# Generation 2 Route Map V1

Date: 2026-07-06

Route source files:

- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`

## G2 and Related Commercial Routes

| Route Path | Route Constant | Screen File | Purpose | User Type | Entry Source | Destination | Status | Known Issues | Testing Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `/splash` | `Routes.splash` | `lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart` | Active G2 start surface | All | Root route and app redirects | Mobile login selection or legacy splash | ACTIVE | G2 splash has no shared Daleel integration in this file | Test mobile/tablet/desktop button layout. |
| `/legacy/splash` | `Routes.legacySplash` | `lib/features/splash/presentation/pages/splash_page.dart` | Legacy splash/welcome | All | G2 desktop button / legacy links | Older residential/commercial entries | LEGACY_ACTIVE | Separate Daleel implementation exists | Keep until owner confirms removal. |
| `/g2/mobile/login-selection` | `Routes.generation2MobileLoginSelection` | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart` | Friends vs Supporters selector | All mobile users | G2 Splash mobile button | Client/supporter account selections | ACTIVE | None observed | Test guide, survey, language, back. |
| MaterialPageRoute | N/A | `generation2_mobile_selection_pages.dart` / `Generation2MobileFriendsSelectionPage` | Client account selection | Client/premium | Mobile login selection `أصدقاء` | Client friend room or `/g2/mobile/client-room` | ACTIVE | No named route/deep link | Documented by governance card; test from parent flow. |
| MaterialPageRoute | N/A | `generation2_mobile_selection_pages.dart` / `Generation2MobileSupportersSelectionPage` | Supporters account selection | Specialist/center | Mobile login selection `داعمين` | `/g2/mobile/specialist-room` or `/g2/mobile/center-room` | PARTIAL | Missing guide asset | Test from parent flow after asset supplied. |
| MaterialPageRoute | N/A | `generation2_mobile_friend_client_room_page.dart` | Client Friend room | Client | Client account selection | Shared room scaffold | ACTIVE | No named route/deep link | Test cards and Daleel manually. |
| `/g2/mobile/client-room` | `Routes.generation2MobileClientRoom` | `generation2_mobile_client_room_page.dart` | Premium Friend room | Premium/accessibility client | Client account selection | Shared room scaffold | ACTIVE | Guide asset may need owner decision | Test route guard/public access expectations. |
| `/g2/mobile/specialist-room` | `Routes.generation2MobileSpecialistRoom` | `generation2_mobile_specialist_room_page.dart` | Specialist mobile room | Specialist | Supporters account selection | Shared room scaffold / commercial pages | ACTIVE | Route is included in clinician protected routes | Test with authorized specialist account. |
| `/g2/mobile/center-room` | `Routes.generation2MobileCenterRoom` | `generation2_mobile_center_room_page.dart` | Center mobile room | Center | Supporters account selection | Shared room scaffold / commercial pages | ACTIVE | Route is included in center protected routes | Test with authorized center account. |
| `/g2/mobile/client` | `Routes.generation2MobileLiteClient` | `generation2_mobile_lite_client_page.dart` | Temporary lite client route | Client/tester | Direct route only | Lite placeholder/client | LEGACY_ACTIVE_ROUTE | Not current splash destination | Decide after final testing. |
| `/commercial/access` | `Routes.commercialAccess` | `commercial_access_page.dart` | Commercial role selector | Specialist/center/admin | Splash/legacy/commercial links | Specialist/center/admin login | ACTIVE | Daleel only visible on wide landscape | Test desktop viewport. |
| `/commercial/specialist/login` | `Routes.commercialSpecialistLogin` | `specialist_login_page.dart` | Specialist login | Specialist | Commercial access | Specialist room | ACTIVE | Uses real auth; needs account testing | Test login success/failure. |
| `/commercial/specialist/register` | `Routes.commercialSpecialistRegister` | `commercial_register_pages.dart` | Specialist registration | Specialist | Specialist login | Specialist login/room | ACTIVE | Needs auth/register test | Test validation and success. |
| `/commercial/center/login` | `Routes.commercialCenterLogin` | `center_login_page.dart` | Center login | Center | Commercial access | Center room | ACTIVE | Uses real auth; needs account testing | Test login success/failure. |
| `/commercial/center/register` | `Routes.commercialCenterRegister` | `commercial_register_pages.dart` | Center registration | Center | Center login | Center login/room | ACTIVE | Needs auth/register test | Test validation and success. |
| `/commercial/room` | `Routes.commercialRoom` | `commercial_room_page.dart` | Specialist commercial room | Specialist | Specialist login | Profile/library/tools | ACTIVE | Protected by role gate | Test with specialist account. |
| `/commercial/center/room` | `Routes.commercialCenterRoom` | `center_room_page.dart` | Center commercial room | Center | Center login | Profile/library/tools | ACTIVE | Protected by role gate | Test with center account. |
| `/accessibility/checkin` | `Routes.accessibilityCheckin` | `accessibility_checkin_page.dart` | Existing shared `طمنّا عليك` page with local support-space placement | Client/premium client | Client and premium client room cards | Check-in questions, WhatsApp check-in, and internal support space | ACTIVE / UPDATED | Support space uses internal `MaterialPageRoute`, no new named route | Test from Client Friend Mobile, Premium Friend Mobile, Client Friend Desktop, Premium Friend Desktop. |
| MaterialPageRoute | N/A | `accessibility_checkin_page.dart` / `_ClientSupportSpacePage` | Local `مساحة المشاركة` write/view surface | Client/premium client beta users | Buttons inside existing `طمنّا عليك` page | Local write mode or recent messages view | ACTIVE_LOCAL_ONLY | Not deep-linkable by design; no route added | Confirm messages stay local and disappear after reload. |

## Route Issues / Watchlist

| Issue | Status | Notes |
| --- | --- | --- |
| Client account selection has no named route | NEEDS_OWNER_DECISION | Not broken; opened through parent flow. Direct browser deep link not available. |
| Supporters account selection has no named route | NEEDS_OWNER_DECISION | Not broken; opened through parent flow. Direct browser deep link not available. |
| `Routes.generation2MobileLiteClient` remains active | DEFER_AFTER_TESTING | Current G2 splash no longer points to it; keep until owner confirms cleanup. |
| Supporters guide image missing | SAFE_TO_FIX_NOW | Add `assets/branding/guides/supporters_account_selection_mobile_guide.png`. |
| Premium Friend guide points to specialist friend guide | NEEDS_OWNER_DECISION | Confirm if intentional or replace with dedicated premium guide asset. |
| Client support space has no named route | INTENTIONAL | Placement final update required using existing `طمنّا عليك` page and no new card; internal `MaterialPageRoute` keeps it beta-only. |
