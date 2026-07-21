# PROJECT INVENTORY PART 7C ASSET ISOLATION

## Scope

| Item | State |
| --- | --- |
| Audit type | Read-only isolation audit |
| Source base | Current asset state after PART 7B plus PROJECT_INVENTORY_PART_7_ASSETS.md |
| Asset scope | assets/, pubspec.yaml, lib/, test/, web/ |
| Frozen zone | lib/core/platform_core/ and test/core/platform_core/ untouched |
| Runtime edits | 0 |
| Asset edits | 0 |

## Screen Inventory

| Screen Class | Source Path | Section Owner | Capsule Owner | Assets Used | Evidence |
| --- | --- | --- | --- | --- | --- |
| SplashPage | lib/features/splash/presentation/pages/splash_page.dart | APP | APP | assets/branding/guides/welcome_screen_guide.png; assets/branding/language/en_gold.png; assets/images/mobile/splash/btn_mobile.webp.png | splash_page.dart:164; splash_page.dart:202; splash_page.dart:1101 |
| Generation2MobileLoginSelectionPage | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart | APP | APP | assets/images/mobile/login/background_mobile.webp; assets/images/mobile/login/background_tablet.webp; assets/images/mobile/splash/btn_friend.webp; assets/images/mobile/splash/btn_supporter.webp; assets/branding/guides/mobile_login_selection_guide.png | generation2_mobile_login_selection_page.dart:21; 23; 29; 35; 175 |
| Generation2MobileClientSelectionPage | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart | CLIENT | CLIENT | assets/branding/guides/client_account_selection_mobile_guide.png; assets/images/mobile/login/background_mobile.webp | generation2_mobile_selection_pages.dart:17; 116 |
| Generation2MobileSupportersSelectionPage | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart | APP | APP | assets/branding/guides/supporters_account_selection_mobile_guide.png; assets/images/mobile/login/background_mobile.webp | generation2_mobile_selection_pages.dart:68; 116 |
| Generation2MobileClientRoomPage | lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart | CLIENT | CLIENT | assets/branding/guides/specialist_friend_mobile_guide.png; assets/images/mobile/client_room/background_mobile.webp; assets/images/mobile/client_room/background_tablet.webp; assets/images/mobile/client_room/client_cards_strip.webp; assets/images/mobile/client_room/frame_client_image.webp; assets/branding/logo_primary.png | generation2_mobile_client_room_page.dart:31; 79; 81; 83; 85; 419 |
| Generation2MobileFriendClientRoomPage | lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart | CLIENT | CLIENT | assets/branding/guides/client_friend_mobile_guide.png | generation2_mobile_friend_client_room_page.dart:23 |
| Generation2MobileCenterRoomPage | lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/guides/center_friend_mobile_guide.png | generation2_mobile_center_room_page.dart:22 |
| Generation2MobileSpecialistRoomPage | lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/guides/specialist_friend_mobile_guide.png | generation2_mobile_specialist_room_page.dart:23 |
| CommercialAccessPage | lib/features/commercial/presentation/pages/commercial_access_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/logo_primary.png; assets/branding/guides/commercial_desktop_login.png | commercial_access_page.dart:46; 75 |
| SpecialistLoginPage | lib/features/commercial/presentation/pages/specialist_login_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/logo_primary.png; assets/branding/guides/specialist_desktop_login_guide.png | specialist_login_page.dart:65; 167 |
| CenterLoginPage | lib/features/commercial/presentation/pages/center_login_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/guides/center_desktop_login_guide.png | center_login_page.dart:64 |
| CommercialRoomPage | lib/features/commercial/presentation/pages/commercial_room_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/guides/specialist_room_mobile_guide.png | commercial_room_page.dart:86 |
| CenterRoomPage | lib/features/commercial/presentation/pages/center_room_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/guides/center_room_mobile_guide.png | center_room_page.dart:81 |
| CommercialPublicAccountsPage | lib/features/commercial/presentation/pages/commercial_public_accounts_page.dart | COMMERCIAL | COMMERCIAL | assets/branding/logo_transparent.png | commercial_public_accounts_page.dart:13 |
| CommercialV2WebShowcasePage | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart | COMMERCIAL | COMMERCIAL | assets/library/platform_guides/platform_guide_content_access.webp.png; assets/library/backgrounds/official_links_background.webp.png | commercial_v2_web_showcase_page.dart:303; 307; 309 |
| ClientRoomPage | lib/features/client/presentation/pages/client_room_page.dart | CLIENT | CLIENT | assets/branding/rooms/client_room/accessibility_room_exit_button.png; assets/branding/rooms/client_room/accessibility_room_youtube_button.png; assets/branding/guides/client_room_desktop_guide.png; accessibility_room card icons | client_room_page.dart:35; 37; 43; 45; 51; 341 |
| AccessibilityRoomPage | lib/features/accessibility/presentation/pages/accessibility_room_page.dart | ACCESSIBILITY | ACCESSIBILITY | assets/branding/rooms/accessibility_room/accessibility_room_exit_button.png; assets/branding/rooms/accessibility_room/accessibility_room_youtube_button.png; assets/branding/rooms/accessibility_room/accessibility_room_photo_upload_button.png; accessibility_room card icons; assets/branding/guides/client_room_desktop_guide.png | accessibility_room_page.dart:36; 38; 40; 44; 50; 52; 172 |
| AccessibilityCheckinPage | lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart | ACCESSIBILITY | ACCESSIBILITY | assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | accessibility_checkin_page.dart:22 |
| AccessibilityCommunityToolsPage | lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart | ACCESSIBILITY | ACCESSIBILITY | assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | accessibility_community_tools_page.dart:13 |
| AccessibilityLinksPage | lib/features/accessibility/presentation/pages/accessibility_links_page.dart | ACCESSIBILITY | ACCESSIBILITY | assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | accessibility_links_page.dart:14 |
| AccessibilityMessageOfDayPage | lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart | ACCESSIBILITY | ACCESSIBILITY | assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | accessibility_message_of_day_page.dart:15 |
| AccessibilitySuggestionsPage | lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart | ACCESSIBILITY | ACCESSIBILITY | assets/branding/rooms/accessibility_room/cards/accessibility_suggestions_papyrus_background.png | accessibility_suggestions_page.dart:21 |
| AccessibilityToolsPage | lib/features/accessibility/presentation/pages/accessibility_tools_page.dart | ACCESSIBILITY | ACCESSIBILITY | assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | accessibility_tools_page.dart:13 |
| LibraryPage | lib/features/library/presentation/pages/library_page.dart | LIBRARY | LIBRARY | assets/c6_library/categories/*.png; assets/branding/web/library/backgrounds/*.png | library_page.dart:127; 135; 144; 153; 162; 170; 346; 349; 351 |
| LibraryProviderContentPages | lib/features/library/presentation/pages/library_provider_content_pages.dart | LIBRARY | LIBRARY | assets/branding/web/library/backgrounds/*.png | library_provider_content_pages.dart:882; 885; 887 |
| KnowledgeArticleViewerPage | lib/features/library/knowledge_cards/presentation/pages/knowledge_article_viewer_page.dart | LIBRARY | LIBRARY | assets/content/library/know_your_right/{folder}/{source} | knowledge_article_viewer_page.dart:279 |
| AssetKnowledgeCardRepository | lib/features/library/knowledge_cards/data/knowledge_card_repository.dart | LIBRARY | LIBRARY | assets/content/library/know_your_right; assets/images/library/know_your_right/cards | knowledge_card_repository.dart:21; 22 |
| AssetPresentationGalleryRepository | lib/features/presentation_gallery/data/presentation_gallery_repository.dart | SHARED_PLATFORM | SHARED_PLATFORM | assets/presentations/*.webp.png fallback assets | presentation_gallery_repository.dart:11 |

## Multi-Screen Asset Paths

| Asset Path | Hash | Physical Owner | Consumer Screen | Consumer Owner | Isolation State | Evidence |
| --- | --- | --- | --- | --- | --- | --- |
| assets/branding/logo_primary.png | Recorded in PART 7A | SHARED_PLATFORM | CommercialAccessPage; SpecialistLoginPage; Generation2MobileClientRoomPage | COMMERCIAL; CLIENT | PLATFORM_SHARED_VERIFIED | Official brand logo used as platform identity |
| assets/branding/logo_transparent.png | Recorded in PART 7A | SHARED_PLATFORM | CommercialPublicAccountsPage; core branding constant | COMMERCIAL; APP | PLATFORM_SHARED_VERIFIED | Official transparent brand logo |
| assets/branding/guides/specialist_friend_mobile_guide.png | Recorded in PART 7A | COMMERCIAL | Generation2MobileClientRoomPage; Generation2MobileSpecialistRoomPage | CLIENT; COMMERCIAL | SHARED_PATH | Same guide path is consumed by client and specialist mobile rooms |
| assets/branding/guides/client_room_desktop_guide.png | Recorded in PART 7A | CLIENT | ClientRoomPage; AccessibilityRoomPage | CLIENT; ACCESSIBILITY | SHARED_PATH | Accessibility and client rooms consume one guide path |
| assets/branding/rooms/accessibility_room/cards/accessibility_checkin_card_icon.png | Recorded in PART 7A | ACCESSIBILITY | AccessibilityRoomPage; ClientRoomPage; shared wellbeing card | ACCESSIBILITY; CLIENT; SHARED_PLATFORM | SHARED_PATH | Client surface consumes accessibility namespace card icon |
| assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_card_icon.png | Recorded in PART 7A | ACCESSIBILITY | AccessibilityRoomPage; ClientRoomPage | ACCESSIBILITY; CLIENT | SHARED_PATH | Client surface consumes accessibility namespace card icon |
| assets/branding/rooms/accessibility_room/cards/accessibility_links_card_icon.png | Recorded in PART 7A | ACCESSIBILITY | AccessibilityRoomPage; ClientRoomPage | ACCESSIBILITY; CLIENT | SHARED_PATH | Client surface consumes accessibility namespace card icon |
| assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | Recorded in PART 7A | ACCESSIBILITY | AccessibilityCheckinPage; AccessibilityCommunityToolsPage; AccessibilityLinksPage; AccessibilityMessageOfDayPage; AccessibilityToolsPage | ACCESSIBILITY | SHARED_PATH | Multiple accessibility screens share one screen-themed background path |
| assets/images/mobile/login/background_mobile.webp | Recorded after PART 7B | APP | Generation2MobileLoginSelectionPage; Generation2MobileClientSelectionPage; Generation2MobileSupportersSelectionPage | APP; CLIENT | SHARED_PATH | One login background path used by multiple mobile entry screens |
| assets/branding/web/library/backgrounds/desktop/library_desktop_bg.png | Recorded in PART 7A | LIBRARY | LibraryPage; LibraryProviderContentPages | LIBRARY | SECTION_SHARED_VERIFIED | Library section background path shared inside library capsule |
| assets/branding/web/library/backgrounds/mobile/library_mobile_bg.png | Recorded in PART 7A | LIBRARY | LibraryPage; LibraryProviderContentPages | LIBRARY | SECTION_SHARED_VERIFIED | Library section background path shared inside library capsule |
| assets/branding/web/library/backgrounds/tablet/library_tablet_bg.png | Recorded in PART 7A | LIBRARY | LibraryPage; LibraryProviderContentPages | LIBRARY | SECTION_SHARED_VERIFIED | Library section background path shared inside library capsule |

## Cross-Capsule Dependency

| Asset | Physical Owner | Consumer Owner | Consumer Screen | Evidence |
| --- | --- | --- | --- | --- |
| assets/branding/guides/specialist_friend_mobile_guide.png | COMMERCIAL | CLIENT | Generation2MobileClientRoomPage | generation2_mobile_client_room_page.dart:31 |
| assets/branding/guides/client_room_desktop_guide.png | CLIENT | ACCESSIBILITY | AccessibilityRoomPage | accessibility_room_page.dart:172 |
| assets/branding/rooms/accessibility_room/cards/accessibility_checkin_card_icon.png | ACCESSIBILITY | CLIENT | ClientRoomPage | client_room_page.dart:43 |
| assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_card_icon.png | ACCESSIBILITY | CLIENT | ClientRoomPage | client_room_page.dart:45 |
| assets/branding/rooms/accessibility_room/cards/accessibility_links_card_icon.png | ACCESSIBILITY | CLIENT | ClientRoomPage | client_room_page.dart:51 |
| assets/library/backgrounds/official_links_background.webp.png | LIBRARY | COMMERCIAL | CommercialV2WebShowcasePage | commercial_v2_web_showcase_page.dart:307; 309 |

## Same-Hash Copies

| Hash Group | Copies | Owners | Consumers | Isolation Purpose | State |
| --- | --- | --- | --- | --- | --- |
| DUP-009 | assets/branding/navigation/back/back_left_gold.png; assets/branding/shared/navigation/back/back_left_gold.png | SHARED_PLATFORM; SHARED_PLATFORM | language page; shell actions | Platform navigation direction assets | VALID_ISOLATED_COPIES |
| DUP-010 | assets/branding/navigation/back/back_right_gold.png; assets/branding/shared/navigation/back/back_right_gold.png | SHARED_PLATFORM; SHARED_PLATFORM | language page; shell actions | Platform navigation direction assets | VALID_ISOLATED_COPIES |
| DUP-012 | assets/branding/rooms/accessibility_room/accessibility_room_exit_button.png; assets/branding/rooms/client_room/accessibility_room_exit_button.png | ACCESSIBILITY; CLIENT | AccessibilityRoomPage; ClientRoomPage; CommercialRoomUtilityTools | Separate room namespaces with same visual content | VALID_ISOLATED_COPIES |
| DUP-014 | assets/branding/rooms/accessibility_room/accessibility_room_youtube_button.png; assets/branding/rooms/client_room/accessibility_room_youtube_button.png | ACCESSIBILITY; CLIENT | AccessibilityRoomPage; ClientRoomPage | Separate room namespaces with same visual content | VALID_ISOLATED_COPIES |
| DUP-015 | accessibility papyrus background copies under cards | ACCESSIBILITY | Multiple accessibility pages; some copies have no direct consumer | Screen background copies partly unresolved | UNUSED_COPY |
| DUP-023 | assets/c6_library/brand/logo_mark.png; assets/c7_branding/logo/logo_mark.png | LIBRARY; APP | c7 logo mark currently consumed; c6 brand copy no direct consumer observed | Brand copy across capsule generations | UNUSED_COPY |
| DUP-025 to DUP-030 | assets/c6_library/categories/*.png and former assets/images/cat_*.png copies | LIBRARY; UNKNOWN | c6_library category copies consumed | Unused legacy image copies no longer present after PART 7B | VALID_ISOLATED_COPIES |
| DUP-031 to DUP-034 | markdown and txt article content pairs | LIBRARY | Knowledge article dynamic loader | Alternate content file extensions under one article capsule | VALID_ISOLATED_COPIES |
| DUP-035 | assets/images/library/know_right_why_me_addicted.webp.png; assets/images/library/know_your_right/cards/why_me_addicted_card.webp | LIBRARY | Knowledge card image path uses know_your_right/cards root | One old image copy and one active card copy | UNUSED_COPY |
| DUP-043 | assets/images/mobile/splash/btn_language.webp; assets/images/mobile/splash/btn_language.webp.png | APP | Login selection page; splash page | Separate primary and png-suffixed runtime variants | VALID_ISOLATED_COPIES |
| DUP-044 | assets/images/mobile/splash/btn_supporter.webp; assets/images/mobile/splash/btn_supporter.webp.png | APP | Login selection action uses btn_supporter.webp | png-suffixed copy no direct consumer observed | UNUSED_COPY |

## Shared Asset Paths

| Shared Asset Path | Screen Consumers | Capsule Consumers | Valid Platform Exception | State |
| --- | --- | --- | --- | --- |
| assets/branding/logo_primary.png | CommercialAccessPage; SpecialistLoginPage; Generation2MobileClientRoomPage | COMMERCIAL; CLIENT | YES | PLATFORM_SHARED_VERIFIED |
| assets/branding/logo_transparent.png | CommercialPublicAccountsPage; core branding | COMMERCIAL; APP | YES | PLATFORM_SHARED_VERIFIED |
| assets/branding/guides/specialist_friend_mobile_guide.png | Generation2MobileClientRoomPage; Generation2MobileSpecialistRoomPage | CLIENT; COMMERCIAL | NO | SHARED_PATH |
| assets/branding/guides/client_room_desktop_guide.png | ClientRoomPage; AccessibilityRoomPage | CLIENT; ACCESSIBILITY | NO | SHARED_PATH |
| assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | AccessibilityCheckinPage; AccessibilityCommunityToolsPage; AccessibilityLinksPage; AccessibilityMessageOfDayPage; AccessibilityToolsPage | ACCESSIBILITY | NO | SHARED_PATH |
| assets/images/mobile/login/background_mobile.webp | LoginSelection; ClientSelection; SupportersSelection | APP; CLIENT | NO | SHARED_PATH |
| assets/branding/web/library/backgrounds/desktop/library_desktop_bg.png | LibraryPage; LibraryProviderContentPages | LIBRARY | NO | ISOLATED |
| assets/branding/web/library/backgrounds/mobile/library_mobile_bg.png | LibraryPage; LibraryProviderContentPages | LIBRARY | NO | ISOLATED |
| assets/branding/web/library/backgrounds/tablet/library_tablet_bg.png | LibraryPage; LibraryProviderContentPages | LIBRARY | NO | ISOLATED |

## Path Ownership Quality

| Asset Path | Physical Owner | Observed Consumer Owner | Quality State | Evidence |
| --- | --- | --- | --- | --- |
| assets/branding/guides/client_room_desktop_guide.png | CLIENT | CLIENT; ACCESSIBILITY | Cross-capsule path sharing | client_room_page.dart:341; accessibility_room_page.dart:172 |
| assets/branding/guides/specialist_friend_mobile_guide.png | COMMERCIAL | CLIENT; COMMERCIAL | Cross-capsule path sharing | generation2_mobile_client_room_page.dart:31; generation2_mobile_specialist_room_page.dart:23 |
| assets/branding/rooms/accessibility_room/cards/accessibility_*_card_icon.png | ACCESSIBILITY | ACCESSIBILITY; CLIENT | Cross-capsule path sharing | accessibility_room_page.dart; client_room_page.dart |
| assets/library/backgrounds/official_links_background.webp.png | LIBRARY | COMMERCIAL; LIBRARY | Cross-capsule path sharing | commercial_v2_web_showcase_page.dart:307; official_platform_links_page.dart:7 |
| assets/images/mobile/login/background_mobile.webp | APP | APP; CLIENT | Shared entry surface path | mobile login and selection pages |
| assets/branding/web/library/backgrounds/*.png | LIBRARY | LIBRARY | Section shared verified | library_page.dart; library_provider_content_pages.dart |

## Registered No Consumer Observed Review

| Asset Path | Owner | Current Classification | Evidence | State |
| --- | --- | --- | --- | --- |
| assets/branding/guides/centers_library_desktop_guide.png | COMMERCIAL | Prepared guide copy | Registered under guides; no direct consumer observed | NOT VERIFIED |
| assets/branding/guides/library_desktop_guide.png | LIBRARY | Prepared guide copy | Registered under guides; no direct consumer observed | NOT VERIFIED |
| assets/branding/guides/specialists_library_desktop_guide.png | COMMERCIAL | Prepared guide copy | Registered under guides; no direct consumer observed | NOT VERIFIED |
| assets/branding/guides/welcome_screen_mobile_guide.png | APP | Prepared guide copy | Registered under guides; no direct consumer observed | NOT VERIFIED |
| assets/branding/logo_light.png | SHARED_PLATFORM | Branding copy | AppAssets constant observed previously | PLATFORM_SHARED_VERIFIED |
| assets/branding/logo_marketing_glow.png | SHARED_PLATFORM | Branding copy | AppAssets constant observed previously | PLATFORM_SHARED_VERIFIED |
| assets/branding/logo_primary_dark.png | SHARED_PLATFORM | Branding copy | AppAssets and library use observed previously | PLATFORM_SHARED_VERIFIED |
| assets/images/mobile/splash/btn_language.webp | APP | Alternate runtime copy | Login selection page direct consumer | ISOLATED |
| assets/images/mobile/splash/btn_language.webp.png | APP | Alternate runtime copy | Splash page direct consumer | ISOLATED |
| assets/images/mobile/splash/btn_supporter.webp | APP | Runtime action copy | Login selection page direct consumer | ISOLATED |
| assets/images/mobile/splash/btn_supporter.webp.png | APP | Alternate copy | No direct consumer observed after current review | NOT VERIFIED |
| assets/images/library/know_right_why_me_addicted.webp.png | LIBRARY | Legacy image copy | Same-hash group with active know_your_right card image | NOT VERIFIED |
| assets/c6_library/brand/logo_mark.png | LIBRARY | Brand copy | Same-hash group with c7 logo mark | NOT VERIFIED |
| assets/branding/rooms/accessibility_room/cards/accessibility_checkin_papyrus_background.png | ACCESSIBILITY | Screen background copy | Same-hash group; no direct consumer observed | NOT VERIFIED |
| assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_papyrus_background.png | ACCESSIBILITY | Screen background copy | Same-hash group; no direct consumer observed | NOT VERIFIED |

## Blocked Missing Reference

| Blocked Item | Expected Path | Existing Copies | Correct Owner | Current State |
| --- | --- | --- | --- | --- |
| Supporters mobile account selection guide | assets/branding/guides/supporters_account_selection_mobile_guide.png | No same-name copy observed; related guide copies exist for client/mobile/specialist/center/welcome only | APP | BLOCKED: consumer is active and no matching asset copy was observed |

## Final Verification

| Metric | Count |
| --- | ---: |
| Active screen assets | 121 |
| Screens using assets | 27 |
| Single-screen asset paths | 109 |
| Multi-screen shared paths | 12 |
| Cross-capsule asset dependencies | 6 |
| Cross-screen ownership dependencies | 6 |
| Valid isolated same-hash copies | 7 |
| One-copy shared by multiple screens | 6 |
| Unused isolated copies | 5 |
| Platform-shared verified assets | 3 |
| Section-shared verified assets | 3 |
| Unverified shared assets | 6 |
| Registered-no-consumer copies | 32 |
| Blocked missing references | 1 |

