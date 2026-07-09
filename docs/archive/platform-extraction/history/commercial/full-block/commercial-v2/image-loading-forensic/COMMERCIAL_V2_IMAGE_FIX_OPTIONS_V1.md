# COMMERCIAL_V2_IMAGE_FIX_OPTIONS_V1

Status: DOCUMENTED OPTIONS ONLY

No fix was implemented.

## Recommended Fix

Load PDF images from Firebase Storage bytes and remove silent failure.

Documented repair shape:

- Keep `_pdfIdentityImage`.
- Prefer `FirebaseStorage.instance.refFromURL(url).getData(...)`.
- Log or surface the exception when `getData` fails.
- Only use `networkImage` if SDK byte loading is not available.

Risk Level: LOW

Complexity: LOW-MEDIUM

## Alternative Fix

Persist local uploaded image bytes temporarily for immediate CV/PDF generation after upload.

Risk Level: MEDIUM

Complexity: MEDIUM

Reason:

This avoids network retrieval during same-session generation but requires lifecycle rules for transient bytes.

## Fallback Fix

Use a signed/download URL with explicit request validation before PDF build.

Risk Level: MEDIUM

Complexity: MEDIUM

Reason:

This validates URL accessibility before PDF render but does not avoid network dependency.

## Temporary Workaround

Generate CV/PDF without image and keep identity image visible in the profile page until loader diagnostics are added.

Risk Level: LOW

Complexity: LOW

## Not Recommended

- PDF redesign
- Firebase rule changes without evidence
- Replacing the whole PDF package without instrumentation
- Converting the image path to a new architecture before confirming the exact thrown exception

