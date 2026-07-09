# G2 Login Selection Route Forensic Fix V1

## Root Cause

The `/g2/mobile/login-selection` route already existed and was registered, but the Mobile button on the new G2 Splash was pointing to the temporary Mobile Lite client route `/g2/mobile/client`.

## Files Checked

- `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart`
- `lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart`
- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`

## Route Findings

- Login selection file exists: YES
- Router import exists: YES
- `/g2/mobile/login-selection` route constant exists: YES
- `/g2/mobile/login-selection` route case exists: YES
- Route names duplicated or shadowed: NO duplicate route constant found in checked router files
- Hash route style: current app routing uses named routes; direct browser hash `#/g2/mobile/login-selection` should resolve through the same registered route when the Flutter web hash strategy is active

## Button Target

- Before: `Routes.generation2MobileLiteClient` (`/g2/mobile/client`)
- After: `Routes.generation2MobileLoginSelection` (`/g2/mobile/login-selection`)

## Direct Route Test Result

Manual runtime browser validation not executed by Codex per owner preference. Static router verification confirms that `#/g2/mobile/login-selection` maps to `Generation2MobileLoginSelectionPage` through the registered route.

## Final Verified Flow

1. `/` or `/splash`
2. `Generation2SplashPage`
3. Tap `نسخة الموبايل`
4. `/g2/mobile/login-selection`
5. `Generation2MobileLoginSelectionPage`
6. Identity choices visible: `صديق`, `داعم صديق`

## Guardrails

- `/legacy/splash` unchanged.
- `/g2/mobile/client` not deleted; it remains a temporary Mobile Lite client route.
- Firebase changed: NO
- Firestore changed: NO
- Signals changed: NO
- Archive changed: NO
- Capsules changed: NO
