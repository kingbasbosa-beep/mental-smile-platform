# COMMERCIAL_V2_IMAGE_RUNTIME_TRACE_V1

Operation ID: OP-COMMERCIAL-V2-CV-IMAGE-LOADING-FORENSIC-AUDIT-V1

Status: FORENSIC DEBUG ONLY

## Scope

Trace Commercial V2 identity image lifecycle from local selection to CV/PDF export.

## File Involved

`lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

## Lifecycle Trace

| Stage | Function | Lines | Async Call | Evidence | Status |
|---|---|---:|---|---|---|
| Image Selection | `_uploadIdentityImage` | 1212-1219 | `ImagePicker().pickImage(...)` | User selects image from gallery. | FOUND |
| Content Type Validation | `_imageContentType` via `_uploadIdentityImage` | 1220-1228 | None | Unsupported image exits before upload. | FOUND |
| Local Bytes Read | `_uploadIdentityImage` | 1232 | `picked.readAsBytes()` | Bytes are read before upload. | FOUND |
| Firebase Storage Reference | `_uploadIdentityImage` | 1240-1244 | None | Path: `commercial_v2_identity/{uid}/{profile_photo|logo}`. | FOUND |
| Firebase Storage Upload | `_uploadIdentityImage` | 1245-1254 | `ref.putData(...)` | Upload is awaited. | FOUND |
| Download URL Resolution | `_uploadIdentityImage` | 1255 | `ref.getDownloadURL()` | Download URL is awaited after upload. | FOUND |
| Controller Assignment | `_uploadIdentityImage` | 1256-1262 | None | URL assigned to `profileImageUrl` or `logoImageUrl`. | FOUND |
| Firestore Save | `_uploadIdentityImage` -> `_CommercialV2Store.saveDraft` | 1263, 2986-2992 | `saveDraft`, `profileDoc(uid).set(...)` | Draft profile and root image fields are saved. | FOUND |
| Profile Loading | `_load` | 898-909 | `profileDoc(uid).get()` twice | Draft is loaded through `_profileMapWithIdentityFallback`. | FOUND |
| Controller Restore | `_apply` | 912-929 | None | Image URL restored into text controllers. | FOUND |
| Payload Creation | `_payload` | 949-963 | None | URL is normalized by `_normalizeImageUrl`. | FOUND |
| URL Fallback Merge | `_profileMapWithIdentityFallback` | 5800-5819 | None | Profile/root/live URL fallback order exists. | FOUND |
| Runtime Image Resolution | `_resolveIdentityImageUrl` | 5822-5831 | None | Chooses first non-empty normalized profile/logo URL. | FOUND |
| Generated Profile UI | `_CommercialV2IdentityImage.build` | 5495-5541 | `Image.network(...)` | UI image path logs resolved URL and network failures. | FOUND |
| Official PDF Builder | `_CommercialV2PdfBuilder.build` | 3289-3317 | `_pdfIdentityImage(payload)` | Uses returned PDF image provider if non-null. | FOUND |
| CV Generator | `_CommercialV2MedicalWhitePdfBuilder.build` | 3477-3525 | `_pdfIdentityImage(payload)` | Uses image if non-null, otherwise prints `MS`. | FOUND |
| PDF Export | `_downloadGeneratedCvPreviewPdf` | 1457-1468 | `Printing.layoutPdf(...)` | CV PDF export awaits builder output. | FOUND |

## Finding

The lifecycle reaches PDF/CV builders with a resolved payload URL path. The disappearance inside generated CV/PDF occurs after `_pdfIdentityImage` is invoked.

