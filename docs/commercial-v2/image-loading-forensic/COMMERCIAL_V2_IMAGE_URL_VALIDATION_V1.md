# COMMERCIAL_V2_IMAGE_URL_VALIDATION_V1

Status: FORENSIC DEBUG ONLY

## Raw URL Source

Raw download URL source:

- `final url = await ref.getDownloadURL();`
- File: `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- Line: 1255

## Stored URL Paths

| Location | Lines | Transformation |
|---|---:|---|
| `_profileImageUrl.text = url` | 1256-1258 | Direct assignment |
| `_logoImageUrl.text = url` | 1259-1261 | Direct assignment |
| `_CommercialV2Store.saveDraft` root fields | 2986-2992 | Stores payload URL |
| `_ProfilePayload.toMap` | 3762-3781 | Writes URL fields into profile map |
| `_ProfilePayload.fromMap` | 3733-3749 | Reads URL fields with `_normalizeImageUrl` |
| `_payload` | 949-963 | Reads controller values with `_normalizeImageUrl` |
| `_resolveIdentityImageUrl` | 5822-5831 | Chooses first non-empty normalized URL |

## URL Manipulation Found

Only one URL transformation was found:

`_normalizeImageUrl` at lines 5853-5854:

- converts null to empty string
- removes all whitespace using `replaceAll(RegExp(r'\s+'), '')`
- trims the result

## URL Replacement Found

No URL host replacement was found.

No token replacement was found.

No `alt=media` replacement was found.

No URL escaping rewrite was found.

## Token / alt=media Verification

Cannot be proven from repository source alone because the actual Firebase download URL value is runtime data returned by Firebase Storage at line 1255.

Known source-level fact:

- The code uses Firebase Storage `getDownloadURL()`, which is expected to return a Firebase download URL.
- The code does not inspect or validate `token`, `alt=media`, or query parameters before PDF loading.

## Final URL Used By PDF

Final URL used by PDF is the result of:

`_resolveIdentityImageUrl(payload)` at line 5835.

It is the normalized `profileImageUrl` or `logoImageUrl`.

## Differences

Known source-level difference:

- Raw URL from Firebase may contain whitespace only if Firebase returned it or UI state introduced it.
- Final URL removes whitespace.

No other source-level difference is present.

