# Collection Registry V1

Status: ACTIVE_BASELINE_REGISTRY
Classification: EXISTING_HISTORICAL_PROMOTE
Runtime effect: none

## Historical References

- `mental-smile-os-workspace/docs/mental-smile-os/pure-runtime/ACTIVE_RUNTIME_COLLECTION_REGISTRY_V1.md`
- historical references to `GENERATION_1_APPROVED_COLLECTION_REGISTRY_V1`

## Baseline Collections

| Collection | Status |
| --- | --- |
| `clients` | ARCHIVED_HARD_REMOVED |
| `clinicians` | ACTIVE_NON_DISCOVERY |
| `centers` | ACTIVE_NON_DISCOVERY |
| `provider_contact_requests` | REMOVED_FROM_RUNTIME |
| `center_contact_requests` | REMOVED_FROM_RUNTIME |
| `saved_destinations` | ARCHIVED_REMOVED_FROM_RUNTIME |
| `support_requests` | ACTIVE |
| `chat_threads` | REMOVED_FROM_FIRESTORE_RULES |
| `chat_threads/{threadId}/messages` | REMOVED_FROM_FIRESTORE_RULES |
| `chat_escalations` | REMOVED_FROM_FIRESTORE_RULES |
| `chat_escalations/{escalationId}/reports` | REMOVED_FROM_FIRESTORE_RULES |
| `signal_events` | ACTIVE |
| `signal_aggregates` | REMOVED_FROM_FIRESTORE_RULES |
| `system_domains` | ACTIVE_GOVERNANCE |
| `ai_policies` | SHADOW |
| `analytics_summaries` | SHADOW_OPS |
| `booking_requests` | ARCHIVE_CANDIDATE |
| `tool_registry` | UNKNOWN |

## Ghost Infrastructure Archival Guide Collection Notes

| Collection / Collection Name | Status | Related Guide | Related Operation | Note |
| --- | --- | --- | --- | --- |
| `saved_destinations` | REMOVED_FROM_RUNTIME | `ARCHIVE_CARD_SAVED_DESTINATIONS_V1.md` | OP-SAVED-DESTINATIONS-EXTRACTION-V1 | Owner decided to remove stored destination memory; Firestore rules, repository/model, save UI, and runtime signal producer were removed pending manual verification. |
| `provider_contact_requests` | REMOVED_FROM_RUNTIME | `OLD_MENU_SPECIALISTS_CENTERS_UI_SHELL_ARCHIVE_AND_RUNTIME_REMOVAL_REPORT_V1.md` | OP-OLD-MENU-SPECIALISTS-CENTERS-RUNTIME-REMOVAL-V1 | Old specialist details contact flow and ContactRequestRepository were removed from active runtime. |
| `center_contact_requests` | REMOVED_FROM_RUNTIME | `OLD_MENU_SPECIALISTS_CENTERS_UI_SHELL_ARCHIVE_AND_RUNTIME_REMOVAL_REPORT_V1.md` | OP-OLD-MENU-SPECIALISTS-CENTERS-RUNTIME-REMOVAL-V1 | Old center details contact flow and ContactRequestRepository were removed from active runtime. |
| `signal_aggregates` | REMOVED_FROM_FIRESTORE_RULES | `PLATFORM_FIREBASE_PURIFICATION_REPORT_V1.md` | OP-PLATFORM-FINAL-FIREBASE-PURIFICATION-BLOCK-B-V1 | No active runtime caller; read-only rule branch removed during final Firebase purification. |
| `chat_threads` | REMOVED_FROM_FIRESTORE_RULES | `PLATFORM_FIREBASE_PURIFICATION_REPORT_V1.md` | OP-PLATFORM-FINAL-FIREBASE-PURIFICATION-BLOCK-B-V1 | No active routed chat runtime or caller remained in current production sections. |
| `chat_escalations` | REMOVED_FROM_FIRESTORE_RULES | `PLATFORM_FIREBASE_PURIFICATION_REPORT_V1.md` | OP-PLATFORM-FINAL-FIREBASE-PURIFICATION-BLOCK-B-V1 | No active routed escalation runtime or caller remained in current production sections. |
| `accessibility_resources` | ARCHIVAL_CARD_CREATED_PENDING_OWNER_DECISION | `GHOST_INFRASTRUCTURE_ARCHIVAL_GUIDE_V1.md` | OP-GHOST-INFRASTRUCTURE-ARCHIVAL-GUIDE-V1 | Model collection name exists while current accessibility resources are static sample data. |
| `ai_policies` | OWNER_DECISION_REQUIRED | `GHOST_INFRASTRUCTURE_ARCHIVAL_GUIDE_V1.md` | OP-GHOST-INFRASTRUCTURE-ARCHIVAL-GUIDE-V1 | Registry/seeder references exist without a confirmed Firestore rule path in the Purpose Null Audit. |

## Rule

No collection creation, deletion, or rule change before Owner-approved collection governance.
