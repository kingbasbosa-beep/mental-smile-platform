# Entry/Auth Alignment Findings V1

Operation: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Unified Start Update: OP-ENTRY-AUTH-UNIFIED-START-MIGRATION-V1
Date: 2026-06-23

## Active Items

| Item | Classification | Evidence |
|---|---|---|
| App startup to Splash | ACTIVE | `MaterialApp.initialRoute` is `Routes.splash` |
| Splash Quick Access | ACTIVE | Opens `/client/room` |
| Splash Accessibility Access | ACTIVE | Opens `/accessibility/room` |
| Splash Provider / Center Access | ACTIVE | Opens `/commercial-v2/start` |
| Unified Start route | ACTIVE | `/commercial-v2/start` opens `CommercialV2StartPage` |
| Official Website route | ACTIVE | Opens `/`, which maps to `PortalHomePage`; hosted URL still needs Owner verification |
| Splash assets | ACTIVE | `pubspec.yaml` includes `assets/branding/splash/` |
| Language assets | ACTIVE | `pubspec.yaml` includes `assets/branding/language/` |
| Commercial V2 assets | ACTIVE | `pubspec.yaml` includes `assets/branding/commercial_v2/` |

## Archive-Only Items

| Item | Classification | Evidence |
|---|---|---|
| `/login` | ARCHIVE_ONLY | Unified Start replaced previous Login responsibilities |
| `/language` from Login register link | ARCHIVE_ONLY | Previous Login page reference only |
| `/account-blocked` from Login flow | ARCHIVE_ONLY | Previous Login page reference only |
| Login role destinations | ARCHIVE_ONLY | Previous Login route responsibility only |
| `assets/branding/login/` | ARCHIVE_ONLY | Used by archived Login page only from Entry/Auth perspective |
| Login Firebase role-resolution dependencies | ARCHIVE_ONLY | Previous Login page responsibility only |

## Website Destination Review

Current route:

- `/`
- `PortalHomePage`

Expected destination:

- Official public website / Firebase Hosted Website

Status:

- ACTIVE route with Owner hosted URL verification pending.

## Final Alignment Statement

Entry/Auth active ownership now centers on `/splash` and `/commercial-v2/start`. The previous `/login` route and its dependent controls, assets, and role-resolution references are archive-only for Entry/Auth.
