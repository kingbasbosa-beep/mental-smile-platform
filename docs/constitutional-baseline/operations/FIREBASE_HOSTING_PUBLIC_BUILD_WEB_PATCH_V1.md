# Firebase Hosting Public Build Web Patch V1

Status: COMPLETED
Date: 2026-07-08
Scope: `firebase.json` hosting config only

## Changes

- Changed `hosting.public` from `public-landing` to `build/web`.
- Added SPA rewrite:
  - `source`: `**`
  - `destination`: `/index.html`

## Not Changed

- `functions` config was not changed.
- `firestore` config was not changed.
- `storage` config was not changed.
- `flutter` config was not changed.
- No deploy was run.
- No commands were run.

## Files Changed

- `firebase.json`
- `docs/constitutional-baseline/operations/FIREBASE_HOSTING_PUBLIC_BUILD_WEB_PATCH_V1.md`
