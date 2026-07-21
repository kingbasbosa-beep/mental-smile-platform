# Mental Smile Platform - Full Organized Inventory

Inventory date: 2026-07-20

Scope: current workspace at `C:\mental_smile_workspace\app\mental-smile-platform`.

Mode: inventory only. No source edits, cleanup, tests, build, deploy, staging, or commit were performed as part of this inventory.

## 1. Executive Summary

The platform is a Flutter/Firebase runtime named `mental_smile_os`.

The repository currently contains:

| Area | Current State |
| --- | --- |
| Main app runtime | Flutter app with Riverpod, Firebase, localization, central router, and shared UI/runtime services |
| Capsules | 4 capsule areas: `platform`, `residential`, `commercial`, `library` |
| Runtime capsule packages | 3 path dependencies mounted in `pubspec.yaml`: commercial, library, residential |
| Platform capsule | Infrastructure/governance package and registries, not an active app runtime dependency |
| Firebase | Configured for project `mental-smile-platform` with Firestore, Storage, Hosting, and empty Functions source |
| Landing | Static `public-landing/` surface plus Flutter web hosting target `build/web` |
| Assets | Large visual/content asset layer, currently 195 visible source asset files by `rg --files` |
| Tests | 27 top-level Dart test files plus capsule package tests/examples |
| Reports | Existing inventory/audit reports for assets, runtime connections, purification, boundaries, canonical ports, and platform core |
| Working tree | Very dirty: 60 modified, 5294 deleted, 41 untracked paths in `git status --short` |

High-level conclusion: the platform has moved from a clean shell into a materialized capsule runtime with app routes, signals, Firebase rules, assets, tests, and audit documents. It is not currently in a clean git state.

## 2. Visible Source Inventory

Visible source files from `rg --files`: 870.

Top-level visible source distribution:

| Root | Files |
| --- | ---: |
| `capsules/` | 376 |
| `lib/` | 208 |
| `assets/` | 195 |
| `test/` | 27 |
| `android/` | 22 |
| `public-landing/` | 8 |
| `web/` | 7 |
| `functions/` | 7 |
| `tool/` | 2 |
| `tools/` | 1 |
| root config/report files | 24 |

Top extensions:

| Extension | Count |
| --- | ---: |
| `.dart` | 381 |
| `.png` | 268 |
| `.json` | 71 |
| `.md` | 28 |
| `.webp` | 24 |
| `.yaml` | 24 |
| `.arb` | 16 |
| `.txt` | 12 |
| `.xml` | 9 |
| `.lock` | 9 |
| `.html` | 7 |
| `.jpg` | 6 |

Generated/ignored folders also exist locally, including `.dart_tool/`, `build/`, `.firebase/`, `.idea/`, and generated `functions/lib/`.

## 3. Capsule Inventory

Registered capsule registry: `capsules/platform/registries/CAPSULE_REGISTRY.json`.

| Capsule | Capsule ID | Registry State | Package Path | Active |
| --- | --- | --- | --- | --- |
| Platform | `MS-CAPSULE-PLATFORM-INFRASTRUCTURE` | `PACKAGE_READY` | `capsules/platform/package` | false |
| Residential | `MS-CAPSULE-RES-R-1.07.2026` | `MANUAL_VERIFICATION_PASSED` | `capsules/residential/package` | false |
| Commercial | `MS-CAPSULE-COM-BLUEPRINT` | `MANUAL_VERIFICATION_PASSED` | `capsules/commercial/package` | false |
| Library | `MS-CAPSULE-LIB-BLUEPRINT` | `MANUAL_VERIFICATION_PASSED` | `capsules/library/package` | false |

Capsule source counts by visible files:

| Capsule | Files | Dart | JSON | Assets | Tests | Examples |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| `commercial` | 107 | 56 | 12 | 28 | 4 | 14 |
| `library` | 95 | 42 | 16 | 18 | 3 | 13 |
| `platform` | 30 | 6 | 15 | 0 | 2 | 8 |
| `residential` | 144 | 60 | 13 | 56 | 7 | 14 |

Important capsule status notes:

| Item | State |
| --- | --- |
| Runtime packages in app `pubspec.yaml` | `mental_smile_commercial_capsule`, `mental_smile_library_capsule`, `mental_smile_residential_capsule` |
| Runtime capsule manifests | `platformMounted=true`, `testMounted=true`, `active=false`, `mergeable=false` |
| Verification inside manifests | Mostly `PENDING_MANUAL_VERIFICATION` |
| Platform registry states | Runtime capsules marked `MANUAL_VERIFICATION_PASSED` |
| Interpretation | Mounted/test-mounted and registry-passed, but not declared active/mergeable in manifests |

## 4. Capsule Registries Present

Each runtime capsule has these governance files:

| Registry Type | Commercial | Library | Residential |
| --- | --- | --- | --- |
| Manifest | yes | yes | yes |
| Route registry | yes | yes | yes |
| Signal registry | yes | yes | yes |
| Port registry | yes | yes | yes |
| Runtime map | yes | yes | yes |
| Firebase registry | yes | yes | yes |
| Asset registry | yes | yes | yes |
| Localization registry | yes | yes | yes |
| Test registry | yes | yes | yes |
| Validation registry | yes | yes | yes |
| Guide | yes | yes | yes |
| Capsule ID | yes | yes | yes |

Platform capsule governance files include:

| File | Purpose |
| --- | --- |
| `identity/IDENTITY.json` | Platform identity |
| `registries/CAPSULE_REGISTRY.json` | Master capsule registry |
| `ports/PORT_REGISTRY.json` | Platform port registry |
| `contracts/CONTRACT_REGISTRY.json` | Contract registry |
| `canonical_lines/CANONICAL_LINE_REGISTRY.json` | Canonical line registry |
| `compatibility/COMPATIBILITY_GATE.json` | Compatibility gate |
| `diagnostics/DIAGNOSTICS_REGISTRY.json` | Diagnostics registry |
| `host/HOST_ADAPTERS.json` | Host adapter declaration |
| `lifecycle/LIFECYCLE_REGISTRY.json` | Lifecycle registry |
| `mount/MOUNT_MANAGER.json` | Mount manager |
| `validation/VALIDATION_REGISTRY.json` | Validation registry |

## 5. Runtime App Inventory

Main runtime entry:

| File | Role |
| --- | --- |
| `lib/main.dart` | Initializes Flutter, Firebase, saved locale, and `ProviderScope` |
| `lib/app/app.dart` | Builds `MaterialApp`, Arabic default locale, localization delegates, theme, router |
| `lib/app/router/routes.dart` | Central route constants |
| `lib/app/router/app_router.dart` | Central route resolution, auth/role gates, blocked/visibility checks |
| `lib/firebase_options.dart` | Generated Firebase options |

Runtime feature distribution under `lib/`:

| Area | Files |
| --- | ---: |
| `core/` | 31 |
| `shared/` | 30 |
| `l10n/` | 36 |
| `features/commercial` | 21 |
| `features/commercial_v2_web` | 15 |
| `features/library` | 18 |
| `features/residential` | 13 |
| `features/accessibility` | 7 |
| `features/signals` | 14 |
| app/router/locale | 4 |
| other feature surfaces | 19 |

Core systems observed:

| System | Files/Area |
| --- | --- |
| Platform Core | `lib/core/platform_core/` |
| Auth/account access | `lib/core/auth/` |
| Storage locale | `lib/core/storage/locale_storage.dart` |
| Domain registry/status | `lib/core/system/` |
| Visibility readiness | `lib/core/visibility/` |
| Local signals | `lib/core/local_signals/` |
| Shared capsule runtime ports | `lib/shared/capsule_runtime/` |
| Shared speech/accessibility | `lib/shared/accessibility/` |
| Shared provider profiles | `lib/shared/provider_profiles/` |
| Shared links | `lib/shared/links/safe_external_link_launcher.dart` |
| Shared UI kit | `lib/shared/ui_kit/` |

## 6. Route Inventory

Routes registered by capsule registries:

| Capsule | Reachable Routes | Notes |
| --- | ---: | --- |
| Residential | 14 | G2 splash, mobile client, client/accessibility rooms, exit portal |
| Commercial | 18 | root `/`, commercial access, specialist/center login/register/rooms, commercial V2 web |
| Library | 5 | web library, knowledge cards/article, provider specialists/centers |

Total capsule-registered reachable routes: 37.

Important active route behavior:

| Route | Current Destination |
| --- | --- |
| `/` | `CommercialV2WebShowcasePage` |
| `initialRoute` | `Routes.splash` |
| `/splash` | `Generation2SplashPage` |
| `/legacy/splash` | legacy `SplashPage` |
| hidden residential test | `/__capsule_test/residential` |
| hidden commercial test | `/__capsule_test/commercial` |
| hidden library test | `/__capsule_test/library` |

Protected route groups:

| Role | Routes |
| --- | --- |
| clinician | commercial room/profile/library, G2 specialist room |
| center | center room/profile/library, G2 center room |
| clinician or center | commercial assistive tools |

## 7. Signal Inventory

Signal registry counts:

| Capsule | Core/Firestore Signals | Local Signals | Other Notes |
| --- | ---: | ---: | --- |
| Residential | 3 | 58 | local buffer `mental_smile_local_signals_residential` |
| Commercial | 4 | 7 | 1 writer-accepted local signal, 6 writer-skipped local signals |
| Library | 1 | 22 | 6 persisted local signals, 16 dictionary-only signals |

Total registered signal codes across runtime capsules: 95.

Signal infrastructure observed:

| Area | Role |
| --- | --- |
| Platform Core signal bridge | validates/emits core signal envelopes |
| Local section signal buffer | local temporary signal persistence |
| Archive signal event writers | per-section signal archive writers |
| Firebase signal rules | `signal_events`, `core_*_signals`, `archive_signal_events` |

## 8. Firebase And Backend Inventory

Firebase project: `mental-smile-platform`.

Configured surfaces:

| File | Role |
| --- | --- |
| `.firebaserc` | default project |
| `firebase.json` | functions, firestore, storage, hosting, Flutter Firebase app config |
| `firestore.rules` | Firestore access policy |
| `firestore.indexes.json` | one index for `signal_events` by `actorId` + `timestamp desc` |
| `storage.rules` | official profile/identity image upload policy |
| `functions/package.json` | Node 20 Firebase Functions package |
| `functions/src/index.ts` | currently empty |
| `functions/lib/index.js` | generated empty JS output |

Firestore collections/rule surfaces:

| Surface | State |
| --- | --- |
| `clinicians/{uid}` | self registration/update, read self or visibility ready |
| `clinicians/{uid}/profile/current` | specialist private profile |
| `centers/{uid}` | self registration/update, read self or visibility ready |
| `centers/{uid}/profile/current` | center private profile |
| `public_specialist_profiles/{uid}` | published public specialist profiles |
| `public_center_profiles/{uid}` | published public center profiles |
| `system_domains/{docId}` | owner read only, no writes |
| `signal_events/{signalId}` | signed-in signal creation/read rules |
| `core_test_signal_events/{signalId}` | write-only test signal path |
| `core_login/logout/survey/feedback/application_signals` | write-only production signal families |
| `archive_signal_events/{eventId}` | owner read, controlled create |
| fallback | deny all |

Storage paths:

| Path | State |
| --- | --- |
| `centers/{uid}/official/identity_image` | public read, center owner upload/update, no delete |
| `clinicians/{uid}/official/profile_image` | public read, clinician owner upload/update, no delete |
| fallback | deny all |

## 9. Assets Inventory

Visible asset files: 195.

Asset distribution:

| Area | Count |
| --- | ---: |
| `assets/images` | 23 |
| `assets/branding/rooms` | 23 |
| `assets/c5` | 22 |
| `assets/commercial` | 19 |
| `assets/branding/guides` | 16 |
| `assets/content` | 12 |
| `assets/client` | 10 |
| `assets/branding/web` | 8 |
| `assets/c6_library` | 8 |
| `assets/accessibility` | 7 |
| `assets/library` | 6 |
| `assets/presentations` | 5 |
| other branding/platform/background/icon areas | 36 |

Important prior asset audit findings from `PROJECT_INVENTORY_PART_7_ASSETS.md`:

| Metric | Count |
| --- | ---: |
| Total asset files in that audit | 248 |
| Active assets | 49 |
| Registered but no consumer observed | 43 |
| Consumer not registered | 20 |
| Not referenced | 78 |
| Duplicate content files | 93 |
| Missing asset references | 6 |
| Fully inactive directories | 56 |
| Unknown ownership assets | 48 |

Important prior isolation findings from `PROJECT_INVENTORY_PART_7C_ASSET_ISOLATION.md`:

| State | Meaning |
| --- | --- |
| shared platform assets exist | official logos and some navigation/guide assets are cross-screen |
| shared paths exist | client/accessibility/commercial/library reuse some paths across sections |
| asset ownership partially mixed | some client screens consume accessibility namespace assets and shared guide assets |

## 10. Localization Inventory

Localization is Arabic-first with English support.

Namespaces:

| Namespace | Files |
| --- | --- |
| app | ARB + generated localizations |
| shared | ARB + generated localizations |
| accessibility | ARB + generated localizations |
| commercial | ARB + generated localizations |
| library | ARB + generated localizations |
| residential | ARB + generated localizations |

App default locale: Arabic (`Locale('ar')`) unless saved locale is `ar` or `en`.

## 11. Test And Validation Inventory

Top-level test files: 27.

Coverage areas:

| Area | Tests |
| --- | --- |
| Platform Core | platform core facade, signal bridge, dictionary, sockets, gateways, adapter layer |
| Local signals | local section signal buffer |
| Capsule runtime test ports | commercial, library, residential test ports |
| Accessibility speech | localized speech service |
| Commercial provider profile | connection/final closure |
| Library public cards | specialist and center white cards |
| Residential speech | speech boundary |
| Trust/provider summaries | mapper, fake provider, fixtures |
| Clean core import | old/core import guard |
| Widget test | default Flutter widget test |

Capsule package tests:

| Capsule | Test Count |
| --- | ---: |
| commercial | 4 |
| library | 3 |
| platform | 2 |
| residential | 7 |

Validation/probe tools:

| Tool | Role |
| --- | --- |
| `tool/platform_core_phase_2c_probe.dart` | Platform core phase probe |
| `tool/platform_core_production_probe.dart` | Production platform core probe |
| `tools/provider_profile_final_cleanup.js` | Provider profile cleanup/finalization utility |

No tests were executed during this inventory.

## 12. Public/Landing/Web Inventory

| Area | State |
| --- | --- |
| Flutter web shell | `web/index.html`, `web/manifest.json`, icons, favicon |
| Public landing | `public-landing/index.html`, `styles.css`, `landing-links.js`, `404.html`, favicon, report/readme |
| Firebase Hosting | configured to serve `build/web` and rewrite all routes to `/index.html` |

## 13. Existing Audit/Inventory Reports

Current root-level reports:

| Report | Purpose |
| --- | --- |
| `PLATFORM_CORE_FREEZE_INSPECTION.md` | Platform Core folder, consumers, tests, public API inspection |
| `PROJECT_INVENTORY_PART_7_ASSETS.md` | Asset inventory and status classification |
| `PROJECT_INVENTORY_PART_7C_ASSET_ISOLATION.md` | Screen-to-asset isolation and ownership audit |
| `PROJECT_INVENTORY_PART_8A_RUNTIME_CONNECTIONS.md` | Links, persistence, Firebase, mobile/desktop parity |
| `PROJECT_INVENTORY_PART_9A_RUNTIME_PURIFICATION.md` | Runtime files, dead files/symbols, ownership violations |
| `PROJECT_INVENTORY_PART_9C_RUNTIME_BOUNDARIES.md` | Post-cleanup runtime boundaries and dependency map |
| `PROJECT_INVENTORY_PART_9E_CANONICAL_PORT_LANGUAGE.md` | Canonical lines, contracts, reserved extension lines |

Key prior audit findings:

| Report | Important Finding |
| --- | --- |
| Part 8A | Specialist/center profile and public profile persistence exists on desktop, mobile parity is partial/desktop-only for several professional flows |
| Part 9A | Found 48 dead runtime files, 68 dead symbols, 39 ownership violations before cleanup |
| Part 9C | After cleanup, broken internal Dart imports observed: 0; platform core modified: 0; current blocker model still exists |
| Part 9E | 149 central port blockers remained in that static result, mostly lifecycle/route/localization/external-action lines |

## 14. Working Tree / Dust Inventory

`git status --short` summary:

| State | Count |
| --- | ---: |
| Modified | 60 |
| Deleted | 5294 |
| Untracked | 41 |
| Total status entries | 5395 |

Important dirty-state examples:

| Type | Examples |
| --- | --- |
| Modified config | `.firebaserc`, `analysis_options.yaml`, `android/app/build.gradle.kts`, `pubspec.yaml`, `pubspec.lock`, `storage.rules` |
| Deleted governance/workflows | `.github/workflows/*` deleted |
| Deleted old assets/docs/backups | many legacy asset, backup, docs, and `mental-smile-os-workspace` paths deleted |
| Untracked current materialization | `capsules/`, new `lib/l10n/*`, `lib/shared/capsule_runtime/*`, new tests, new assets, root inventory reports |
| Generated untracked output | `functions/lib/`, `.artifacts/` |

Inventory interpretation:

The repository is currently in a large cutover/materialization state. The old archive/docs/assets appear deleted from git, while capsule runtime, new l10n, tests, assets, Firebase functions source/output, and reports are untracked or modified. This should be treated as a deliberate but uncommitted platform transformation until reviewed.

## 15. What Has Been Built / Materialized

Observed completed work:

| Work Area | Evidence |
| --- | --- |
| Flutter app runtime | `lib/main.dart`, `lib/app/app.dart`, `lib/app/router/app_router.dart` |
| Arabic-first localization | six l10n namespaces with ARB/generated Dart |
| Firebase bootstrap | `firebase_options.dart`, `firebase.json`, `.firebaserc` |
| Firebase security policy | Firestore and Storage rules for accounts, public profiles, signals, official images |
| Commercial runtime | access/login/register/rooms/profiles/libraries/public accounts/V2 web showcase |
| Residential runtime | G2 splash/client room/accessibility room/exit portal/speech/signals |
| Library runtime | web library, provider branches, knowledge cards/articles/content repository |
| Platform Core | socket/dock/dictionary/resolver/gateway/session/bridge contracts |
| Signal system | core/local/archive signals across residential, commercial, library |
| Capsule packaging | commercial/library/residential/platform package structures with manifests and registries |
| Capsule test ports | hidden routes and shared test host adapters |
| Asset materialization | section assets copied into root app and capsule packages |
| Landing surface | `public-landing/` static site |
| Test suite expansion | 27 top-level tests plus capsule package tests |
| Audit documentation | platform core freeze and project inventory parts 7 through 9E |

## 16. Open Inventory Risks

This is not a bug list; it is the inventory of unresolved platform state.

| Risk | Evidence |
| --- | --- |
| Git state is too dirty to call clean | 5395 status entries |
| Manifest/registry status language differs | manifests say `active=false` and pending manual verification, registry says runtime capsules passed |
| Functions source is empty | `functions/src/index.ts` has no implementation |
| Generated Functions output is present | `functions/lib/index.js` is generated and untracked |
| Asset ownership remains mixed | prior Part 7/7C reports show duplicates, unknown ownership, shared cross-section paths |
| Mobile/desktop parity incomplete | Part 8A marks professional profile/library flows desktop-only or partial |
| Port boundary blockers remain in prior report | Part 9E records 149 blockers at that time |
| Build/test freshness not established here | no build/test/analyze executed during this inventory |

## 17. Clean Inventory Conclusion

The platform currently consists of:

1. A central Flutter/Firebase app runtime.
2. Three materialized runtime capsules: residential, commercial, library.
3. One platform infrastructure capsule.
4. A substantial asset/content layer.
5. A signal/port/platform-core architecture.
6. Firebase rules and hosting configuration.
7. Static landing artifacts.
8. Expanded tests and probe tools.
9. Several existing audit reports.
10. A very large uncommitted working-tree transformation.

Nothing was cleaned or changed by this report. This file is only the organized inventory snapshot.
