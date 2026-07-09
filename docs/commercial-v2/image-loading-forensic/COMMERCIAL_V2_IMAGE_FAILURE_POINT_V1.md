# COMMERCIAL_V2_IMAGE_FAILURE_POINT_V1

Status: FORENSIC DEBUG ONLY

## Exact File

`lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

## Observed Runtime Log Path

The log text:

`Commercial V2 identity image failed to load`

is produced only by `_CommercialV2IdentityImage.build`.

Exact code path:

1. `_CommercialV2IdentityImage.build`
2. `_resolveIdentityImageUrl(payload)` at line 5495
3. `debugPrint('Commercial V2 resolved identity image URL: $imageUrl')` at line 5496
4. `Image.network(imageUrl, ...)` at lines 5522-5536
5. `errorBuilder` at lines 5537-5541
6. `debugPrint('Commercial V2 identity image failed to load: $imageUrl | $error')` at lines 5538-5539

## Exact Runtime Branch Producing Logged Error

The logged `HTTP request failed statusCode: 0` belongs to the Flutter `Image.network` branch, not directly to the PDF builder branch.

## PDF/CV Missing Image Path

The generated CV/PDF image path is:

1. `_downloadGeneratedCvPreviewPdf` lines 1457-1468
2. `Printing.layoutPdf(...)` lines 1460-1467
3. `_CommercialV2MedicalWhitePdfBuilder.build(...)` lines 3477-3488
4. `_pdfIdentityImage(payload)` line 3488
5. `_resolveIdentityImageUrl(payload)` line 5835
6. `FirebaseStorage.instance.refFromURL(url).getData(...)` lines 5837-5839
7. If that throws, catch at lines 5843-5845
8. `networkImage(url)` line 5847
9. If that throws, catch at lines 5848-5849
10. Builder receives `identityImage == null` and renders fallback `MS` at lines 3514-3525

## Failure Line Determination

Exact logged HTTP failure line:

- UI profile loader: `Image.network` error branch at lines 5522-5541.

Exact PDF disappearance line:

- `_pdfIdentityImage` returns `null` at line 5849 after both image-provider attempts fail or throw.

## Evidence Limitation

The PDF helper catches exceptions silently at lines 5843 and 5848. Therefore the exact internal exception from `getData` or `networkImage` cannot be proven from current logs without adding instrumentation, which is prohibited by this operation.

