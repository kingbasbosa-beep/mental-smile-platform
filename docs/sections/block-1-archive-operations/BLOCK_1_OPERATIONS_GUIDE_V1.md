# BLOCK_1_OPERATIONS_GUIDE_V1

Status: ACTIVE_GUIDE
Block: BLOCK 1 - Archive + Operations
Runtime Route: `/commercial/admin/operations`
Runtime Page: `Block1OperationsDashboardPage`

## Purpose

The Operations Dashboard is the execution memory timeline for Mental Smile.

It tracks operation evidence, registry/index presence, report presence, timeline grouping, and structural health.

## Source Model

Current source mode:

- `EXECUTED_OPERATIONS_INDEX_V1.md`
- `EXECUTED_OPERATIONS_REGISTRY_V1.md`
- Existing operation reports where referenced

## Dashboard Capabilities

- Latest operation counter
- Last updated counter
- Total operations counter
- This month counter
- This week counter
- Pending counter
- Search by operation number, ID, date, and keyword
- Filter by year, quarter, type, and result
- Timeline grouped by year, quarter, and month
- Health validation

## Validation Rules

Each operation is checked for:

- Registry Entry
- Index Entry
- Report
- Affected Modules
- Affected Files

Older records do not always contain structured affected files/modules. These are shown as warnings instead of being silently treated as valid. The current operation snapshot includes 266 indexed rows discovered from the operations index.

## Runtime Rules

- No Firebase dependency
- No Firestore dependency
- No automatic registry mutation from runtime
- No fake operation records
- No hidden completion status
