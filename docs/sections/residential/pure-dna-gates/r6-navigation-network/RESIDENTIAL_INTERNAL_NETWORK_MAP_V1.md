# RESIDENTIAL_INTERNAL_NETWORK_MAP_V1

Status: ACTIVE

Gate: R6

Runtime Status: DOCUMENTED_ONLY

Purpose: Document the Residential internal navigation network as a governed graph.

---

## Internal Network

| Network Node | Connected To | Connection Type | Trigger | Related Route | Related Signal Family | Owner | Review Status |
|---|---|---|---|---|---|---|---|
| Splash | Client Room | Entry | Residential/client button | /client/room | R.B / R.S | Application UI Owner | ACTIVE_REVIEWED |
| Splash | Accessibility Room | Entry | Accessibility button | /accessibility/room | R.B / R.S | Accessibility Owner | ACTIVE_REVIEWED |
| Client Room | Accessibility Check-in | Quick Access | Check-in card | /accessibility/checkin | R.C | Accessibility Owner | ACTIVE_REVIEWED |
| Client Room | Accessibility Community Tools | Quick Access | Community tools card | /accessibility/community-tools | R.C / R.T | Accessibility Owner | ACTIVE_REVIEWED |
| Client Room | Accessibility Suggestions | Quick Access | Suggestions card | /accessibility/suggestions | R.C / R.G | Support Owner | ACTIVE_REVIEWED |
| Client Room | Residential Exit Portal | Exit | Cup/exit action | /residential/exit-social-links | R.X | Residential UI Owner | ACTIVE_REVIEWED |
| Accessibility Room | Accessibility Links | Room card | Links card | /accessibility/links | R.C / R.L | Accessibility Resource Owner | ACTIVE_REVIEWED |
| Accessibility Room | Accessibility Tools | Room card | Tools card | /accessibility/tools | R.C / R.T | Accessibility Tools Owner | ACTIVE_REVIEWED |
| Accessibility Room | Accessibility Suggestions | Room card | Suggestions card | /accessibility/suggestions | R.C / R.G | Support Owner | ACTIVE_REVIEWED |
| Accessibility Room | Accessibility Community Tools | Room card | Community tools card | /accessibility/community-tools | R.C / R.T | Accessibility Owner | ACTIVE_REVIEWED |
| Accessibility Room | Accessibility Check-in | Room card | Check-in card | /accessibility/checkin | R.C | Accessibility Owner | ACTIVE_REVIEWED |
| Accessibility Room | Residential Exit Portal | Exit | Cup/exit action | /residential/exit-social-links | R.X | Residential UI Owner | ACTIVE_REVIEWED |
| Accessibility Check-in | Public Library / Specialist / Center destinations | Internal/public support adjacency | resource rows | Existing public/library routes | R.L | Accessibility Resource Owner | ACTIVE_REVIEWED |
| Support Flow | Support Issue Selector / Chat | Route-proven support adjacency | support action | /module/support-issue-selector / /chat | R.P | Support Owner | ACTIVE_REVIEWED |
| Residential Exit Portal | Splash / external app close behavior | Return/exit | return/exit control | /splash where applicable | R.X / R.L | Residential UI Owner | ACTIVE_REVIEWED |

---

## Network Rule

This document does not create routes. It describes active and route-proven Residential navigation relationships.

Final Status: RESIDENTIAL_INTERNAL_NETWORK_MAP_CREATED

