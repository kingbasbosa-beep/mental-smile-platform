# RESIDENTIAL_ROUTE_NAVIGATION_MAP_V1

Status: ACTIVE

Gate: R6

Runtime Status: DOCUMENTED_ONLY

Purpose: Govern Residential route and navigation documentation without changing routes.

---

## Route Navigation Map

| Route Name | Route Path | Source Screen | Destination Screen | Triggering UI Element | Related UI Card | Related Signal Code | Related Signal Card | Archive Magnet | Aggregation Destination | Strategic Summary Destination | Owner | Runtime Status | Review Status |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Routes.splash | /splash | App startup / return flows | Splash | startup / return | R2-UI-SCR-001 | R.S.001.VIEW | R2-SIG-001 | RB10 | Residential Screen Presence Aggregation | Residential Experience Coverage Summary | Application UI Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.clientRoom | /client/room | Splash | Client Room | Client / Residential entry button | R2-UI-BTN-001 | R.B.001.TAP | R2-SIG-011 | RB20 | Residential Button Intent Aggregation | Residential Intent Summary | Application UI Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.accessibilityRoom | /accessibility/room | Splash | Accessibility Room | Accessibility entry button | R2-UI-BTN-002 | R.B.002.TAP | R2-SIG-012 | RB20 | Residential Button Intent Aggregation | Accessibility Demand Summary | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.accessibilityCheckin | /accessibility/checkin | Client Room / Accessibility Room | Accessibility Check-in | Check-in / support card | R2-UI-CRD-001 / R2-UI-CRD-010 | R.C.001.OPEN / R.C.010.OPEN | R2-SIG-025 / R2-SIG-034 | RB30 | Residential Card Engagement Aggregation | Residential Feature Demand Summary | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.accessibilityCommunityTools | /accessibility/community-tools | Client Room / Accessibility Room | Accessibility Community Tools | Community tools card | R2-UI-CRD-002 / R2-UI-CRD-009 | R.C.002.OPEN / R.C.009.OPEN | R2-SIG-026 / R2-SIG-033 | RB30 | Residential Card Engagement Aggregation | Residential Feature Demand Summary | Accessibility Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.accessibilitySuggestions | /accessibility/suggestions | Client Room / Accessibility Room | Accessibility Suggestions | Suggestions card | R2-UI-CRD-003 / R2-UI-CRD-008 | R.C.003.OPEN / R.C.008.OPEN | R2-SIG-027 / R2-SIG-032 | RB30 | Residential Card Engagement Aggregation | Improvement Request Summary | Accessibility / Support Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.accessibilityLinks | /accessibility/links | Accessibility Room | Accessibility Links | Links card | R2-UI-CRD-005 | R.C.005.OPEN | R2-SIG-029 | RB30 | Residential Card Engagement Aggregation | Resource Discovery Summary | Accessibility Resource Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.accessibilityTools | /accessibility/tools | Accessibility Room | Accessibility Tools | Tools card | R2-UI-CRD-006 | R.C.006.OPEN | R2-SIG-030 | RB30 | Residential Card Engagement Aggregation | Residential Tool Utility Summary | Accessibility Tools Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.accessibilityMessageOfDay | /accessibility/message-of-the-day | Accessibility Room / Message link | Accessibility Message of the Day | Motivation/message action | R2-UI-MOT-004 | R.M.004.SELECT | R2-SIG-088 | RB100 | Residential Motivation Aggregation | Motivation Content Summary | Accessibility Content Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.residentialExitSocialLinks | /residential/exit-social-links | Client Room / Accessibility Room | Residential Exit Portal | Exit cup/button | R2-UI-MIX-003 | R.X.001.EXIT | R2-SIG-091 | RB130 | Residential Exit Aggregation | Exit and Return Pattern Summary | Residential UI Owner | ACTIVE_ROUTE | ACTIVE_REVIEWED |
| Routes.supportIssueSelector | /module/support-issue-selector | Support entry / route-proven support flow | Support Issue Selector | support flow action | R2-UI-MIX-002 | R.P.001.OPEN | R2-SIG-090 | RB120 | Residential Complaint Support Aggregation | Support Risk Summary | Support Owner | ACTIVE_SUPPORT_ADJACENCY | ACTIVE_REVIEWED |

---

## Validation

Every active Residential screen has route/navigation documentation: YES

Missing route references: 0

Broken navigation references: 0

Final Status: RESIDENTIAL_ROUTE_NAVIGATION_MAP_CREATED
