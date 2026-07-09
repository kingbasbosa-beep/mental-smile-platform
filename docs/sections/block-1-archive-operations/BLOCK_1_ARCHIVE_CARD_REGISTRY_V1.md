# BLOCK_1_ARCHIVE_CARD_REGISTRY_V1

Status: ACTIVE_CARD_REGISTRY
Block: BLOCK 1 - Archive + Operations

## Cards

| Card | Runtime Target | Status | Purpose |
| --- | --- | --- | --- |
| Operational Archive | `/commercial/admin/archive` | ACTIVE | Opens the searchable archive dashboard. |
| Operations Dashboard | `/commercial/admin/operations` | ACTIVE | Opens the executed operations dashboard. |
| Section Card | In-page section dashboard | ACTIVE | Opens overview, inventory, dependencies, health, and missing items for the selected section. |
| Run Audit | In-page action | NOT_CONNECTED_YET | Future audit runner entry; currently reports source not connected. |
| Generate Checklist | In-page action | NOT_CONNECTED_YET | Future checklist generator entry; currently reports source not connected. |
| Show Missing | In-page action | NOT_CONNECTED_YET | Future missing-source viewer entry; current missing list is visible in section dashboard. |
| Export Summary | In-page action | NOT_CONNECTED_YET | Future export entry; currently reports source not connected. |

## Governance

No card in this registry mutates archive documents. All generation actions remain disabled-by-source until a governed writer exists.

