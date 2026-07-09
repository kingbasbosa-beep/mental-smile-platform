# RESIDENTIAL_ROUTE_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index active Residential routes for the future Residential Capsule.

## Active Routes

| Route Constant | Path | Screen | Entry / Owner | Status |
|---|---|---|---|---|
| `Routes.clientRoom` | `/client/room` | `ClientRoomPage` | Splash residential/client entry, Admin `SEC-RES` shortcut | ACTIVE |
| `Routes.accessibilityRoom` | `/accessibility/room` | `AccessibilityRoomPage` | Splash accessibility entry | ACTIVE |
| `Routes.accessibilityLinks` | `/accessibility/links` | `AccessibilityLinksPage` | Accessibility Room | ACTIVE |
| `Routes.accessibilityTools` | `/accessibility/tools` | `AccessibilityToolsPage` | Accessibility Room | ACTIVE |
| `Routes.accessibilitySuggestions` | `/accessibility/suggestions` | `AccessibilitySuggestionsPage` | Client / Accessibility Room | ACTIVE |
| `Routes.accessibilityCommunityTools` | `/accessibility/community-tools` | `AccessibilityCommunityToolsPage` | Client / Accessibility Room | ACTIVE |
| `Routes.accessibilityCheckin` | `/accessibility/checkin` | `AccessibilityCheckinPage` | Client / Accessibility Room | ACTIVE |
| `Routes.accessibilityMessageOfDay` | `/accessibility/message-of-the-day` | `AccessibilityMessageOfDayPage` | Accessibility Room note/message action | ACTIVE |
| `Routes.residentialExitSocialLinks` | `/residential/exit-social-links` | `ResidentialExitSocialPortalPage` | Client / Accessibility exit | ACTIVE |

## Active Cards

Route cards are documented in:

- `docs/sections/residential/pure-dna-gates/r13-final-connection-cards/RESIDENTIAL_ROUTE_CARD_REGISTRY_V1.md`
- `docs/sections/residential/pure-dna-gates/r6-navigation-network/RESIDENTIAL_ROUTE_NAVIGATION_MAP_V1.md`
- `docs/sections/residential/pure-dna-gates/r6-navigation-network/RESIDENTIAL_BUTTON_TO_ROUTE_MAP_V1.md`

## Active Signals

Screen and route navigation signals are documented by `R.S`, `R.B`, `R.C`, `R.X`, and related Residential signal families. Runtime Archive writes are limited to governed tool signals.

## Future Capsule Must Copy

Route constants, router cases, active screens, route card registry, route navigation maps, button-to-route maps.

## Future Capsule Must Exclude

Old portal routes, old commercial/client room confusion, deleted social link pages, chat routes, inactive placeholders.

Owner notes: Route snapshot is active-route only.

Current status: ACTIVE ROUTE SNAPSHOT.
