# Mental Smile Generation 2 Project Inventory V1

Date: 2026-07-06

Scope: Documentation/governance inventory only. Runtime, routes, Firebase, authentication, and localization behavior were not intentionally changed by this inventory task.

## Scan Summary

| Area | Count / Status | Notes |
| --- | ---: | --- |
| Dart files under `lib/` | 239 | Counted with `rg --files lib`. |
| Documentation files under `docs/` | 3869 | Existing docs tree is large and includes capsules, archives, operations, and generation-2 notes. |
| Asset files under `assets/` | 219 | Counted with `rg --files assets`. |
| G2 mobile Dart files | 8 | Entry, account selection, client/premium/specialist/center room files. |
| Guide asset folder in pubspec | YES | `pubspec.yaml` includes `assets/branding/guides/`. |
| Shared Daleel Assistant | PRESENT | `lib/shared/guides/daleel_assistant.dart`. |
| G2 signals backend | GOVERNANCE_ONLY | No dedicated G2 runtime signal emitter found. Existing signal packages are generic/residential/commercial-v2. |

## Important Runtime Items

| Name | Type | Path | Purpose | Owner Surface | Route | Guide Image | Survey | Runtime Status | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Generation2SplashPage | Screen | `lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart` | G2 mobile/tablet/desktop entry choice | G2 Entry | `/splash` via `Routes.splash` | NONE in this file | NONE in this file | ACTIVE | Routes mobile to `/g2/mobile/login-selection`; desktop to legacy splash. |
| Legacy Welcome/Splash Page | Screen | `lib/features/splash/presentation/pages/splash_page.dart` | Legacy/welcome page with its own Daleel implementation | Legacy/G1/G2 bridge | `/legacy/splash` | `welcome_screen_guide.png` | Local splash survey | ACTIVE | Separate local Daleel system remains in this file. |
| Mobile Login Selection | Screen | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart` | Select Friends vs Supporters | G2 Mobile Entry | `/g2/mobile/login-selection` | `mobile_login_selection_guide.png` | `mobileLoginSelectionSections` | ACTIVE / NEEDS_VERIFICATION | Connected to shared Daleel Assistant. |
| Client Account Selection | Screen (pushed) | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart` | Select Client Friend vs Premium Friend | G2 Mobile Entry | MaterialPageRoute only | `client_account_selection_mobile_guide.png` | `premiumClientAccountSelectionMobileSections` | ACTIVE / NEEDS_VERIFICATION | No named route constant; opened from Mobile Login Selection. |
| Supporters Account Selection | Screen (pushed) | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart` | Select Supporting Specialist vs Support Center | G2 Mobile Entry | MaterialPageRoute only | `supporters_account_selection_mobile_guide.png` | `supportersAccountSelectionMobileSections` | PARTIAL | Guide asset missing from folder at scan time. |
| Client Friend Mobile Room | Screen | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart` | Client friend room cards | G2 Mobile Client | MaterialPageRoute only | `client_friend_mobile_guide.png` | `clientFriendMobileSections` | ACTIVE / NEEDS_VERIFICATION | Opened from Client Account Selection. |
| Premium Friend Mobile Room | Screen | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart` | Premium/accessibility-focused friend room | G2 Mobile Client | `/g2/mobile/client-room` | `specialist_friend_mobile_guide.png` currently referenced | `premiumFriendMobileSections` | ACTIVE / NEEDS_VERIFICATION | Guide filename may need owner confirmation because current code points to specialist friend guide. |
| Specialist Friend Mobile Room | Screen | `lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart` | Specialist mobile friend room cards | G2 Mobile Supporter | `/g2/mobile/specialist-room` | `specialist_friend_mobile_guide.png` | `specialistFriendMobileSections` | ACTIVE / NEEDS_VERIFICATION | Uses shared room scaffold. |
| Center Friend Mobile Room | Screen | `lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart` | Center mobile friend room cards | G2 Mobile Supporter | `/g2/mobile/center-room` | `center_friend_mobile_guide.png` | `centerFriendMobileSections` | ACTIVE / NEEDS_VERIFICATION | Uses shared room scaffold. |
| Mobile Lite Client | Screen | `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_lite_client_page.dart` | Earlier temporary mobile client route | G2 Mobile Entry | `/g2/mobile/client` | NONE | NONE | LEGACY_ACTIVE_ROUTE | Route exists but current Mobile button now points to login selection. |
| Specialist Desktop Login | Screen | `lib/features/commercial/presentation/pages/specialist_login_page.dart` | Real commercial specialist login | Commercial / Specialist | `/commercial/specialist/login` | `specialist_desktop_login_guide.png` | `specialistLoginSections` | ACTIVE | Uses `CommercialAuthService`. |
| Center Desktop Login | Screen | `lib/features/commercial/presentation/pages/center_login_page.dart` | Real commercial center login | Commercial / Center | `/commercial/center/login` | `center_desktop_login_guide.png` | `centerLoginSections` | ACTIVE | Uses `CommercialAuthService`. |
| Commercial Access | Screen | `lib/features/commercial/presentation/pages/commercial_access_page.dart` | Desktop commercial role selector | Commercial | `/commercial/access` | `commercial_desktop_login.png` | `commercialAccessSections` | ACTIVE | Daleel shown on wide landscape desktop layout only. |
| Daleel Assistant | Shared widget/system | `lib/shared/guides/daleel_assistant.dart` | Guide dialog + local survey bottom sheet | Shared | N/A | Parameterized | Parameterized | ACTIVE / LOCAL_ONLY | Survey output is `debugPrint` only. |

## G2 Mobile Room Cards

| Room | Cards | Source |
| --- | --- | --- |
| Client Friend | Check-in, apps/tools, suggestions, tools, links | `Generation2MobileFriendClientRoomPage.clientCardTitles` |
| Premium Friend | Important links, assistive tools, suggestions, apps/tools, check-in | `Generation2MobileClientRoomPage.clientCardTitles` |
| Specialist Friend | Professional profile, professional library, assistive tools, check-in | `Generation2MobileSpecialistRoomPage.specialistCardTitles` |
| Center Friend | Center profile, professional library for centers, assistive tools, check-in | `Generation2MobileCenterRoomPage.centerCardTitles` |

## Guide Assets Found Under `assets/branding/guides/`

| Asset | File Exists | Notes |
| --- | --- | --- |
| `welcome_screen_mobile_guide.png` | YES | Used by prior mobile welcome work. |
| `mobile_login_selection_guide.png` | YES | Connected to mobile login selection. |
| `client_account_selection_mobile_guide.png` | YES | Connected to client account selection. |
| `supporters_account_selection_mobile_guide.png` | NO | Referenced by documentation/request; missing at scan time. |
| `client_friend_mobile_guide.png` | YES | Connected to Client Friend room. |
| `specialist_friend_mobile_guide.png` | YES | Connected to Specialist Friend and currently Premium Friend room. |
| `center_friend_mobile_guide.png` | YES | Connected to Center Friend room. |
| `specialist_desktop_login_guide.png` | YES | Connected to specialist login. |
| `center_desktop_login_guide.png` | YES | Connected to center login. |
| `commercial_desktop_login.png` | YES | Connected to commercial access. |
| `center_room_mobile_guide.png` | YES | Present but not connected in current G2 room code. |
| `specialist_room_mobile_guide.png` | YES | Present but not connected in current G2 room code. |
| `client_room_desktop_guide.png` | YES | Present; not in G2 mobile scope. |
| `welcome_screen_guide.png` | YES | Legacy splash/welcome guide. |

## Documentation Patterns Found

| Pattern | Path | Notes |
| --- | --- | --- |
| Existing G2 docs | `docs/generation-2/mobile-entry/` | Prior route, splash, owner notes, and manual test docs. |
| Operations index | `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md` | Table rows plus append-only historical entries. |
| Operations registry | `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md` | Detailed append-only operation blocks. |
| Capsule roots | `docs/capsules/` | Many sovereign capsule build outputs exist for sections. |

