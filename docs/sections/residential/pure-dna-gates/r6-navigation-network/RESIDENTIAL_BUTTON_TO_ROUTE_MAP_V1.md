# RESIDENTIAL_BUTTON_TO_ROUTE_MAP_V1

Status: ACTIVE

Gate: R6

Runtime Status: DOCUMENTED_ONLY

Purpose: Document button/action-to-route mappings for active Residential navigation.

---

## Button to Route Map

| Button / Action | Source Screen | Route Name | Route Path | Destination | Related UI Card | Related Signal Code | Related Signal Card | Archive Magnet | Owner | Runtime Status | Review Status |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Residential/client entry | Splash | Routes.clientRoom | /client/room | Client Room | R2-UI-BTN-001 | R.B.001.TAP | R2-SIG-011 | RB20 | Application UI Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Accessibility entry | Splash | Routes.accessibilityRoom | /accessibility/room | Accessibility Room | R2-UI-BTN-002 | R.B.002.TAP | R2-SIG-012 | RB20 | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Check-in card | Client Room | Routes.accessibilityCheckin | /accessibility/checkin | Accessibility Check-in | R2-UI-CRD-001 | R.C.001.OPEN | R2-SIG-025 | RB30 | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Community tools card | Client Room | Routes.accessibilityCommunityTools | /accessibility/community-tools | Accessibility Community Tools | R2-UI-CRD-002 | R.C.002.OPEN | R2-SIG-026 | RB30 | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Suggestions card | Client Room | Routes.accessibilitySuggestions | /accessibility/suggestions | Accessibility Suggestions | R2-UI-CRD-003 | R.C.003.OPEN | R2-SIG-027 | RB30 | Support Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Exit cup/action | Client Room | Routes.residentialExitSocialLinks | /residential/exit-social-links | Residential Exit Portal | R2-UI-MIX-003 | R.X.001.EXIT | R2-SIG-091 | RB130 | Residential UI Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Links card | Accessibility Room | Routes.accessibilityLinks | /accessibility/links | Accessibility Links | R2-UI-CRD-005 | R.C.005.OPEN | R2-SIG-029 | RB30 | Accessibility Resource Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Tools card | Accessibility Room | Routes.accessibilityTools | /accessibility/tools | Accessibility Tools | R2-UI-CRD-006 | R.C.006.OPEN | R2-SIG-030 | RB30 | Accessibility Tools Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Suggestions card | Accessibility Room | Routes.accessibilitySuggestions | /accessibility/suggestions | Accessibility Suggestions | R2-UI-CRD-008 | R.C.008.OPEN | R2-SIG-032 | RB30 | Support Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Community tools card | Accessibility Room | Routes.accessibilityCommunityTools | /accessibility/community-tools | Accessibility Community Tools | R2-UI-CRD-009 | R.C.009.OPEN | R2-SIG-033 | RB30 | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Check-in card | Accessibility Room | Routes.accessibilityCheckin | /accessibility/checkin | Accessibility Check-in | R2-UI-CRD-010 | R.C.010.OPEN | R2-SIG-034 | RB30 | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Exit cup/action | Accessibility Room | Routes.residentialExitSocialLinks | /residential/exit-social-links | Residential Exit Portal | R2-UI-MIX-003 | R.X.001.EXIT | R2-SIG-091 | RB130 | Residential UI Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Specialist support row | Accessibility Check-in | Route-proven public/support destination | Existing public route | Specialist support content | R2-UI-LNK-005 | R.L.005.OPEN | R2-SIG-073 | RB70 | Accessibility Resource Owner | ACTIVE_ROUTE_REFERENCE | ACTIVE_REVIEWED |
| Center support row | Accessibility Check-in | Route-proven public/support destination | Existing public route | Center support content | R2-UI-LNK-006 | R.L.006.OPEN | R2-SIG-074 | RB70 | Accessibility Resource Owner | ACTIVE_ROUTE_REFERENCE | ACTIVE_REVIEWED |
| Library support row | Accessibility Check-in | Route-proven public/support destination | Existing public route | Library resources | R2-UI-LNK-007 | R.L.007.OPEN | R2-SIG-075 | RB70 | Library Resource Owner | ACTIVE_ROUTE_REFERENCE | ACTIVE_REVIEWED |
| Exit return action | Residential Exit Portal | Routes.splash | /splash | Splash | R2-UI-LNK-008 | R.L.008.OPEN | R2-SIG-076 | RB130 | Residential UI Owner | ACTIVE_ROUTE_REFERENCE | ACTIVE_REVIEWED |

---

## Validation

Every navigation action has source and destination: YES

Missing route references: 0

Final Status: RESIDENTIAL_BUTTON_TO_ROUTE_MAP_CREATED

