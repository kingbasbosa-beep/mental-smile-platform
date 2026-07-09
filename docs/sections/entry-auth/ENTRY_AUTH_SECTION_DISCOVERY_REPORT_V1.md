# Entry/Auth Section Discovery Report V1

Status: COMPLETED

Operation ID: OP-ENTRY-AUTH-SECTION-FOUNDATION-V1

Date: 2026-06-23

Mode: DISCOVERY_AND_ARCHIVE_FOUNDATION_ONLY

Runtime Impact: NONE

## Scope

Entry/Auth owns the public application entry and identity gateway surfaces only.

Included in this discovery:

- Splash Page
- Login Page
- route constants and router cases that open entry/auth destinations
- auth service used after login
- Firebase Auth usage
- Firestore usage directly related to login role resolution
- Splash assets
- Login assets
- language controls
- visible entry buttons
- Commercial V2 start route as the Provider / Center entry destination only

Not included:

- Client Room internals
- Accessibility Room internals
- Provider dashboard internals
- Center dashboard internals
- Owner Room internals
- Web commercial internals

## Files Inspected

| File | Reason |
| --- | --- |
| `lib/app/app.dart` | startup route and app locale wiring |
| `lib/app/router/routes.dart` | route constants |
| `lib/app/router/app_router.dart` | route destinations and auth guards |
| `lib/features/splash/presentation/pages/splash_page.dart` | Splash entry surface |
| `lib/features/auth/presentation/pages/login_page.dart` | ARCHIVE_ONLY/role login gateway |
| `lib/core/auth/account_access_service.dart` | post-login role resolution |
| `lib/app/locale_provider.dart` | app locale state |
| `lib/l10n/app_en.arb` | Login localization keys |
| `lib/l10n/app_ar.arb` | Login localization keys |
| `lib/l10n/app_localizations.dart` | generated localization contract |
| `lib/l10n/app_localizations_en.dart` | generated English labels |
| `lib/l10n/app_localizations_ar.dart` | generated Arabic labels |
| `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Commercial V2 start destination opened by Splash |
| `assets/branding/splash/` | Splash background assets |
| `assets/branding/login/` | Login background assets |
| `assets/branding/language/` | Splash language button asset |
| `assets/branding/commercial_v2/` | Commercial V2 start logo assets |

## Screen Inventory

### Splash Page

| Item | Value |
| --- | --- |
| File path | `lib/features/splash/presentation/pages/splash_page.dart` |
| Route path | `/splash` |
| Startup status | Initial route via `MaterialApp.initialRoute: Routes.splash` |
| Purpose | Public entry surface |
| Background | `splash_mobile_v1.jpg`, `splash_tablet_v1.jpg`, `splash_web_v1.jpg` |
| Language control | Top-right image button using `assets/branding/language/en_gold.png` |
| Auth dependency | none |
| Firebase dependency | none |
| Signals | none found |

#### Splash Visible Elements

| Element | Type | Visual Purpose | Function | Opens | Route Or URL | Requires Auth | Accessibility Support | Voice Indicator | Visual Indicator | Asset | Localization | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Background | image | public entry scene | display only | none | none | no | no explicit metadata | no | yes | `assets/branding/splash/*` | no | active |
| Overlay | color layer | darken background | display only | none | none | no | no | no | yes | none | no | active |
| Language button | image button | switch app language | toggles `ar`/`en` using `LocaleStorage` and `localeProvider` | none | none | no | tooltip only | no speaker icon | image indicator | `assets/branding/language/en_gold.png` | tooltip text inline | active |
| Quick Access | primary button | client direct entry | pushes Client Room | Client Room | `/client/room` | no | icon only | no | flash icon | none | inline English | active |
| Accessibility Access | secondary button | accessibility client entry | pushes Accessibility Room | Accessibility Room | `/accessibility/room` | no | icon only | no | accessibility icon | none | inline English | active |
| Provider / Center Access | secondary button | professional/commercial entry | pushes Commercial V2 start | Commercial V2 Start | `/commercial-v2/start` | no at button; auth happens inside destination | icon only | no | business icon | none | inline English | active |
| Official Website | secondary button | public website entry | replaces route with portal home | Portal Home | `/` | no | icon only | no | public icon | none | inline Arabic/English branch | active |

Splash counts:

- Main buttons: 4
- Language buttons: 1
- Accessibility indicators: 4 button icons plus 0 speaker indicators
- External links: 0 direct external URLs; Official Website opens internal portal route `/`
- Buttons opening direct rooms: 2
- Buttons opening login/auth/commercial auth: 1
- Buttons opening web: 1

### Login Page

| Item | Value |
| --- | --- |
| File path | `lib/features/auth/presentation/pages/login_page.dart` |
| Route path | `/login` |
| Purpose | Email/password identity and role gateway |
| Background | `login_mobile_v1.png`, `login_tablet_v1.png`, `login_web_v1.png` |
| Fields | Email, Password |
| Phone field | none |
| Submit button | localized login button |
| Back button | none found |
| Language controls | none found inside page |
| Auth service | `FirebaseAuth.instance.signInWithEmailAndPassword` |
| Access service | `AccountAccessService().resolve(user)` |
| Firestore usage | indirect through `AccountAccessService` reading `clinicians` and `centers` |
| Loading state | `_loading` disables login and shows `CircularProgressIndicator` |
| Error state | `_error` string rendered in red |
| Signals | none found |

#### Login Fields

| Field | Controller | Data Type | Required In UI | Storage Destination | Runtime Usage |
| --- | --- | --- | --- | --- | --- |
| Email | `_emailController` | string | not locally validated before Firebase call | Firebase Auth credential | normalized with trim/lowercase |
| Password | `_passwordController` | string | not locally validated before Firebase call | Firebase Auth credential | passed to sign-in; obscurable |

#### Login Error Mapping

| Firebase code | Message source |
| --- | --- |
| `invalid-email` | `l10n.authInvalidEmail` |
| `user-disabled` | `l10n.authLoginFailed` |
| `user-not-found` | `l10n.authInvalidCredentialsMessage` |
| `wrong-password` | `l10n.authInvalidCredentialsMessage` |
| `network-request-failed` | `l10n.authTryAgain` |
| default | `l10n.authLoginFailed` |
| generic catch | `l10n.authUnexpectedError` |

#### Login Role Handling

After Firebase sign-in:

1. `AccountAccessService().resolve(user)` is called.
2. blocked users route to `/account-blocked`.
3. clinician/center accounts with visibility readiness not ready route to `/account-blocked`.
4. role destinations:

| Role | Destination |
| --- | --- |
| owner | `/s/owner` |
| monitoring operator | `/s/capital/signal-monitoring-room` |
| registry steward | `/s/registry-room` |
| declaration reviewer | `/s/declaration-review-room` |
| support observer | `/s/support-room` |
| clinician | `/clinician/room` |
| center | `/center/dashboard` |
| default/no role | `/menu` |

### Commercial V2 Start Entry

| Item | Value |
| --- | --- |
| File path | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` |
| Route path | `/commercial-v2/start` |
| Entry/Auth ownership | Destination opened by Provider / Center Access button |
| Fields | Email, Phone, Password |
| Buttons | Login, Create Account, Cancel, EN/Arabic toggle |
| Auth dependency | `FirebaseAuth.createUserWithEmailAndPassword`, `FirebaseAuth.signInWithEmailAndPassword` |
| Firestore dependency | `_CommercialV2Store.ensureProfileShell` writes/ensures `commercial_v2_profiles` |
| Destination after auth | `/commercial-v2/owner` |
| External URL | none found in inspected start entry |

## Route Inventory

| Route | Destination | Status |
| --- | --- | --- |
| `/splash` | `SplashPage` | active |
| `/login` | `LoginPage` | active |
| `/client/room` | `ClientRoomPage` | active destination, not owned internally by Entry/Auth |
| `/accessibility/room` | `AccessibilityRoomPage` | active destination, not owned internally by Entry/Auth |
| `/commercial-v2/start` | `CommercialV2StartPage` | active commercial auth entry |
| `/commercial-v2/owner` | `CommercialV2OwnerProfilePage` behind auth check | active destination, internals not owned by Entry/Auth |
| `/` | `PortalHomePage` | active official website/public portal route |
| `/language` | `MkLanguagePage` from Login register link | active route |
| `/account-blocked` | `AccountBlockedPage` | active blocked account route |
| `/s/owner` | owner route after ARCHIVE_ONLY login | protected role route |
| `/s/capital/signal-monitoring-room` | monitoring route after ARCHIVE_ONLY login | protected role route |
| `/s/registry-room` | registry route after ARCHIVE_ONLY login | protected role route |
| `/s/declaration-review-room` | declaration review route after ARCHIVE_ONLY login | protected role route |
| `/s/support-room` | support observer route after ARCHIVE_ONLY login | protected role route |
| `/clinician/room` | clinician route after ARCHIVE_ONLY login | protected role route |
| `/center/dashboard` | center route after ARCHIVE_ONLY login | protected role route |
| `/menu` | default ARCHIVE_ONLY login fallback | active route |

No dead route was proven inside the inspected Entry/Auth code. Some destinations belong to other sections and are only documented as route endpoints.

## Asset Inventory

| Asset | Usage |
| --- | --- |
| `assets/branding/splash/splash_mobile_v1.jpg` | Splash mobile background |
| `assets/branding/splash/splash_tablet_v1.jpg` | Splash tablet background |
| `assets/branding/splash/splash_web_v1.jpg` | Splash desktop/web background |
| `assets/branding/language/en_gold.png` | Splash language toggle image |
| `assets/branding/login/login_mobile_v1.png` | Login mobile background |
| `assets/branding/login/login_tablet_v1.png` | Login tablet background |
| `assets/branding/login/login_web_v1.png` | Login desktop/web background |
| `assets/branding/commercial_v2/ms_logo_silver.png` | Commercial V2 start logo |
| `assets/branding/commercial_v2/ms_logo_gold.png` | Commercial V2 future/theme logo asset present |

## Localization Inventory

Login uses generated localization keys:

- `authLoginTitle`
- `authEmail`
- `authPassword`
- `authLoginButton`
- `authCreateAccount`
- `authInvalidEmail`
- `authLoginFailed`
- `authInvalidCredentialsMessage`
- `authTryAgain`
- `authUnexpectedError`

Splash uses inline English labels for Quick Access, Accessibility Access, Provider / Center Access, and inline Arabic/English branch for Official Website.

Commercial V2 Start uses internal `_startText(en, ar)` strings rather than generated app localization.

## Firebase Dependency Inventory

| Dependency | Location | Purpose |
| --- | --- | --- |
| `FirebaseAuth.instance.signInWithEmailAndPassword` | Login Page | ARCHIVE_ONLY/role login |
| `FirebaseAuth.instance.currentUser` | Router | route protection / non-anonymous checks |
| `FirebaseAuth.instance.createUserWithEmailAndPassword` | Commercial V2 Start | commercial account creation |
| `FirebaseAuth.instance.signInWithEmailAndPassword` | Commercial V2 Start | commercial login |
| Firestore `clinicians` | AccountAccessService | role resolution by uid/email |
| Firestore `centers` | AccountAccessService | role resolution by uid/email |
| Firestore `commercial_v2_profiles` | Commercial V2 Start store | commercial shell creation |

## Signal Inventory

No Entry/Auth signals are implemented in the inspected Splash or Login files.

Future signal families are documented separately in `ENTRY_AUTH_SIGNAL_GUIDE_V1.md`.

