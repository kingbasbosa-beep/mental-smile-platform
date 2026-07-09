# FIRESTORE_COLLECTION_OWNERSHIP_MATRIX_V1

Status: COMPLETE

## Active Collection Ownership

| Collection | Owner | Runtime Status | Notes |
|---|---|---|---|
| `archive_signal_events` | Archive | ACTIVE | Only governed runtime signal collection for CV2, Residential tools, Library, Provider Display. |
| `clinicians` | Clinician / Declaration Review | ACTIVE_RESTRICTED | Account access and declaration observation. |
| `centers` | Center / Declaration Review | ACTIVE_RESTRICTED | Account access and declaration observation. |
| `clinician_profile_change_requests` | Declaration Review | READ_ONLY_ACTIVE | Client create/update closed. |
| `center_profile_change_requests` | Declaration Review | READ_ONLY_ACTIVE | Client create/update closed. |
| `support_requests` | Support Observer / Residential | ACTIVE_RESTRICTED | Structured support submission and read-only support observation. |
| `system_domains` | Owner / Registry Steward | READ_ONLY_ACTIVE | Governance status observation. |
| `signal_events` | Legacy Signal Service | ACTIVE_RESTRICTED_PENDING_ARCHIVE_MIGRATION | Still referenced by active fail-soft support signal runtime. |

## Removed From Active Rule Authority

| Collection | Status |
|---|---|
| `provider_contact_requests` | REMOVED_FROM_RULES |
| `center_contact_requests` | REMOVED_FROM_RULES |
| `chat_threads` | REMOVED_FROM_RULES |
| `chat_threads/{threadId}/messages` | REMOVED_FROM_RULES |
| `chat_escalations` | REMOVED_FROM_RULES |
| `chat_escalations/{escalationId}/reports` | REMOVED_FROM_RULES |
| `signal_aggregates` | REMOVED_FROM_RULES |

Final Status: COLLECTION_OWNERSHIP_PURIFIED
