# CARD 009 Business Card Generation

| Field | Value |
|---|---|
| Card ID | CARD 009 |
| Card Name | Business Card Generation |
| Purpose | Generate business card asset from Commercial V2 profile data. |
| Current Behavior | Active Business Card generator, preview, PDF export, metadata registration, and storage contract exist inside Commercial V2 owner profile runtime. |
| Expected Behavior | Create business card asset from Commercial V2 profile data and identity media. |
| Inputs | Commercial V2 draft profile payload and identity media. |
| Outputs | Business Card preview, PDF export, `commercialOutputs.businessCard` metadata. |
| Dependencies | Commercial V2 profile document and existing PDF/printing runtime. |
| Signals | `commercial_generated`. |
| Storage | `commercial_v2_profiles/{ownerUid}.commercialOutputs.businessCard`; exported PDF remains operator-download artifact. |
| Collections | None. |
| Known Issues | No automatic Marketing handoff or Archive write in this implementation. |
| Required Changes | Future Marketing/Archive automation only. |
| Status | IMPLEMENTED |
## 2026-06-26 Update

Operation:

OP-COMMERCIAL-V2-IMAGE-UPLOAD-REMOVAL-AND-AI-GENERATION-HANDOFF-V1

Business card generation no longer depends on identity image/logo URL.

Fallback:

Initials/brand placeholder.

Future image/logo may be supplied later to an AI/design/publication workflow only.
