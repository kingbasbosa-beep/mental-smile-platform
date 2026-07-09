# CARD 010 Promo Post Generation

| Field | Value |
|---|---|
| Card ID | CARD 010 |
| Card Name | Promo Post Generation |
| Purpose | Generate promotional post asset from Commercial V2 profile data. |
| Current Behavior | Active Promo Post generator, preview, PDF export, metadata registration, and storage contract exist inside Commercial V2 owner profile runtime. |
| Expected Behavior | Create promo post asset for future Marketing and Media pipeline. |
| Inputs | Commercial V2 draft profile payload and identity media. |
| Outputs | Promo Post preview, PDF export, `commercialOutputs.promoPost` metadata. |
| Dependencies | Commercial V2 profile document and existing PDF/printing runtime. |
| Signals | `commercial_generated`. |
| Storage | `commercial_v2_profiles/{ownerUid}.commercialOutputs.promoPost`; exported PDF remains operator-download artifact. |
| Collections | None. |
| Known Issues | No automatic Marketing publication or Archive write in this implementation. |
| Required Changes | Future Marketing publication pipeline only. |
| Status | IMPLEMENTED |
## 2026-06-26 Update

Operation:

OP-COMMERCIAL-V2-IMAGE-UPLOAD-REMOVAL-AND-AI-GENERATION-HANDOFF-V1

Promo post generation no longer depends on identity image/logo URL.

Fallback:

Initials/brand placeholder.

Future image/logo may be supplied later to an AI/design/publication workflow only.
