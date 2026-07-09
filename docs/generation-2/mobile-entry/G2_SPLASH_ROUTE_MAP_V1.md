# G2 Splash Route Map V1

## Startup

| Route | Widget | Status |
| --- | --- | --- |
| `/` | `Generation2SplashPage` | Active startup alias |
| `/splash` | `Generation2SplashPage` | Active app startup route |

## Legacy Splash

| Route | Widget | Entry |
| --- | --- | --- |
| `/legacy/splash` | `SplashPage` | Desktop button |

## Button Behavior

| Button | Label | Route or action | Notes |
| --- | --- | --- | --- |
| Mobile | `نسخة الموبايل` | `/g2/mobile/login-selection` | Opens identity selection for mobile users |
| Desktop | `نسخة التابلت والديسكتوب` | `/legacy/splash` | Opens the old existing splash |
| Language | `اللغة` | Bottom sheet action | Arabic/English selector, no localization architecture change |

## First Splash Identity Choices

The first G2 Splash is device/display selection only.

- Friend / `صديق` button removed from the first Splash.
- Supporter / `داعم صديق` button removed from the first Splash.
- First Splash now contains three choices only: Mobile, Desktop/Tablet, Language.
- Supporter registration-first rule belongs to the Mobile identity flow, not the first Splash.

## Broken Route Check

Expected broken routes: 0

Manual runtime verification remains pending because command execution was stopped by the owner.
