# FIRESTORE_INDEX_PURIFICATION_REPORT_V1

Status: COMPLETE

## Remaining Indexes

| Collection Group | Fields | Reason |
|---|---|---|
| `signal_events` | `actorId`, `timestamp` | Supports active `SignalStorageService.watchLatestEvents` query shape. |

## Removed Indexes

| Collection Group | Reason |
|---|---|
| `chat_threads` | Removed chat rules and no active caller. |
| `messages` | Removed chat message rules and no active caller. |
| `support_requests` composite indexes | Active query does not use these composites. |
| `clinician_profile_change_requests` composite index | Active declaration review no longer uses this composite query. |
| `center_profile_change_requests` composite index | Active declaration review no longer uses this composite query. |

Final Status: FIRESTORE_INDEX_PURIFICATION_COMPLETE
