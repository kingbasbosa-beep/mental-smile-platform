# COMMERCIAL_V2_PDF_IMAGE_LOADING_TRACE_V1

Status: FORENSIC DEBUG ONLY

## PDF Loader Implementation

| Loader | Package | Method | Source File | Function Name | Current Status |
|---|---|---|---|---|---|
| Firebase Storage SDK | `firebase_storage` | `FirebaseStorage.instance.refFromURL(url).getData(5 * 1024 * 1024)` | `commercial_v2_profile_engine_page.dart` | `_pdfIdentityImage` | PRIMARY PDF LOADER |
| PDF Memory Image | `pdf` | `pw.MemoryImage(bytes)` | `commercial_v2_profile_engine_page.dart` | `_pdfIdentityImage` | USED IF FIREBASE BYTES RETURN |
| Printing Network Image | `printing` | `networkImage(url)` | `commercial_v2_profile_engine_page.dart` | `_pdfIdentityImage` | FALLBACK LOADER |
| HTTP GET | `http` transitive through `printing` | `http.get(uri, headers: headers)` | `printing-5.14.3/lib/src/cache.dart` | `PdfBaseCache._download` | USED BY `networkImage` |
| Flutter UI Network Image | Flutter SDK | `Image.network(imageUrl)` | `commercial_v2_profile_engine_page.dart` | `_CommercialV2IdentityImage.build` | UI PROFILE LOADER ONLY |
| NetworkAssetBundle | Flutter SDK | Not found in Commercial V2 image path | None | None | NOT USED |
| Cached Network Image | External package | Not present in dependency list or code path | None | None | NOT USED |
| Custom Loader | Local code | `_pdfIdentityImage` | `commercial_v2_profile_engine_page.dart` | `_pdfIdentityImage` | USED |

## External Package Evidence

`printing-5.14.3/lib/src/asset_utils.dart`:

- `networkImage` is defined at lines 103-119.
- It resolves bytes through `PdfBaseCache.resolve`.
- It returns `MemoryImage(bytes)`.

`printing-5.14.3/lib/src/cache.dart`:

- `_download` imports `package:http/http.dart` at line 21.
- `_download` calls `http.get(uri, headers: headers)` at line 48.
- Non-200 returns `null` at lines 49-51.
- `resolve` throws `FlutterError('Unable to download $uri')` when bytes are null at lines 69-70.

## Finding

The PDF loader is not `Image.network`. The PDF loader is `_pdfIdentityImage`, trying Firebase Storage SDK first and `printing.networkImage` second.

