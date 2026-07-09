# CARD 013 Commercial Asset Package

| Field | Value |
|---|---|
| Card ID | CARD 013 |
| Card Name | Commercial Asset Package |
| Purpose | Bundle Commercial profile, identity media, generated CV/PDF, and future assets for Archive/Marketing. |
| Current Behavior | Active asset package metadata builder exists inside Commercial V2 owner profile runtime. |
| Expected Behavior | Create package containing source profile, generated assets, archive destination, marketing intake metadata, and retention data. |
| Inputs | Published profile, images/logos, PDFs, CV assets, generated business card/post assets. |
| Outputs | Commercial asset package metadata with contents, classification, version, archive destination, and future marketing input. |
| Dependencies | Commercial V2 profile document and generated output state. |
| Signals | `commercial_generated`. |
| Storage | `commercial_v2_profiles/{ownerUid}.commercialAssetPackage`; registry under `commercialOutputRegistry.assetPackage`. |
| Collections | None active. |
| Known Issues | Metadata package only; no Archive transfer or Marketing automation is executed. |
| Required Changes | Future Archive/Marketing connection only. |
| Status | IMPLEMENTED |
## 2026-06-26 Update

Operation:

OP-COMMERCIAL-V2-IMAGE-UPLOAD-REMOVAL-AND-AI-GENERATION-HANDOFF-V1

Commercial Asset Package now includes:

- Commercial Text Profile Package
- Commercial AI Generation Handoff Package
- CV metadata if generated
- Business Card metadata if generated
- Promo Post metadata if generated
- Metadata
- Version Information

It no longer treats Identity Image or Logo as required package contents.

Runtime storage additions:

- `commercialTextProfilePackage`
- `commercialAiGenerationHandoffPackage`
