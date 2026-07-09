# APPLICATION_BUTTON_CARD_COVERAGE_MATRIX_V1

Status: COMPLETED

## Button / Card Coverage

| Surface | UI Label | Icon / Visual Marker | Audio Marker | Route / Action | Signal Expectation | Archive Expectation | Localization Key | Status |
|---|---|---|---|---|---|---|---|---|
| Splash | Quick Access | `Icons.flash_on_rounded` | Semantic "Audio label ready" | `/client/room` | `splash_button_clicked` | Splash route summary | Missing runtime key wiring | PARTIAL |
| Splash | Accessibility Access | `Icons.accessibility_new_rounded` | Semantic "Audio label ready" | `/accessibility/room` | `splash_button_clicked` | Splash route summary | Missing runtime key wiring | PARTIAL |
| Splash | Provider / Center / Owner Access | `Icons.business_center_outlined` | Semantic path only | `/commercial/access` | `splash_button_clicked` | Cross-section handoff summary | Missing runtime key wiring | PARTIAL |
| Splash | Official Website | `Icons.public_rounded` | Semantic path only | External URL | `official_website_clicked` | Website click summary | Missing runtime key wiring | PARTIAL |
| Splash | Language Toggle | Image asset / EN fallback | Tooltip only | Locale toggle | `language_changed` | Localization summary | Partial | PARTIAL |
| Client Room | طمنا عليك | Card image + leaf marker | `onSpeak` placeholder | `/accessibility/checkin` | `client_room_control_clicked` | Support/check-in summary | Hardcoded | PARTIAL |
| Client Room | تطبيقات وأدوات | Card image + marker | `onSpeak` placeholder | `/accessibility/community-tools` | `client_room_control_clicked` | Tools summary | Hardcoded | PARTIAL |
| Client Room | شاركنا باقتراح | Card image + marker | `onSpeak` placeholder | `/accessibility/suggestions` | `client_room_control_clicked` | Suggestion summary | Hardcoded | PARTIAL |
| Client Room | أدواتك | Card image + marker | `onSpeak` placeholder | Local dialog | `client_room_control_clicked` | Local tool summary | Hardcoded | PARTIAL |
| Client Room | لينكاتك | Card image + marker | `onSpeak` placeholder | Local dialog / external links | `links_card_opened` | Links summary | Hardcoded | PARTIAL |
| Client Room | Feather / Notebook | Asset button | `onSpeak` placeholder | Local dialog | `feather_tool_opened` | Notebook count summary only | Hardcoded | PARTIAL |
| Client Room | YouTube | Asset button | `onSpeak` placeholder | External URL | `external_link_clicked` | External destination summary | Hardcoded | PARTIAL |
| Client Room | Temporary Photo | Asset button | `onSpeak` placeholder | Local image picker | `client_room_control_clicked` | No raw image archive | Hardcoded | PARTIAL |
| Client Room | Exit Cup | Asset button + Accessibility Guide Icon | `onSpeak` placeholder | `/residential/exit-social-links` | `residential_exit_opened` | Exit summary | Hardcoded | PARTIAL |
| Accessibility Room | Links | Card image | Snackbar placeholder | `/accessibility/links` | `accessibility_card_clicked` | Links summary | Hardcoded | PARTIAL |
| Accessibility Room | Tools | Card image | Snackbar placeholder | `/accessibility/tools` | `accessibility_card_clicked` | Tools summary | Hardcoded | PARTIAL |
| Accessibility Room | Suggestions | Card image | Snackbar placeholder | `/accessibility/suggestions` | `accessibility_card_clicked` | Suggestion summary | Hardcoded | PARTIAL |
| Accessibility Room | Community Tools | Card image | Snackbar placeholder | `/accessibility/community-tools` | `accessibility_card_clicked` | Tools summary | Hardcoded | PARTIAL |
| Accessibility Room | Check-in | Card image | Snackbar placeholder | `/accessibility/checkin` | `accessibility_card_clicked` | Support/check-in summary | Hardcoded | PARTIAL |
| Accessibility Room | Feather / Message | Asset button | Snackbar placeholder | Local dialog | `feather_tool_opened` | Local count summary | Hardcoded | PARTIAL |
| Accessibility Room | YouTube | Asset button | Not fully unified | External URL | `external_link_clicked` | External destination summary | Hardcoded | PARTIAL |
| Accessibility Room | Temporary Photo | Asset button | Not fully unified | Local image picker | `accessibility_control_clicked` | No raw image archive | Hardcoded | PARTIAL |
| Accessibility Room | Exit Cup | Asset button + Accessibility Guide Icon | Not fully unified | `/residential/exit-social-links` | `residential_exit_opened` | Exit summary | Hardcoded | PARTIAL |
| Residential Exit | خروج | Text button | Not found | Return to `/splash` | `residential_return_to_splash_clicked` | Exit summary | Hardcoded | PARTIAL |

## Missing Button / Card Matrix

| Missing Item | Location | Classification | Reason |
|---|---|---|---|
| Direct button to `AccessibilityMessageOfDayPage` | Accessibility Room | Low cleanup | Route exists, but room uses local dialog instead |
| Admin visibility card for Application summaries | Admin / Owner | Critical before runtime | No runtime aggregation output exists |
| Archive view card for Application summaries | Archive/Admin | High before release | No archive destination writer exists |
| Localization/TTS health card | Admin / Monitoring | High before release | Localization readiness is partial |
| Complaint governance queue card | Governance Operations | High before release | Suggestion path is WhatsApp-only; complaint routing not unified |

Final Status: APPLICATION_BUTTON_CARD_COVERAGE_MATRIX_COMPLETED
