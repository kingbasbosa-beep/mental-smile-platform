# CARD 003 Business Card Core Information

| Field | Value |
|---|---|
| Card ID | CARD 003 |
| Card Name | Business Card Core Information |
| Purpose | Capture core Commercial profile data that can later feed profile, CV, business card, and marketing assets. |
| Current Behavior | Owner page captures name, category, subcategory, description, services, audiences, location, phone, WhatsApp, and links. |
| Expected Behavior | Core information should remain reusable for Commercial profile and future generated assets. |
| Inputs | Core profile fields. |
| Outputs | `_ProfilePayload` draft data. |
| Dependencies | `CommercialV2OwnerProfilePage`; `_ProfilePayload`; Firestore. |
| Signals | None found. |
| Storage | None directly. |
| Collections | `commercial_v2_profiles/{uid}.draftProfile`. |
| Known Issues | Business card generation itself is missing. |
| Required Changes | Define business-card-specific required fields if generator is created later. |
| Status | EXISTS |

