# RESIDENTIAL_OWNER_DECISION_ITEMS_V1

Status: ACTIVE

Gate: R8

Runtime Status: DOCUMENTATION_ONLY

Purpose: List Residential residue items that require Owner decision before any future cleanup.

---

## Owner Decision Items

| Item | Classification | Decision Needed | Reason |
|---|---|---|---|
| Whether to archive inactive exit page Dart files | OWNER_DECISION_REQUIRED | Archive later vs keep in runtime tree as historical fallback. | They are not routed, but source deletion/archive should be deliberate. |
| Whether to create new immutable versions of stale route/runtime docs | OWNER_DECISION_REQUIRED | Create superseding docs vs leave R5/R6 as canonical pointer only. | Immutable documentation rule discourages silent edits. |
| Whether to move old Residential section reports to archive/history | OWNER_DECISION_REQUIRED | Archive active-section copies later. | Many already have archive/history copies or are superseded. |
| Cross-labeled client/accessibility room assets | OWNER_DECISION_REQUIRED | Rename/reorganize later vs keep as-is. | Asset names may be historical but active. |
| Duplicate avatar/audio category assets | OWNER_DECISION_REQUIRED | Run dedicated asset usage audit later. | Cannot mark unused without visual/runtime asset proof. |
| Monitoring Residential files | DO_NOT_TOUCH | No cleanup decision in R8. | Monitoring/runtime architecture may depend on them. |
| Support Issue Selector / Chat adjacency | DO_NOT_TOUCH | No cleanup decision in R8. | Shared support flow, not Residential-only residue. |

---

## Validation

Owner-decision items are explicit: YES

Unknown residue: 0

Final Status: RESIDENTIAL_OWNER_DECISION_ITEMS_CREATED

