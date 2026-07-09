# RESIDENTIAL_ROUTE_CARD_REGISTRY_V1

## Purpose

Register route cards for active Residential/Application routes documented in R6.

## Route Card Registry

| Route Card ID | Route Name | Route Path | Destination Screen | Source | Signal Code | Archive Magnet | Runtime Status | Review Status |
|---|---|---|---|---|---|---|---|---|
| RRC-001 | Routes.splash | `/splash` | Splash | App startup / return flows | R.S.001.VIEW | RB10 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-002 | Routes.clientRoom | `/client/room` | Client Room | Splash quick access | R.B.001.TAP | RB20 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-003 | Routes.accessibilityRoom | `/accessibility/room` | Accessibility Room | Splash accessibility access | R.B.002.TAP | RB20 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-004 | Routes.accessibilityCheckin | `/accessibility/checkin` | Accessibility Check-in | Client / Accessibility Room | R.C.001.OPEN / R.C.010.OPEN | RB30 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-005 | Routes.accessibilityCommunityTools | `/accessibility/community-tools` | Accessibility Community Tools | Client / Accessibility Room | R.C.002.OPEN / R.C.009.OPEN | RB30 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-006 | Routes.accessibilitySuggestions | `/accessibility/suggestions` | Accessibility Suggestions | Client / Accessibility Room | R.C.003.OPEN / R.C.008.OPEN | RB30 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-007 | Routes.accessibilityLinks | `/accessibility/links` | Accessibility Links | Accessibility Room | R.C.005.OPEN | RB30 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-008 | Routes.accessibilityTools | `/accessibility/tools` | Accessibility Tools | Accessibility Room | R.C.006.OPEN | RB30 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-009 | Routes.accessibilityMessageOfDay | `/accessibility/message-of-the-day` | Accessibility Message of the Day | Accessibility Room / message action | R.M.004.SELECT | RB100 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-010 | Routes.residentialExitSocialLinks | `/residential/exit-social-links` | Residential Exit Portal | Client / Accessibility Room | R.X.001.EXIT | RB130 | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| RRC-011 | Routes.supportIssueSelector | `/module/support-issue-selector` | Support Issue Selector | Support adjacency | R.P.001.OPEN | RB120 | ACTIVE_SUPPORT_ADJACENCY | ACTIVE_REVIEWED |

## Validation

Every Residential active route has route card: YES

Missing route cards: 0

## Final Status

RESIDENTIAL_ROUTE_CARD_REGISTRY_CREATED
