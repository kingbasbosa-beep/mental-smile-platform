# Beta Firebase Capsule V1

Capsule ID: MS-BETA-FIREBASE-CAPSULE-V1

Firebase Project ID: mental-smile-platform

Status: MATERIALIZED_PENDING_OWNER_VALIDATION

## Active Firebase Files

- `firebase.json`
- `firestore.rules`
- `firestore.indexes.json`
- `storage.rules`
- `lib/firebase_options.dart`

## Authentication Boundary

Firebase Auth is the only approved password authority.

Forbidden outside Firebase Auth:

- password
- passwordHash
- confirmPassword
- authToken
- refreshToken

Code scan result:

- Runtime password controllers are UI/Auth inputs only.
- Commercial auth service passes passwords to Firebase Auth.
- Firestore profile writes do not include password or token fields.
- Platform Core signal context blocks password/token/PII keys.

## Active Firestore Collections

Business/runtime collections observed in active code and rules:

- `clinicians`
- `clinicians/{uid}/profile`
- `centers`
- `centers/{uid}/profile`
- `clinician_profile_change_requests`
- `center_profile_change_requests`
- `support_requests`
- `system_domains`
- `signal_events`
- `archive_signal_events`
- `core_test_signal_events`
- `core_login_signals`
- `core_logout_signals`
- `core_survey_signals`
- `core_feedback_signals`
- `core_application_signals`

Production Core signal collections:

- `core_login_signals`
- `core_logout_signals`
- `core_survey_signals`
- `core_feedback_signals`
- `core_application_signals`

Rules posture for production signal collections:

- create only
- public read denied
- update denied
- delete denied
- strict allowed keys
- `environment == "production"`
- `source == "central_platform_core"`

## Active Indexes

Current active index:

- collection group: `signal_events`
- fields:
  - `actorId` ascending
  - `timestamp` descending

Reason retained:

- `SignalStorageService.watchLatestEvents` queries `signal_events` by `actorId` and orders by `timestamp`.

## Active Storage Paths

Storage paths retained:

- `centers/{uid}/...`
- `clinicians/{uid}/...`
- `identity/{uid}/...`
- `certificates/{uid}/...`
- `licenses/{uid}/...`
- `national_ids/{uid}/...`
- `verification_docs/{uid}/...`
- `medical_docs/{uid}/...`
- `branding/...`
- `public_gallery/...`
- `public_images/...`
- `marketing_assets/...`

Owner decision note:

Some public and marketing storage paths may be historical or operational depending on current content ownership. They were not deleted because the final block requires avoiding production-data risk.

## Deployment Commands

Manual Firebase validation commands:

```powershell
firebase use
firebase deploy --only firestore:rules
```

Forbidden in this capsule:

- Firebase Hosting deploy
- Storage rules deploy without separate owner review
- Functions deploy
- full Firebase deploy

## Validation Evidence

Pending owner/manual validation:

- Firebase project selection
- Firestore rules deployment
- production signal write to all five production collections
- no PII in production signal documents
- local session data not sent to Firebase

## Open Owner Decisions

The following are retained because active callers or production-data risk still exist:

- `signal_events`
- `archive_signal_events`
- storage public/marketing paths

These should be removed only after their active callers are removed or explicitly replaced.
