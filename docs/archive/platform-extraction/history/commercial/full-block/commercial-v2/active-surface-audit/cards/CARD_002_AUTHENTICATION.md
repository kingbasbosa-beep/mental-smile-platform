# CARD 002 Authentication

| Field | Value |
|---|---|
| Card ID | CARD 002 |
| Card Name | Authentication |
| Purpose | Authenticate Commercial V2 profile owner. |
| Current Behavior | Uses Phone and Password login on `/commercial-v2/start`; derives internal auth email from phone for Firebase email/password compatibility; ensures profile shell after sign-in. |
| Expected Behavior | Authenticated owner reaches `/commercial-v2/owner`. |
| Inputs | Phone, Password. |
| Outputs | Auth session; ensured profile shell. |
| Dependencies | Firebase Auth; Firestore; router. |
| Signals | None found. |
| Storage | None. |
| Collections | `commercial_v2_profiles/{uid}`. |
| Known Issues | True Firebase phone verification is not implemented. |
| Required Changes | Manual verification required for compatibility path. |
| Status | UPDATED / VERIFY_REQUIRED |
