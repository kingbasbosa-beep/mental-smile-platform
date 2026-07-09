# Legacy Public Web Skeleton Active Removal Report V1

Operation: REMOVE_ACTIVE_LEGACY_PUBLIC_WEB_SKELETON

Date: 2026-07-02

Scope: Active cleanup of the legacy public web skeleton. No Firebase, Firestore, Storage, Commercial V2, Residential, first runtime write, format, analyze, or test changes were made.

## Removed From Active Runtime

Deleted active legacy page file:

- `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart`

Removed active legacy widget family:

- `PortalHomePage`
- `PortalAboutPage`
- `PortalContactPage`
- `_PortalHeroHome`
- `_PortalNavbar`
- `_PortalActionButton`

Removed active legacy route constants:

- `Routes.portalHome`
- `Routes.portalAbout`
- `Routes.portalLibrary`
- `Routes.portalContact`

Removed active legacy route paths:

- `/` no longer opens the legacy skeleton.
- `/about` no longer opens `PortalAboutPage`.
- `/library` no longer opens the portal Library alias.
- `/contact` no longer opens `PortalContactPage`.

## Root Route Handling

Root `/` remains handled because web roots must be valid.

New behavior:

- `/` routes to the current valid Splash/start page.
- The route settings are normalized to `Routes.splash`.

This satisfies the rule: if `/` must exist, route it to the current valid splash/start page, not the old portal skeleton.

## Library Return Behavior

Updated:

- `lib/features/library/presentation/pages/library_page.dart`

Change:

- Library fallback route now returns to `Routes.webLibrary`.
- Library no longer returns to `Routes.portalLibrary`.
- `/library` portal alias is disconnected.

Protected current Library routes remain active:

- `/web/library`
- `/library/providers/specialists`
- `/library/providers/centers`

## Router Changes

Updated:

- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`

Removed:

- Import of `portal_skeleton_pages.dart`
- `case Routes.portalHome`
- `case Routes.portalAbout`
- `case Routes.portalLibrary`
- `case Routes.portalContact`

Added:

- Direct root `/` handling to `SplashPage`.

## Validation

Legacy page file deleted: YES

Legacy widget unreachable: YES

Legacy route constants removed: YES

`/` opens current Splash/start page: YES

`/about` opens legacy page: NO

`/library` opens legacy portal alias: NO

`/contact` opens legacy page: NO

`Routes.portalHome` remains: NO

`Routes.portalLibrary` remains: NO

`Routes.portalAbout` remains: NO

`Routes.portalContact` remains: NO

Broken Arabic portal text remains in active `lib`: NO

Current `/web/library` preserved: YES

Specialists route preserved: YES

Centers route preserved: YES

Commercial V2 affected: NO

Residential affected: NO

Firebase changed: NO

Firestore changed: NO

Storage changed: NO

First runtime write affected: NO

Dart format run: NO

Flutter analyze run: NO

Tests run: NO

## Final Verdict

LEGACY_PUBLIC_WEB_SKELETON_REMOVED_FROM_ACTIVE_RUNTIME
