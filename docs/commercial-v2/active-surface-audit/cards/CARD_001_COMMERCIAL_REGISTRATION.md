# CARD 001 Commercial Registration

| Field | Value |
|---|---|
| Card ID | CARD 001 |
| Card Name | Commercial Registration |
| Purpose | Create a Commercial V2 account and profile shell. |
| Current Behavior | Uses Phone, Password, Confirm Password, and optional Identity Image / Logo selection on `/commercial-v2/start`; creates Firebase Auth user through internal phone-derived email compatibility and `commercial_v2_profiles/{uid}` shell. |
| Expected Behavior | Target registration is Phone, Password, Confirm Password, with optional non-blocking identity image/logo selection. |
| Inputs | Phone, Password, Confirm Password, optional local identity image/logo bytes. |
| Outputs | Firebase Auth user; Commercial V2 profile shell; optional draft/root identity image URL when upload succeeds. |
| Dependencies | Firebase Auth email/password compatibility; Firestore; Firebase Storage public identity path; `_CommercialV2Store.ensureProfileShell`; `_CommercialV2Store.updateIdentityImageUrl`. |
| Signals | None found. |
| Storage | Optional upload to `commercial_v2_public_identity/{uid}/profile_photo` or `/logo`. |
| Collections | `commercial_v2_profiles/{uid}`. |
| Known Issues | Native Firebase phone auth is not implemented; current approach uses internal phone-derived email compatibility. |
| Required Changes | Manual verification required for create/login with and without optional image. |
| Status | MITIGATED_BY_REGISTRATION_RELOCATION_PENDING_VERIFICATION |
## 2026-06-26 Update

Operation:

OP-COMMERCIAL-V2-IMAGE-UPLOAD-REMOVAL-AND-AI-GENERATION-HANDOFF-V1

Registration no longer accepts or uploads identity image/logo as an active account creation input.

Current required registration inputs:

- Phone
- Password
- Confirm Password

Image/logo can be supplied later during future design, AI generation, or publication workflow.

Runtime dependency on Firebase Storage image upload during registration:

REMOVED
