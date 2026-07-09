# CARD 008 CV Generation

| Field | Value |
|---|---|
| Card ID | CARD 008 |
| Card Name | CV Generation |
| Purpose | Generate professional CV preview and PDF from Commercial V2 draft data. |
| Current Behavior | `_generateProfessionalCvPreview` creates local preview payload and captures local identity image bytes; `_downloadGeneratedCvPreviewPdf` builds Medical White preview PDF with local bytes, Firebase Storage SDK bytes, and HTTP fallback priority. Official `_generatePdfProfile` now builds payload through identity fallback instead of raw `liveProfile`. |
| Expected Behavior | Generated CV should include correct identity image/logo and be package-ready for archive/marketing when approved. |
| Inputs | Draft profile payload; style instruction; local identity bytes; identity image/logo URL. |
| Outputs | UI preview; preview PDF. |
| Dependencies | `_GeneratedCvPreview`; `_CommercialV2MedicalWhitePdfBuilder`; `_pdfIdentityImage`; Printing/pdf; Firebase Storage SDK; HTTP fallback. |
| Signals | None found. |
| Storage | Generated on demand, not automatically stored. |
| Collections | Reads current profile/draft data only. |
| Known Issues | Non-medical template rendering is documented pending template expansion. |
| Required Changes | Verify official PDF and CV preview receive resolved identity image URL after repeated draft saves. |
| Status | FIXED_PENDING_MANUAL_VERIFICATION |
## 2026-06-26 Update

Operation:

OP-COMMERCIAL-V2-IMAGE-UPLOAD-REMOVAL-AND-AI-GENERATION-HANDOFF-V1

CV generation now treats Commercial V2 as text-only.

Identity image loading through Firebase Storage, HTTP, or local selected bytes is not part of the active CV/PDF generation path.

Fallback:

Initials/avatar placeholder.

Image dependency:

REMOVED_FROM_ACTIVE_RUNTIME
