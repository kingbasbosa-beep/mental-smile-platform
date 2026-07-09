# CARD 007 Profile Generation

| Field | Value |
|---|---|
| Card ID | CARD 007 |
| Card Name | Profile Generation |
| Purpose | Save draft and publish live Commercial V2 profile. |
| Current Behavior | Saves `draftProfile`; publish writes `liveProfile`, updates root flags, and versions prior live profile. |
| Expected Behavior | Profile generation should produce profile data plus future asset/archive/marketing packages when distribution is created. |
| Inputs | `_ProfilePayload`. |
| Outputs | Draft profile, live profile, version history. |
| Dependencies | `_CommercialV2Store.saveDraft`; `_CommercialV2Store.publish`; Firestore. |
| Signals | None found. |
| Storage | None. |
| Collections | `commercial_v2_profiles/{uid}` and `versions`. |
| Known Issues | No asset package is produced. |
| Required Changes | Add package generation only in a future implementation operation. |
| Status | EXISTS |

