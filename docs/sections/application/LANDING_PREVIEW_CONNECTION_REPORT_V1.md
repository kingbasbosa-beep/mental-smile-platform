# Landing Preview Connection Report V1

Status: CONNECTED_PENDING_RUNTIME_PREVIEW
Date: 2026-07-07
Scope: Existing Flutter landing / website home preview only

## Landing Page

Landing page file:

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`

Landing page widget:

- `CommercialV2WebShowcasePage`

## Existing Route

Existing route:

- `/commercial-v2/web`

Existing route constant:

- `Routes.commercialV2Web`

Router status:

- Already reachable from `AppRouter.onGenerateRoute`.

## Temporary Preview Route

Temporary safe route added:

- `/landing-preview`

Temporary route constant:

- `Routes.landingPreview`

Preview target:

- Same existing `CommercialV2WebShowcasePage`.

## Preview URL

Chrome preview URL:

- `http://localhost:5000/#/landing-preview`

Fallback command:

```powershell
flutter run -d chrome --web-port 5000
```

Then open:

- `http://localhost:5000/#/landing-preview`

## Files Changed

- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`
- `docs/sections/application/LANDING_PREVIEW_CONNECTION_REPORT_V1.md`

## Boundaries Respected

- No new landing design created.
- No Figma output used.
- No website redesign performed.
- No booking, login, payment, pricing, appointments, or patient dashboard added.
- Existing `/commercial-v2/web` route preserved.
- Existing routes were not removed.

## Issues Found

- The app currently includes recently added dependencies in `pubspec.yaml`; if `flutter pub get` has not been run after those changes, Flutter analysis/build can report missing `flutter_markdown` and `markdown` packages before preview.
- `pubspec.lock` must be refreshed by `flutter pub get` if not already done locally.

## Final Verdict

LANDING_PREVIEW_ROUTE_CONNECTED_PENDING_CHROME_RUN
