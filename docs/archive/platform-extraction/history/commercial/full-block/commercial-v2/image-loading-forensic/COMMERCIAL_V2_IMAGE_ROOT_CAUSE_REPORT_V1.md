# COMMERCIAL_V2_IMAGE_ROOT_CAUSE_REPORT_V1

Status: FORENSIC DEBUG ONLY

## Questions Answered

| Question | Conclusion | Confidence | Evidence |
|---|---|---:|---|
| Does failure occur before Storage? | NO | HIGH | Upload is reported successful; code awaits `putData` at lines 1245-1254. |
| Does failure occur after Storage? | YES | HIGH | URL is resolved and profile can display image according to mission facts. |
| Does failure occur before URL resolution? | NO | HIGH | `getDownloadURL` is awaited at line 1255 and URL is logged. |
| Does failure occur after URL resolution? | YES | HIGH | Runtime log includes resolved identity image URL before failure. |
| Does failure occur inside PDF Builder? | PARTLY | MEDIUM | PDF builder calls `_pdfIdentityImage`; image disappears when it returns null. |
| Does failure occur inside Image Loader? | YES | HIGH for UI log, MEDIUM for PDF | UI error branch is `Image.network`; PDF loader catches errors silently. |
| Does failure occur inside Network Request? | YES for observed log | HIGH | Observed `HTTP request failed statusCode: 0` is a network request failure. |
| Does failure occur inside Windows Runtime? | NOT PROVEN | LOW | No platform evidence collected beyond statusCode 0. |
| Does failure occur inside `package:pdf`? | NO direct evidence | MEDIUM | `package:pdf` only renders `pw.Image` if given an image provider; loader is local helper plus `printing`. |
| Does failure occur inside `printing.networkImage`? | POSSIBLE, not proven from current logs | MEDIUM | PDF fallback uses `networkImage`; exceptions are swallowed at lines 5848-5849. |

## Root Cause Statement

The confirmed failure boundary is after URL resolution and before PDF image rendering.

For the observed log text, the exact failing branch is Flutter `Image.network` in `_CommercialV2IdentityImage.build`, lines 5522-5541.

For the generated CV/PDF missing image, the exact disappearance point is `_pdfIdentityImage` returning `null` at line 5849 after image loading attempts fail or throw.

## Why It Is Not a Storage Upload Failure

The operation facts state that:

- image uploads successfully
- download URL resolves successfully
- image exists in Firebase Storage
- image appears correctly in generated profile

The source code also awaits upload, URL resolution, and Firestore save.

## Why It Is Not Proven as URL Corruption

Only whitespace stripping is performed by `_normalizeImageUrl`; no token, host, or query replacement exists.

Actual token/`alt=media` verification requires runtime URL capture and is not present in repository source.

