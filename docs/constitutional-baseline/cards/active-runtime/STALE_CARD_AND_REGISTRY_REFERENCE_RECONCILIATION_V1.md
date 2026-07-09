# STALE_CARD_AND_REGISTRY_REFERENCE_RECONCILIATION_V1

Date: 2026-06-26

Operation ID: OP-ARCHIVE-OPERATIONS-REGISTRY-AND-CARD-MEMORY-RECONCILIATION-V1

Runtime effect: none

## Corrected Active Registries

| File | Correction |
|---|---|
| `docs/constitutional-baseline/registries/COMMERCIAL_ROUTE_OWNERSHIP_REGISTRY_V1.md` | Marked old specialists/centers routes as `REMOVED_FROM_RUNTIME`; added current Commercial clean room routes. |
| `docs/constitutional-baseline/registries/COMMERCIAL_COLLECTION_OWNERSHIP_REGISTRY_V1.md` | Marked `provider_contact_requests` and `center_contact_requests` as `REMOVED_FROM_RUNTIME`; clarified `clinicians` and `centers` are no longer old discovery reads. |
| `docs/constitutional-baseline/registries/COMMERCIAL_SIGNAL_OWNERSHIP_REGISTRY_V1.md` | Marked old provider/center contact and accessible contact signals as `REMOVED_FROM_RUNTIME`. |
| `docs/constitutional-baseline/registries/RESIDENTIAL_ROUTE_OWNERSHIP_REGISTRY_V1.md` | Marked `/menu`, `/home`, `/language`, and `/client/session-room` as removed; added `/client/room`. |
| `docs/constitutional-baseline/registries/COLLECTION_REGISTRY_V1.md` | Marked old contact request collections as removed and clarified `clinicians`/`centers` non-discovery status. |
| `docs/constitutional-baseline/registries/SIGNAL_OWNERSHIP_REGISTRY_V1.md` | Reclassified provider/center contact signal families as removed from runtime. |
| `docs/constitutional-baseline/registries/SIGNAL_GOVERNANCE_REGISTRY_V1.md` | Updated commercial and accessible communication signal governance after old discovery/contact removal. |

## Stale References Retained As History

The following references were not edited because they are reports, archive-history evidence, or old audit snapshots:

- Historical Commercial V1/V2 reports under `docs/commercial/`.
- Archived Commercial block under `docs/archive/platform-extraction/history/commercial/`.
- Archived Administrative forensic reports under `docs/archive/platform-extraction/history/administrative/`.
- Older audits under `docs/audits/`.
- Old Owner reports superseded by `LEGACY_OWNER_RUNTIME_ARCHIVE_AND_ACTIVE_REMOVAL_REPORT_V1.md`.

## Removed Runtime References Corrected

| Reference | Current Status |
|---|---|
| `/menu` | REMOVED_FROM_RUNTIME |
| `/home` | REMOVED_FROM_RUNTIME |
| `/language` | REMOVED_FROM_RUNTIME |
| `/module/specialists` | REMOVED_FROM_RUNTIME |
| `/module/specialists/list` | REMOVED_FROM_RUNTIME |
| `/module/specialists/details` | REMOVED_FROM_RUNTIME |
| `/module/centers` | REMOVED_FROM_RUNTIME |
| `/module/centers/list` | REMOVED_FROM_RUNTIME |
| `/module/centers/details` | REMOVED_FROM_RUNTIME |
| old Owner `/s/owner*` | REMOVED_FROM_RUNTIME |
| `provider_contact_requests` active discovery flow | REMOVED_FROM_RUNTIME |
| `center_contact_requests` active discovery flow | REMOVED_FROM_RUNTIME |

## Supersession Notes

- Old Menu/Specialists/Centers are superseded by Library Provider Content branches and current clean Commercial rooms.
- Old textual Owner runtime is superseded by visual Owner Operational Room at `/commercial/admin/room`.
- Old Commercial V1/V2 runtime is archive history; current Commercial is empty clean room foundation.
