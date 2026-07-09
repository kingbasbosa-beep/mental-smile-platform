# RESIDENTIAL_INACTIVE_PAGE_AND_ROUTE_REFERENCE_MAP_V1

Status: ACTIVE

Gate: R8

Runtime Status: DOCUMENTATION_ONLY

Purpose: Classify inactive Residential pages and stale route references.

---

## Inactive Page / Route Reference Map

| Item | Evidence | Active Route? | Classification | Reason | Later Action |
|---|---|---|---|---|---|
| `ResidentialExitSocialPortalPage` | Router imports/builds this page | YES | ACTIVE_PROTECTED | Current `/residential/exit-social-links` page. | Do not touch. |
| Old Residential exit social links page | File removed; router does not build it | NO | REMOVED_DURING_PLATFORM_RUNTIME_PURIFICATION | Old exit/social page no longer routed. | No active runtime authority remains. |
| Old Residential exit social links polished page | File removed; router does not build it | NO | REMOVED_DURING_PLATFORM_RUNTIME_PURIFICATION | Superseded polished variant. | No active runtime authority remains. |
| `docs/sections/residential/RESIDENTIAL_RUNTIME_GUIDE_V1.md` polished-page route reference | `rg` found polished page reference | N/A | SUPERSEDED_BY_R_GATE | Stale documentation only. | New version/pointer later if immutable governance requires. |
| `docs/sections/application/APPLICATION_SECTION_ROUTE_HEALTH_REPORT_V1.md` old page reference | `rg` found `ResidentialExitSocialLinksPage` | N/A | SUPERSEDED_BY_R_GATE | Historical route report no longer current. | Keep as history. |
| `docs/constitutional-baseline/cards/active-runtime/ACTIVE_RUNTIME_CARD_MEMORY_RECONCILIATION_V1.md` polished page reference | `rg` found polished page reference | N/A | OWNER_DECISION_REQUIRED | Active-runtime memory may need new immutable version, not silent edit. | Owner decision for supersession document. |
| Support Issue Selector / Chat | Route-proven active support adjacency | YES | ACTIVE_PROTECTED | Shared support flow, not Residential-only cleanup target. | Do not touch in R8. |

---

## Validation

Broken navigation references in active runtime: 0

Inactive route/page candidates classified: YES

Final Status: RESIDENTIAL_INACTIVE_PAGE_AND_ROUTE_REFERENCE_MAP_CREATED
