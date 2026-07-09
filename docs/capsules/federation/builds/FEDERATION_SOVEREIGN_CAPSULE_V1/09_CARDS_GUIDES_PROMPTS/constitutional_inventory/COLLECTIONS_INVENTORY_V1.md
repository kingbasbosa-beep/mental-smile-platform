# COLLECTIONS_INVENTORY_V1

Status: ACTIVE_INVENTORY
Phase: 6
Runtime effect: none

| Collection | Purpose | Owner | Status |
| --- | --- | --- | --- |
| `clients` | Client profiles and personal-space entry | Client/System | ARCHIVED_HARD_REMOVED |
| `clinicians` | Clinician profiles, registration, discovery | Clinician/System | ACTIVE |
| `centers` | Center profiles, registration, discovery | Center/System | ACTIVE |
| `saved_destinations` | Client saved destination records | Client/System | REMOVED_FROM_RUNTIME |
| `support_requests` | Support issue/request records | Client/Support Observer | ACTIVE |
| `chat_threads` | Chat thread records | Client/System | REMOVED_FROM_FIRESTORE_RULES |
| `chat_threads/{id}/messages` | Chat thread messages | Client/System | REMOVED_FROM_FIRESTORE_RULES |
| `chat_escalations` | Chat escalation records | Monitoring Operator | REMOVED_FROM_FIRESTORE_RULES |
| `chat_escalations/{id}/reports` | Escalation reports | Monitoring Operator | REMOVED_FROM_FIRESTORE_RULES |
| `signal_events` | Signal event storage | Monitoring/System | ACTIVE |
| `clinician_profile_change_requests` | Clinician profile change review | Declaration Reviewer | ACTIVE |
| `center_profile_change_requests` | Center profile change review | Declaration Reviewer | ACTIVE |
| `provider_contact_requests` | Provider contact requests | Commercial/System | REMOVED_FROM_RUNTIME |
| `center_contact_requests` | Center contact requests | Commercial/System | REMOVED_FROM_RUNTIME |
| `system_domains` | Domain status service/seeder records | Owner/System | ACTIVE |
| `ai_policies` | AI policy seeder records | Owner/System | UNKNOWN |
| dynamic account access collections | Account access lookup by collection/doc id | System | UNKNOWN |

## Counts

- Total collection entries inventoried: 17
- ACTIVE: 7
- UNKNOWN: 2
- LEGACY: 0
- SHADOW: 0
- ARCHIVED/REMOVED: 8
