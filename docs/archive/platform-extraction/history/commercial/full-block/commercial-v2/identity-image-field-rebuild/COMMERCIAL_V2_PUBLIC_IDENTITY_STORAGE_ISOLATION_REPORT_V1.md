# COMMERCIAL_V2_PUBLIC_IDENTITY_STORAGE_ISOLATION_REPORT_V1

Operation ID: OP-COMMERCIAL-V2-PUBLIC-IDENTITY-STORAGE-ISOLATION-FIX-V1

Date: 2026-06-25

Status: PUBLIC_STORAGE_ISOLATED_PENDING_MANUAL_DEPLOYMENT_AND_VERIFICATION

## Mission

Isolate Commercial V2 public-facing identity images into a dedicated Storage namespace to avoid legacy private/client image rule conflicts and old image-flow contamination.

## New Storage Namespace

New uploads now use only:

- `commercial_v2_public_identity/{uid}/profile_photo`
- `commercial_v2_public_identity/{uid}/logo`

Legacy path remains untouched:

- `commercial_v2_identity/{uid}/profile_photo`
- `commercial_v2_identity/{uid}/logo`

No old files were migrated.

No old files were deleted.

No old URLs were rewritten.

## Storage Rules Change

File:

`storage.rules`

Added exact rules for:

- `commercial_v2_public_identity/{uid}/profile_photo`
- `commercial_v2_public_identity/{uid}/logo`

Rule behavior:

- Public read: YES
- Owner write only: YES
- Image MIME only: YES
- Max size: 5 MB
- Delete: NO

No client image rules were changed.

No legacy Commercial V2 identity rules were changed.

No unrelated storage paths were changed.

## Runtime Change

File:

`lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

Updated `_uploadIdentityImage` so new uploads target:

- Specialist: `commercial_v2_public_identity/{uid}/profile_photo`
- Non-specialist: `commercial_v2_public_identity/{uid}/logo`

After upload, Firebase Storage `getDownloadURL()` is still used.

The returned URL is stored through the existing draft/root save path:

- `draftProfile.profileImageUrl` or `draftProfile.logoImageUrl`
- root `profileImageUrl` or `logoImageUrl`

## Preview Requirement

Preview source priority remains:

1. `draftProfile` image URL
2. root image URL
3. `liveProfile` image URL
4. fallback

New uploads should place a public identity URL into draft/root fields, allowing `/commercial-v2/preview` to display before publishing after storage rules are deployed.

## CV/PDF Requirement

CV/PDF continues to use `_pdfIdentityImage`.

For new uploads, the URL points to the public identity namespace and can be loaded through:

1. local selected bytes
2. Firebase Storage SDK bytes
3. HTTP bytes fallback
4. fallback initials/avatar

## Debug Logs

Added/kept:

- `Commercial V2 public identity upload started`
- `Commercial V2 public identity upload completed`
- `Commercial V2 public identity download URL stored`
- `Commercial V2 public identity preview URL`
- `Commercial V2 public identity direct media test URL`
- `Commercial V2 public identity PDF bytes loading`
- `Commercial V2 public identity load failed`

## Files Changed

- `storage.rules`
- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- `docs/commercial-v2/active-surface-audit/COMMERCIAL_IMAGE_SYSTEM_FORENSIC_CARD_V1.md`
- `docs/commercial-v2/active-surface-audit/cards/CARD_006_IMAGE_UPLOAD.md`
- `docs/commercial-v2/active-surface-audit/cards/CARD_008_CV_GENERATION.md`
- `docs/commercial-v2/active-surface-audit/COMMERCIAL_V2_KNOWN_BUGS_REGISTRY_V1.md`
- `docs/commercial-v2/identity-image-field-rebuild/COMMERCIAL_V2_PUBLIC_IDENTITY_STORAGE_ISOLATION_REPORT_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

## Manual Commands

Owner will manually run:

```powershell
firebase deploy --only storage
dart format lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart
flutter analyze
```

## Manual Test Checklist

1. Upload a new identity image after the path change.
2. Confirm new Storage path:
   - `commercial_v2_public_identity/{uid}/profile_photo`
   - or `commercial_v2_public_identity/{uid}/logo`
3. Open direct media URL in browser.
4. Confirm image opens and does not return 403.
5. Confirm Owner page shows image.
6. Confirm Preview before publishing shows image.
7. Confirm CV preview shows image.
8. Confirm exported PDF shows image.
9. Confirm Submit For Distribution keeps image.

## Strict Limits Confirmation

Client image rules changed: NO

Legacy image cleanup rules changed: NO

Old files deleted: NO

Old files migrated: NO

Firestore rules changed: NO

Routes changed: NO

UI redesign: NO

Archive integration created: NO

Marketing integration created: NO

## Final Verdict

COMMERCIAL_V2_PUBLIC_IDENTITY_STORAGE_ISOLATION_COMPLETED

