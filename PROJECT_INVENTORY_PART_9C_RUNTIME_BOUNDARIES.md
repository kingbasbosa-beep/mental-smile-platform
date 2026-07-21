# PART 9C - Post-Cleanup Runtime Boundary Reinventory

## 1. Scope

Read-only inspection was performed after PART 9B deletion of 47 files and 67 symbols. No build, test, analyze, format, deploy, route edit, Firebase edit, Platform Core edit, or runtime repair was executed.

Inspected scope:

| Scope Item | Count / State | Evidence |
| --- | ---: | --- |
| Files reinspected | 250 | `lib/`, `test/`, `tool/`, `pubspec.yaml`, Firebase config files |
| `lib/` files | 220 | filesystem listing |
| `lib/` Dart files | 173 | filesystem listing |
| `test/` files | 23 | filesystem listing |
| `tool/` files | 2 | filesystem listing |
| Broken internal Dart imports observed | 0 | internal import resolver over `lib/`, `test/`, `tool/` |
| Platform Core modified | 0 | `git status --short -- lib/core/platform_core test/core/platform_core` |

Baseline reference from PART 9A:

| Metric | Before | Current |
| --- | ---: | ---: |
| Direct dependencies / ownership records in PART 9A definition | 39 | superseded by expanded 9C scan |
| Ownership violations in PART 9A definition | 39 | superseded by expanded 9C scan |
| Duplicate component groups | 2 | 2 |
| Not-verified route components | 6 | 6 |

## 2. Current Runtime Summary

Current owner file counts:

| Owner | Files | Dart Files | Evidence |
| --- | ---: | ---: | --- |
| CENTRAL_RUNTIME | 84 | 51 | `lib/main.dart`, `lib/app/`, `lib/core/`, `lib/features/signals/`, `lib/features/splash/`, generated app/shared l10n |
| SHARED | 15 | 13 | `lib/shared/` |
| RESIDENTIAL | 32 | 26 | `lib/features/residential/`, `lib/features/client/`, `lib/features/accessibility/`, residential/accessibility l10n |
| COMMERCIAL | 42 | 39 | `lib/features/commercial/`, `lib/features/commercial_v2_web/`, commercial l10n |
| LIBRARY | 25 | 22 | `lib/features/library/`, library l10n |
| PLATFORM_CORE | 22 | 22 | `lib/core/platform_core/` |

Expanded PART 9C dependency scan:

| Dependency Type | Count | Contracted | State |
| --- | ---: | --- | --- |
| Section -> central/shared import | 94 | NO | DIRECT_ACTIVE |
| Central runtime -> section import | 40 | NO | 36 CENTRAL_UI_WIRING, 4 DIRECT_ACTIVE |
| Cross-section import | 10 | NO | DIRECT_ACTIVE |
| Section/tool -> Platform Core contract import | 10 | YES | CONTRACTED |

## 3. Central Runtime Map

| Runtime Area | Files / Symbols | State | Evidence |
| --- | --- | --- | --- |
| App entry | `lib/main.dart`, `MentalSmileOSApp` | ENTRYPOINT | `main.dart:6-8` imports app, locale provider, locale storage |
| App composition | `lib/app/app.dart` | CENTRAL_UI_WIRING | imports section localization delegates at `app.dart:2-6` |
| Router | `lib/app/router/app_router.dart`, `lib/app/router/routes.dart` | CENTRAL_UI_WIRING | route switch imports section destinations at `app_router.dart:11-47` |
| Firebase bootstrap | `lib/firebase_options.dart` | TOOLCHAIN_REQUIRED | generated Firebase options |
| Auth gate | `lib/core/auth/account_access_service.dart`, `_RouteAccessGate` in `app_router.dart` | DIRECT_ACTIVE | `app_router.dart:146`, `account_access_service.dart:25-28` |
| Shared localization wiring | `lib/l10n/app/*`, `lib/l10n/shared/*` | GENERATED / TOOLCHAIN_REQUIRED | generated localization files and ARB sources |
| Global link utility | `lib/shared/links/safe_external_link_launcher.dart` | VALID_SHARED | consumed by Residential, Commercial, Library |
| Local signal buffer | `lib/core/local_signals/local_section_signal_buffer.dart` | DIRECT_ACTIVE | consumed by section archive writers |
| Signal runtime | `lib/features/signals/**` | CENTRAL_RUNTIME | exported by `lib/features/signals/signals.dart` |
| Platform Core | `lib/core/platform_core/**` | PLATFORM_FROZEN | read only; no modifications |

Section-specific elements inside central namespace:

| File/Symbol | Physical Owner | Actual Consumer Owner | Ownership State | Evidence |
| --- | --- | --- | --- | --- |
| `lib/features/splash/presentation/pages/splash_page.dart` -> residential signal imports | CENTRAL_RUNTIME | RESIDENTIAL | TRUE_OWNERSHIP_VIOLATION | `splash_page.dart:8-9` imports `residential_signal_codes.dart`, `residential_signal_emitter.dart` |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_lite_client_page.dart` -> `ClientRoomPage` | CENTRAL_RUNTIME | RESIDENTIAL | TRUE_OWNERSHIP_VIOLATION | line 2 imports `features/client/.../client_room_page.dart` |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart` -> friend client room | CENTRAL_RUNTIME | RESIDENTIAL | TRUE_OWNERSHIP_VIOLATION | line 3 imports `generation2_mobile_friend_client_room_page.dart` |
| `lib/features/presentation_gallery/**` used by commercial web | CENTRAL_RUNTIME | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | `commercial_v2_web_showcase_page.dart:6-9` imports presentation gallery implementation files |

## 4. Residential Boundary Map

| Area | Files / Symbols | Boundary Facts | Evidence |
| --- | --- | --- | --- |
| Entry pages | `ClientRoomPage`, `AccessibilityRoomPage`, `ResidentialExitSocialPortalPage`, Generation2 client room | Active routes | `app_router.dart:26-33`, `app_router.dart:47` |
| Routes | Residential/accessibility/client pages import `Routes` directly | Uncontracted route dependency | 6 section files import `lib/app/router/routes.dart` |
| Services | Residential archive writer | Uses central local buffer directly | `residential_archive_signal_event_writer.dart:2` |
| Firebase access | none observed in Residential section files | none | Firebase direct scan |
| Storage access | none observed in Residential section files | none | Firebase direct scan |
| Signals | `residential_signal_*`, archive builder/writer | Active; socket bridge exists | `residential_runtime_signal_bridge.dart:1`, `residential_section_adapter.dart:1` |
| Localization | `residential_localizations`, `accessibility_localizations`, `shared_localizations` | Shared l10n direct imports remain | e.g. `client_room_page.dart:12`, `accessibility_room_page.dart:13` |
| Assets | Residential/client/accessibility assets | 3 cross/central asset references observed | e.g. `generation2_mobile_client_room_page.dart:31`, `:419` |
| Cross-section dependencies | Residential -> Library l10n | 1 direct import | `accessibility_checkin_page.dart:6` |

## 5. Commercial Boundary Map

| Area | Files / Symbols | Boundary Facts | Evidence |
| --- | --- | --- | --- |
| Entry pages | commercial access/login/register/rooms/profiles, commercial v2 web | Active routes | `app_router.dart:18`, `:20`, `:34-46` |
| Routes | Commercial pages/widgets import `Routes` directly | Uncontracted route dependency | 13 direct route imports |
| Services | `CommercialAuthService`, `ProviderProfileRepository` | Direct central/Firebase dependency | `commercial_auth_service.dart:5-8`, `provider_profile_repository.dart:11-17` |
| Firebase access | Auth/Firestore/Storage direct in 4 Commercial files | Uncontracted Firebase dependency | `commercial_auth_service.dart:22-31`, `provider_profile_repository.dart:11-17` |
| Storage access | `ProviderProfileRepository` | Uncontracted Storage dependency | `provider_profile_repository.dart:12-17` |
| Signals | commercial v2 signal emitter/registry/archive writer | Active; local buffer direct | `commercial_v2_archive_signal_event_writer.dart:2` |
| Localization | commercial l10n plus library/residential/shared imports | Cross-owner l10n remains | `commercial_public_accounts_page.dart:4-6`, `commercial_room_utility_tools.dart:5-6` |
| Assets | commercial assets plus central/library/residential asset paths | 19 cross/central asset references observed | `commercial_v2_web_showcase_page.dart:295-309`, `commercial_room_page.dart:15-19` |
| Cross-section dependencies | Commercial -> Residential, Commercial -> Library | 5 direct imports | generation2 center/specialist imports client room; public accounts imports library/residential l10n |

## 6. Library Boundary Map

| Area | Files / Symbols | Boundary Facts | Evidence |
| --- | --- | --- | --- |
| Entry pages | `LibraryPage`, provider pages, knowledge cards, official links | Active routes | `app_router.dart:11-17` |
| Routes | Library pages import `Routes` directly | Uncontracted route dependency | `library_page.dart:4`, `library_provider_content_pages.dart:3`, `knowledge_cards_page.dart:3` |
| Services | `KnowledgeCardRepository` | Asset-backed content loader | `knowledge_card_repository.dart:21-22` |
| Firebase access | Provider content page streams Firestore directly | Uncontracted Firebase dependency | `library_provider_content_pages.dart:503` |
| Storage access | none observed | none | Firebase direct scan |
| Signals | `library_signal_*`, archive builder/writer | Active; local buffer direct | `library_archive_signal_event_writer.dart:2` |
| Localization | library l10n | Section-owned | `library_page.dart:8` |
| Assets | library/category/content assets plus shared branding | 4 central asset references observed | `library_page.dart:465-466`, `:1536`; carousel `:379` |
| Cross-section dependencies | Library -> Commercial models/categories | 4 direct imports | provider pages/cards import commercial profile/category files |

## 7. Direct Dependency Map

Primary expanded dependency table:

| Source | Source Owner | Target | Target Owner | Dependency Type | Contracted | State | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `lib/app/app.dart` | CENTRAL_RUNTIME | `lib/l10n/accessibility/accessibility_localizations.dart` | RESIDENTIAL | central-to-section-import | NO | CENTRAL_UI_WIRING | line 2 |
| `lib/app/app.dart` | CENTRAL_RUNTIME | `lib/l10n/commercial/commercial_localizations.dart` | COMMERCIAL | central-to-section-import | NO | CENTRAL_UI_WIRING | line 4 |
| `lib/app/app.dart` | CENTRAL_RUNTIME | `lib/l10n/library/library_localizations.dart` | LIBRARY | central-to-section-import | NO | CENTRAL_UI_WIRING | line 5 |
| `lib/app/app.dart` | CENTRAL_RUNTIME | `lib/l10n/residential/residential_localizations.dart` | RESIDENTIAL | central-to-section-import | NO | CENTRAL_UI_WIRING | line 6 |
| `lib/app/router/app_router.dart` | CENTRAL_RUNTIME | section route destination imports | RESIDENTIAL/COMMERCIAL/LIBRARY | central-to-section-import | NO | CENTRAL_UI_WIRING | lines 11-47 |
| `lib/features/splash/presentation/pages/splash_page.dart` | CENTRAL_RUNTIME | `lib/features/residential/signals/residential_signal_codes.dart` | RESIDENTIAL | central-to-section-import | NO | DIRECT_ACTIVE | line 8 |
| `lib/features/splash/presentation/pages/splash_page.dart` | CENTRAL_RUNTIME | `lib/features/residential/signals/residential_signal_emitter.dart` | RESIDENTIAL | central-to-section-import | NO | DIRECT_ACTIVE | line 9 |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_lite_client_page.dart` | CENTRAL_RUNTIME | `lib/features/client/presentation/pages/client_room_page.dart` | RESIDENTIAL | central-to-section-import | NO | DIRECT_ACTIVE | line 2 |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart` | CENTRAL_RUNTIME | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart` | RESIDENTIAL | central-to-section-import | NO | DIRECT_ACTIVE | line 3 |
| `lib/features/residential/signals/residential_archive_signal_event_writer.dart` | RESIDENTIAL | `lib/core/local_signals/local_section_signal_buffer.dart` | CENTRAL_RUNTIME | section-to-central-import | NO | DIRECT_ACTIVE | line 2 |
| `lib/features/library/signals/library_archive_signal_event_writer.dart` | LIBRARY | `lib/core/local_signals/local_section_signal_buffer.dart` | CENTRAL_RUNTIME | section-to-central-import | NO | DIRECT_ACTIVE | line 2 |
| `lib/features/commercial_v2_web/signals/commercial_v2_archive_signal_event_writer.dart` | COMMERCIAL | `lib/core/local_signals/local_section_signal_buffer.dart` | CENTRAL_RUNTIME | section-to-central-import | NO | DIRECT_ACTIVE | line 2 |
| `lib/features/commercial/application/commercial_auth_service.dart` | COMMERCIAL | `lib/core/auth/account_access_service.dart` | CENTRAL_RUNTIME | section-to-central-import | NO | DIRECT_ACTIVE | line 5 |
| `lib/features/commercial/application/commercial_auth_service.dart` | COMMERCIAL | `lib/core/visibility/visibility_readiness.dart` | CENTRAL_RUNTIME | section-to-central-import | NO | DIRECT_ACTIVE | line 6 |
| section route users | RESIDENTIAL/COMMERCIAL/LIBRARY | `lib/app/router/routes.dart` | CENTRAL_RUNTIME | section-to-central-import | NO | DIRECT_ACTIVE | 22 imports |
| section shared utility users | RESIDENTIAL/COMMERCIAL/LIBRARY | `lib/shared/**` | SHARED | section-to-central-import | NO | DIRECT_ACTIVE | 51 imports |
| section shared l10n users | RESIDENTIAL/COMMERCIAL/LIBRARY | `lib/l10n/shared/shared_localizations.dart` | CENTRAL_RUNTIME | section-to-central-import | NO | DIRECT_ACTIVE | 11 imports |
| section Platform Core adapters | RESIDENTIAL/COMMERCIAL/LIBRARY | `lib/core/platform_core/platform_core.dart` | PLATFORM_CORE | platform-core-contract | YES | CONTRACTED | residential/commercial/library adapters and pages |

Cross-section dependency table:

| Source | Source Owner | Target | Target Owner | Dependency Type | Contracted | State | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `library_provider_content_pages.dart` | LIBRARY | `provider_profile_categories.dart` | COMMERCIAL | cross-section-import | NO | DIRECT_ACTIVE | line 4 |
| `library_provider_content_pages.dart` | LIBRARY | `provider_public_profile.dart` | COMMERCIAL | cross-section-import | NO | DIRECT_ACTIVE | line 5 |
| `center_public_white_card.dart` | LIBRARY | `provider_public_profile.dart` | COMMERCIAL | cross-section-import | NO | DIRECT_ACTIVE | line 2 |
| `specialist_public_white_card.dart` | LIBRARY | `provider_public_profile.dart` | COMMERCIAL | cross-section-import | NO | DIRECT_ACTIVE | line 2 |
| `generation2_mobile_specialist_room_page.dart` | COMMERCIAL | `generation2_mobile_client_room_page.dart` | RESIDENTIAL | cross-section-import | NO | DIRECT_ACTIVE | line 3 |
| `generation2_mobile_center_room_page.dart` | COMMERCIAL | `generation2_mobile_client_room_page.dart` | RESIDENTIAL | cross-section-import | NO | DIRECT_ACTIVE | line 3 |
| `commercial_public_accounts_page.dart` | COMMERCIAL | `library_localizations.dart` | LIBRARY | cross-section-import | NO | DIRECT_ACTIVE | line 4 |
| `commercial_public_accounts_page.dart` | COMMERCIAL | `residential_localizations.dart` | RESIDENTIAL | cross-section-import | NO | DIRECT_ACTIVE | line 5 |
| `commercial_room_utility_tools.dart` | COMMERCIAL | `residential_localizations.dart` | RESIDENTIAL | cross-section-import | NO | DIRECT_ACTIVE | line 5 |
| `accessibility_checkin_page.dart` | RESIDENTIAL | `library_localizations.dart` | LIBRARY | cross-section-import | NO | DIRECT_ACTIVE | line 6 |

## 8. Ownership Violations

| File/Symbol | Physical Owner | Actual Consumer Owner | Ownership State | Evidence |
| --- | --- | --- | --- | --- |
| Commercial public profile models/categories consumed by Library provider UI | COMMERCIAL | LIBRARY | TRUE_OWNERSHIP_VIOLATION | 4 imports listed in cross-section table |
| Residential client room reused by Commercial Generation2 center/specialist rooms | RESIDENTIAL | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | `generation2_mobile_*_room_page.dart:3` |
| Library localization consumed by Commercial public accounts | LIBRARY | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | `commercial_public_accounts_page.dart:4` |
| Residential localization consumed by Commercial public accounts/tools | RESIDENTIAL | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | `commercial_public_accounts_page.dart:5`, `commercial_room_utility_tools.dart:5` |
| Library localization consumed by Accessibility checkin | LIBRARY | RESIDENTIAL | TRUE_OWNERSHIP_VIOLATION | `accessibility_checkin_page.dart:6` |
| Presentation gallery files in central namespace consumed by Commercial web | CENTRAL_RUNTIME | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | `commercial_v2_web_showcase_page.dart:6-9` |
| Section asset paths referenced across owners or from central/shared asset namespaces | mixed | mixed | TRUE_OWNERSHIP_VIOLATION | 26 asset reference lines detected |
| `lib/shared/links/safe_external_link_launcher.dart` | SHARED | RESIDENTIAL/COMMERCIAL/LIBRARY | VALID_SHARED | consumed by all sections |
| `lib/shared/accessibility/accessibility_guide_icon.dart` | SHARED | multiple sections | VALID_SHARED | used by splash, residential, commercial, library |
| `lib/core/platform_core/**` | PLATFORM_CORE | sections/tools | VALID_CENTRAL | imports are contract/adapter entrypoints |

## 9. Duplicate Components

| Duplicate Group | Components | Owners | Consumers | Duplicate State | Evidence |
| --- | --- | --- | --- | --- | --- |
| `DaleelAssistant` | `lib/shared/guides/daleel_assistant.dart:4`; `lib/features/splash/presentation/pages/splash_page.dart:273` | SHARED / CENTRAL_RUNTIME | shared assistant is imported by multiple sections; splash local assistant remains in splash file | TRUE_DUPLICATE | duplicate class declarations |
| anonymous `extension on ...SignalDefinition` | Residential, Library, Commercial V2 signal emitters | RESIDENTIAL / LIBRARY / COMMERCIAL | section signal emitter internals | NOT_DUPLICATE | same anonymous extension name `on`, different receiver types and owners |

## 10. Not-Verified Components

| Component | Current Classification | Consumers | Capsule Blocker | Evidence |
| --- | --- | --- | --- | --- |
| `Routes.commercialPublicAccounts` | NOT_VERIFIED | route constant and AppRouter case only; page has l10n usage | BLOCKS_CAPSULE | `routes.dart:28`, `app_router.dart:310`, page localization lines in `commercial_public_accounts_page.dart` |
| `Routes.commercialV2Web` | NOT_VERIFIED | route constant and AppRouter case only; root `/` also opens same page | BLOCKS_CAPSULE | `routes.dart:31`, `app_router.dart:316`, root case at `app_router.dart:148` |
| `Routes.landingPreview` | NOT_VERIFIED | route constant and AppRouter case only | BLOCKS_CAPSULE | `routes.dart:32`, `app_router.dart:322` |
| `Routes.exitSocialLinks` | NOT_VERIFIED | route constant and AppRouter case only | BLOCKS_CAPSULE | `routes.dart:40`, `app_router.dart:212` |
| `Routes.blockedAccount` | NOT_VERIFIED | route constant and AppRouter cases only | BLOCKS_CAPSULE | `routes.dart:42`, `app_router.dart:73`, `app_router.dart:224` |
| `Routes.accessibilityMessageOfDay` | NOT_VERIFIED | route constant and AppRouter case only | BLOCKS_CAPSULE | `routes.dart:50`, `app_router.dart:364` |

## 11. Pre-Capsule Blockers

| Blocker Type | Count | Status | Evidence |
| --- | ---: | --- | --- |
| Direct central/shared implementation imports from sections | 94 | BLOCKS_CAPSULE | import graph scan |
| Central runtime direct imports of section files | 40 | BLOCKS_CAPSULE | `app_router.dart`, `app.dart`, splash, generation2 entry |
| Cross-section imports | 10 | BLOCKS_CAPSULE | cross-section dependency table |
| Section-owned files or behavior inside central namespace | 4 | BLOCKS_CAPSULE | splash/residential signals, generation2 entry, presentation gallery consumed by commercial |
| Uncontracted Firebase dependencies | 5 files | BLOCKS_CAPSULE | Library provider content page; Commercial auth/repository/profile pages |
| Uncontracted Storage dependencies | 1 file | BLOCKS_CAPSULE | `provider_profile_repository.dart` |
| Uncontracted route dependencies | 22 imports | BLOCKS_CAPSULE | direct `Routes` imports from sections |
| Uncontracted localization dependencies | 15 imports | BLOCKS_CAPSULE | section imports of shared or other-owner l10n |
| Uncontracted asset dependencies | 26 references | BLOCKS_CAPSULE | cross/central asset path scan |
| Duplicate active implementation | 1 group | BLOCKS_CAPSULE | `DaleelAssistant` duplicate |
| Not-verified runtime routes | 6 | BLOCKS_CAPSULE | not-verified table |
| Platform Core contract imports | 10 external imports | DOES_NOT_BLOCK_CAPSULE | section/tool imports of `platform_core.dart` |
| Signal-only Platform Core adapters | 3 section adapters/bridges | DOES_NOT_BLOCK_CAPSULE | residential/commercial/library platform core files |

## 12. Final Factual Tables

| Source | Source Owner | Target | Target Owner | Dependency Type | Contracted | State | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Sections | RESIDENTIAL/COMMERCIAL/LIBRARY | `lib/app/router/routes.dart` | CENTRAL_RUNTIME | route dependency | NO | DIRECT_ACTIVE | 22 direct imports |
| Sections | RESIDENTIAL/COMMERCIAL/LIBRARY | `lib/shared/**` | SHARED | shared implementation dependency | NO | DIRECT_ACTIVE | 51 direct imports |
| Sections | RESIDENTIAL/COMMERCIAL/LIBRARY | `lib/l10n/shared/shared_localizations.dart` | CENTRAL_RUNTIME | localization dependency | NO | DIRECT_ACTIVE | 11 direct imports |
| Sections | RESIDENTIAL/COMMERCIAL/LIBRARY | other section files/l10n | mixed | cross-section dependency | NO | DIRECT_ACTIVE | 10 direct imports |
| Central runtime | CENTRAL_RUNTIME | section pages/localizations | mixed | central UI wiring | NO | CENTRAL_UI_WIRING | 36 direct imports |
| Central runtime | CENTRAL_RUNTIME | section implementation files | RESIDENTIAL | direct implementation import | NO | DIRECT_ACTIVE | 4 direct imports |
| Sections/tools | mixed | `lib/core/platform_core/platform_core.dart` | PLATFORM_CORE | platform-core-contract | YES | CONTRACTED | 10 external imports |

| File/Symbol | Physical Owner | Actual Consumer Owner | Ownership State | Evidence |
| --- | --- | --- | --- | --- |
| `provider_public_profile.dart`, `provider_profile_categories.dart` | COMMERCIAL | LIBRARY | TRUE_OWNERSHIP_VIOLATION | Library provider pages/cards import Commercial domain |
| `generation2_mobile_client_room_page.dart` | RESIDENTIAL | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | Commercial Generation2 rooms import client room |
| `library_localizations.dart` | LIBRARY | COMMERCIAL/RESIDENTIAL | TRUE_OWNERSHIP_VIOLATION | Commercial public accounts and Accessibility checkin import it |
| `residential_localizations.dart` | RESIDENTIAL | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | Commercial public accounts/tools import it |
| `presentation_gallery/**` | CENTRAL_RUNTIME | COMMERCIAL | TRUE_OWNERSHIP_VIOLATION | Commercial V2 imports repository/model/viewer/widget |
| `safe_external_link_launcher.dart` | SHARED | all sections | VALID_SHARED | section link actions |
| `platform_core.dart` | PLATFORM_CORE | sections/tools | VALID_CENTRAL | contract imports only |

| Duplicate Group | Components | Owners | Consumers | Duplicate State | Evidence |
| --- | --- | --- | --- | --- | --- |
| `DaleelAssistant` | shared assistant; splash-local assistant | SHARED / CENTRAL_RUNTIME | shared imported by sections; splash local used inside splash | TRUE_DUPLICATE | duplicate class declarations |
| anonymous `extension on` signal definitions | residential/library/commercial emitters | section-owned | private section emitter helpers | NOT_DUPLICATE | different receiver types |

| Component | Current Classification | Consumers | Capsule Blocker | Evidence |
| --- | --- | --- | --- | --- |
| `commercialPublicAccounts` | NOT_VERIFIED | AppRouter only | BLOCKS_CAPSULE | no caller found outside router/localization |
| `commercialV2Web` | NOT_VERIFIED | AppRouter only; root route duplicates destination | BLOCKS_CAPSULE | no caller found outside router |
| `landingPreview` | NOT_VERIFIED | AppRouter only | BLOCKS_CAPSULE | no caller found outside router |
| `exitSocialLinks` | NOT_VERIFIED | AppRouter only | BLOCKS_CAPSULE | no caller found outside router |
| `blockedAccount` | NOT_VERIFIED | AppRouter only | BLOCKS_CAPSULE | no caller found outside router |
| `accessibilityMessageOfDay` | NOT_VERIFIED | AppRouter only | BLOCKS_CAPSULE | no caller found outside router |

Final counts:

| Output Field | Count / Value |
| --- | ---: |
| Runtime files reinspected | 250 |
| Direct dependencies before | 39 |
| Direct dependencies now | 144 |
| Ownership violations before | 39 |
| Ownership violations now | 40 |
| True duplicate components | 1 |
| Valid duplicate variants | 1 |
| Previously not-verified | 6 |
| Now active | 0 |
| Now test-only | 0 |
| Now toolchain-required | 0 |
| Now dead-verified | 0 |
| Still not-verified | 6 |
| Central runtime components | 84 files / 51 Dart |
| Residential-owned components | 32 files / 26 Dart |
| Commercial-owned components | 42 files / 39 Dart |
| Library-owned components | 25 files / 22 Dart |
| Cross-section dependencies | 10 |
| Uncontracted Firebase dependencies | 5 files |
| Uncontracted Storage dependencies | 1 file |
| Uncontracted route dependencies | 22 imports |
| Uncontracted localization dependencies | 15 imports |
| Uncontracted asset dependencies | 26 references |
| Pre-capsule blockers | 184 factual findings |
| Non-blocking findings | 11 factual findings |
| Original files modified | 0 |
| Platform Core modified | 0 |

MANUAL COMMANDS FOR USER

No commands.

PART 9C STATUS:
POST-CLEANUP RUNTIME BOUNDARIES INVENTORIED
