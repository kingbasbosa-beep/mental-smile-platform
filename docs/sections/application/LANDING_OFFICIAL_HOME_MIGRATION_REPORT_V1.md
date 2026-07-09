# Landing Official Home Migration Report V1

Status: COMPLETED_PENDING_MANUAL_RUNTIME_PREVIEW
Date: 2026-07-08
Scope: Route-level migration only

## Objective

Make the official site root path `/` render the current Mental Smile landing page directly.

The landing page remains the same existing page used by `/landing-preview`.

## What Was Modified

- Updated `lib/app/router/app_router.dart`.
- Changed the root route `/` from `Generation2SplashPage` to `CommercialV2WebShowcasePage`.
- Kept the route settings as `/` so the browser root remains the official homepage path.

## Official Home Result

After deployment of the Flutter web build, opening:

- `https://mentalsmile.org`

will load the app at `/`, and `/` now renders the current landing page directly.

## Temporary Preview Route

The temporary review route remains active:

- `/landing-preview`

It still renders:

- `CommercialV2WebShowcasePage`

## Internal Landing Links

No landing page button behavior was changed.

Expected existing links remain owned by their current implementation:

- Mobile version control: unchanged.
- Desktop version control: unchanged.
- Presentation gallery: unchanged.
- Official links page: unchanged.

## What Was Not Modified

- No landing design changes.
- No landing widget changes.
- No Firebase Rules changes.
- No runtime feature changes.
- No backend changes.
- No new pages.
- No login, booking, payment, pricing, appointments, or dashboard additions.
- No removal of `/landing-preview`.
- No changes to existing routes except the `/` target.

## Files Changed

- `lib/app/router/app_router.dart`
- `docs/sections/application/LANDING_OFFICIAL_HOME_MIGRATION_REPORT_V1.md`

## Verification

No Flutter commands were run in this task.

Manual preview recommended:

```powershell
flutter run -d chrome --web-port 5000
```

Then open:

- `http://localhost:5000/`
- `http://localhost:5000/#/landing-preview`

## Final Verdict

LANDING_OFFICIAL_HOME_ROUTE_CONNECTED
