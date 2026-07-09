# APPLICATION_ROUTE_AND_NAVIGATION_MAP_V1

Status: COMPLETED

## Active Route Map

| Route Name | Route Path | Source Page / Button | Destination Page | Status | Owner Section | Connected Buttons | Missing Buttons | Admin / Owner Visible |
|---|---|---|---|---|---|---|---|---|
| `Routes.splash` | `/splash` | App fallback / exit return | `SplashPage` | ACTIVE | Application | Exit return, unauthorized fallback | None found | Not as Application dashboard |
| `Routes.clientRoom` | `/client/room` | Splash Quick Access | `ClientRoomPage` | ACTIVE | Application / Client | Splash Quick Access | None found | Not visible as admin metric |
| `Routes.accessibilityRoom` | `/accessibility/room` | Splash Accessibility Access | `AccessibilityRoomPage` | ACTIVE | Application / Accessibility | Splash Accessibility | None found | Not visible as admin metric |
| `Routes.residentialExitSocialLinks` | `/residential/exit-social-links` | Client / Accessibility exit cup | `ResidentialExitSocialPortalPage` | ACTIVE | Application / Residential Exit | Exit cup | None found | Not visible as admin metric |
| `Routes.accessibilityLinks` | `/accessibility/links` | Accessibility links card | `AccessibilityLinksPage` | ACTIVE | Accessibility | Accessibility Room Links | No Client direct route; Client uses dialog links | Not visible |
| `Routes.accessibilityTools` | `/accessibility/tools` | Accessibility tools card | `AccessibilityToolsPage` | ACTIVE | Accessibility | Accessibility Room Tools | Client tools is local dialog | Not visible |
| `Routes.accessibilitySuggestions` | `/accessibility/suggestions` | Client / Accessibility suggestions card | `AccessibilitySuggestionsPage` | ACTIVE | Accessibility / Suggestion | Suggestions cards | None found | Not visible as governance queue |
| `Routes.accessibilityCommunityTools` | `/accessibility/community-tools` | Client / Accessibility community tools card | `AccessibilityCommunityToolsPage` | ACTIVE | Accessibility | Community tools cards | None found | Not visible |
| `Routes.accessibilityCheckin` | `/accessibility/checkin` | Client / Accessibility check-in card | `AccessibilityCheckinPage` | ACTIVE | Accessibility / Support | Check-in cards | None found | Not visible |
| `Routes.accessibilityMessageOfDay` | `/accessibility/message-of-the-day` | Route registered | `AccessibilityMessageOfDayPage` | ACTIVE | Accessibility | No direct room navigation found; room uses dialog | Button gap | Not visible |
| `Routes.commercialAccess` | `/commercial/access` | Splash Provider / Center / Owner Access | Commercial Access | ACTIVE external-to-scope | Commercial | Splash commercial access | None in Application | Not Application-owned |

## Legacy / Archive-Only Route References

| Route | Status | Audit Note |
|---|---|---|
| `/login` | ARCHIVE_ONLY in Application docs | Legacy email login retired; app router redirects unauthorized users to Splash |
| `/language` | Removed/legacy by prior operation | Not part of active Application route map |
| `/menu`, `/home`, `/module/specialists`, `/module/centers` | Removed legacy menu block | Must not return as Application entry |

## Navigation Findings

- Active Application navigation exists.
- Route-to-page mapping exists for all inspected active routes.
- Navigation does not emit Application section signals.
- Navigation does not update Application aggregation.
- Navigation does not produce archive snapshots.

Final Status: APPLICATION_ROUTE_AND_NAVIGATION_MAP_COMPLETED
