# BLOCK_1_ARCHIVE_OPERATIONS_MISSING_ITEMS_REPORT_V1

Status: ACTIVE_MISSING_SOURCE_REPORT
Block: BLOCK 1 - Archive + Operations

## Missing / Not Connected Sources

| Source | Status | Reason |
| --- | --- | --- |
| Live Archive Reader | NOT_CONNECTED_YET | Runtime currently uses generated local snapshot instead of live file indexing. |
| Archive File Browser | NOT_CONNECTED_YET | No governed runtime reader/writer contract exists yet. |
| Dynamic Checklist Generator | NOT_CONNECTED_YET | Generation actions require a governed writer, which is intentionally absent. |
| Missing Cards Generator | NOT_CONNECTED_YET | Document immutability requires controlled document creation; not connected in this block. |
| Missing Guides Generator | NOT_CONNECTED_YET | Document immutability requires controlled document creation; not connected in this block. |
| Missing Reports Generator | NOT_CONNECTED_YET | Document immutability requires controlled document creation; not connected in this block. |
| Report Export Engine | NOT_CONNECTED_YET | No export service exists for this module yet. |
| Full Operation Row Parser | PARTIAL | Older registry/index rows are not consistently structured for affected modules/files. |
| Capsule Source | NOT_CONNECTED_YET | No capsule source files were discovered in the snapshot. |

## Governance Note

No missing source was replaced with fake data. Runtime displays `Not Connected Yet` where an actual source is absent.

