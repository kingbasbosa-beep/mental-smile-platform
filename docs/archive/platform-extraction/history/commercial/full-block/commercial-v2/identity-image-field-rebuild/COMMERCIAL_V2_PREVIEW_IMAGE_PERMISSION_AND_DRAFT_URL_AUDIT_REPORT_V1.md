# COMMERCIAL_V2_PREVIEW_IMAGE_PERMISSION_AND_DRAFT_URL_AUDIT_REPORT_V1

Operation ID: COMMERCIAL_V2_PREVIEW_IMAGE_PERMISSION_AND_DRAFT_URL_AUDIT_V1

Date: 2026-06-25

Status: FORENSIC DEBUG ONLY

## Scope

Audit why Commercial V2 identity image appears on the owner page after upload but does not appear on `/commercial-v2/preview`, while direct browser access to the Firebase Storage media URL returns `403 Permission denied`.

No fixes were applied.

No runtime files were changed.

No Firebase, Firestore, or Storage rules were changed.

## Files Inspected

- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- `storage.rules`
- `firestore.rules`
- `.firebaserc`
- Existing Commercial V2 image forensic/fix/rebuild documentation

## Task 1 - Firestore Document Field Inspection

Target document:

`commercial_v2_profiles/{uid}`

Required fields:

- root `profileImageUrl`
- root `logoImageUrl`
- `draftProfile.profileImageUrl`
- `draftProfile.logoImageUrl`
- `liveProfile.profileImageUrl`
- `liveProfile.logoImageUrl`

### Result

BLOCKED_FOR_LIVE_DOCUMENT

### Reason

The exact `{uid}` and exact stored Firebase Storage URL were not available in the workspace. No local Firestore export, debug log, JSON fixture, or captured runtime URL containing `firebasestorage.googleapis.com` was found.

### Source-Level Evidence

The upload handler writes the URL into the active draft payload and root fields through:

- `_uploadIdentityImage`
- `_profileImageUrl.text = url` for Specialist
- `_logoImageUrl.text = url` for non-specialist entities
- `_CommercialV2Store.saveDraft(uid, _payload())`

`saveDraft` writes:

- `draftProfile: payload.toMap()`
- root `profileImageUrl`
- root `logoImageUrl`

Therefore, if the uploaded URL reached `_profileImageUrl` or `_logoImageUrl`, source code is designed to store it in both draft payload and root image field.

### Exact Field Containing Current Uploaded URL

UNKNOWN_NOT_AVAILABLE_LOCALLY

Reason:

Actual Firestore document data was not available for inspection.

## Task 2 - Preview Page Image Source Inspection

Preview route:

`/commercial-v2/preview`

Preview class:

`CommercialV2PreviewPage`

### Confirmed Source Path

The preview page reads:

```dart
_profileMapWithIdentityFallback(_mapValue(data['draftProfile']), data)
```

Then:

```dart
_ProfilePayload.fromMap(...)
```

Then `_PublicProfileView(payload: payload, isPreview: true, ...)`.

### Fallback Priority Confirmed

`_profileMapWithIdentityFallback` checks:

1. `draftProfile.profileImageUrl` / `draftProfile.logoImageUrl`
2. root `profileImageUrl` / `logoImageUrl`
3. `liveProfile.profileImageUrl` / `liveProfile.logoImageUrl`
4. empty string fallback

### Answer

YES, preview reads `draftProfile.profileImageUrl` or `draftProfile.logoImageUrl` before root/live fallback.

## Task 3 - URL Token Validation

Required validation:

- Contains `alt=media`
- Contains `token=...`
- Token matches Firebase Storage metadata `downloadTokens`
- URL is not truncated
- URL is not incorrectly re-encoded

### Result

BLOCKED_FOR_EXACT_URL_AND_METADATA

### Reason

The exact URL stored in Firestore was not available locally, and Storage object metadata was not available for comparison.

### Source-Level Evidence

The code obtains the URL from:

```dart
final url = await ref.getDownloadURL();
```

The code does not remove `alt=media`.

The code does not remove `token`.

The code does not replace the host, path, bucket, or query string.

The only URL normalization found is:

```dart
replaceAll(RegExp(r'\s+'), '').trim()
```

This removes whitespace only.

### Answer

Cannot certify token validity without the exact Firestore URL and Firebase Storage metadata.

## Task 4 - Storage Rules Inspection

File inspected:

`storage.rules`

### Relevant Rules

```text
match /commercial_v2_identity/{uid}/profile_photo {
  allow read: if true;
  allow create, update: if request.auth != null
    && request.auth.uid == uid
    && request.resource != null
    && request.resource.contentType.matches('image/.*')
    && request.resource.size <= 5 * 1024 * 1024;
  allow delete: if false;
}

match /commercial_v2_identity/{uid}/logo {
  allow read: if true;
  allow create, update: if request.auth != null
    && request.auth.uid == uid
    && request.resource != null
    && request.resource.contentType.matches('image/.*')
    && request.resource.size <= 5 * 1024 * 1024;
  allow delete: if false;
}
```

### Answer

The local `storage.rules` file allows public read for:

- `commercial_v2_identity/{uid}/profile_photo`
- `commercial_v2_identity/{uid}/logo`

If the live browser media URL returns 403 for one of those exact object paths, the local rules file itself is not the apparent blocker.

## Direct Media URL 403

Reported behavior:

Browser access to Firebase Storage media URL returns:

`403 Permission denied`

### Interpretation

Given local `storage.rules` allow read on the exact target paths, a 403 can be caused by one of these exact conditions:

1. The stored URL is missing or has an invalid `token`.
2. The stored URL points to a different object path than `commercial_v2_identity/{uid}/profile_photo` or `commercial_v2_identity/{uid}/logo`.
3. The object exists but the URL token no longer matches the object metadata `downloadTokens`.
4. The deployed Storage rules differ from the local `storage.rules`.
5. The URL is truncated or incorrectly copied before browser access.
6. The URL points to another Firebase bucket/project.

## Required Answers

### Is the uploaded image URL stored in draftProfile?

SOURCE_CODE_DESIGNED_YES, LIVE_DOCUMENT_NOT_VERIFIED

The code stores the uploaded URL through `_payload().toMap()` into `draftProfile`, but the exact Firestore document was not available locally.

### Is preview reading the correct field?

YES

Preview reads `draftProfile` first through `_profileMapWithIdentityFallback`.

### Does the stored URL contain a valid token?

UNKNOWN_NOT_AVAILABLE_LOCALLY

Exact stored URL and Storage metadata were not available.

### Does direct media URL access return 403?

REPORTED_YES

The user reported browser access returns `403 Permission denied`. This was not independently reproduced because the exact URL was not available.

### Are Storage rules blocking image read?

LOCAL_RULES_NO

The local rules allow read for the exact paths:

- `commercial_v2_identity/{uid}/profile_photo`
- `commercial_v2_identity/{uid}/logo`

Live deployed rules were not verified in this operation.

## Exact Recommended Fix

No code fix should be applied before inspecting the live document and object metadata.

Recommended next repair path:

1. Inspect `commercial_v2_profiles/{uid}` and copy the exact value of:
   - root `profileImageUrl`
   - root `logoImageUrl`
   - `draftProfile.profileImageUrl`
   - `draftProfile.logoImageUrl`
2. Confirm preview URL equals the current uploaded image field.
3. Confirm URL path is exactly one of:
   - `commercial_v2_identity/{uid}/profile_photo`
   - `commercial_v2_identity/{uid}/logo`
4. Confirm URL contains `alt=media`.
5. Confirm URL contains a non-empty `token`.
6. Inspect Firebase Storage metadata for the object and confirm `firebaseStorageDownloadTokens` / `downloadTokens` contains the same token.
7. If token is missing or mismatched, regenerate the download URL by calling `getDownloadURL()` for the exact object and overwrite the draft/root profile image URL.
8. If token is valid but browser still returns 403, verify deployed Storage rules for project `mental-smile-platform` match local `storage.rules`.

## Final Status

The preview code path is correct from source inspection.

The local Storage rules are not blocking the exact configured Commercial V2 identity paths.

The unresolved evidence is the live Firestore URL/token/metadata comparison.

## Final Verdict

COMMERCIAL_V2_PREVIEW_IMAGE_PERMISSION_AUDIT_BLOCKED

Blocked reason:

Exact Firestore document `{uid}`, exact stored Firebase Storage media URL, and Firebase Storage object metadata download token were not available in the workspace, so token validity and field-level live storage could not be certified.

