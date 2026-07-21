# PART 9A - Runtime Core Purification Inventory

Scope: `lib/` was inspected by read-only listing, import/export graph parsing, symbol scanning, route reference scanning, and targeted test-reference lookup. No build, test, format, deploy, git write, delete, move, or refactor command was executed.

Frozen zone: `lib/core/platform_core/` was read for reference classification only and was not modified.

## Summary

| Metric | Count | Evidence |
| --- | ---: | --- |
| Runtime files inspected | 267 | all files under `lib/` |
| Dart files inspected | 220 | import/symbol graph |
| Non-Dart runtime/toolchain files inspected | 47 | ARB/YAML under `lib/l10n/` |
| Active direct components | 64 | imported directly by runtime files |
| Active indirect components | 25 | barrel/export, symbol reference, or signal catalog style references |
| Entrypoints | 5 | `lib/main.dart`, `lib/app/app.dart`, `lib/app/router/app_router.dart`, `lib/app/router/routes.dart`, `lib/app/locale_provider.dart` |
| Route destinations | 36 | `lib/app/router/app_router.dart` switch cases |
| Generated components | 19 | `firebase_options.dart` and generated localization Dart files |
| Toolchain-required components | 18 | 12 ARB + 6 `l10n.yaml` files |
| Test-only components | 1 | `ProviderTrustSummaryMapper` referenced from tests only |
| Platform-frozen components | 22 | `lib/core/platform_core/**/*.dart` |
| Dead runtime files | 48 | no runtime import/export/symbol reference found |
| Dead symbols | 68 | public symbols inside dead files, counted from parsed declarations |
| Duplicate components | 2 | duplicate public symbol names |
| Ownership violations | 39 | direct feature-to-feature or feature-to-core imports |
| Circular dependencies | 0 | no import cycle found in parsed graph |
| Not verified components | 6 | route constants registered in AppRouter only, no external caller found |

## Entrypoints

| File | Symbol / Role | Status | Evidence |
| --- | --- | --- | --- |
| `lib/main.dart` | Flutter app entry | ENTRYPOINT | imports `MentalSmileOSApp` and wraps `ProviderScope` |
| `lib/app/app.dart` | App composition | ENTRYPOINT | `MaterialApp` / route delegate owner |
| `lib/app/router/app_router.dart` | Runtime router | ENTRYPOINT | `AppRouter.onGenerateRoute` |
| `lib/app/router/routes.dart` | Route constants | ENTRYPOINT | `class Routes` |
| `lib/app/locale_provider.dart` | Riverpod locale provider | ENTRYPOINT | imported by `main.dart` and app shell |

## Generated And Toolchain Components

Generated Dart components:

- `lib/firebase_options.dart`
- `lib/l10n/accessibility/accessibility_localizations.dart`
- `lib/l10n/accessibility/accessibility_localizations_ar.dart`
- `lib/l10n/accessibility/accessibility_localizations_en.dart`
- `lib/l10n/app/app_section_localizations.dart`
- `lib/l10n/app/app_section_localizations_ar.dart`
- `lib/l10n/app/app_section_localizations_en.dart`
- `lib/l10n/commercial/commercial_localizations.dart`
- `lib/l10n/commercial/commercial_localizations_ar.dart`
- `lib/l10n/commercial/commercial_localizations_en.dart`
- `lib/l10n/library/library_localizations.dart`
- `lib/l10n/library/library_localizations_ar.dart`
- `lib/l10n/library/library_localizations_en.dart`
- `lib/l10n/residential/residential_localizations.dart`
- `lib/l10n/residential/residential_localizations_ar.dart`
- `lib/l10n/residential/residential_localizations_en.dart`
- `lib/l10n/shared/shared_localizations.dart`
- `lib/l10n/shared/shared_localizations_ar.dart`
- `lib/l10n/shared/shared_localizations_en.dart`

Toolchain-required ARB/YAML components:

- `lib/l10n/accessibility/accessibility_ar.arb`, `accessibility_en.arb`, `l10n.yaml`
- `lib/l10n/app/app_ar.arb`, `app_en.arb`, `l10n.yaml`
- `lib/l10n/commercial/commercial_ar.arb`, `commercial_en.arb`, `l10n.yaml`
- `lib/l10n/library/library_ar.arb`, `library_en.arb`, `l10n.yaml`
- `lib/l10n/residential/residential_ar.arb`, `residential_en.arb`, `l10n.yaml`
- `lib/l10n/shared/shared_ar.arb`, `shared_en.arb`, `l10n.yaml`

## Route Destinations

All route destinations below are registered in `lib/app/router/app_router.dart`.

| Route destination file | Symbol | Status | Evidence |
| --- | --- | --- | --- |
| `lib/features/library/presentation/pages/library_page.dart` | `LibraryPage` | ROUTE_DESTINATION | `Routes.webLibrary`, `app_router.dart` |
| `lib/features/library/presentation/pages/official_platform_links_page.dart` | `OfficialPlatformLinksPage` | ROUTE_DESTINATION | `Routes.officialPlatformLinks`, `app_router.dart` |
| `lib/features/library/knowledge_cards/presentation/pages/knowledge_cards_page.dart` | `KnowledgeCardsPage` | ROUTE_DESTINATION | `Routes.knowledgeCards`, `app_router.dart` |
| `lib/features/library/knowledge_cards/presentation/pages/knowledge_article_viewer_page.dart` | `KnowledgeArticleViewerPage` | ROUTE_DESTINATION | `Routes.knowledgeArticleViewer`, `app_router.dart` |
| `lib/features/library/presentation/pages/library_provider_content_pages.dart` | `LibrarySpecialistsPage`, `LibraryCentersPage` | ROUTE_DESTINATION | `Routes.libraryProviderSpecialists`, `Routes.libraryProviderCenters` |
| `lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart` | `AppExitSocialLinksPage` | ROUTE_DESTINATION | `Routes.exitSocialLinks` |
| `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart` | `ResidentialExitSocialPortalPage` | ROUTE_DESTINATION | `Routes.residentialExitSocialLinks` |
| `lib/core/auth/presentation/pages/account_blocked_page.dart` | `AccountBlockedPage` | ROUTE_DESTINATION | `Routes.blockedAccount` |
| `lib/features/client/presentation/pages/client_room_page.dart` | `ClientRoomPage` | ROUTE_DESTINATION | `Routes.clientRoom` |
| `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | `AccessibilityRoomPage` | ROUTE_DESTINATION | `Routes.accessibilityRoom` |
| `lib/features/accessibility/presentation/pages/accessibility_links_page.dart` | `AccessibilityLinksPage` | ROUTE_DESTINATION | `Routes.accessibilityLinks` |
| `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart` | `AccessibilityToolsPage` | ROUTE_DESTINATION | `Routes.accessibilityTools` |
| `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart` | `AccessibilitySuggestionsPage` | ROUTE_DESTINATION | `Routes.accessibilitySuggestions` |
| `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart` | `AccessibilityCommunityToolsPage` | ROUTE_DESTINATION | `Routes.accessibilityCommunityTools` |
| `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart` | `AccessibilityCheckinPage` | ROUTE_DESTINATION | `Routes.accessibilityCheckin` |
| `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart` | `AccessibilityMessageOfDayPage` | ROUTE_DESTINATION | `Routes.accessibilityMessageOfDay` |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart` | `Generation2SplashPage` | ROUTE_DESTINATION | `Routes.splash` |
| `lib/features/splash/presentation/pages/splash_page.dart` | `SplashPage` | ROUTE_DESTINATION | `Routes.legacySplash` |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_lite_client_page.dart` | `Generation2MobileLiteClientPage` | ROUTE_DESTINATION | `Routes.generation2MobileLiteClient` |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart` | `Generation2MobileLoginSelectionPage` | ROUTE_DESTINATION | `Routes.generation2MobileLoginSelection` |
| `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart` | `Generation2MobileClientRoomPage` | ROUTE_DESTINATION | `Routes.generation2MobileClientRoom` |
| `lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart` | `Generation2MobileSpecialistRoomPage` | ROUTE_DESTINATION | `Routes.generation2MobileSpecialistRoom` |
| `lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart` | `Generation2MobileCenterRoomPage` | ROUTE_DESTINATION | `Routes.generation2MobileCenterRoom` |
| `lib/features/commercial/presentation/pages/commercial_access_page.dart` | `CommercialAccessPage` | ROUTE_DESTINATION | `Routes.commercialAccess` |
| `lib/features/commercial/presentation/pages/specialist_login_page.dart` | `SpecialistLoginPage` | ROUTE_DESTINATION | `Routes.commercialSpecialistLogin` |
| `lib/features/commercial/presentation/pages/commercial_register_pages.dart` | `SpecialistRegisterPage`, `CenterRegisterPage` | ROUTE_DESTINATION | specialist/center register routes |
| `lib/features/commercial/presentation/pages/center_login_page.dart` | `CenterLoginPage` | ROUTE_DESTINATION | `Routes.commercialCenterLogin` |
| `lib/features/commercial/presentation/pages/commercial_room_page.dart` | `CommercialRoomPage` | ROUTE_DESTINATION | `Routes.commercialRoom` |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_clean_layout_page.dart` | `SpecialistProfessionalProfileCleanLayoutPage` | ROUTE_DESTINATION | `Routes.commercialSpecialistProfessionalProfile` |
| `lib/features/commercial/presentation/pages/specialist_professional_library_page.dart` | `SpecialistProfessionalLibraryPage` | ROUTE_DESTINATION | `Routes.commercialSpecialistProfessionalLibrary` |
| `lib/features/commercial/presentation/pages/center_room_page.dart` | `CenterRoomPage` | ROUTE_DESTINATION | `Routes.commercialCenterRoom` |
| `lib/features/commercial/presentation/pages/center_professional_profile_clean_layout_page.dart` | `CenterProfessionalProfileCleanLayoutPage` | ROUTE_DESTINATION | `Routes.commercialCenterProfessionalProfile` |
| `lib/features/commercial/presentation/pages/center_professional_library_page.dart` | `CenterProfessionalLibraryPage` | ROUTE_DESTINATION | `Routes.commercialCenterProfessionalLibrary` |
| `lib/features/commercial/presentation/pages/commercial_shared_assistive_tools_page.dart` | `CommercialSharedAssistiveToolsPage` | ROUTE_DESTINATION | `Routes.commercialAssistiveTools` |
| `lib/features/commercial/presentation/pages/commercial_public_accounts_page.dart` | `CommercialPublicAccountsPage` | ROUTE_DESTINATION | `Routes.commercialPublicAccounts` |
| `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart` | `CommercialV2WebShowcasePage` | ROUTE_DESTINATION | `/`, `Routes.commercialV2Web`, `Routes.landingPreview` |

Routes with no caller found outside AppRouter:

| Route | Route constant evidence | Status |
| --- | --- | --- |
| `Routes.commercialPublicAccounts` | `routes.dart:28`, `app_router.dart:310` | NOT_VERIFIED |
| `Routes.commercialV2Web` | `routes.dart:31`, `app_router.dart:316`; root `/` also loads same page | NOT_VERIFIED |
| `Routes.landingPreview` | `routes.dart:32`, `app_router.dart:322` | NOT_VERIFIED |
| `Routes.exitSocialLinks` | `routes.dart:40`, `app_router.dart:212` | NOT_VERIFIED |
| `Routes.blockedAccount` | `routes.dart:42`, `app_router.dart:73` | NOT_VERIFIED |
| `Routes.accessibilityMessageOfDay` | `routes.dart:50`, `app_router.dart:364` | NOT_VERIFIED |

## Active Runtime Components

Representative active direct components:

| File | Symbol / Runtime role | Consumer evidence | Status |
| --- | --- | --- | --- |
| `lib/core/auth/account_access_service.dart` | `AccountAccessService` | `app_router.dart`, `commercial_auth_service.dart`, `role_access_gateway.dart` | ACTIVE_DIRECT |
| `lib/core/storage/locale_storage.dart` | `LocaleStorage` | `main.dart`, splash/generation2 language flows | ACTIVE_DIRECT |
| `lib/core/visibility/visibility_readiness.dart` | visibility gate | `app_router.dart`, `commercial_auth_service.dart` | ACTIVE_DIRECT |
| `lib/features/commercial/application/commercial_auth_service.dart` | auth service | login/register pages | ACTIVE_DIRECT |
| `lib/features/commercial/data/provider_profile_repository.dart` | provider repository | professional profile pages | ACTIVE_DIRECT |
| `lib/features/commercial/domain/provider_public_profile.dart` | public provider profile model | library provider content pages and cards | ACTIVE_DIRECT |
| `lib/features/library/knowledge_cards/data/knowledge_card_repository.dart` | knowledge card repository | `app_router.dart`, knowledge pages | ACTIVE_DIRECT |
| `lib/features/signals/data/services/signal_storage_service.dart` | signal persistence service | section archive writers | ACTIVE_DIRECT |
| `lib/core/local_signals/local_section_signal_buffer.dart` | 24-hour local signal buffer | archive writers and signal storage service | ACTIVE_DIRECT |
| `lib/shared/links/safe_external_link_launcher.dart` | external link gateway | app exit/accessibility/commercial/library link surfaces | ACTIVE_DIRECT |
| `lib/shared/accessibility/speech/localized_speech_service.dart` | device speech service | `localized_speech_button.dart` | ACTIVE_DIRECT |
| `lib/shared/accessibility/speech/localized_speech_button.dart` | speech UI | `library_page.dart` | ACTIVE_DIRECT |
| `lib/shared/accessibility/accessibility_guide_icon.dart` | shared guide icon | splash/client/commercial/library/accessibility screens | ACTIVE_DIRECT |

Representative active indirect components:

| File | Evidence | Status |
| --- | --- | --- |
| `lib/features/commercial_v2_web/signals/commercial_v2_signal_emitter.dart` | symbol references from showcase flow | ACTIVE_INDIRECT |
| `lib/features/library/signals/library_signal_registry.dart` | used by signal catalog/metadata lookups | ACTIVE_INDIRECT |
| `lib/features/residential/signals/residential_signal_registry.dart` | residential signal catalog | ACTIVE_INDIRECT |
| `lib/features/signals/signals.dart` | barrel-style signal export | ACTIVE_INDIRECT |
| `lib/features/recommendations/recommendations.dart` | barrel-style recommendation export | ACTIVE_INDIRECT |
| `lib/shared/ui_kit/app_theme.dart` | app UI kit export/reference | ACTIVE_INDIRECT |
| `lib/shared/ui_kit/app_widgets.dart` | app UI kit export/reference | ACTIVE_INDIRECT |

## Test-Only Components

| File | Symbol | Test consumer | Status |
| --- | --- | --- | --- |
| `lib/features/trust/domain/mappers/provider_trust_summary_mapper.dart` | `ProviderTrustSummaryMapper` | `test/features/trust/domain/mappers/provider_trust_summary_mapper_test.dart:7` | TEST_ONLY |

## Dead Runtime Files

Files below had no runtime import, export, route registration, or external symbol reference found in `lib/`. One test-only mapper is excluded from this dead count.

| File | Public symbol evidence | Status |
| --- | --- | --- |
| `lib/core/di/providers.dart` | no public declaration found | DEAD_NO_CONSUMER |
| `lib/core/system/domain_governance_capability.dart` | `DomainGovernanceCapability:3`, `DomainGovernanceCapabilityX:83` | DEAD_NO_CONSUMER |
| `lib/core/system/domain_status_service.dart` | `DomainStatusService:5` | DEAD_NO_CONSUMER |
| `lib/dev/domain_status_seeder.dart` | top-level dev seeder | DEAD_NO_CONSUMER |
| `lib/features/assistant/presentation/widgets/bounded_assistant_panel.dart` | `BoundedAssistantCommand:5`, `BoundedAssistantPanel:21` | DEAD_NO_CONSUMER |
| `lib/features/auth/presentation/pages/login_page.dart` | no route/import found | DEAD_NO_CONSUMER |
| `lib/features/centers/data/models/center_pricing.dart` | `CenterCapabilityFlags:1`, `AccommodationCostItem:103`, `AutismCareCostItem:238` | DEAD_NO_CONSUMER |
| `lib/features/centers/presentation/center_document_requirements.dart` | no runtime consumer found | DEAD_NO_CONSUMER |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_page.dart` | `SpecialistProfessionalProfilePage:3` | DEAD_NO_CONSUMER |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_refined_page.dart` | `SpecialistProfessionalProfileRefinedPage:3` | DEAD_NO_CONSUMER |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_signal_first_page.dart` | `SpecialistProfessionalProfileSignalFirstPage:6` | DEAD_NO_CONSUMER |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_upload_refinement_page.dart` | `SpecialistProfessionalProfileUploadRefinementPage:6` | DEAD_NO_CONSUMER |
| `lib/features/commercial_v2_web/domain/commercial_v2_web_registry.dart` | `CommercialV2WebRegistry:6` | DEAD_NO_CONSUMER |
| `lib/features/commercial_v2_web/presentation/widgets/commercial_v2_web_showcase_card.dart` | `CommercialV2WebShowcaseCard:5` | DEAD_NO_CONSUMER |
| `lib/features/language/presentation/pages/language_page.dart` | `MkLanguagePage:5` | DEAD_NO_CONSUMER |
| `lib/features/library/platform_core/library_runtime_signal_bridge.dart` | `LibraryRuntimeSignalBridge:4` | DEAD_NO_CONSUMER |
| `lib/features/localization/federation/contracts/guidance_text_contract.dart` | `GuidanceTextContract:3` | DEAD_NO_CONSUMER |
| `lib/features/localization/federation/models/accessibility_text_profile.dart` | `AccessibilityTextProfile:1`, `FederationAccessibilityLabel:13`, `AccessibilityTextProfileKey:23` | DEAD_NO_CONSUMER |
| `lib/features/localization/federation/models/department_localization_profile.dart` | `DepartmentLocalizationProfile:1` | DEAD_NO_CONSUMER |
| `lib/features/localization/federation/models/info_card_localization_profile.dart` | `InfoCardLocalizationProfile:3` | DEAD_NO_CONSUMER |
| `lib/features/localization/federation/registry/contact_language_standard.dart` | `ContactLanguageStandard:1` | DEAD_NO_CONSUMER |
| `lib/features/localization/federation/registry/report_localization_map.dart` | `ReportLocalizationMap:3` | DEAD_NO_CONSUMER |
| `lib/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart` | `KernelMetric:8`, `KernelItem:15`, `KernelDashboardPage:42` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/models/magnet_resource.dart` | `MagnetResource:1` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/models/recommendation_candidate.dart` | `RecommendationCandidate:1` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/models/signal_fingerprint.dart` | `SignalFingerprint:1` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/models/signal_magnet_registry.dart` | `SignalMagnetRegistry:1` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/registry/recommendation_candidate_registry.dart` | `RecommendationCandidateRegistry:1` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/registry/resource_fingerprint_registry.dart` | `ResourceFingerprintRegistry:1` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/registry/signal_fingerprint_registry.dart` | `SignalFingerprintRegistry:1` | DEAD_NO_CONSUMER |
| `lib/features/recommendations/domain/signal_magnet/signal_magnet_foundation.dart` | no public declaration found | DEAD_NO_CONSUMER |
| `lib/features/signals/domain/emitters/clean_signal_runtime.dart` | `CleanSignalRuntime:8` | DEAD_NO_CONSUMER |
| `lib/features/signals/domain/factories/signal_package_factory.dart` | `SignalPackageFactory:8` | DEAD_NO_CONSUMER |
| `lib/features/signals/domain/models/center_signals.dart` | `CenterSignals:1` | DEAD_NO_CONSUMER |
| `lib/features/signals/domain/models/provider_signals.dart` | `ProviderSignals:1` | DEAD_NO_CONSUMER |
| `lib/features/signals/domain/models/signal_aggregate_read_models.dart` | `MostRequestedGoals:3`, `MostContactedProviderCategories:9`, `MostOpenedLibraryTopics:15` | DEAD_NO_CONSUMER |
| `lib/features/trust/domain/providers/fake_provider_trust_summary_provider.dart` | `FakeProviderTrustSummaryProvider:6` | DEAD_NO_CONSUMER |
| `lib/features/trust/domain/trust_domain.dart` | barrel/domain marker, no consumer found | DEAD_NO_CONSUMER |
| `lib/l10n/localization_ownership.dart` | `LocalizationSection:1`, `LocalizationOwnership:10` | DEAD_NO_CONSUMER |
| `lib/l10n/section_localization_registry.dart` | `SectionLocalizationRegistry:1` | DEAD_NO_CONSUMER |
| `lib/shared/analytics/app_analytics.dart` | `AppAnalytics:7` | DEAD_NO_CONSUMER |
| `lib/shared/contracts/center_types.dart` | `CenterTypes:1` | DEAD_NO_CONSUMER |
| `lib/shared/contracts/pricing_units.dart` | `PricingUnits:1` | DEAD_NO_CONSUMER |
| `lib/shared/contracts/request_kinds.dart` | `RequestKinds:1` | DEAD_NO_CONSUMER |
| `lib/shared/contracts/reviewer_types.dart` | `ReviewerTypes:1` | DEAD_NO_CONSUMER |
| `lib/shared/gateways/role_access_gateway.dart` | `RoleAccessGateway:5` | DEAD_NO_CONSUMER |
| `lib/shared/ui_kit/app_shell_actions.dart` | `AppShellActions:7` | DEAD_NO_CONSUMER |
| `lib/shared/ui_kit/asset_fallback_widgets.dart` | `AppMissingAssetPlaceholder:4` | DEAD_NO_CONSUMER |

## Unused By Category

| Category | Unused components |
| --- | --- |
| Unused providers | `lib/core/di/providers.dart`; `lib/features/signals/domain/models/provider_signals.dart`; `lib/features/signals/domain/models/signal_aggregate_read_models.dart`; `lib/features/trust/domain/providers/fake_provider_trust_summary_provider.dart` |
| Unused services | `lib/core/system/domain_status_service.dart` |
| Unused repositories | none found |
| Unused helpers | `lib/shared/ui_kit/asset_fallback_widgets.dart`; `lib/shared/analytics/app_analytics.dart` |
| Unused adapters | none outside Platform Core found |
| Unused bridges | `lib/features/library/platform_core/library_runtime_signal_bridge.dart` |
| Unused controllers | none found |
| Unused registries | `lib/features/commercial_v2_web/domain/commercial_v2_web_registry.dart`; `lib/features/localization/federation/registry/contact_language_standard.dart`; `lib/features/localization/federation/registry/report_localization_map.dart`; recommendation signal-magnet registries; `lib/l10n/section_localization_registry.dart` |
| Unused signal handlers | `lib/features/signals/domain/emitters/clean_signal_runtime.dart`; `lib/features/signals/domain/factories/signal_package_factory.dart` |
| Unused local storage/caches | none outside dead service/model candidates found |
| Unused models/DTOs/enums/constants/extensions | listed in Dead Runtime Files table |

## Direct Section-Runtime Dependencies And Ownership Violations

These are direct imports that cross feature boundaries or point from a feature into non-Platform-Core `core/` services. They are recorded as `OWNERSHIP_VIOLATION` for inventory purposes only.

| Source | Target | Type |
| --- | --- | --- |
| `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart:2` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart:3` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart:2` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart:3` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_links_page.dart:2` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_links_page.dart:3` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart:4` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart:5` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_room_page.dart:9` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_room_page.dart:10` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart:2` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart:3` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart:2` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart:3` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/client/presentation/pages/client_room_page.dart:8` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/client/presentation/pages/client_room_page.dart:9` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |
| `lib/features/commercial/application/commercial_auth_service.dart:5` | `lib/core/auth/account_access_service.dart` | feature-to-core-direct |
| `lib/features/commercial/application/commercial_auth_service.dart:6` | `lib/core/visibility/visibility_readiness.dart` | feature-to-core-direct |
| `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:6` | `lib/features/presentation_gallery/data/presentation_gallery_repository.dart` | features-cross-import |
| `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:7` | `lib/features/presentation_gallery/domain/models/presentation_card.dart` | features-cross-import |
| `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:8` | `lib/features/presentation_gallery/presentation/pages/presentation_viewer_page.dart` | features-cross-import |
| `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:9` | `lib/features/presentation_gallery/presentation/widgets/presentation_asset_image.dart` | features-cross-import |
| `lib/features/commercial_v2_web/signals/commercial_v2_archive_signal_event_writer.dart:2` | `lib/core/local_signals/local_section_signal_buffer.dart` | feature-to-core-direct |
| `lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:3` | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart` | features-cross-import |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_lite_client_page.dart:2` | `lib/features/client/presentation/pages/client_room_page.dart` | features-cross-import |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:5` | `lib/core/storage/locale_storage.dart` | feature-to-core-direct |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart:3` | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart` | features-cross-import |
| `lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:5` | `lib/core/storage/locale_storage.dart` | feature-to-core-direct |
| `lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart:3` | `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart` | features-cross-import |
| `lib/features/library/presentation/pages/library_provider_content_pages.dart:4` | `lib/features/commercial/domain/provider_profile_categories.dart` | features-cross-import |
| `lib/features/library/presentation/pages/library_provider_content_pages.dart:5` | `lib/features/commercial/domain/provider_public_profile.dart` | features-cross-import |
| `lib/features/library/presentation/widgets/center_public_white_card.dart:2` | `lib/features/commercial/domain/provider_public_profile.dart` | features-cross-import |
| `lib/features/library/presentation/widgets/specialist_public_white_card.dart:2` | `lib/features/commercial/domain/provider_public_profile.dart` | features-cross-import |
| `lib/features/library/signals/library_archive_signal_event_writer.dart:2` | `lib/core/local_signals/local_section_signal_buffer.dart` | feature-to-core-direct |
| `lib/features/residential/signals/residential_archive_signal_event_writer.dart:2` | `lib/core/local_signals/local_section_signal_buffer.dart` | feature-to-core-direct |
| `lib/features/signals/data/services/signal_storage_service.dart:2` | `lib/core/local_signals/local_section_signal_buffer.dart` | feature-to-core-direct |
| `lib/features/splash/presentation/pages/splash_page.dart:5` | `lib/core/storage/locale_storage.dart` | feature-to-core-direct |
| `lib/features/splash/presentation/pages/splash_page.dart:8` | `lib/features/residential/signals/residential_signal_codes.dart` | features-cross-import |
| `lib/features/splash/presentation/pages/splash_page.dart:9` | `lib/features/residential/signals/residential_signal_emitter.dart` | features-cross-import |

## Duplicate Runtime Components

| Symbol | Locations | Status |
| --- | --- | --- |
| `DaleelAssistant` | `lib/features/splash/presentation/pages/splash_page.dart:273`; `lib/shared/guides/daleel_assistant.dart:4` | DUPLICATE |
| `on` | `lib/features/commercial_v2_web/signals/commercial_v2_signal_emitter.dart:31`; `lib/features/library/signals/library_signal_emitter.dart:29`; `lib/features/residential/signals/residential_signal_emitter.dart:64` | DUPLICATE |

## Circular Dependencies

No circular imports were found in the parsed Dart import graph.

## Platform Core

`lib/core/platform_core/` contains 22 Dart files. They were read only and classified as `PLATFORM_FROZEN`.

Platform Core modified: 0

## Final Counts

| Output Field | Count / Value |
| --- | ---: |
| Runtime files inspected | 267 |
| Active runtime components | 89 |
| Dead runtime components | 48 files / 68 public symbols |
| Unused providers | 4 |
| Unused services | 1 |
| Unused repositories | 0 |
| Unused helpers | 2 |
| Unused adapters | 0 outside Platform Core |
| Unused bridges | 1 |
| Unused controllers | 0 |
| Unused registries | 9 |
| Unused routes | 6 NOT_VERIFIED routes with AppRouter-only references |
| Unused signal handlers | 2 |
| Direct section-runtime dependencies | 39 |
| Circular dependencies | 0 |
| Duplicate runtime components | 2 |
| Ownership violations | 39 |
| Platform Core modified | 0 |
| Original files modified | 0 |

MANUAL COMMANDS FOR USER

لا توجد أوامر.

PART 9A STATUS:
RUNTIME PURIFICATION INVENTORY COMPLETED
