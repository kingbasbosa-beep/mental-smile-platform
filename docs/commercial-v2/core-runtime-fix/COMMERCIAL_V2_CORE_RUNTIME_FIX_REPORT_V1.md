# Commercial V2 Core Runtime Fix Report V1

## Operation

OP-COMMERCIAL-V2-CORE-RUNTIME-FIX-PACKAGE-V1

## Date

2026-06-25

## Status

COMPLETED_PENDING_MANUAL_VERIFICATION

## Final Verdict

COMMERCIAL_V2_CORE_RUNTIME_FIXES_COMPLETED

## Manual Verification Note

Automated command verification was intentionally not executed in this closure pass per operator instruction.
Manual verification remains required for formatting, static analysis, and end-to-end Commercial V2 runtime flow validation.

## Before

| Area | Before |
|---|---|
| Registration | User-facing fields were Email, Phone, Password. |
| Confirm Password | Missing. |
| Authentication | Firebase Auth email/password used with user-entered email. |
| CV Image | Generated CV/PDF could fail to include identity image/logo even when profile display worked. |
| Submit Semantics | Button/message used Publish/Profile published language. |
| Success Message | `Profile published. Public URL is ready.` |

## After

| Area | After |
|---|---|
| Registration | User-facing fields are Phone, Password, Confirm Password. |
| Email Field | Removed from user-facing registration UI and validation. |
| Confirm Password | Added and validated on Create Account. |
| Authentication | Phone-first UI uses internal Firebase email/password compatibility credential derived from phone number. |
| CV Image | PDF builders now attempt Firebase Storage byte loading from download URL before network fallback. |
| Official PDF | Official profile PDF now includes identity image when load succeeds. |
| Submit Semantics | Button label updated to Submit For Distribution. |
| Success Message | Updated to: `Creation completed successfully. Your profile has been prepared and will be processed for publication shortly.` |

## Files Changed

- lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart
- docs/commercial-v2/active-surface-audit/COMMERCIAL_REGISTRATION_REVIEW_CARD_V1.md
- docs/commercial-v2/active-surface-audit/COMMERCIAL_V2_ACTIVE_SURFACE_CARD_REGISTRY_V1.md
- docs/commercial-v2/active-surface-audit/COMMERCIAL_V2_KNOWN_BUGS_REGISTRY_V1.md
- docs/commercial-v2/active-surface-audit/cards/CARD_001_COMMERCIAL_REGISTRATION.md
- docs/commercial-v2/active-surface-audit/cards/CARD_002_AUTHENTICATION.md
- docs/commercial-v2/active-surface-audit/cards/CARD_006_IMAGE_UPLOAD.md
- docs/commercial-v2/active-surface-audit/cards/CARD_008_CV_GENERATION.md
- docs/commercial-v2/active-surface-audit/cards/CARD_012_SUBMIT_FOR_DISTRIBUTION.md
- docs/commercial-v2/core-runtime-fix/COMMERCIAL_V2_CORE_RUNTIME_FIX_REPORT_V1.md
- docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md
- docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md

## Verification

Automated command verification was not run because the user requested command execution to stop and will run commands manually.

Manual verification required:

- Run formatter.
- Run analyzer.
- Create account with Phone, Password, Confirm Password.
- Login with Phone and Password.
- Upload identity image.
- Confirm profile display shows image.
- Generate CV preview.
- Generate CV PDF.
- Confirm image appears in generated CV/PDF.
- Submit For Distribution.
- Confirm success message appears.

## Authentication Review

Phone-first authentication is implemented at UI/runtime entry level.

Firebase compatibility:

- Firebase Auth configuration was not changed.
- Existing Firebase email/password dependency remains.
- Runtime derives an internal non-user-facing email from the phone number for Firebase Auth compatibility.

Blocker:

- True Firebase phone verification is not implemented in this package.
- If native phone auth is required later, Firebase Auth provider configuration and runtime flow must be changed in a separate approved operation.

## Remaining Bugs

| ID | Status | Notes |
|---|---|---|
| CV2-BUG-001 | FIX_ATTEMPTED_VERIFY_REQUIRED | Needs manual PDF/image verification. |
| CV2-BUG-002 | FIXED_WITH_COMPATIBILITY_VERIFY_REQUIRED | UI target met; true phone auth remains future dependency. |
| CV2-BUG-003 | SEMANTICS_UPDATED_PACKAGE_POSTPONED | Asset/archive/marketing package intentionally not implemented. |
| CV2-BUG-004 | REMAINS_POSTPONED | Commercial signals not in this package scope. |

## Prohibitions Verification

No archiving: YES

No legacy cleanup: YES

No new generators: YES

No Marketing integration: YES

No Archive integration: YES

No Discovery implementation: YES

Routes changed: NO

Firebase rules changed: NO

Firestore rules changed: NO

Storage rules changed: NO
