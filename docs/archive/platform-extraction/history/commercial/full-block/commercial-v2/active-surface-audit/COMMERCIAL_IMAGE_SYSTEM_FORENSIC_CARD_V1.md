# Commercial Image System Forensic Card V1

## Operation

OP-COMMERCIAL-V2-ACTIVE-SURFACE-EXTRACTION-AND-CARD-REGISTRY-AUDIT-V1

## Status

FORENSIC CARD ONLY

## Image Lifecycle Audit

| Lifecycle Step | Status | Evidence | Notes |
|---|---|---|---|
| Upload | Mitigated By Registration Relocation / Pending Verification | Registration optional image selector; owner profile optional edit | Image upload no longer blocks profile creation/editing flow. |
| Storage | Public Storage Isolated / Pending Manual Verification | `commercial_v2_public_identity/{uid}/profile_photo` or `/logo` | New storage rules allow public read and owner image write <= 5MB for the new namespace only. |
| Retrieval | Fixed / Pending Manual Verification | `_CommercialV2IdentityImage`; local bytes; draft/root/live URL fallback; `_resolveIdentityImageUrl`; `_profileMapWithIdentityFallback` | Draft save now preserves existing identity URLs when incoming payload image fields are empty. |
| Profile Display | Non-Blocking / Pending Manual Verification | `_ProfileMediaBlock`; `_IdentityImageControl` | Owner display supports local bytes and draft URL rendering diagnostics; failure does not block editing. |
| Preview Display | Rebuilt / Pending Manual Verification | `CommercialV2PreviewPage`; `_profileMapWithIdentityFallback`; `_PublicProfileView` | Draft preview now logs and renders from `draftProfile` identity URL before publishing. |
| CV Display | Fixed / Pending Manual Verification | `_CommercialV2MedicalWhitePdfBuilder`; `_CommercialV2PdfBuilder`; `_pdfIdentityImage`; `_profileMapWithIdentityFallback` | Official PDF payload now uses identity fallback instead of raw liveProfile. |
| Business Card Display | Implemented / Pending Manual Verification | `_BusinessCardPreview`; `_CommercialV2BusinessCardPdfBuilder` | Uses rebuilt identity image rendering path for preview/PDF metadata. |
| Promo Post Display | Implemented / Pending Manual Verification | `_PromoPostPreview`; `_CommercialV2PromoPostPdfBuilder` | Uses rebuilt identity image rendering path for preview/PDF metadata. |

## Reported Issue

Image visible in storage.

Image available to profile.

Image not correctly appearing in generated CV.

## Severity

HIGH

## Impact

Generated CV output can lose identity image/logo, reducing quality of Commercial V2 generated asset and future Marketing handoff.

## Probable Cause

The old generated CV PDF path depended on remote URL loading without local selected image bytes. The rebuilt path now prefers local selected bytes for same-session generation, then Firebase Storage SDK bytes, then explicit HTTP bytes fallback.

## Known Dependency

- Firebase Storage public read rule for `commercial_v2_public_identity`.
- Legacy `commercial_v2_identity` remains unchanged for backward compatibility.
- Download URL validity.
- PDF generation network image fetching.
- `_resolveIdentityImageUrl`.
- `_pdfIdentityImage`.

## Status

FIXED_PENDING_MANUAL_VERIFICATION

Targeted source-of-truth fix performed in `OP-COMMERCIAL-V2-IMAGE-AND-STYLE-SOURCE-OF-TRUTH-FIX-V1`.
