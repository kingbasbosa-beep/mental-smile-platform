# RESIDENTIAL_COLLECTION_OWNERSHIP_REGISTRY_V1

Status: ACTIVE_OWNERSHIP_REGISTRY
Phase: 8B
Runtime effect: none

| Entry | Owner | Consumers | Dependencies | Signals | Collections | Status | Lifecycle | Classification |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `clients` | Archive/System | Archived client identity | none | none | `clients` | ARCHIVED_HARD_REMOVED | Runtime archive | PURE_CLIENT_IDENTITY_REMOVED |
| `saved_destinations` | Archive/System | Archived discovery save actions | OP-SAVED-DESTINATIONS-EXTRACTION-V1 | none | none | REMOVED_FROM_RUNTIME | Runtime archive | FRESH_SIGNALS_DOCTRINE_REMOVAL |
| `support_requests` | Client/Support Observer | Support Room, Monitoring | Firestore, support selector | support/risk/technical | `support_requests` | ACTIVE | Runtime | CROSS_DOMAIN |
| `chat_threads` | Client/System | Removed chat runtime | none | none | none | REMOVED_FROM_FIRESTORE_RULES | Runtime removed | CHAT_RUNTIME_REMOVED |
| `chat_threads/{threadId}/messages` | Client/System | Removed chat runtime | none | none | none | REMOVED_FROM_FIRESTORE_RULES | Runtime removed | CHAT_RUNTIME_REMOVED |
| `signal_events` | System/Monitoring | Session surfaces, Monitoring | Signal storage | signal packages | `signal_events` | ACTIVE_SESSION_SCOPED | Runtime | CROSS_DOMAIN |
