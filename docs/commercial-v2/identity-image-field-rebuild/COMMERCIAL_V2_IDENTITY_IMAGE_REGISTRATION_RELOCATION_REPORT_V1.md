# COMMERCIAL_V2_IDENTITY_IMAGE_REGISTRATION_RELOCATION_REPORT_V1

Operation ID: OP-COMMERCIAL-V2-IDENTITY-IMAGE-REGISTRATION-RELOCATION-V1

Date: 2026-06-25

Status: MITIGATED_BY_REGISTRATION_RELOCATION_PENDING_VERIFICATION

## Mission

Move Commercial V2 identity image/logo selection out of the blocking profile creation flow and into the optional registration step.

## Runtime Change

File:

`lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

## Registration Step

The `/commercial-v2/start` flow now includes an optional identity image/logo selection block.

Registration fields:

- Phone
- Password
- Confirm Password
- Identity Image / Logo selection (optional)

The image selector:

- previews selected local bytes before account creation
- lets the user choose target field:
  - `profileImageUrl`
  - `logoImageUrl`
- does not block account creation if omitted
- does not block account creation if upload fails

## Storage Strategy

Existing latest public Commercial V2 identity path is used:

- `commercial_v2_public_identity/{uid}/profile_photo`
- `commercial_v2_public_identity/{uid}/logo`

No new storage path was created.

No storage rules were changed.

## Profile Shell Update

After account creation and profile shell creation, registration image upload is attempted.

If upload succeeds, the returned Firebase Storage download URL is stored into:

- root `profileImageUrl` or `logoImageUrl`
- `draftProfile.profileImageUrl` or `draftProfile.logoImageUrl`

If upload fails:

- account creation continues
- profile shell remains available
- failure is logged
- user proceeds to owner profile creation/editing

## Owner Profile Page

Image editing remains available as optional identity media.

Owner profile creation, preview, CV generation, and Submit For Distribution do not require successful image upload.

If image upload fails in owner profile:

- a non-blocking error message is shown
- previous image URL remains unchanged
- editing can continue

## Preview Behavior

Preview remains non-blocking.

If image URL cannot load:

- fallback initials/avatar are used
- preview continues rendering
- image failure is logged

## CV/PDF Behavior

CV/PDF generation remains non-blocking.

If image bytes or URL fail:

- fallback initials/avatar are used
- PDF generation continues
- image failure is logged

## Submit For Distribution Message

The message remains:

Creation completed successfully. Your profile has been prepared and will be processed for publication shortly.

The message does not imply image publication is complete.

## Files Changed

- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- `docs/commercial-v2/identity-image-field-rebuild/COMMERCIAL_V2_IDENTITY_IMAGE_REGISTRATION_RELOCATION_REPORT_V1.md`
- `docs/commercial-v2/active-surface-audit/cards/CARD_001_COMMERCIAL_REGISTRATION.md`
- `docs/commercial-v2/active-surface-audit/cards/CARD_006_IMAGE_UPLOAD.md`
- `docs/commercial-v2/active-surface-audit/cards/CARD_008_CV_GENERATION.md`
- `docs/commercial-v2/active-surface-audit/COMMERCIAL_IMAGE_SYSTEM_FORENSIC_CARD_V1.md`
- `docs/commercial-v2/active-surface-audit/COMMERCIAL_V2_KNOWN_BUGS_REGISTRY_V1.md`
- `docs/commercial-v2/active-surface-audit/COMMERCIAL_V2_ACTIVE_SURFACE_CARD_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

## Manual Test Checklist

1. Register with Phone + Password + Confirm Password without image.
2. Confirm account created successfully.
3. Register with image selected.
4. Confirm account created even if image upload fails.
5. Confirm profile creation page opens.
6. Confirm image field is not blocking profile editing.
7. Generate CV with no image.
8. Confirm CV generated with fallback.
9. Preview with no image or failed image.
10. Confirm preview renders with fallback.
11. Submit For Distribution.
12. Confirm success message appears.

## Technical Limits

Firebase Rules Changed: NO

Storage Rules Changed: NO

Firestore Rules Changed: NO

Routes Changed: NO

Archive Changed: NO

Marketing Changed: NO

Profile Creation Blocked By Image: NO

Registration Blocked By Image: NO

Preview Blocked By Image: NO

CV/PDF Blocked By Image: NO

## Final Verdict

COMMERCIAL_V2_IDENTITY_IMAGE_REGISTRATION_RELOCATION_COMPLETED

