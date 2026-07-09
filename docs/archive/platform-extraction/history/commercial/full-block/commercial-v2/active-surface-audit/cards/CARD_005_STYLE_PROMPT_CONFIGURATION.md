# CARD 005 Style Prompt Configuration

| Field | Value |
|---|---|
| Card ID | CARD 005 |
| Card Name | Style Prompt Configuration |
| Purpose | Capture style instruction for generated CV/profile preview. |
| Current Behavior | `_styleInstruction` is captured and mapped by `_commercialV2GeneratedCvTemplate`; unsupported non-medical styles now return documented pending-template values instead of silently forcing `medical_white`. |
| Expected Behavior | Style configuration should influence approved generation outputs consistently as more templates become available. |
| Inputs | Style instruction text. |
| Outputs | Generated CV preview style context. |
| Dependencies | `_commercialV2GeneratedCvTemplate`; `_GeneratedCvPreview`. |
| Signals | None found. |
| Storage | Saved in `draftProfile.styleInstruction`. |
| Collections | `commercial_v2_profiles/{uid}.draftProfile`. |
| Known Issues | Only Medical White renderer currently exists; pharaonic/gold/black requests are documented as pending template expansion. |
| Required Changes | Add real non-medical template renderers in future approved implementation. |
| Status | DOCUMENTED_PENDING_TEMPLATE_EXPANSION |
## 2026-06-26 Update

Operation:

OP-COMMERCIAL-V2-IMAGE-UPLOAD-REMOVAL-AND-AI-GENERATION-HANDOFF-V1

`styleInstruction` remains a text-only Commercial V2 input.

It is included in:

- Commercial Text Profile Package
- Commercial AI Generation Handoff Package

Image/logo is not required for style instruction capture.

Template expansion remains:

DOCUMENTED_PENDING_TEMPLATE_EXPANSION
