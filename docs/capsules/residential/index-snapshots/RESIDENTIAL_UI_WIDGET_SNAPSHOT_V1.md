# RESIDENTIAL_UI_WIDGET_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index active Residential UI surfaces and widgets.

## Active UI Surfaces

| Surface | File | Purpose | Status |
|---|---|---|---|
| Client Room | `lib/features/client/presentation/pages/client_room_page.dart` | Quick Access Room, cards, notebook/feather, links/tools dialogs, exit | ACTIVE |
| Accessibility Room | `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | Accessibility support room and child navigation | ACTIVE |
| Accessibility Links | `accessibility_links_page.dart` | Important links/resources | ACTIVE |
| Accessibility Tools | `accessibility_tools_page.dart` | Assistive tools/resources | ACTIVE |
| Accessibility Suggestions | `accessibility_suggestions_page.dart` | Suggestion path | ACTIVE |
| Accessibility Community Tools | `accessibility_community_tools_page.dart` | Community tools/resources | ACTIVE |
| Accessibility Check-in | `accessibility_checkin_page.dart` | Check-in flow | ACTIVE |
| Message of the Day | `accessibility_message_of_day_page.dart` | Local message selection | ACTIVE |
| Residential Exit Portal | `residential_exit_social_portal_page.dart` | Warm exit / public links | ACTIVE |

## Active UI Elements

- Quick Access wall cards
- Feather note / local notebook behavior
- Coffee/exit affordances
- Residential links/tools dialogs
- Loved image / image anchor behavior if present in active room state
- Audio/headphone visual support icons
- Accessibility Guide visual/audio markers

## Active Cards / Signals

UI element coverage is indexed in `RESIDENTIAL_UI_ELEMENT_SIGNAL_CARD_REGISTRY_V1.md`. Runtime screen view signals use `R.S.*`; UI/card/docs signal families use `R.B`, `R.C`, `R.A`, `R.T`, `R.L`, `R.N`, `R.I`, `R.M`, `R.X`.

## Future Capsule Must Copy

Active UI files, referenced shared UI helpers, referenced assets, localization keys, and UI card/signal registries.

## Future Capsule Must Exclude

Old menu pages, deleted session rooms, inactive accessibility hub/list pages, placeholder-only screens, old chat or contact request UI.

Owner notes: Preserve warm, personal, non-clinical Residential language. Do not introduce diagnosis or identity collection.

Current status: ACTIVE UI/WIDGET SNAPSHOT.
