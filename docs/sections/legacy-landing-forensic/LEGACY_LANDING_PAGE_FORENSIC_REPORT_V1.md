# Legacy Landing Page Forensic Report V1

Operation: LEGACY_LANDING_PAGE_FORENSIC

Date: 2026-07-02

Scope: Forensic documentation only. No Flutter, route, runtime, Firebase, Firestore, or Storage changes were made.

## Finding

The page shown at localhost root is an active Flutter web portal skeleton, not an unknown-route fallback and not a browser-only residue.

It is still active because the app router explicitly registers `/` as `Routes.portalHome` and returns `PortalHomePage`.

## Exact Page File

File path:

- `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart`

Exact widget/class:

- `PortalHomePage`

Visible page body source:

- `_PortalHeroHome`

Visible navigation source:

- `_PortalNavbar`
- `_PortalNavButton`
- `_PortalActionButton`

Visible text evidence:

- `Mental Smile`
- `Constitutional Operational Federation`
- `Marketplace + Support Ecosystem + Professional Services`
- `Open Mental Smile App / ...` with broken Arabic mojibake
- Top links: `Home`, `About`, `Library`, `Contact`

## Exact Route Paths

| Route Constant | Path | Widget / Destination | Status |
|---|---|---|---|
| `Routes.portalHome` | `/` | `PortalHomePage` | ACTIVE |
| `Routes.portalAbout` | `/about` | `PortalAboutPage` | ACTIVE |
| `Routes.portalLibrary` | `/library` | `LibraryPage(returnRoute: Routes.portalHome)` | ACTIVE |
| `Routes.portalContact` | `/contact` | `PortalContactPage` | ACTIVE |

There is no active `Routes.home` found in the inspected runtime.

There is no `/home` route found in the inspected runtime.

## Router References

Route constants:

- `lib/app/router/routes.dart`
- Comment: `Web Portal Phase 1 Skeleton`
- `static const portalHome = '/';`
- `static const portalAbout = '/about';`
- `static const portalLibrary = '/library';`
- `static const portalContact = '/contact';`

Router mapping:

- `lib/app/router/app_router.dart`
- `case Routes.portalHome:` returns `PortalHomePage`
- `case Routes.portalAbout:` returns `PortalAboutPage`
- `case Routes.portalLibrary:` returns `LibraryPage(... returnRoute: Routes.portalHome)`
- `case Routes.portalContact:` returns `PortalContactPage`

App startup:

- `lib/app/app.dart`
- `initialRoute: Routes.splash`

This means the app does not start at `/` internally, but `/` remains a valid public root route when requested directly or reached through legacy portal navigation.

## Navigation References

Active in-app navigation references found:

| Source | Navigation | Destination |
|---|---|---|
| `_PortalNavbar` | `Navigator.of(context).pushNamed(route)` | `/`, `/about`, `/library`, `/contact` |
| `_PortalHeroHome` action buttons | `_PortalActionButton` | `/library`, `/contact`, `/splash` |
| `LibraryPage` opened through `/library` | `_LibraryBackButton` with `returnRoute: Routes.portalHome` | `/` |
| Browser/direct URL | direct route load | `/` |

External website references found:

| Source | Destination |
|---|---|
| `SplashPage` official website button | `https://mental-smile-platform.web.app` |
| `AppExitSocialLinksPage` Website row | `https://mental-smile-platform.web.app` |
| `ResidentialExitSocialLinksPage` Official Website row | `https://mental-smile-platform.web.app` |

These are external URL launches, not in-app `Navigator` route pushes. If that hosted URL serves the same Flutter app at root, it will display `PortalHomePage`.

## Screens That Can Reach It

Direct active screens/routes:

- `PortalHomePage` through `/`
- `PortalAboutPage` through navbar Home link to `/`
- `PortalContactPage` through navbar Home link to `/`
- `LibraryPage` when opened by `/library`, because the router gives it `returnRoute: Routes.portalHome`

Indirect active entry points:

- Browser address bar at localhost root or hosted root
- External official website buttons that open `https://mental-smile-platform.web.app`

No inspected active Residential, Library, Commercial V2, Administrative, or Splash screen directly pushes `Routes.portalHome` through `Navigator`.

## Active Dependency Count

Active route cases depending on the legacy portal skeleton family: 4

- `/`
- `/about`
- `/library`
- `/contact`

Active route cases directly depending on `PortalHomePage`: 1

- `/`

Active in-app navigation surfaces inside the legacy portal family: 2 reusable widgets

- `_PortalNavButton`
- `_PortalActionButton`

Active non-portal screen dependency that can return to `/`: 1

- `LibraryPage` only when entered through `/library`

## Classification

Classification: ACTIVE LEGACY PUBLIC WEB SKELETON

It is not an unknown route.

It is not a fallback route.

It is not `/home`.

It is not `Routes.home`.

It is not only archived code.

It is active runtime because `app_router.dart` imports `portal_skeleton_pages.dart` and returns the portal widgets for active route cases.

## Why It Still Exists

It still exists because:

1. `Routes.portalHome = '/'` remains active.
2. `AppRouter.onGenerateRoute` still maps `/` to `PortalHomePage`.
3. The legacy portal navbar still links Home/About/Library/Contact.
4. `/library` is still a portal/public Library alias and is configured to return to `/`.
5. Historical documentation labels `/` as the public web / official website route.

## Safe Removal Risk

Safe removal risk: MEDIUM

Removing `PortalHomePage` without replacing `/` would break:

- Direct localhost root loading.
- Hosted public root loading if `mental-smile-platform.web.app` serves this Flutter app.
- Portal navbar Home.
- The `/library` route's current back destination.
- Documentation expectations that `/` is the official website/public web destination.

Removing only the active route mapping would not break `Routes.splash` startup, because the app starts at `/splash`.

## Recommended Action

Recommended action: OWNER_DECISION_REQUIRED

Reason: The page is ugly/legacy and contains broken text, but it is also the active public root route. This is a product/ownership decision, not only a cleanup decision.

Decision options:

- `REMOVE_FROM_ACTIVE_SYSTEM`: Safe only after `/`, `/about`, `/contact`, and `/library` return behavior are reassigned.
- `KEEP_AS_PUBLIC_WEB_LANDING`: Requires redesign/copy repair because the current skeleton is stale and visually legacy.
- `REPLACE_WITH_CURRENT_SPLASH`: Good if root should behave like the active entry-auth/splash experience.
- `ROUTE_TO_ARCHIVE_ONLY`: Good if this should remain historical evidence but not active runtime.
- `OWNER_DECISION_REQUIRED`: Current recommended status.

Owner decision required: YES

## Final Verdict

LEGACY_LANDING_PAGE_FORENSIC_COMPLETED
