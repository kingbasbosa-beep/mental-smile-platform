# RESIDENTIAL_SCREEN_TO_CARD_NETWORK_V1

Status: ACTIVE

Gate: R6

Runtime Status: DOCUMENTED_ONLY

Purpose: Map Residential screens to their governed cards and navigation responsibilities.

---

## Screen to Card Network

| Screen | Route Path | Cards / Actions | Related UI Card | Related Signal Code | Destination | Owner | Review Status |
|---|---|---|---|---|---|---|---|
| Splash | /splash | Residential/client entry | R2-UI-BTN-001 | R.B.001.TAP | /client/room | Application UI Owner | ACTIVE_REVIEWED |
| Splash | /splash | Accessibility entry | R2-UI-BTN-002 | R.B.002.TAP | /accessibility/room | Accessibility Owner | ACTIVE_REVIEWED |
| Client Room | /client/room | Check-in card | R2-UI-CRD-001 | R.C.001.OPEN | /accessibility/checkin | Accessibility Owner | ACTIVE_REVIEWED |
| Client Room | /client/room | Community tools card | R2-UI-CRD-002 | R.C.002.OPEN | /accessibility/community-tools | Accessibility Owner | ACTIVE_REVIEWED |
| Client Room | /client/room | Suggestions card | R2-UI-CRD-003 | R.C.003.OPEN | /accessibility/suggestions | Support Owner | ACTIVE_REVIEWED |
| Client Room | /client/room | Personal tools dialog | R2-UI-TOL-001 | R.T.001.OPEN | Local dialog | Residential Tools Owner | ACTIVE_REVIEWED |
| Client Room | /client/room | Personal links dialog | R2-UI-LNK-001 | R.L.001.OPEN | Local dialog | Residential Resource Owner | ACTIVE_REVIEWED |
| Accessibility Room | /accessibility/room | Links card | R2-UI-CRD-005 | R.C.005.OPEN | /accessibility/links | Accessibility Resource Owner | ACTIVE_REVIEWED |
| Accessibility Room | /accessibility/room | Tools card | R2-UI-CRD-006 | R.C.006.OPEN | /accessibility/tools | Accessibility Tools Owner | ACTIVE_REVIEWED |
| Accessibility Room | /accessibility/room | Suggestions card | R2-UI-CRD-008 | R.C.008.OPEN | /accessibility/suggestions | Support Owner | ACTIVE_REVIEWED |
| Accessibility Room | /accessibility/room | Community tools card | R2-UI-CRD-009 | R.C.009.OPEN | /accessibility/community-tools | Accessibility Owner | ACTIVE_REVIEWED |
| Accessibility Room | /accessibility/room | Check-in card | R2-UI-CRD-010 | R.C.010.OPEN | /accessibility/checkin | Accessibility Owner | ACTIVE_REVIEWED |
| Accessibility Links | /accessibility/links | Resource link rows | R2-UI-LNK-004 | R.L.004.OPEN | External resource | Accessibility Resource Owner | ACTIVE_REVIEWED |
| Accessibility Tools | /accessibility/tools | Tool rows/categories | R2-UI-TOL-003 / R2-UI-TOL-006 | R.T.003.OPEN / R.T.006.OPEN | External/local resource | Accessibility Tools Owner | ACTIVE_REVIEWED |
| Accessibility Suggestions | /accessibility/suggestions | Suggestion submit/support channel | R2-UI-MIX-001 / R2-UI-APP-004 | R.G.001.SUBMIT / R.Q.004.OPEN | Suggestion channel | Support Owner | ACTIVE_REVIEWED |
| Accessibility Check-in | /accessibility/checkin | Specialist/Center/Library rows | R2-UI-LNK-005 to R2-UI-LNK-007 | R.L.005.OPEN to R.L.007.OPEN | Public/library routes | Accessibility Resource Owner | ACTIVE_REVIEWED |
| Accessibility Message of the Day | /accessibility/message-of-the-day | Message option | R2-UI-MOT-004 | R.M.004.SELECT | Same screen/local choice | Accessibility Content Owner | ACTIVE_REVIEWED |
| Accessibility Community Tools | /accessibility/community-tools | Community tools / return | R2-UI-TOL-004 / R2-UI-TOL-007 | R.T.004.OPEN / R.T.007.OPEN | Community/local/return | Accessibility Owner | ACTIVE_REVIEWED |
| Residential Exit Portal | /residential/exit-social-links | Exit / return | R2-UI-MIX-003 / R2-UI-LNK-008 | R.X.001.EXIT / R.L.008.OPEN | Exit or Splash | Residential UI Owner | ACTIVE_REVIEWED |

---

## Validation

Every active Residential screen has card/network documentation: YES

Missing card references: 0

Final Status: RESIDENTIAL_SCREEN_TO_CARD_NETWORK_CREATED

