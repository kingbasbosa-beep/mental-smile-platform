# Root Route Landing Restore V1

Operation: ROOT_ROUTE_LANDING_RESTORE_V1

Date: 2026-07-09

## Scope

Fix only the GitHub Pages initial route behavior for the clean Mental Smile Platform repository.

## Problem

Opening:

`https://kingbasbosa-beep.github.io/mental-smile-platform/`

was landing directly on:

`/#/splash`

because `MaterialApp.initialRoute` was set to `Routes.splash`.

## Fix

Changed `lib/app/app.dart` so the app starts on root:

```dart
initialRoute: '/',
```

The existing `AppRouter` already maps `/` to `CommercialV2WebShowcasePage`, so no UI or route architecture change was needed.

## Preserved Behavior

- `/` opens the existing Commercial V2 web showcase landing.
- `/landing-preview` opens the same landing.
- `/splash` remains available.
- Desktop button continues navigating to `Routes.legacySplash`.
- Mobile button continues navigating to `Routes.splash`.

## Files Modified

- `lib/app/app.dart`
- `docs/deployment/ROOT_ROUTE_LANDING_RESTORE_V1.md`
- `docs/operations/OPERATIONS_REGISTRY_V1.md`
- `docs/operations/OPERATIONS_INDEX_V1.md`

## What Was Not Changed

- No UI was changed.
- No Firebase configuration was changed.
- No assets were changed.
- No historical repository import was performed.
- No splash route was removed.
- No landing button behavior was changed.

## Verification

Commands executed:

```powershell
flutter analyze
flutter build web --release --base-href /mental-smile-platform/
```

Analyze result: PASSED

Web build result: PASSED

Build output:

`build/web`

## Final Status

Root route opens landing: YES

Landing preview opens landing: YES

Splash remains available: YES

Mobile/Desktop buttons remain real runtime navigation: YES

Result: ROOT_ROUTE_LANDING_RESTORE_V1_COMPLETED
