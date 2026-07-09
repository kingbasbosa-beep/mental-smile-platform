# Commercial V2 Profile Generation Audit V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24

## Generation Inventory

| Item | Status | Evidence | Notes |
|---|---:|---|---|
| Profile Creation Page | ACTIVE | `/commercial-v2/owner`, `CommercialV2OwnerProfilePage` | Creates and saves draft profile fields. |
| AI Generation | PLACEHOLDER | No AI API call or model integration found | Style text maps to `medical_white`; no AI generation engine. |
| Profile Generation | ACTIVE / PARTIAL | Generated CV preview section | Creates a visual preview from draft payload; one template. |
| Card Print Generation | PLACEHOLDER | No route/action found | Not implemented. |
| Promo Post Generation | PLACEHOLDER | No route/action found | Not implemented. |
| Official PDF Generation | ACTIVE | `_generatePdfProfile`, `_CommercialV2PdfBuilder` | Uses live published profile only. |
| Preview PDF Generation | ACTIVE | `_downloadGeneratedCvPreviewPdf`, `_CommercialV2MedicalWhitePdfBuilder` | Uses draft payload; labeled preview/not published. |

## Template Behavior

The style instruction currently runs through `_commercialV2GeneratedCvTemplate`. All detected cases return:

- `medical_white`

Therefore template selection exists as a deterministic mapping, but only one actual template is currently available.

## Identity Image Use

Runtime includes:

- Firebase Storage upload for identity image
- unified identity image widget for Flutter UI
- PDF image loading for medical-white preview through `networkImage`

## Generation Boundaries

No evidence found of:

- invented credentials
- ranking
- recommendations
- booking
- payment
- messaging

## Generation Conclusion

Commercial V2 has real template-based PDF and preview generation. AI generation, business card generation, and promotional post generation remain absent/placeholders.

