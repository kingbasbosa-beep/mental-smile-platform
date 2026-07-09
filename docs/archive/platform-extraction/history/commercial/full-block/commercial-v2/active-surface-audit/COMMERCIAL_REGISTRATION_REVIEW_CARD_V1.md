# Commercial Registration Review Card V1

## Operation

OP-COMMERCIAL-V2-ACTIVE-SURFACE-EXTRACTION-AND-CARD-REGISTRY-AUDIT-V1

## Status

FORENSIC REVIEW ONLY

## Current Fields

| Field | Present | Evidence | Notes |
|---|---:|---|---|
| Email | NO | Email field removed from active UI/runtime entry. | Firebase compatibility uses an internal derived auth email from phone; not a user-facing field. |
| Phone | YES | `_phone` controller; missing-phone validation | Required for create account and login. |
| Password | YES | `_password` controller; length validation | Minimum 6 characters. |
| Confirm Password | YES | `_confirmPassword` controller; password match validation on account creation | Required by target registration rule. |

## Current Validations

- Phone must be non-empty and convertible to Firebase compatibility credential.
- Password must be at least 6 characters.
- Confirm Password must match Password for account creation.
- Login uses Phone and Password.

## Current Collections

- `commercial_v2_profiles/{uid}`

## Current Dependencies

- Firebase Auth email/password compatibility using a generated internal phone-derived email.
- Firestore profile shell creation through `_CommercialV2Store.ensureProfileShell`.

## Current Signals

No Commercial V2 registration signal emission was found.

## Special Validation Result

Email still exists: NO

Phone still exists: YES

Password still exists: YES

Confirm Password still exists: YES

## Status

UPDATED / COMPATIBILITY_DEPENDENCY

## Reason

Commercial V2 target registration is:

- Phone.
- Password.
- Confirm Password.

Current runtime now exposes:

- Phone.
- Password.
- Confirm Password.

Firebase compatibility note:

The runtime still depends on Firebase email/password authentication internally by deriving a non-user-facing auth email from the phone number. This avoids Firebase configuration changes in this operation.

Runtime was modified by OP-COMMERCIAL-V2-CORE-RUNTIME-FIX-PACKAGE-V1.
