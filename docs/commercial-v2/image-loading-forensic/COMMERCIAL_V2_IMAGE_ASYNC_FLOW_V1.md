# COMMERCIAL_V2_IMAGE_ASYNC_FLOW_V1

Status: FORENSIC DEBUG ONLY

## Async Flow Review

| Step | Awaited | Evidence |
|---|---|---|
| Image selection | YES | `await ImagePicker().pickImage(...)`, lines 1215-1218 |
| Bytes read | YES | `await picked.readAsBytes()`, line 1232 |
| Upload | YES | `await ref.putData(...)`, lines 1245-1254 |
| Download URL | YES | `await ref.getDownloadURL()`, line 1255 |
| Firestore draft update | YES | `await _CommercialV2Store.saveDraft(...)`, line 1263 |
| Firestore write inside saveDraft | YES | `await profileDoc(uid).set(...)`, lines 2986-2992 |
| Profile reload on page load | YES | `await profileDoc(uid).get()`, lines 898 and 902 |
| PDF layout/export | YES | `await Printing.layoutPdf(...)`, lines 1460-1467 |
| CV builder image lookup | YES | `final identityImage = await _pdfIdentityImage(payload)`, line 3488 |
| Firebase bytes for PDF image | YES | `await FirebaseStorage.instance.refFromURL(url).getData(...)`, lines 5837-5839 |
| Network fallback for PDF image | YES | `return await networkImage(url)`, line 5847 |

## Race Condition Review

No race condition was found in upload, URL resolution, Firestore draft save, or PDF image await sequence.

## Important Branch

The PDF builder intentionally continues when `_pdfIdentityImage` returns `null`. That fallback behavior is visible at lines 3514-3525.

