# Generation 2 Signal Registry V1

Date: 2026-07-06

This is a governance-only registry. No backend emission was added by this task.

Existing signal infrastructure observed:

- `lib/features/signals/`
- `lib/features/residential/signals/`
- `lib/features/commercial_v2_web/signals/`
- `lib/features/monitoring/`

No dedicated Generation 2 mobile signal emitter or payload class was found during this inventory. Runtime/backend status is therefore `IMPLEMENTATION_PENDING` unless noted.

| Signal Key | Trigger | Screen | Payload Class | Privacy Level | Retention Class | User Type | Backend Status | Runtime Status | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `g2.screen_opened` | Screen build/open | All G2 screens | `G2SignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Use for manual analytics later. |
| `g2.guide_opened` | Daleel guide image opened | All Daleel screens | `G2GuideSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Current UI opens dialog only. |
| `g2.survey_opened` | Daleel survey opened | All Daleel screens | `G2SurveySignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Current UI opens bottom sheet only. |
| `g2.survey_submitted` | Survey submit button | All Daleel screens | `G2SurveySignalPayload` planned | MEDIUM | TEMPORARY | All | NONE | LOCAL_DEBUGPRINT_ONLY | Current behavior is debugPrint only. |
| `g2.audio_help_clicked` | Speaker/help icon clicked | All guided controls | `G2AssistiveSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Existing `AccessibilityGuideIcon` UI is present. |
| `g2.language_toggle_clicked` | Language button tapped | Splash/login selection | `G2LanguageSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Locale storage exists; no signal emission. |
| `g2.back_clicked` | Back/exit button tapped | Selection and room screens | `G2NavigationSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Current navigation unchanged. |
| `g2.login_selection_client_clicked` | Friends branch tapped | Mobile Login Selection | `G2NavigationSignalPayload` planned | LOW | SESSION | Client | NONE | IMPLEMENTATION_PENDING | Opens Client Account Selection. |
| `g2.login_selection_supporter_clicked` | Supporters branch tapped | Mobile Login Selection | `G2NavigationSignalPayload` planned | LOW | SESSION | Specialist/center | NONE | IMPLEMENTATION_PENDING | Opens Supporters Account Selection. |
| `g2.client_account_selected` | `صديقي العميل` tapped | Client Account Selection | `G2AccountSelectionPayload` planned | LOW | SESSION | Client | NONE | IMPLEMENTATION_PENDING | Opens Client Friend room. |
| `g2.premium_account_selected` | `صديقي المميز` tapped | Client Account Selection | `G2AccountSelectionPayload` planned | LOW | SESSION | Premium client | NONE | IMPLEMENTATION_PENDING | Opens `/g2/mobile/client-room`. |
| `g2.supporter_specialist_selected` | Specialist supporter tapped | Supporters Account Selection | `G2AccountSelectionPayload` planned | LOW | SESSION | Specialist | NONE | IMPLEMENTATION_PENDING | Opens `/g2/mobile/specialist-room`. |
| `g2.supporter_center_selected` | Center supporter tapped | Supporters Account Selection | `G2AccountSelectionPayload` planned | LOW | SESSION | Center | NONE | IMPLEMENTATION_PENDING | Opens `/g2/mobile/center-room`. |
| `g2.login_attempted` | Login button tapped | Specialist/center login | `G2AuthSignalPayload` planned | MEDIUM | AUDIT | Specialist/center | NONE | IMPLEMENTATION_PENDING | Auth service already performs login; no signal added. |
| `g2.login_success` | Login success | Specialist/center login | `G2AuthSignalPayload` planned | MEDIUM | AUDIT | Specialist/center | NONE | IMPLEMENTATION_PENDING | Requires future auth-safe integration. |
| `g2.login_failed` | Login failure | Specialist/center login | `G2AuthSignalPayload` planned | MEDIUM | AUDIT | Specialist/center | NONE | IMPLEMENTATION_PENDING | Requires future auth-safe integration. |
| `g2.register_clicked` | Register link/button tapped | Specialist/center login | `G2AuthSignalPayload` planned | MEDIUM | AUDIT | Specialist/center | NONE | IMPLEMENTATION_PENDING | Current routes navigate to register pages. |
| `g2.register_success` | Register success | Register pages | `G2AuthSignalPayload` planned | MEDIUM | AUDIT | Specialist/center | NONE | IMPLEMENTATION_PENDING | No change in this task. |
| `g2.register_failed` | Register failure | Register pages | `G2AuthSignalPayload` planned | MEDIUM | AUDIT | Specialist/center | NONE | IMPLEMENTATION_PENDING | No change in this task. |
| `g2.room_opened` | Room opened | Client/premium/specialist/center rooms | `G2RoomSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Shared scaffold candidate. |
| `g2.profile_image_upload_clicked` | Profile image upload clicked | Premium/client room scaffold | `G2RoomSignalPayload` planned | MEDIUM | TEMPORARY | Client/specialist/center | NONE | IMPLEMENTATION_PENDING | Image picker present in shared scaffold. |
| `g2.note_opened` | Note/card opened | Mobile rooms | `G2CardSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Card-specific instrumentation pending. |
| `g2.motivational_sentence_selected` | Motivational message selected | Mobile room scaffold | `G2CardSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Message choices exist in shared scaffold. |
| `g2.rolling_card_changed` | Rolling/rotating card changes | Mobile rooms | `G2CardSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Future UI signal. |
| `g2.tools_card_opened` | Tools card tapped/opened | Mobile rooms | `G2CardSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Some cards route to commercial assistive tools. |
| `g2.links_card_opened` | Links card tapped/opened | Mobile rooms | `G2CardSignalPayload` planned | LOW | SESSION | Client/premium | NONE | IMPLEMENTATION_PENDING | Card present in client room. |
| `g2.apps_card_opened` | Apps/tools card opened | Mobile rooms | `G2CardSignalPayload` planned | LOW | SESSION | Client/premium | NONE | IMPLEMENTATION_PENDING | Card present in client/premium rooms. |
| `g2.suggestions_card_opened` | Suggestions card opened | Mobile rooms | `G2CardSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Local feedback surface only. |
| `g2.contact_methods_card_opened` | Contact methods opened | Mobile rooms | `G2CardSignalPayload` planned | MEDIUM | SESSION | Providers | NONE | IMPLEMENTATION_PENDING | Provider/customer contact later. |
| `g2.exit_clicked` | Exit/logout/back room button tapped | Mobile rooms | `G2NavigationSignalPayload` planned | LOW | SESSION | All | NONE | IMPLEMENTATION_PENDING | Current navigation unchanged. |

