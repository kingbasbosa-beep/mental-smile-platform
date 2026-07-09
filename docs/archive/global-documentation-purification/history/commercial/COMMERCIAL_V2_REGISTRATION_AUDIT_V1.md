# Commercial V2 Registration Audit V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24

## Current Registration Model

Runtime file:

- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

Route:

- `/commercial-v2/start`

## Registration Questions

| Question | Actual Runtime Answer |
|---|---|
| Phone only? | NO |
| Email only? | NO |
| Phone + Email? | YES |
| Password? | YES |
| Verification? | Firebase email/password auth only; no phone verification found in Commercial V2 start flow |
| Firebase Auth? | YES |
| Other? | Firestore profile shell is created after auth succeeds |

## Actual Runtime Details

Account creation requires:

- email
- phone
- password

Validation observed:

- email must contain `@`
- password length must be at least 6
- phone is required before create account

Create account behavior:

- calls `FirebaseAuth.instance.createUserWithEmailAndPassword`
- then calls `_CommercialV2Store.ensureProfileShell`
- creates `commercial_v2_profiles/{uid}` if not present

Login behavior:

- calls `FirebaseAuth.instance.signInWithEmailAndPassword`
- then calls `_CommercialV2Store.ensureProfileShell`
- navigates to `/commercial-v2/owner`

Profile shell contains:

- `ownerUid`
- `accountEmail`
- `accountPhone`
- `draftProfile`
- `liveProfile: null`
- `isPublished: false`
- `isHidden: true`
- `publicProfileId`
- `version`
- timestamps

## Registration Conclusion

Commercial V2 registration is email/password Firebase Auth plus required phone field captured into the Commercial V2 profile shell. It is not the old clinician/center declaration registration flow.

