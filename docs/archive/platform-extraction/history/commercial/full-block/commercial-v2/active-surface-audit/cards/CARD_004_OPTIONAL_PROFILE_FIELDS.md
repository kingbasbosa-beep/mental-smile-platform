# CARD 004 Optional Profile Fields

| Field | Value |
|---|---|
| Card ID | CARD 004 |
| Card Name | Optional Profile Fields |
| Purpose | Capture optional public profile and category-specific content. |
| Current Behavior | Supports external media links, conditional fields, repeatable conditional fields, and custom sections. |
| Expected Behavior | Optional fields enrich profile, CV, and future marketing assets without becoming operational case/payment/booking data. |
| Inputs | Social links, gallery link, category-specific fields, custom sections. |
| Outputs | Expanded `_ProfilePayload`. |
| Dependencies | Conditional field specs; custom section controllers; Firestore. |
| Signals | None found. |
| Storage | None directly. |
| Collections | `commercial_v2_profiles/{uid}.draftProfile`. |
| Known Issues | No issue confirmed in this audit. |
| Required Changes | Review field taxonomy before discovery/search. |
| Status | EXISTS |

