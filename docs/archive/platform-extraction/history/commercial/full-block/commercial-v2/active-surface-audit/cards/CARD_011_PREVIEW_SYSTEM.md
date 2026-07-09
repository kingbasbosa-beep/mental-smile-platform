# CARD 011 Preview System

| Field | Value |
|---|---|
| Card ID | CARD 011 |
| Card Name | Preview System |
| Purpose | Preview draft profile before publication. |
| Current Behavior | `_preview` saves draft then routes to `/commercial-v2/preview`; `CommercialV2PreviewPage` streams profile doc and displays draft preview. |
| Expected Behavior | User can inspect profile before publish/distribution. |
| Inputs | Draft profile. |
| Outputs | Read-only preview view. |
| Dependencies | Firestore stream; router; `_CommercialV2ProfileView`. |
| Signals | None found. |
| Storage | None. |
| Collections | `commercial_v2_profiles/{uid}`. |
| Known Issues | No issue confirmed in this audit. |
| Required Changes | Review preview parity with final public/distribution outputs. |
| Status | EXISTS |

