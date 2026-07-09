# G2 Mobile Tablet Splash Entry Report V1

## Status

G2_MOBILE_TABLET_SPLASH_ENTRY_FOUNDATION_COMPLETED

## Scope

Implemented a new Generation 2 startup splash entry layer for mobile, tablet, and desktop-sized layouts.

The legacy splash remains present and is now opened from the Desktop button through `/legacy/splash`.

## Startup Route

- Active startup route: `/splash`
- App startup constant: `Routes.splash`
- Root route `/` also resolves to the new Generation 2 splash.

## Legacy Splash

- Legacy route: `/legacy/splash`
- Legacy widget: `SplashPage`
- Access path: Desktop button on the new Generation 2 splash.
- Legacy splash file was not deleted or rewritten.

## New Pages

- `Generation2SplashPage`
- `Generation2MobileLoginSelectionPage`
- `Generation2MobileLiteClientPage`

## Sequence

1. Splash (`/splash` or `/`)
2. Device/display selection (Mobile / Desktop-Tablet / Language)
3. Mobile identity selection
4. Target path

## Buttons

The new splash contains three main buttons only:
1. Mobile: `نسخة الموبايل` (routes to `/g2/mobile/login-selection`)
2. Desktop: `نسخة التابلت والديسكتوب`
3. Language: `اللغة`

Friend / `صديق` and Supporter / `داعم صديق` were removed from the first Splash.
Identity selection will happen later inside the Mobile flow.

The Mobile identity selection page contains:
1. Friend: `صديق`
2. Supporter: `داعم صديق`
3. Language: `اللغة`
4. Back: `رجوع`

## Audio Icon

Each visible Arabic label includes the existing accessibility/audio guide icon from:

`assets/icons/accessibility/ms_accessibility_guide.webp.png`

The reused widget is `AccessibilityGuideIcon`, already used by the Client Room.

## Temporary Decisions

- Mobile Lite route did not exist, so `/g2/mobile/client` was added.
- `Generation2MobileLiteClientPage` currently wraps the existing `ClientRoomPage` until the dedicated Mobile Lite client surface is built.
- Supporter registration-first rule belongs to the Mobile identity flow, not the first Splash.

## Restricted Areas

No intentional changes were made to:

- Firebase initialization
- Firestore rules or indexes
- Signal registries or emitters
- Archive runtime
- Capsules

## Command Validation

No additional static commands were run after owner interruption. Manual checks are left to the owner.
