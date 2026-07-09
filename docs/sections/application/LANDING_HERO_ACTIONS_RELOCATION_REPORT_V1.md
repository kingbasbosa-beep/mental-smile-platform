# Landing Hero Actions Relocation Report V1

Status: IMPLEMENTED_PENDING_MANUAL_VERIFICATION
Date: 2026-07-07
Scope: Existing Flutter landing preview page only

## Target File

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`

## Existing Page

Widget:

- `CommercialV2WebShowcasePage`

Routes preserved:

- `/commercial-v2/web`
- `/landing-preview`

## Changes Applied

- Removed the two large centered hero actions from the hero center:
  - `استكشاف المنصة`
  - `فتح التطبيق`
- Added two compact floating controls at the top-right of the landing page:
  - `ديسكتوب`
  - `موبايل`
- Kept the standalone language switch at the top-left.
- Removed the old hero action button height from the center area.
- Preserved the clean hero center.
- Kept the existing scroll-to-platform behavior for the desktop control.
- Kept the existing open-app route behavior for the mobile control.

## Icon Handling

The controls use minimal matching Material gold outline icons:

- Desktop: `Icons.desktop_windows_rounded`
- Mobile: `Icons.phone_iphone_rounded`

This preserves the Splash visual idea without introducing risky widget extraction or new assets.

## Behavior

Desktop control:

- Label: `ديسكتوب`
- Behavior: same as previous `استكشاف المنصة`; scrolls to the platform/features section.

Mobile control:

- Label: `موبايل`
- Behavior: same as previous `فتح التطبيق`; opens `Routes.splash`.

## Preserved

- Existing landing content.
- Existing background and hero art.
- Existing animations.
- RTL.
- Responsiveness.
- Language switching.
- Existing routes and navigation behavior.

## Not Added

- No booking.
- No login.
- No pricing.
- No payment.
- No appointments.
- No dashboard.
- No route changes.
- No redesign.

## Files Changed

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`
- `docs/sections/application/LANDING_HERO_ACTIONS_RELOCATION_REPORT_V1.md`

## Verification

Commands were not run by request.

Manual preview command:

```powershell
flutter run -d chrome --web-port 5000
```

Preview URL:

- `http://localhost:5000/#/landing-preview`

## Issues Found

- Manual format/analyzer verification is still required.
- If dependencies have not been refreshed after previous work, run `flutter pub get` manually before preview.

## Final Verdict

LANDING_HERO_ACTIONS_RELOCATION_IMPLEMENTED_PENDING_MANUAL_VERIFICATION
