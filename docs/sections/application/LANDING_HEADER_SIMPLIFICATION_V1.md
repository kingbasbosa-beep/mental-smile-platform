# Landing Header Simplification V1

Status: IMPLEMENTED_PENDING_MANUAL_VERIFICATION
Date: 2026-07-07
Scope: Existing Flutter landing page header cleanup

## Landing Page

File:

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`

Routes:

- `/commercial-v2/web`
- `/landing-preview`

## Changes Applied

- Removed the full top navigation/header container from the landing page.
- Removed the navigation actions from the header widget tree:
  - الرئيسية
  - عن المنصة
  - ما تقدمه
  - الغرف
  - تواصل
- Removed the navigation text fields from `_WebsiteCopy`.
- Kept only the language switch.
- Moved the language switch into a small standalone top-left `SafeArea` control.
- Removed the reserved header space from the scroll content.
- Reduced top scroll padding.
- Moved the hero section upward so the landing starts almost immediately with the hero.

## Preserved

- Existing landing design.
- Existing hero section.
- Existing animations.
- Existing RTL behavior.
- Existing responsive layout.
- Existing feature cards and routes.
- Existing `/commercial-v2/web` route.
- Existing `/landing-preview` alias route.

## Not Added

- No booking.
- No login.
- No payment.
- No pricing.
- No appointments.
- No patient dashboard.
- No redesign.
- No Figma output.

## Files Changed

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`
- `docs/sections/application/LANDING_HEADER_SIMPLIFICATION_V1.md`

## Verification

Commands were not run by request.

Manual preview command:

```powershell
flutter run -d chrome --web-port 5000
```

Preview URL:

- `http://localhost:5000/#/landing-preview`

## Issues Found

- Manual formatting/analyzer verification is still required.
- If dependencies were not refreshed after previous work, run `flutter pub get` manually before web preview.

## Final Verdict

LANDING_HEADER_SIMPLIFICATION_IMPLEMENTED_PENDING_MANUAL_VERIFICATION
