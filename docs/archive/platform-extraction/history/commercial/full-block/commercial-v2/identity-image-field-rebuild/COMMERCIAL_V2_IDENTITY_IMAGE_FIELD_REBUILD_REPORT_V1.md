# COMMERCIAL_V2_IDENTITY_IMAGE_FIELD_REBUILD_REPORT_V1

Operation ID: OP-COMMERCIAL-V2-IDENTITY-IMAGE-FIELD-REBUILD-V1

Date: 2026-06-25

Status: REBUILT_PENDING_MANUAL_VERIFICATION

## Mission

Rebuild the active Commercial V2 identity image field path so uploaded profile photos/logos display consistently on owner edit, preview before publishing, and generated CV/PDF.

## Old Path Replaced

Replaced active behavior in:

`lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

Old active path components replaced or extended:

- `_uploadIdentityImage`
- `_IdentityImageControl`
- `_CommercialV2IdentityImage`
- `CommercialV2PreviewPage`
- `_GeneratedCvPreview`
- `_CommercialV2PdfBuilder.build`
- `_CommercialV2MedicalWhitePdfBuilder.build`
- `_pdfIdentityImage`

## New Field Behavior

The identity image field now supports:

- Select image with `ImagePicker`.
- Store selected image bytes in current owner page state.
- Render local selected bytes immediately on owner page before or during upload.
- Upload to Firebase Storage.
- Preserve storage paths:
  - `commercial_v2_identity/{uid}/profile_photo`
  - `commercial_v2_identity/{uid}/logo`
- Store download URL in draft profile and root profile fields.
- Display uploaded image from draft URL when local bytes are unavailable.
- Preserve fallback initials/avatar behavior.

## Supported Target Fields

Specialist:

- `profileImageUrl`

Non-specialist entities:

- `logoImageUrl`

## Preview Before Publish Verification

Preview route:

`/commercial-v2/preview`

Preview source:

- `draftProfile.profileImageUrl`
- `draftProfile.logoImageUrl`

Preview no longer depends on `liveProfile` or Submit For Distribution for identity image rendering.

## Image Source Priority

Owner page and preview page:

1. Local selected image bytes, if available in current session.
2. Draft profile image URL.
3. Root profile image URL.
4. Live profile image URL.
5. Fallback initials/avatar.

CV/PDF:

1. Local image bytes if available.
2. Firebase Storage SDK bytes from URL/path.
3. HTTP bytes fallback.
4. Fallback initials/avatar.

## CV/PDF Image Behavior

Generated CV preview now captures local identity bytes when the CV preview is generated.

PDF export passes captured local identity bytes into:

`_CommercialV2MedicalWhitePdfBuilder.build`

The PDF image loader:

`_pdfIdentityImage`

now accepts optional `localImageBytes` and uses them before remote loading.

## Debug Logging Added

- `Commercial V2 identity image: selected`
- `Commercial V2 identity image: local preview ready`
- `Commercial V2 identity image: upload started`
- `Commercial V2 identity image: upload completed`
- `Commercial V2 identity image: download URL stored`
- `Commercial V2 identity image: draft URL found`
- `Commercial V2 identity image: preview rendering from draft URL`
- `Commercial V2 identity image: owner rendering from draft URL`
- `Commercial V2 identity image: PDF bytes loading started`
- `Commercial V2 identity image: PDF bytes loading succeeded`
- `Commercial V2 identity image: PDF bytes loading failed`
- `Commercial V2 identity image: fallback used`

Failure logs include:

- URL or storage path
- Source branch
- Exception type
- Exception message

## Files Changed

- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- `docs/commercial-v2/active-surface-audit/COMMERCIAL_IMAGE_SYSTEM_FORENSIC_CARD_V1.md`
- `docs/commercial-v2/active-surface-audit/cards/CARD_006_IMAGE_UPLOAD.md`
- `docs/commercial-v2/active-surface-audit/cards/CARD_008_CV_GENERATION.md`
- `docs/commercial-v2/active-surface-audit/COMMERCIAL_V2_KNOWN_BUGS_REGISTRY_V1.md`
- `docs/commercial-v2/identity-image-field-rebuild/COMMERCIAL_V2_IDENTITY_IMAGE_FIELD_REBUILD_REPORT_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

## Manual Test Checklist

Owner will run manually:

1. `dart format lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
2. `flutter analyze`
3. Register/login.
4. Upload identity image/logo.
5. Confirm image appears immediately on owner page.
6. Save draft.
7. Open preview before publishing.
8. Confirm image appears in preview before publishing.
9. Generate CV preview.
10. Export CV/PDF.
11. Confirm image appears in CV/PDF.
12. Submit For Distribution.
13. Confirm image remains visible after submit.

## Remaining Issues

- Manual verification is required before marking CV2-BUG-001 fully fixed.
- No Firebase rules were changed.
- If manual verification reveals permission errors, record the exact Firebase/Storage error before any further fix.

## Technical Limits

Runtime Changed: YES

Routes Changed: NO

Firebase Rules Changed: NO

Firestore Rules Changed: NO

Storage Rules Changed: NO

Archive Changed: NO

Marketing Changed: NO

PDF Redesign: NO

UI Redesign: NO

Architecture Change: NO

Commands Run For Verification: NO

## Final Verdict

COMMERCIAL_V2_IDENTITY_IMAGE_FIELD_REBUILD_COMPLETED
