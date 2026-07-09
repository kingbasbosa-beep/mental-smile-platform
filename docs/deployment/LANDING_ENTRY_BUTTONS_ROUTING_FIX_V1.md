# Landing Entry Buttons Routing Fix V1

Operation: LANDING_ENTRY_BUTTONS_ROUTING_FIX_V1

Date: 2026-07-09

## Scope

Fix the visible Mobile and Desktop landing entry buttons in the clean Mental Smile Platform repository.

Work was performed only inside:

`C:\mental_smile_workspace\repositories\mental-smile-platform-clean`

The historical repository was not touched.

## Problem

The landing buttons were wired to old routes:

- Desktop: `/legacy/splash`
- Mobile: `/splash`

Those routes do not exist in the clean repository because only the Landing Capsule has been materialized.

## Fix

The buttons now use Flutter internal navigation to clean placeholder routes:

- Desktop: `/desktop-entry`
- Mobile: `/mobile-entry`

## Routes Added

### `/desktop-entry`

Displays:

- Title: `Desktop Entry`
- Arabic: `دخول نسخة الديسكتوب`
- Message: `This entry will be connected during the next platform materialization step.`

### `/mobile-entry`

Displays:

- Title: `Mobile Entry`
- Arabic: `دخول نسخة الموبايل`
- Message: `This entry will be connected during the next platform materialization step.`

## Files Modified

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`
- `lib/app/router/routes.dart`
- `lib/app/app.dart`
- `docs/operations/OPERATIONS_REGISTRY_V1.md`
- `docs/operations/OPERATIONS_INDEX_V1.md`

## Verification

Commands executed:

```powershell
flutter pub get
flutter build web --release --base-href /mental-smile-platform/
```

Build status: PASSED

Build output:

`build/web`

## What Was Not Changed

- No mobile runtime was imported.
- No desktop runtime was imported.
- No old modules were imported.
- No Firebase configuration was added.
- No authentication was created.
- No assets were modified.
- No GitHub Pages settings were changed.
- No historical repository files were touched.

## Final Status

Mobile button fixed: YES

Desktop button fixed: YES

Routes added: `/mobile-entry`, `/desktop-entry`

Build passed: YES

Result: LANDING_ENTRY_BUTTONS_ROUTING_FIX_V1_COMPLETED
