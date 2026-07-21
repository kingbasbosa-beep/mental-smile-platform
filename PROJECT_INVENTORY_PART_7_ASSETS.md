# PROJECT INVENTORY PART 7 ASSETS

## 1. Scope and exclusions

| Item | Observed State |
| --- | --- |
| Asset root | assets/ |
| Runtime scan roots | lib/, test/, tool/, web/, android/, ios/, windows/, linux/, macos/ |
| Excluded scan areas | build/, .dart_tool/, .git/, node_modules/, functions/node_modules/ |
| Frozen area | lib/core/platform_core/ and test/core/platform_core/ classified as reference only |
| Runtime file changes | 0 |
| Report artifact | PROJECT_INVENTORY_PART_7_ASSETS.md |

## 2. Asset summary

| Metric | Count |
| --- | ---: |
| Total asset files | 248 |
| Active assets | 49 |
| Registered no consumer observed | 43 |
| Consumer not registered | 20 |
| Not referenced | 78 |
| Duplicate content files | 93 |
| Missing asset references | 6 |
| Fully inactive directories | 56 |
| Unknown ownership assets | 48 |

## 3. Complete asset inventory

| AssetPath | Owner | Registered | Consumer | DynamicPattern | Manifest | DuplicateGroup | Status | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| assets/animations/.gitkeep | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-001 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/backgrounds/commercial_background_dark.webp | COMMERCIAL | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:64 assets/backgrounds/commercial_background_dark.webp; NO CONSUMER OBSERVED |
| assets/backgrounds/residential_exit_social_portal.webp.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:65 assets/backgrounds/residential_exit_social_portal.webp.png; NO CONSUMER OBSERVED |
| assets/branding/guides/center_desktop_login_guide.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/center_friend_mobile_guide.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/center_room_mobile_guide.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/centers_library_desktop_guide.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/client_account_selection_mobile_guide.png | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/client_friend_mobile_guide.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/client_room_desktop_guide.png | SHARED | YES | lib/features/accessibility/presentation/pages/accessibility_room_page.dart:172 asset literal; lib/features/client/presentation/pages/client_room_page.dart:341 asset literal | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:57 assets/branding/guides/; lib/features/accessibility/presentation/pages/accessibility_room_page.dart:172 asset literal; lib/features/client/presentation/pages/client_room_page.dart:341 asset literal |
| assets/branding/guides/commercial_desktop_login.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/library_desktop_guide.png | LIBRARY | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/mobile_login_selection_guide.png | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/specialist_desktop_login_guide.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/specialist_friend_mobile_guide.png | SHARED | YES | lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart:31 asset literal; lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart:23 asset literal | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:57 assets/branding/guides/; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart:31 asset literal; lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart:23 asset literal |
| assets/branding/guides/specialist_room_mobile_guide.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/specialists_library_desktop_guide.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/welcome_screen_guide.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/guides/welcome_screen_mobile_guide.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:57 assets/branding/guides/; NO CONSUMER OBSERVED |
| assets/branding/language/en_gold.png | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:56 assets/branding/language/; NO CONSUMER OBSERVED |
| assets/branding/library/backgrounds/desktop/library_desktop_bg.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-002 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/library/backgrounds/mobile/library_mobile_bg.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-003 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/library/backgrounds/tablet/library_tablet_bg.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-004 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/library/bedaya_amena/bedaya_amena_card.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-005 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/library/hodn_amen/hodn_amen_card.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-006 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/login/login_mobile_v1.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/login/login_tablet_v1.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/login/login_web_v1.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/logo_icon.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED | DUP-007 | DUPLICATE_CONTENT | pubspec.yaml:42 assets/branding/logo_icon.png; NO CONSUMER OBSERVED |
| assets/branding/logo_icon_light.png | APP_SHARED | YES | lib/core/branding/app_assets.dart:10 asset literal; lib/features/language/presentation/pages/language_page.dart:120 asset literal | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED | DUP-008 | DUPLICATE_CONTENT | pubspec.yaml:43 assets/branding/logo_icon_light.png; lib/core/branding/app_assets.dart:10 asset literal; lib/features/language/presentation/pages/language_page.dart:120 asset literal |
| assets/branding/logo_light.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:44 assets/branding/logo_light.png; NO CONSUMER OBSERVED |
| assets/branding/logo_marketing_glow.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:45 assets/branding/logo_marketing_glow.png; NO CONSUMER OBSERVED |
| assets/branding/logo_primary.png | SHARED | YES | lib/core/branding/app_assets.dart:4 asset literal; lib/features/commercial/presentation/pages/commercial_access_page.dart:46 asset literal; lib/features/commercial/presentation/pages/specialist_login_page.dart:167 asset literal; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart:419 asset literal | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:46 assets/branding/logo_primary.png; lib/core/branding/app_assets.dart:4 asset literal; lib/features/commercial/presentation/pages/commercial_access_page.dart:46 asset literal; lib/features/commercial/presentation/pages/specialist_login_page.dart:167 asset literal; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart:419 asset literal |
| assets/branding/logo_primary_dark.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED | DUP-007 | DUPLICATE_CONTENT | pubspec.yaml:47 assets/branding/logo_primary_dark.png; NO CONSUMER OBSERVED |
| assets/branding/logo_transparent.png | SHARED | YES | lib/core/branding/app_assets.dart:7 asset literal; lib/features/commercial/presentation/pages/commercial_public_accounts_page.dart:13 asset literal | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | NO MANIFEST OBSERVED | DUP-008 | DUPLICATE_CONTENT | pubspec.yaml:48 assets/branding/logo_transparent.png; lib/core/branding/app_assets.dart:7 asset literal; lib/features/commercial/presentation/pages/commercial_public_accounts_page.dart:13 asset literal |
| assets/branding/menu/desktop/menu_desktop_bg.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/menu/mobile/menu_mobile_bg.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/menu/tablet/menu_tablet_bg.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/navigation/back/back_left_gold.png | SHARED | YES | lib/features/language/presentation/pages/language_page.dart:34 asset literal; lib/shared/ui_kit/app_shell_actions.dart:263 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-009 | DUPLICATE_CONTENT | pubspec.yaml:55 assets/branding/navigation/back/; lib/features/language/presentation/pages/language_page.dart:34 asset literal; lib/shared/ui_kit/app_shell_actions.dart:263 asset literal |
| assets/branding/navigation/back/back_right_gold.png | SHARED | YES | lib/features/language/presentation/pages/language_page.dart:33 asset literal; lib/shared/ui_kit/app_shell_actions.dart:262 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-010 | DUPLICATE_CONTENT | pubspec.yaml:55 assets/branding/navigation/back/; lib/features/language/presentation/pages/language_page.dart:33 asset literal; lib/shared/ui_kit/app_shell_actions.dart:262 asset literal |
| assets/branding/navigation/logout/logout_gold.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-011 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/accessibility_room_exit_button.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-012 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/accessibility_room_photo_upload_button.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-013 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/accessibility_room_youtube_button.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-014 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/cards/accessibility_checkin_card_icon.png | SHARED | YES | lib/features/accessibility/presentation/pages/accessibility_room_page.dart:52 asset literal; lib/features/client/presentation/pages/client_room_page.dart:43 asset literal; lib/shared/wellbeing/shared_wellbeing_room_card.dart:13 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; lib/features/accessibility/presentation/pages/accessibility_room_page.dart:52 asset literal; lib/features/client/presentation/pages/client_room_page.dart:43 asset literal; lib/shared/wellbeing/shared_wellbeing_room_card.dart:13 asset literal |
| assets/branding/rooms/accessibility_room/cards/accessibility_checkin_papyrus_background.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-015 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_card_icon.png | SHARED | YES | lib/features/accessibility/presentation/pages/accessibility_room_page.dart:50 asset literal; lib/features/client/presentation/pages/client_room_page.dart:45 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; lib/features/accessibility/presentation/pages/accessibility_room_page.dart:50 asset literal; lib/features/client/presentation/pages/client_room_page.dart:45 asset literal |
| assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_papyrus_background.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-015 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/cards/accessibility_links_card_icon.png | SHARED | YES | lib/features/accessibility/presentation/pages/accessibility_room_page.dart:44 asset literal; lib/features/client/presentation/pages/client_room_page.dart:51 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; lib/features/accessibility/presentation/pages/accessibility_room_page.dart:44 asset literal; lib/features/client/presentation/pages/client_room_page.dart:51 asset literal |
| assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | ACCESSIBILITY | YES | lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart:22 asset literal; lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart:13 asset literal; lib/features/accessibility/presentation/pages/accessibility_links_page.dart:14 asset literal; lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart:15 asset literal; lib/features/accessibility/presentation/pages/accessibility_tools_page.dart:13 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-015 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart:22 asset literal; lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart:13 asset literal; lib/features/accessibility/presentation/pages/accessibility_links_page.dart:14 asset literal; lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart:15 asset literal; lib/features/accessibility/presentation/pages/accessibility_tools_page.dart:13 asset literal |
| assets/branding/rooms/accessibility_room/cards/accessibility_note_feather_button.png | SHARED | YES | lib/features/accessibility/presentation/pages/accessibility_room_page.dart:42 asset literal; lib/features/client/presentation/pages/client_room_page.dart:41 asset literal; lib/features/commercial/presentation/widgets/commercial_room_utility_tools.dart:33 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; lib/features/accessibility/presentation/pages/accessibility_room_page.dart:42 asset literal; lib/features/client/presentation/pages/client_room_page.dart:41 asset literal; lib/features/commercial/presentation/widgets/commercial_room_utility_tools.dart:33 asset literal |
| assets/branding/rooms/accessibility_room/cards/accessibility_suggestions_card_icon.png | SHARED | YES | lib/features/accessibility/presentation/pages/accessibility_room_page.dart:48 asset literal; lib/features/client/presentation/pages/client_room_page.dart:47 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; lib/features/accessibility/presentation/pages/accessibility_room_page.dart:48 asset literal; lib/features/client/presentation/pages/client_room_page.dart:47 asset literal |
| assets/branding/rooms/accessibility_room/cards/accessibility_suggestions_papyrus_background.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-015 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/cards/accessibility_tools_card_icon.png | SHARED | YES | lib/features/accessibility/presentation/pages/accessibility_room_page.dart:46 asset literal; lib/features/client/presentation/pages/client_room_page.dart:49 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; lib/features/accessibility/presentation/pages/accessibility_room_page.dart:46 asset literal; lib/features/client/presentation/pages/client_room_page.dart:49 asset literal |
| assets/branding/rooms/accessibility_room/cards/accessibility_tools_papyrus_background.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-015 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; pubspec.yaml:61 assets/branding/rooms/accessibility_room/cards/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/client_room_background_desktop.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-016 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/client_room_background_mobile.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-017 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/accessibility_room/client_room_background_tablet.png | ACCESSIBILITY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-018 | DUPLICATE_CONTENT | pubspec.yaml:60 assets/branding/rooms/accessibility_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/client_room/accessibility_room_exit_button.png | SHARED | YES | lib/features/client/presentation/pages/client_room_page.dart:35 asset literal; lib/features/commercial/presentation/widgets/commercial_room_utility_tools.dart:31 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-012 | DUPLICATE_CONTENT | pubspec.yaml:59 assets/branding/rooms/client_room/; lib/features/client/presentation/pages/client_room_page.dart:35 asset literal; lib/features/commercial/presentation/widgets/commercial_room_utility_tools.dart:31 asset literal |
| assets/branding/rooms/client_room/accessibility_room_photo_upload_button.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-013 | DUPLICATE_CONTENT | pubspec.yaml:59 assets/branding/rooms/client_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/client_room/accessibility_room_youtube_button.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-014 | DUPLICATE_CONTENT | pubspec.yaml:59 assets/branding/rooms/client_room/; NO CONSUMER OBSERVED |
| assets/branding/rooms/client_room/client_room_background_desktop.png | SHARED | YES | lib/features/client/presentation/pages/client_room_page.dart:29 asset literal; lib/features/commercial/presentation/pages/center_room_page.dart:14 asset literal; lib/features/commercial/presentation/pages/commercial_room_page.dart:15 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-016 | DUPLICATE_CONTENT | pubspec.yaml:59 assets/branding/rooms/client_room/; lib/features/client/presentation/pages/client_room_page.dart:29 asset literal; lib/features/commercial/presentation/pages/center_room_page.dart:14 asset literal; lib/features/commercial/presentation/pages/commercial_room_page.dart:15 asset literal |
| assets/branding/rooms/client_room/client_room_background_mobile.png | SHARED | YES | lib/features/client/presentation/pages/client_room_page.dart:33 asset literal; lib/features/commercial/presentation/pages/center_room_page.dart:18 asset literal; lib/features/commercial/presentation/pages/commercial_room_page.dart:19 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-017 | DUPLICATE_CONTENT | pubspec.yaml:59 assets/branding/rooms/client_room/; lib/features/client/presentation/pages/client_room_page.dart:33 asset literal; lib/features/commercial/presentation/pages/center_room_page.dart:18 asset literal; lib/features/commercial/presentation/pages/commercial_room_page.dart:19 asset literal |
| assets/branding/rooms/client_room/client_room_background_tablet.png | SHARED | YES | lib/features/client/presentation/pages/client_room_page.dart:31 asset literal; lib/features/commercial/presentation/pages/center_room_page.dart:16 asset literal; lib/features/commercial/presentation/pages/commercial_room_page.dart:17 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-018 | DUPLICATE_CONTENT | pubspec.yaml:59 assets/branding/rooms/client_room/; lib/features/client/presentation/pages/client_room_page.dart:31 asset literal; lib/features/commercial/presentation/pages/center_room_page.dart:16 asset literal; lib/features/commercial/presentation/pages/commercial_room_page.dart:17 asset literal |
| assets/branding/shared/logo/logo_primary_dark.png | LIBRARY | YES | lib/features/library/knowledge_cards/presentation/widgets/knowledge_cards_rolling_carousel.dart:379 asset literal; lib/features/library/presentation/pages/library_page.dart:1487 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-007 | DUPLICATE_CONTENT | pubspec.yaml:53 assets/branding/shared/logo/; lib/features/library/knowledge_cards/presentation/widgets/knowledge_cards_rolling_carousel.dart:379 asset literal; lib/features/library/presentation/pages/library_page.dart:1487 asset literal |
| assets/branding/shared/navigation/back/back_left_gold.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-009 | DUPLICATE_CONTENT | pubspec.yaml:54 assets/branding/shared/navigation/back/; NO CONSUMER OBSERVED |
| assets/branding/shared/navigation/back/back_right_gold.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-010 | DUPLICATE_CONTENT | pubspec.yaml:54 assets/branding/shared/navigation/back/; NO CONSUMER OBSERVED |
| assets/branding/shared/navigation/logout/logout_gold.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-011 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/splash/splash_mobile_v1.jpg | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:58 assets/branding/splash/; NO CONSUMER OBSERVED |
| assets/branding/splash/splash_tablet_v1.jpg | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:58 assets/branding/splash/; NO CONSUMER OBSERVED |
| assets/branding/splash/splash_web_v1.jpg | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:58 assets/branding/splash/; NO CONSUMER OBSERVED |
| assets/branding/web/library/backgrounds/desktop/library_desktop_bg.png | LIBRARY | YES | lib/features/library/presentation/pages/library_page.dart:351 asset literal; lib/features/library/presentation/pages/library_provider_content_pages.dart:887 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-002 | DUPLICATE_CONTENT | pubspec.yaml:49 assets/branding/web/; pubspec.yaml:50 assets/branding/web/library/backgrounds/desktop/; lib/features/library/presentation/pages/library_page.dart:351 asset literal; lib/features/library/presentation/pages/library_provider_content_pages.dart:887 asset literal |
| assets/branding/web/library/backgrounds/mobile/library_mobile_bg.png | LIBRARY | YES | lib/features/library/presentation/pages/library_page.dart:346 asset literal; lib/features/library/presentation/pages/library_provider_content_pages.dart:882 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-003 | DUPLICATE_CONTENT | pubspec.yaml:49 assets/branding/web/; pubspec.yaml:52 assets/branding/web/library/backgrounds/mobile/; lib/features/library/presentation/pages/library_page.dart:346 asset literal; lib/features/library/presentation/pages/library_provider_content_pages.dart:882 asset literal |
| assets/branding/web/library/backgrounds/tablet/library_tablet_bg.png | LIBRARY | YES | lib/features/library/presentation/pages/library_page.dart:349 asset literal; lib/features/library/presentation/pages/library_provider_content_pages.dart:885 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-004 | DUPLICATE_CONTENT | pubspec.yaml:49 assets/branding/web/; pubspec.yaml:51 assets/branding/web/library/backgrounds/tablet/; lib/features/library/presentation/pages/library_page.dart:349 asset literal; lib/features/library/presentation/pages/library_provider_content_pages.dart:885 asset literal |
| assets/branding/web/library/bedaya_amena/bedaya_amena_card.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-005 | DUPLICATE_CONTENT | pubspec.yaml:49 assets/branding/web/; NO CONSUMER OBSERVED |
| assets/branding/web/library/hodn_amen/hodn_amen_card.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-006 | DUPLICATE_CONTENT | pubspec.yaml:49 assets/branding/web/; NO CONSUMER OBSERVED |
| assets/branding/web/website_hero_top_v2.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:49 assets/branding/web/; NO CONSUMER OBSERVED |
| assets/branding/web/website_hero_v2.png | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:49 assets/branding/web/; NO CONSUMER OBSERVED |
| assets/branding/web/website_hero_v2_clean.png | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:49 assets/branding/web/; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/desktop/centers_step_1_account.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/desktop/centers_step_2_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/desktop/centers_step_3_media.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/desktop/centers_step_4_pricing.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/desktop/centers_step_5_documents.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/desktop/centers_success.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-019 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/mobile/centers_step_1_account.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/mobile/centers_step_2_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/mobile/centers_step_3_media.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/mobile/centers_step_4_pricing.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/mobile/centers_step_5_documents.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/mobile/centers_success.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-020 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/tablet/centers_step_1_account.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/tablet/centers_step_2_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/tablet/centers_step_3_media.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/tablet/centers_step_4_pricing.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/tablet/centers_step_5_documents.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/centers/tablet/centers_success.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-021 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinician/clinician_step_1_account.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinician/clinician_step_2_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinician/clinician_step_4_documents.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinician/clinician_success.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/desktop/clinicians_step_1_account.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/desktop/clinicians_step_2_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/desktop/clinicians_step_4_documents.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/desktop/clinicians_success.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-019 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/mobile/clinicians_step_1_account.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/mobile/clinicians_step_2_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/mobile/clinicians_step_4_documents.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/mobile/clinicians_success.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-020 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/tablet/clinicians_step_1_account.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/tablet/clinicians_step_2_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/tablet/clinicians_step_4_documents.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/branding/web_registration/clinicians/tablet/clinicians_success.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-021 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ASSETS_C5_MANIFEST.json | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/avatars/avatar_client.png | RESIDENTIAL_CLIENT | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:22 | DUP-022 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/avatars/avatar_clinician_f.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:20 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/avatars/avatar_clinician_m.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:21 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/docs/PROMPTS_C5.md | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/icons/icon_approved.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:25 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/icons/icon_booking.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:27 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/icons/icon_inbox.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:28 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/icons/icon_my_requests.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:29 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/icons/icon_pending.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:24 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/icons/icon_rejected.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:26 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/README.md | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/sheet/c5_sheet.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:18 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/badges/badge_new.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:35 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/badges/badge_verified.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:34 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/buttons/button_primary.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:31 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/buttons/button_secondary.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:32 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/gradients/gradient_ribbon_1.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:42 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/gradients/gradient_ribbon_2.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:43 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/ornaments/ornament_divider_1.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:45 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/status_dots/dot_approved.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:38 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/status_dots/dot_online.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:40 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/status_dots/dot_pending.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:37 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c5/ui/status_dots/dot_rejected.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | assets/c5/ASSETS_C5_MANIFEST.json:39 |  | CONSUMER_NOT_REGISTERED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/brand/logo_mark.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-023 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/brand/logo_wordmark.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-024 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/categories/cat_articles.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-025 | DUPLICATE_CONTENT | pubspec.yaml:66 assets/c6_library/categories/; NO CONSUMER OBSERVED |
| assets/c6_library/categories/cat_audio.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-026 | DUPLICATE_CONTENT | pubspec.yaml:66 assets/c6_library/categories/; NO CONSUMER OBSERVED |
| assets/c6_library/categories/cat_exercises.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-027 | DUPLICATE_CONTENT | pubspec.yaml:66 assets/c6_library/categories/; NO CONSUMER OBSERVED |
| assets/c6_library/categories/cat_saved.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-028 | DUPLICATE_CONTENT | pubspec.yaml:66 assets/c6_library/categories/; NO CONSUMER OBSERVED |
| assets/c6_library/categories/cat_tools.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-029 | DUPLICATE_CONTENT | pubspec.yaml:66 assets/c6_library/categories/; NO CONSUMER OBSERVED |
| assets/c6_library/categories/cat_videos.png | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-030 | DUPLICATE_CONTENT | pubspec.yaml:66 assets/c6_library/categories/; NO CONSUMER OBSERVED |
| assets/c6_library/docs/PROMPTS_C6_LIBRARY.md | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/hero/library_hero.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/states/empty_library.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/states/locked_clinicians.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/ui/badges/badge_new.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/ui/badges/badge_pro.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/ui/buttons/btn_primary.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/ui/buttons/btn_secondary.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c6_library/ui/ornaments/ornament_divider_1.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c7_branding/buttons/primary_button.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c7_branding/buttons/secondary_button.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c7_branding/home/hero_art.png | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:67 assets/c7_branding/home/; NO CONSUMER OBSERVED |
| assets/c7_branding/home/home_bg.png | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:67 assets/c7_branding/home/; NO CONSUMER OBSERVED |
| assets/c7_branding/logo/logo_mark.png | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-023 | DUPLICATE_CONTENT | pubspec.yaml:68 assets/c7_branding/logo/; NO CONSUMER OBSERVED |
| assets/c7_branding/logo/logo_wordmark.png | APP_SHARED | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-024 | DUPLICATE_CONTENT | pubspec.yaml:68 assets/c7_branding/logo/; NO CONSUMER OBSERVED |
| assets/c7_branding/splash/splash_bg.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c7_branding/splash/splash_logo_ar.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/c7_branding/splash/splash_logo_en.png | APP_SHARED | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/coming_soon_01/metadata.json | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:78 assets/content/library/know_your_right/coming_soon_01/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/coming_soon_02/metadata.json | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:79 assets/content/library/know_your_right/coming_soon_02/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/coming_soon_03/metadata.json | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:80 assets/content/library/know_your_right/coming_soon_03/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/01_answer.md | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-031 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/01_answer.txt | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-031 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/02_arabic_sources.md | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-032 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/02_arabic_sources.txt | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-032 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/03_english_sources.md | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-033 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/03_english_sources.txt | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-033 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/04_global_references.md | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-034 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/04_global_references.txt | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-034 | DUPLICATE_CONTENT | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/metadata.json | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:76 assets/content/library/know_your_right/; pubspec.yaml:77 assets/content/library/know_your_right/why_me_addicted/; NO CONSUMER OBSERVED |
| assets/icons/.gitkeep | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 | NO MANIFEST OBSERVED | DUP-001 | DUPLICATE_CONTENT | pubspec.yaml:62 assets/icons/; NO CONSUMER OBSERVED |
| assets/icons/accessibility/ms_accessibility_guide.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:62 assets/icons/; pubspec.yaml:63 assets/icons/accessibility/ms_accessibility_guide.webp.png; NO CONSUMER OBSERVED |
| assets/icons/centers.png | COMMERCIAL | YES | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 asset literal; lib/features/commercial/presentation/widgets/commercial_room_tv_apps.dart:29 asset literal | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:62 assets/icons/; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 asset literal; lib/features/commercial/presentation/widgets/commercial_room_tv_apps.dart:29 asset literal |
| assets/icons/library.png | COMMERCIAL | YES | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291 asset literal; lib/features/commercial/presentation/widgets/commercial_room_tv_apps.dart:19 asset literal | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:62 assets/icons/; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291 asset literal; lib/features/commercial/presentation/widgets/commercial_room_tv_apps.dart:19 asset literal |
| assets/icons/specialists.png | COMMERCIAL | YES | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296 asset literal; lib/features/commercial/presentation/widgets/commercial_room_tv_apps.dart:24 asset literal | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:62 assets/icons/; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296 asset literal; lib/features/commercial/presentation/widgets/commercial_room_tv_apps.dart:24 asset literal |
| assets/images/.gitkeep | UNKNOWN | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-001 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/addiction/addiction_contact_support.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/addiction/addiction_explore_centers.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/addiction/addiction_find_specialist.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/addiction/addiction_library.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/avatar_client.png | RESIDENTIAL_CLIENT | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-022 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/avatar_client_fmale.png | RESIDENTIAL_CLIENT | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/avatar_client_male.png | RESIDENTIAL_CLIENT | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/avatar_clinician_fmale.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/avatar_clinician_male.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/backgrounds/specialists_bg_desktop.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/backgrounds/specialists_bg_mobile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/backgrounds/specialists_bg_tablet.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/cat_articles.png | LIBRARY | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-025 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/cat_audio.png | UNKNOWN | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-026 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/cat_exercises.png | UNKNOWN | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-027 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/cat_saved.png | UNKNOWN | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-028 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/cat_tools.png | UNKNOWN | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-029 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/cat_videos.png | UNKNOWN | NO | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-030 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/centers/center_detox.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/centers/center_hospital.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/centers/center_rehabilitation.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/centers/center_special_needs.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/clinicians_dashboard/actions/clinician_edit_profile.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/clinicians_dashboard/actions/clinician_open_cases.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/clinicians_dashboard/actions/clinician_support_request.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/family_support/family_contact_support.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/family_support/family_explore_centers.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/family_support/family_find_specialist.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/family_support/family_library.png | UNKNOWN | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/library/know_right_why_me_addicted.webp.png | LIBRARY | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-035 | DUPLICATE_CONTENT | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/library/know_your_right/cards/why_me_addicted_card.webp | LIBRARY | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-035 | DUPLICATE_CONTENT | pubspec.yaml:72 assets/images/library/know_your_right/cards/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/background_mobile.webp | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-036 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/background_mobile.webp.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-036 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/background_tablet.webp | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-037 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/background_tablet.webp.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-037 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/client_cards_strip.webp | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-038 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/client_cards_strip.webp.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-038 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/frame_client_image.webp | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-039 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/client_room/frame_client_image.webp.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-039 | DUPLICATE_CONTENT | pubspec.yaml:71 assets/images/mobile/client_room/; NO CONSUMER OBSERVED |
| assets/images/mobile/login/background_mobile.webp | UNKNOWN | YES | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:21 asset literal; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart:116 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-040 | DUPLICATE_CONTENT | pubspec.yaml:70 assets/images/mobile/login/; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:21 asset literal; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart:116 asset literal |
| assets/images/mobile/login/background_mobile.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-040 | DUPLICATE_CONTENT | pubspec.yaml:70 assets/images/mobile/login/; NO CONSUMER OBSERVED |
| assets/images/mobile/login/background_tablet.webp | UNKNOWN | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-041 | DUPLICATE_CONTENT | pubspec.yaml:70 assets/images/mobile/login/; NO CONSUMER OBSERVED |
| assets/images/mobile/login/background_tablet.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED | DUP-041 | DUPLICATE_CONTENT | pubspec.yaml:70 assets/images/mobile/login/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/background_mobile.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/background_tablet.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/btn_desktop.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/btn_friend.webp | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-042 | DUPLICATE_CONTENT | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/btn_friend.webp.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-042 | DUPLICATE_CONTENT | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/btn_language.webp | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-043 | DUPLICATE_CONTENT | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/btn_language.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-043 | DUPLICATE_CONTENT | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/btn_mobile.webp.png | SHARED | YES | lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 asset literal; lib/features/splash/presentation/pages/splash_page.dart:1101 asset literal | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:69 assets/images/mobile/splash/; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 asset literal; lib/features/splash/presentation/pages/splash_page.dart:1101 asset literal |
| assets/images/mobile/splash/btn_supporter.webp | UNKNOWN | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-044 | DUPLICATE_CONTENT | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/mobile/splash/btn_supporter.webp.png | APP_SHARED | YES | NO CONSUMER OBSERVED | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | NO MANIFEST OBSERVED | DUP-044 | DUPLICATE_CONTENT | pubspec.yaml:69 assets/images/mobile/splash/; NO CONSUMER OBSERVED |
| assets/images/specialists/specialist_addiction.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/specialists/specialist_coaching.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/specialists/specialist_family.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/specialists/specialist_psychology.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/images/specialists/specialist_speech.png | COMMERCIAL | NO | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | NOT_REFERENCED | not registered in pubspec assets; NO CONSUMER OBSERVED |
| assets/library/backgrounds/official_links_background.webp.png | SHARED | YES | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:308 asset literal; lib/features/library/presentation/pages/official_platform_links_page.dart:7 asset literal | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | ACTIVE | pubspec.yaml:74 assets/library/backgrounds/; lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:308 asset literal; lib/features/library/presentation/pages/official_platform_links_page.dart:7 asset literal |
| assets/library/platform_guides/platform_guide_content_access.webp.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:306 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:73 assets/library/platform_guides/; NO CONSUMER OBSERVED |
| assets/library/platform_guides/platform_guide_desktop.webp.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:306 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:73 assets/library/platform_guides/; NO CONSUMER OBSERVED |
| assets/library/platform_guides/platform_guide_mobile.webp.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:306 | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:73 assets/library/platform_guides/; NO CONSUMER OBSERVED |
| assets/presentations/presentation_about_mental_smile.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:75 assets/presentations/; NO CONSUMER OBSERVED |
| assets/presentations/presentation_accessibility_services.webp.png | UNKNOWN | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:75 assets/presentations/; NO CONSUMER OBSERVED |
| assets/presentations/presentation_center_services.webp.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:75 assets/presentations/; NO CONSUMER OBSERVED |
| assets/presentations/presentation_client_services.webp.png | RESIDENTIAL_CLIENT | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:75 assets/presentations/; NO CONSUMER OBSERVED |
| assets/presentations/presentation_specialist_services.webp.png | COMMERCIAL | YES | NO CONSUMER OBSERVED | NO DYNAMIC PATTERN OBSERVED | NO MANIFEST OBSERVED |  | REGISTERED_NO_CONSUMER_OBSERVED | pubspec.yaml:75 assets/presentations/; NO CONSUMER OBSERVED |

## 4. Ownership map

| Owner | Files | Active | RegisteredNoConsumer | NotReferenced | DuplicateContent |
| --- | --- | --- | --- | --- | --- |
| ACCESSIBILITY | 11 | 1 | 0 | 0 | 11 |
| APP_SHARED | 32 | 1 | 12 | 11 | 9 |
| COMMERCIAL | 76 | 5 | 15 | 50 | 6 |
| LIBRARY | 46 | 5 | 5 | 8 | 32 |
| RESIDENTIAL_CLIENT | 17 | 1 | 3 | 2 | 12 |
| SHARED | 18 | 18 | 0 | 0 | 7 |
| UNKNOWN | 48 | 18 | 8 | 7 | 16 |

## 5. Consumer map

| ConsumerFile | AssetLiterals | Calls | APIs |
| --- | --- | --- | --- |
| lib/core/branding/app_assets.dart | 7 | 7 | asset literal |
| lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart | 1 | 1 | asset literal |
| lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart | 1 | 1 | asset literal |
| lib/features/accessibility/presentation/pages/accessibility_links_page.dart | 1 | 1 | asset literal |
| lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart | 1 | 1 | asset literal |
| lib/features/accessibility/presentation/pages/accessibility_room_page.dart | 13 | 13 | asset literal |
| lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart | 1 | 1 | asset literal |
| lib/features/accessibility/presentation/pages/accessibility_tools_page.dart | 1 | 1 | asset literal |
| lib/features/client/presentation/pages/client_room_page.dart | 13 | 13 | asset literal |
| lib/features/commercial/presentation/pages/center_login_page.dart | 1 | 1 | asset literal |
| lib/features/commercial/presentation/pages/center_room_page.dart | 4 | 4 | asset literal |
| lib/features/commercial/presentation/pages/commercial_access_page.dart | 2 | 2 | asset literal |
| lib/features/commercial/presentation/pages/commercial_public_accounts_page.dart | 1 | 1 | asset literal |
| lib/features/commercial/presentation/pages/commercial_room_page.dart | 4 | 4 | asset literal |
| lib/features/commercial/presentation/pages/specialist_login_page.dart | 2 | 2 | asset literal |
| lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart | 3 | 3 | asset literal |
| lib/features/commercial/presentation/widgets/commercial_room_tv_apps.dart | 3 | 3 | asset literal |
| lib/features/commercial/presentation/widgets/commercial_room_utility_tools.dart | 2 | 2 | asset literal |
| lib/features/commercial/presentation/widgets/commercial_sub_page_background.dart | 1 | 1 | asset literal |
| lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart | 6 | 6 | asset literal |
| lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart | 1 | 1 | asset literal |
| lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart | 6 | 6 | asset literal |
| lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart | 1 | 1 | asset literal |
| lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart | 6 | 6 | asset literal |
| lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart | 3 | 3 | asset literal |
| lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart | 5 | 5 | asset literal |
| lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart | 1 | 1 | asset literal |
| lib/features/language/presentation/pages/language_page.dart | 3 | 3 | asset literal |
| lib/features/library/knowledge_cards/data/knowledge_card_repository.dart | 2 | 2 | asset literal |
| lib/features/library/knowledge_cards/presentation/widgets/knowledge_cards_rolling_carousel.dart | 1 | 1 | asset literal |
| lib/features/library/presentation/pages/library_page.dart | 12 | 12 | asset literal |
| lib/features/library/presentation/pages/library_provider_content_pages.dart | 3 | 3 | asset literal |
| lib/features/library/presentation/pages/official_platform_links_page.dart | 1 | 1 | asset literal |
| lib/features/presentation_gallery/data/presentation_gallery_repository.dart | 1 | 1 | asset literal |
| lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart | 1 | 1 | asset literal |
| lib/features/splash/presentation/pages/splash_page.dart | 6 | 6 | asset literal |
| lib/shared/accessibility/accessibility_guide_icon.dart | 1 | 1 | asset literal |
| lib/shared/ui_kit/app_shell_actions.dart | 2 | 2 | asset literal |
| lib/shared/utils/asset_path_utils.dart | 1 | 4 | asset literal |
| lib/shared/wellbeing/shared_wellbeing_room_card.dart | 1 | 1 | asset literal |

## 6. Pubspec registration map

| Entry | Line | MatchedFiles | ObservedConsumers | State |
| --- | --- | --- | --- | --- |
| assets/branding/logo_icon.png | 42 | 1 | 1 | PATH OBSERVED |
| assets/branding/logo_icon_light.png | 43 | 1 | 1 | PATH OBSERVED |
| assets/branding/logo_light.png | 44 | 1 | 1 | PATH OBSERVED |
| assets/branding/logo_marketing_glow.png | 45 | 1 | 1 | PATH OBSERVED |
| assets/branding/logo_primary.png | 46 | 1 | 1 | PATH OBSERVED |
| assets/branding/logo_primary_dark.png | 47 | 1 | 1 | PATH OBSERVED |
| assets/branding/logo_transparent.png | 48 | 1 | 1 | PATH OBSERVED |
| assets/branding/web/ | 49 | 8 | 4 | PATH OBSERVED |
| assets/branding/web/library/backgrounds/desktop/ | 50 | 1 | 1 | PATH OBSERVED |
| assets/branding/web/library/backgrounds/tablet/ | 51 | 1 | 1 | PATH OBSERVED |
| assets/branding/web/library/backgrounds/mobile/ | 52 | 1 | 1 | PATH OBSERVED |
| assets/branding/shared/logo/ | 53 | 1 | 1 | PATH OBSERVED |
| assets/branding/shared/navigation/back/ | 54 | 2 | 2 | PATH OBSERVED |
| assets/branding/navigation/back/ | 55 | 2 | 2 | PATH OBSERVED |
| assets/branding/language/ | 56 | 1 | 1 | PATH OBSERVED |
| assets/branding/guides/ | 57 | 16 | 12 | PATH OBSERVED |
| assets/branding/splash/ | 58 | 3 | 3 | PATH OBSERVED |
| assets/branding/rooms/client_room/ | 59 | 6 | 6 | PATH OBSERVED |
| assets/branding/rooms/accessibility_room/ | 60 | 17 | 14 | PATH OBSERVED |
| assets/branding/rooms/accessibility_room/cards/ | 61 | 11 | 8 | PATH OBSERVED |
| assets/icons/ | 62 | 5 | 4 | PATH OBSERVED |
| assets/icons/accessibility/ms_accessibility_guide.webp.png | 63 | 1 | 1 | PATH OBSERVED |
| assets/backgrounds/commercial_background_dark.webp | 64 | 1 | 1 | PATH OBSERVED |
| assets/backgrounds/residential_exit_social_portal.webp.png | 65 | 1 | 1 | PATH OBSERVED |
| assets/c6_library/categories/ | 66 | 6 | 6 | PATH OBSERVED |
| assets/c7_branding/home/ | 67 | 2 | 0 | PATH OBSERVED |
| assets/c7_branding/logo/ | 68 | 2 | 0 | PATH OBSERVED |
| assets/images/mobile/splash/ | 69 | 10 | 8 | PATH OBSERVED |
| assets/images/mobile/login/ | 70 | 4 | 2 | PATH OBSERVED |
| assets/images/mobile/client_room/ | 71 | 8 | 4 | PATH OBSERVED |
| assets/images/library/know_your_right/cards/ | 72 | 1 | 0 | PATH OBSERVED |
| assets/library/platform_guides/ | 73 | 3 | 3 | PATH OBSERVED |
| assets/library/backgrounds/ | 74 | 1 | 1 | PATH OBSERVED |
| assets/presentations/ | 75 | 5 | 0 | PATH OBSERVED |
| assets/content/library/know_your_right/ | 76 | 12 | 0 | PATH OBSERVED |
| assets/content/library/know_your_right/why_me_addicted/ | 77 | 9 | 0 | PATH OBSERVED |
| assets/content/library/know_your_right/coming_soon_01/ | 78 | 1 | 0 | PATH OBSERVED |
| assets/content/library/know_your_right/coming_soon_02/ | 79 | 1 | 0 | PATH OBSERVED |
| assets/content/library/know_your_right/coming_soon_03/ | 80 | 1 | 0 | PATH OBSERVED |

## 7. Manifest map

| AssetPath | Manifest | Exists |
| --- | --- | --- |
| assets/. | assets/c5/ASSETS_C5_MANIFEST.json:5 | NO |
| assets/c5/avatars/ | assets/c5/ASSETS_C5_MANIFEST.json:7 | NO |
| assets/c5/avatars/avatar_client.png | assets/c5/ASSETS_C5_MANIFEST.json:22 | YES |
| assets/c5/avatars/avatar_clinician_f.png | assets/c5/ASSETS_C5_MANIFEST.json:20 | YES |
| assets/c5/avatars/avatar_clinician_m.png | assets/c5/ASSETS_C5_MANIFEST.json:21 | YES |
| assets/c5/docs/ | assets/c5/ASSETS_C5_MANIFEST.json:15 | NO |
| assets/c5/icons/ | assets/c5/ASSETS_C5_MANIFEST.json:8 | NO |
| assets/c5/icons/icon_approved.png | assets/c5/ASSETS_C5_MANIFEST.json:25 | YES |
| assets/c5/icons/icon_booking.png | assets/c5/ASSETS_C5_MANIFEST.json:27 | YES |
| assets/c5/icons/icon_inbox.png | assets/c5/ASSETS_C5_MANIFEST.json:28 | YES |
| assets/c5/icons/icon_my_requests.png | assets/c5/ASSETS_C5_MANIFEST.json:29 | YES |
| assets/c5/icons/icon_pending.png | assets/c5/ASSETS_C5_MANIFEST.json:24 | YES |
| assets/c5/icons/icon_rejected.png | assets/c5/ASSETS_C5_MANIFEST.json:26 | YES |
| assets/c5/sheet/ | assets/c5/ASSETS_C5_MANIFEST.json:14 | NO |
| assets/c5/sheet/c5_sheet.png | assets/c5/ASSETS_C5_MANIFEST.json:18 | YES |
| assets/c5/ui/badges/ | assets/c5/ASSETS_C5_MANIFEST.json:10 | NO |
| assets/c5/ui/badges/badge_new.png | assets/c5/ASSETS_C5_MANIFEST.json:35 | YES |
| assets/c5/ui/badges/badge_verified.png | assets/c5/ASSETS_C5_MANIFEST.json:34 | YES |
| assets/c5/ui/buttons/ | assets/c5/ASSETS_C5_MANIFEST.json:9 | NO |
| assets/c5/ui/buttons/button_primary.png | assets/c5/ASSETS_C5_MANIFEST.json:31 | YES |
| assets/c5/ui/buttons/button_secondary.png | assets/c5/ASSETS_C5_MANIFEST.json:32 | YES |
| assets/c5/ui/gradients/ | assets/c5/ASSETS_C5_MANIFEST.json:12 | NO |
| assets/c5/ui/gradients/gradient_ribbon_1.png | assets/c5/ASSETS_C5_MANIFEST.json:42 | YES |
| assets/c5/ui/gradients/gradient_ribbon_2.png | assets/c5/ASSETS_C5_MANIFEST.json:43 | YES |
| assets/c5/ui/ornaments/ | assets/c5/ASSETS_C5_MANIFEST.json:13 | NO |
| assets/c5/ui/ornaments/ornament_divider_1.png | assets/c5/ASSETS_C5_MANIFEST.json:45 | YES |
| assets/c5/ui/status_dots/ | assets/c5/ASSETS_C5_MANIFEST.json:11 | NO |
| assets/c5/ui/status_dots/dot_approved.png | assets/c5/ASSETS_C5_MANIFEST.json:38 | YES |
| assets/c5/ui/status_dots/dot_online.png | assets/c5/ASSETS_C5_MANIFEST.json:40 | YES |
| assets/c5/ui/status_dots/dot_pending.png | assets/c5/ASSETS_C5_MANIFEST.json:37 | YES |
| assets/c5/ui/status_dots/dot_rejected.png | assets/c5/ASSETS_C5_MANIFEST.json:39 | YES |

## 8. Duplicate content groups

| DuplicateGroup | SHA256 | AssetPath | Size |
| --- | --- | --- | --- |
| DUP-043 | 029AC993209FE566EE3C9FD0525C953E76AF5423BDE1E9D632B86F4FF79FA797 | assets/images/mobile/splash/btn_language.webp | 1768049 |
| DUP-043 | 029AC993209FE566EE3C9FD0525C953E76AF5423BDE1E9D632B86F4FF79FA797 | assets/images/mobile/splash/btn_language.webp.png | 1768049 |
| DUP-005 | 0ED3F70EBBF6F1CE1134ECAA36B2021B1278496793A5CDC8D1E6DBE346F8F68A | assets/branding/library/bedaya_amena/bedaya_amena_card.png | 1795768 |
| DUP-005 | 0ED3F70EBBF6F1CE1134ECAA36B2021B1278496793A5CDC8D1E6DBE346F8F68A | assets/branding/web/library/bedaya_amena/bedaya_amena_card.png | 1795768 |
| DUP-028 | 10AD3E39F764D6C29A6CB64B0AA1D87F8118144FDAAC888E6FC5271F57CEA829 | assets/c6_library/categories/cat_saved.png | 3273431 |
| DUP-028 | 10AD3E39F764D6C29A6CB64B0AA1D87F8118144FDAAC888E6FC5271F57CEA829 | assets/images/cat_saved.png | 3273431 |
| DUP-035 | 10FC9FF6DB4C95C47FB3DF6BEE73E5569D262FDDF28BDD4DCE391886E766B7DA | assets/images/library/know_right_why_me_addicted.webp.png | 2538568 |
| DUP-035 | 10FC9FF6DB4C95C47FB3DF6BEE73E5569D262FDDF28BDD4DCE391886E766B7DA | assets/images/library/know_your_right/cards/why_me_addicted_card.webp | 2538568 |
| DUP-027 | 209B60CB6AE6E72E47F21875BCBA084C6D07E6DBF294F7D7DCF25EE4751F898C | assets/c6_library/categories/cat_exercises.png | 2849046 |
| DUP-027 | 209B60CB6AE6E72E47F21875BCBA084C6D07E6DBF294F7D7DCF25EE4751F898C | assets/images/cat_exercises.png | 2849046 |
| DUP-030 | 23B66A5FF6DECBF9A6B6182BEF7387406A77E846B856E31AB5AB3A2ACA4A6DE1 | assets/c6_library/categories/cat_videos.png | 3114176 |
| DUP-030 | 23B66A5FF6DECBF9A6B6182BEF7387406A77E846B856E31AB5AB3A2ACA4A6DE1 | assets/images/cat_videos.png | 3114176 |
| DUP-004 | 26DC2B47407FEE4BA7C1529FF183D3EF205F0C6A1B051AA965D3A342098C69DB | assets/branding/library/backgrounds/tablet/library_tablet_bg.png | 1658306 |
| DUP-004 | 26DC2B47407FEE4BA7C1529FF183D3EF205F0C6A1B051AA965D3A342098C69DB | assets/branding/web/library/backgrounds/tablet/library_tablet_bg.png | 1658306 |
| DUP-015 | 36248315086D580F84FEF502B22610C7C8E023F78509F7484EF7109022FA3113 | assets/branding/rooms/accessibility_room/cards/accessibility_checkin_papyrus_background.png | 2775428 |
| DUP-015 | 36248315086D580F84FEF502B22610C7C8E023F78509F7484EF7109022FA3113 | assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_papyrus_background.png | 2775428 |
| DUP-015 | 36248315086D580F84FEF502B22610C7C8E023F78509F7484EF7109022FA3113 | assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png | 2775428 |
| DUP-015 | 36248315086D580F84FEF502B22610C7C8E023F78509F7484EF7109022FA3113 | assets/branding/rooms/accessibility_room/cards/accessibility_suggestions_papyrus_background.png | 2775428 |
| DUP-015 | 36248315086D580F84FEF502B22610C7C8E023F78509F7484EF7109022FA3113 | assets/branding/rooms/accessibility_room/cards/accessibility_tools_papyrus_background.png | 2775428 |
| DUP-012 | 3CFF393FDA663B76A2A18BCF859FF20EEF701A2CCEB1C47861F9E263204A2820 | assets/branding/rooms/accessibility_room/accessibility_room_exit_button.png | 2494907 |
| DUP-012 | 3CFF393FDA663B76A2A18BCF859FF20EEF701A2CCEB1C47861F9E263204A2820 | assets/branding/rooms/client_room/accessibility_room_exit_button.png | 2494907 |
| DUP-019 | 40D6094A51CFF3996FB73C4DA745EDF23A03748486005538471ACD3AAF05E791 | assets/branding/web_registration/centers/desktop/centers_success.png | 2049077 |
| DUP-019 | 40D6094A51CFF3996FB73C4DA745EDF23A03748486005538471ACD3AAF05E791 | assets/branding/web_registration/clinicians/desktop/clinicians_success.png | 2049077 |
| DUP-044 | 41F17E30C8015848C9271B128C528AB26243F013909115EC665BCA74BB8BCC06 | assets/images/mobile/splash/btn_supporter.webp | 2490400 |
| DUP-044 | 41F17E30C8015848C9271B128C528AB26243F013909115EC665BCA74BB8BCC06 | assets/images/mobile/splash/btn_supporter.webp.png | 2490400 |
| DUP-041 | 447EFF59848EADDEE36B95D6D2F75CDA9F40F396EA44C45DEFDA53CDB2CA8DA4 | assets/images/mobile/login/background_tablet.webp | 2668490 |
| DUP-041 | 447EFF59848EADDEE36B95D6D2F75CDA9F40F396EA44C45DEFDA53CDB2CA8DA4 | assets/images/mobile/login/background_tablet.webp.png | 2668490 |
| DUP-014 | 4A64D06DDB750CCF36D4C59AEE8DD58F0C5AC45E1A0F1D7715B22AAA1BC46762 | assets/branding/rooms/accessibility_room/accessibility_room_youtube_button.png | 1970610 |
| DUP-014 | 4A64D06DDB750CCF36D4C59AEE8DD58F0C5AC45E1A0F1D7715B22AAA1BC46762 | assets/branding/rooms/client_room/accessibility_room_youtube_button.png | 1970610 |
| DUP-033 | 57DAE81823BD7D54037F568B672CCEEB46851F48931E75F0204F74671F867978 | assets/content/library/know_your_right/why_me_addicted/03_english_sources.md | 10725 |
| DUP-033 | 57DAE81823BD7D54037F568B672CCEEB46851F48931E75F0204F74671F867978 | assets/content/library/know_your_right/why_me_addicted/03_english_sources.txt | 10725 |
| DUP-025 | 5EF6CAF2404D970B530F9749347D68A896F7B5A46B4410454EEB46A397A41ED3 | assets/c6_library/categories/cat_articles.png | 2866037 |
| DUP-025 | 5EF6CAF2404D970B530F9749347D68A896F7B5A46B4410454EEB46A397A41ED3 | assets/images/cat_articles.png | 2866037 |
| DUP-026 | 620C2AA0DD164E5DC4640A8E4D0130611A1574CF5EEF65EFFD285610FD3BF110 | assets/c6_library/categories/cat_audio.png | 3131541 |
| DUP-026 | 620C2AA0DD164E5DC4640A8E4D0130611A1574CF5EEF65EFFD285610FD3BF110 | assets/images/cat_audio.png | 3131541 |
| DUP-023 | 677AC18417409A423919F4EF70CE9F4303B685FA2E3F07E235A0962B3B3DBA58 | assets/c6_library/brand/logo_mark.png | 2495569 |
| DUP-023 | 677AC18417409A423919F4EF70CE9F4303B685FA2E3F07E235A0962B3B3DBA58 | assets/c7_branding/logo/logo_mark.png | 2495569 |
| DUP-031 | 7324E7A1D1C9B05B696AD608729DD8A14D974A7377D32C9ECFE4C76D691DBFA8 | assets/content/library/know_your_right/why_me_addicted/01_answer.md | 6497 |
| DUP-031 | 7324E7A1D1C9B05B696AD608729DD8A14D974A7377D32C9ECFE4C76D691DBFA8 | assets/content/library/know_your_right/why_me_addicted/01_answer.txt | 6497 |
| DUP-009 | 7842AA2F4EEDB0DD2EFE55A961FA47312C4046562196ABD356FC80A9AA27D156 | assets/branding/navigation/back/back_left_gold.png | 1901785 |
| DUP-009 | 7842AA2F4EEDB0DD2EFE55A961FA47312C4046562196ABD356FC80A9AA27D156 | assets/branding/shared/navigation/back/back_left_gold.png | 1901785 |
| DUP-002 | 7BBA8394EC06F6C582D99BE293F315ADBB8C8A0B6EAAE2043DD57AD7484EAD93 | assets/branding/library/backgrounds/desktop/library_desktop_bg.png | 1647300 |
| DUP-002 | 7BBA8394EC06F6C582D99BE293F315ADBB8C8A0B6EAAE2043DD57AD7484EAD93 | assets/branding/web/library/backgrounds/desktop/library_desktop_bg.png | 1647300 |
| DUP-040 | 7DB82256436515EEFB43169ADE564628649324521C0B0DD14171A5BDAEA6A0F6 | assets/images/mobile/login/background_mobile.webp | 2655748 |
| DUP-040 | 7DB82256436515EEFB43169ADE564628649324521C0B0DD14171A5BDAEA6A0F6 | assets/images/mobile/login/background_mobile.webp.png | 2655748 |
| DUP-006 | 80E49A15E68D2D9A03246B34F93EC9C734DC0C47C8119FB962C51D392F474B9C | assets/branding/library/hodn_amen/hodn_amen_card.png | 1736892 |
| DUP-006 | 80E49A15E68D2D9A03246B34F93EC9C734DC0C47C8119FB962C51D392F474B9C | assets/branding/web/library/hodn_amen/hodn_amen_card.png | 1736892 |
| DUP-024 | 9274DB752BC712A74A498967B39CEA358FA8FA6BB1BE66D873CDB0024D1E2932 | assets/c6_library/brand/logo_wordmark.png | 2398650 |
| DUP-024 | 9274DB752BC712A74A498967B39CEA358FA8FA6BB1BE66D873CDB0024D1E2932 | assets/c7_branding/logo/logo_wordmark.png | 2398650 |
| DUP-007 | 95092B49837C997B05418801E73778D10BDD9110F7171DEC8225A5751AB422D5 | assets/branding/logo_icon.png | 2196384 |
| DUP-007 | 95092B49837C997B05418801E73778D10BDD9110F7171DEC8225A5751AB422D5 | assets/branding/logo_primary_dark.png | 2196384 |
| DUP-007 | 95092B49837C997B05418801E73778D10BDD9110F7171DEC8225A5751AB422D5 | assets/branding/shared/logo/logo_primary_dark.png | 2196384 |
| DUP-016 | 9E34CC007C5BE7AA6F4CE04C6CBD087C8691B2FB46E515F91E3D38B7E1DE5D7D | assets/branding/rooms/accessibility_room/client_room_background_desktop.png | 2119569 |
| DUP-016 | 9E34CC007C5BE7AA6F4CE04C6CBD087C8691B2FB46E515F91E3D38B7E1DE5D7D | assets/branding/rooms/client_room/client_room_background_desktop.png | 2119569 |
| DUP-017 | A13D7754EE3D3AA8D3DFEEEDABBE937A6F800A0A817D091D927A00BC56930EBC | assets/branding/rooms/accessibility_room/client_room_background_mobile.png | 2180640 |
| DUP-017 | A13D7754EE3D3AA8D3DFEEEDABBE937A6F800A0A817D091D927A00BC56930EBC | assets/branding/rooms/client_room/client_room_background_mobile.png | 2180640 |
| DUP-011 | A3F16ACCA1AE82F8418013979EF872BC123727983E41BFD591F78F70DE239542 | assets/branding/navigation/logout/logout_gold.png | 1864421 |
| DUP-011 | A3F16ACCA1AE82F8418013979EF872BC123727983E41BFD591F78F70DE239542 | assets/branding/shared/navigation/logout/logout_gold.png | 1864421 |
| DUP-032 | B51FFCA91AE0F3E54A22D8F23F6BB9B71AF9ED4BF924C9387C2F44EE2882D043 | assets/content/library/know_your_right/why_me_addicted/02_arabic_sources.md | 8417 |
| DUP-032 | B51FFCA91AE0F3E54A22D8F23F6BB9B71AF9ED4BF924C9387C2F44EE2882D043 | assets/content/library/know_your_right/why_me_addicted/02_arabic_sources.txt | 8417 |
| DUP-013 | B926B3D2B834B41D7E133BFEFA8583DB47D8F991BD4FCA17EFF71E0210102D03 | assets/branding/rooms/accessibility_room/accessibility_room_photo_upload_button.png | 2038592 |
| DUP-013 | B926B3D2B834B41D7E133BFEFA8583DB47D8F991BD4FCA17EFF71E0210102D03 | assets/branding/rooms/client_room/accessibility_room_photo_upload_button.png | 2038592 |
| DUP-037 | BAD2AEC9B560CFF99553F00CF37B58914FEF946066B68B726886BAFB5E6DBA33 | assets/images/mobile/client_room/background_tablet.webp | 2569196 |
| DUP-037 | BAD2AEC9B560CFF99553F00CF37B58914FEF946066B68B726886BAFB5E6DBA33 | assets/images/mobile/client_room/background_tablet.webp.png | 2569196 |
| DUP-039 | C48B19F695E5A2639963EF7856042BE4378084E9CFC02C2A6780E4DE63ADA6A1 | assets/images/mobile/client_room/frame_client_image.webp | 1455841 |
| DUP-039 | C48B19F695E5A2639963EF7856042BE4378084E9CFC02C2A6780E4DE63ADA6A1 | assets/images/mobile/client_room/frame_client_image.webp.png | 1455841 |
| DUP-010 | C99731932D183208F5621AA46CBCC3D7AE0B7AC0089CA513383B2DA5539A12AB | assets/branding/navigation/back/back_right_gold.png | 1853271 |
| DUP-010 | C99731932D183208F5621AA46CBCC3D7AE0B7AC0089CA513383B2DA5539A12AB | assets/branding/shared/navigation/back/back_right_gold.png | 1853271 |
| DUP-036 | CB5088EC9AC5C1D5FB2303A5862F0E5F2FB3169F823F3FB92F28361BED5A73F9 | assets/images/mobile/client_room/background_mobile.webp | 2530734 |
| DUP-036 | CB5088EC9AC5C1D5FB2303A5862F0E5F2FB3169F823F3FB92F28361BED5A73F9 | assets/images/mobile/client_room/background_mobile.webp.png | 2530734 |
| DUP-018 | D31DD98DBFCD77374A5671623D50727410EF5DD721C97B6FA8D6F47B6F86F8B4 | assets/branding/rooms/accessibility_room/client_room_background_tablet.png | 2407206 |
| DUP-018 | D31DD98DBFCD77374A5671623D50727410EF5DD721C97B6FA8D6F47B6F86F8B4 | assets/branding/rooms/client_room/client_room_background_tablet.png | 2407206 |
| DUP-038 | D334CD3944D51C93BF1785A93C52CCC4E3D0353A7FF55A3BB15BEFA7853E066E | assets/images/mobile/client_room/client_cards_strip.webp | 2732480 |
| DUP-038 | D334CD3944D51C93BF1785A93C52CCC4E3D0353A7FF55A3BB15BEFA7853E066E | assets/images/mobile/client_room/client_cards_strip.webp.png | 2732480 |
| DUP-021 | D7647DC96E1F54CADC1FE8F3675AABFEECF5842DBA01062E0ECF0CD2EB34DC33 | assets/branding/web_registration/centers/tablet/centers_success.png | 1870545 |
| DUP-021 | D7647DC96E1F54CADC1FE8F3675AABFEECF5842DBA01062E0ECF0CD2EB34DC33 | assets/branding/web_registration/clinicians/tablet/clinicians_success.png | 1870545 |
| DUP-029 | E095DE4E2091399785F6B73F2056A4C0860D8CF1E82792A17029241613884A02 | assets/c6_library/categories/cat_tools.png | 3181902 |
| DUP-029 | E095DE4E2091399785F6B73F2056A4C0860D8CF1E82792A17029241613884A02 | assets/images/cat_tools.png | 3181902 |
| DUP-001 | E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855 | assets/animations/.gitkeep | 0 |
| DUP-001 | E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855 | assets/icons/.gitkeep | 0 |
| DUP-001 | E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855 | assets/images/.gitkeep | 0 |
| DUP-022 | EB8FC1E3FF3C562B76748DFF177E15E0C7EC883F25F2D7805794370D7210C8A6 | assets/c5/avatars/avatar_client.png | 136050 |
| DUP-022 | EB8FC1E3FF3C562B76748DFF177E15E0C7EC883F25F2D7805794370D7210C8A6 | assets/images/avatar_client.png | 136050 |
| DUP-008 | F03B3EAE1E38031D3D5472D9148286048C7BEEC6A46D100CC01DDD2887765000 | assets/branding/logo_icon_light.png | 664167 |
| DUP-008 | F03B3EAE1E38031D3D5472D9148286048C7BEEC6A46D100CC01DDD2887765000 | assets/branding/logo_transparent.png | 664167 |
| DUP-034 | F15AB0CC54473DC7DF2B4C76493A539FAB1754D2014A83AE6249EDA281B70F22 | assets/content/library/know_your_right/why_me_addicted/04_global_references.md | 9668 |
| DUP-034 | F15AB0CC54473DC7DF2B4C76493A539FAB1754D2014A83AE6249EDA281B70F22 | assets/content/library/know_your_right/why_me_addicted/04_global_references.txt | 9668 |
| DUP-020 | F8E8629E80C311842908F32426866C9C63E9F6FA5165635FED430BD860C3E0F3 | assets/branding/web_registration/centers/mobile/centers_success.png | 1769993 |
| DUP-020 | F8E8629E80C311842908F32426866C9C63E9F6FA5165635FED430BD860C3E0F3 | assets/branding/web_registration/clinicians/mobile/clinicians_success.png | 1769993 |
| DUP-042 | F936C446990F711B9F531D30DCE38C3273ABE9244655F3152C21ACA954A9979C | assets/images/mobile/splash/btn_friend.webp | 2402348 |
| DUP-042 | F936C446990F711B9F531D30DCE38C3273ABE9244655F3152C21ACA954A9979C | assets/images/mobile/splash/btn_friend.webp.png | 2402348 |
| DUP-003 | F99F49F2AB6CDAA87316B33F99D40D058DD9CEC3B87C076338589A1F5CD17D11 | assets/branding/library/backgrounds/mobile/library_mobile_bg.png | 1504609 |
| DUP-003 | F99F49F2AB6CDAA87316B33F99D40D058DD9CEC3B87C076338589A1F5CD17D11 | assets/branding/web/library/backgrounds/mobile/library_mobile_bg.png | 1504609 |

## 9. Missing asset references

| Path | Evidence | Registered |
| --- | --- | --- |
| assets/assets/ | lib/shared/utils/asset_path_utils.dart:6; lib/shared/utils/asset_path_utils.dart:7; lib/shared/utils/asset_path_utils.dart:17; lib/shared/utils/asset_path_utils.dart:18 | NO |
| assets/branding/guides/supporters_account_selection_mobile_guide.png | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart:68 | YES |
| assets/content/library/know_your_right | lib/features/library/knowledge_cards/data/knowledge_card_repository.dart:21 | NO |
| assets/images/library/know_your_right/cards | lib/features/library/knowledge_cards/data/knowledge_card_repository.dart:22 | NO |
| assets/library/platform_guides/platform_official_links.webp | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:306 | YES |
| assets/presentations | lib/features/presentation_gallery/data/presentation_gallery_repository.dart:11 | NO |

## 10. Inactive directory map

| Directory | Files | Active | NoConsumer | DynamicLoader | ObservedState |
| --- | --- | --- | --- | --- | --- |
| assets/animations | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/backgrounds | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/branding | 7 | 3 | 4 | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | MIXED OBSERVED |
| assets/branding/guides | 16 | 2 | 14 | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | MIXED OBSERVED |
| assets/branding/language | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/backgrounds/desktop | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/backgrounds/mobile | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/backgrounds/tablet | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/bedaya_amena | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/hodn_amen | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/login | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/menu/desktop | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/menu/mobile | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/menu/tablet | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/navigation/back | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/navigation/logout | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/rooms/accessibility_room | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/rooms/accessibility_room/cards | 11 | 7 | 4 | NO | MIXED OBSERVED |
| assets/branding/rooms/client_room | 6 | 4 | 2 | NO | MIXED OBSERVED |
| assets/branding/shared/logo | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/shared/navigation/back | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/shared/navigation/logout | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/splash | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web/library/backgrounds/desktop | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/web/library/backgrounds/mobile | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/web/library/backgrounds/tablet | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/web/library/bedaya_amena | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web/library/hodn_amen | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/centers/desktop | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/centers/mobile | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/centers/tablet | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinician | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinicians/desktop | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinicians/mobile | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinicians/tablet | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/c5 | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c5/avatars | 3 | 3 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/docs | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c5/icons | 6 | 6 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/sheet | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/badges | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/buttons | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/gradients | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/ornaments | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/status_dots | 4 | 4 | 0 | NO | ACTIVE OBSERVED |
| assets/c6_library/brand | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/categories | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/docs | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/hero | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/states | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/ui/badges | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/ui/buttons | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/ui/ornaments | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/buttons | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/home | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/logo | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/splash | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/coming_soon_01 | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/coming_soon_02 | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/coming_soon_03 | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/why_me_addicted | 9 | 0 | 9 | NO | FULLY INACTIVE OBSERVED |
| assets/icons | 4 | 3 | 1 | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 | MIXED OBSERVED |
| assets/icons/accessibility | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/images | 12 | 0 | 12 | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | DYNAMIC ONLY OBSERVED |
| assets/images/addiction | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/images/backgrounds | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/images/centers | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/images/clinicians_dashboard/actions | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/images/family_support | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/images/library | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/images/library/know_your_right/cards | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/images/mobile/client_room | 8 | 0 | 8 | NO | FULLY INACTIVE OBSERVED |
| assets/images/mobile/login | 4 | 1 | 3 | NO | MIXED OBSERVED |
| assets/images/mobile/splash | 10 | 1 | 9 | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | MIXED OBSERVED |
| assets/images/specialists | 5 | 0 | 5 | NO | FULLY INACTIVE OBSERVED |
| assets/library/backgrounds | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/library/platform_guides | 3 | 0 | 3 | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:306 | DYNAMIC ONLY OBSERVED |
| assets/presentations | 5 | 0 | 5 | NO | FULLY INACTIVE OBSERVED |

## 11. Web/native assets

| Path | Role | Extension | Size |
| --- | --- | --- | --- |
| web/favicon.png | WEB | .png | 917 |
| web/icons/Icon-192.png | WEB | .png | 5292 |
| web/icons/Icon-512.png | WEB | .png | 8252 |
| web/icons/Icon-maskable-192.png | WEB | .png | 5594 |
| web/icons/Icon-maskable-512.png | WEB | .png | 20998 |
| web/manifest.json | WEB | .json | 957 |
| android/app/src/debug/AndroidManifest.xml | ANDROID | .xml | 385 |
| android/app/src/main/AndroidManifest.xml | ANDROID | .xml | 2265 |
| android/app/src/main/res/drawable/background.png | ANDROID | .png | 69 |
| android/app/src/main/res/drawable/launch_background.xml | ANDROID | .xml | 230 |
| android/app/src/main/res/drawable-v21/background.png | ANDROID | .png | 69 |
| android/app/src/main/res/drawable-v21/launch_background.xml | ANDROID | .xml | 230 |
| android/app/src/main/res/mipmap-hdpi/ic_launcher.png | ANDROID | .png | 544 |
| android/app/src/main/res/mipmap-mdpi/ic_launcher.png | ANDROID | .png | 442 |
| android/app/src/main/res/mipmap-xhdpi/ic_launcher.png | ANDROID | .png | 721 |
| android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png | ANDROID | .png | 1031 |
| android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png | ANDROID | .png | 1443 |
| android/app/src/main/res/values/styles.xml | ANDROID | .xml | 1289 |
| android/app/src/main/res/values-night/styles.xml | ANDROID | .xml | 1288 |
| android/app/src/main/res/values-night-v31/styles.xml | ANDROID | .xml | 1077 |
| android/app/src/main/res/values-v31/styles.xml | ANDROID | .xml | 1078 |
| android/app/src/profile/AndroidManifest.xml | ANDROID | .xml | 385 |

## 12. Final factual tables

### Status totals

| Status | Count |
| --- | --- |
| ACTIVE | 14 |
| CONSUMER_NOT_REGISTERED | 20 |
| DUPLICATE_CONTENT | 93 |
| NOT_REFERENCED | 78 |
| REGISTERED_NO_CONSUMER_OBSERVED | 43 |

### Directory table

| Directory | Files | Active | NoConsumer | DynamicLoader | ObservedState |
| --- | --- | --- | --- | --- | --- |
| assets/animations | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/backgrounds | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/branding | 7 | 3 | 4 | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | MIXED OBSERVED |
| assets/branding/guides | 16 | 2 | 14 | lib/features/commercial/presentation/pages/center_login_page.dart:64; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart:22; lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart:23 | MIXED OBSERVED |
| assets/branding/language | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/backgrounds/desktop | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/backgrounds/mobile | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/backgrounds/tablet | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/bedaya_amena | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/library/hodn_amen | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/login | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/menu/desktop | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/menu/mobile | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/menu/tablet | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/navigation/back | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/navigation/logout | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/rooms/accessibility_room | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/rooms/accessibility_room/cards | 11 | 7 | 4 | NO | MIXED OBSERVED |
| assets/branding/rooms/client_room | 6 | 4 | 2 | NO | MIXED OBSERVED |
| assets/branding/shared/logo | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/shared/navigation/back | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/shared/navigation/logout | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/splash | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web/library/backgrounds/desktop | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/web/library/backgrounds/mobile | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/web/library/backgrounds/tablet | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/branding/web/library/bedaya_amena | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web/library/hodn_amen | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/centers/desktop | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/centers/mobile | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/centers/tablet | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinician | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinicians/desktop | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinicians/mobile | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/branding/web_registration/clinicians/tablet | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/c5 | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c5/avatars | 3 | 3 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/docs | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c5/icons | 6 | 6 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/sheet | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/badges | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/buttons | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/gradients | 2 | 2 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/ornaments | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/c5/ui/status_dots | 4 | 4 | 0 | NO | ACTIVE OBSERVED |
| assets/c6_library/brand | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/categories | 6 | 0 | 6 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/docs | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/hero | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/states | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/ui/badges | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/ui/buttons | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c6_library/ui/ornaments | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/buttons | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/home | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/logo | 2 | 0 | 2 | NO | FULLY INACTIVE OBSERVED |
| assets/c7_branding/splash | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/coming_soon_01 | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/coming_soon_02 | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/coming_soon_03 | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/content/library/know_your_right/why_me_addicted | 9 | 0 | 9 | NO | FULLY INACTIVE OBSERVED |
| assets/icons | 4 | 3 | 1 | lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:291; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:296; lib/features/commercial/presentation/widgets/commercial_room_screen_image.dart:301 | MIXED OBSERVED |
| assets/icons/accessibility | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/images | 12 | 0 | 12 | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | DYNAMIC ONLY OBSERVED |
| assets/images/addiction | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/images/backgrounds | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/images/centers | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/images/clinicians_dashboard/actions | 3 | 0 | 3 | NO | FULLY INACTIVE OBSERVED |
| assets/images/family_support | 4 | 0 | 4 | NO | FULLY INACTIVE OBSERVED |
| assets/images/library | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/images/library/know_your_right/cards | 1 | 0 | 1 | NO | FULLY INACTIVE OBSERVED |
| assets/images/mobile/client_room | 8 | 0 | 8 | NO | FULLY INACTIVE OBSERVED |
| assets/images/mobile/login | 4 | 1 | 3 | NO | MIXED OBSERVED |
| assets/images/mobile/splash | 10 | 1 | 9 | lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:29; lib/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart:35; lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart:26 | MIXED OBSERVED |
| assets/images/specialists | 5 | 0 | 5 | NO | FULLY INACTIVE OBSERVED |
| assets/library/backgrounds | 1 | 1 | 0 | NO | ACTIVE OBSERVED |
| assets/library/platform_guides | 3 | 0 | 3 | lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart:306 | DYNAMIC ONLY OBSERVED |
| assets/presentations | 5 | 0 | 5 | NO | FULLY INACTIVE OBSERVED |

### Final values

| Field | Value |
| --- | ---: |
| Total asset files | 248 |
| Active assets | 49 |
| Registered no consumer observed | 43 |
| Consumer not registered | 20 |
| Not referenced | 78 |
| Duplicate content files | 93 |
| Missing asset references | 6 |
| Fully inactive directories | 56 |
| Unknown ownership assets | 48 |
| Original files modified | 0 |
| Platform Core modified | 0 |
