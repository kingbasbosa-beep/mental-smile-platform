# COMMERCIAL_V2_FIREBASE_GOVERNANCE_MATRIX_V1

Status: DOCUMENTATION-ONLY FIREBASE GOVERNANCE MATRIX

No collections were created.

No rules were modified.

## Future Collection Candidates

| Candidate Collection | Collection Card | Rule Card | Owner | Purpose | Allowed Fields | Blocked Fields | Privacy Class | Retention Class | Allowed Writers | Allowed Readers | Archive Handoff Rule | No Identity Leakage Rule |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `commercial_v2_signal_events` | CREATED | CREATED | Commercial V2 Runtime Owner | Local signal event storage candidate. | signal code, source widget, action, timestamp, runtime version | uid, email, phone, IP, diagnosis, personal notes | anonymous_navigation_signal | operational_summary | Future governed runtime only | Owner/Monitoring summary readers | Archive-owned storage required before durable connection | Personal identity fields blocked |
| `commercial_v2_signal_aggregates` | CREATED | CREATED | Commercial V2 Runtime Owner | Aggregate signal counters candidate. | signal family, counts, period, summary | raw identity, free text, profile content | aggregate_only | summary | Future governed runtime only | Owner/Monitoring summary readers | Archive summary handoff required | Aggregate only |
| `commercial_v2_outbox_packages` | CREATED | CREATED | Archive / Commercial V2 Boundary Owner | Outbox package staging candidate. | package address fields, archive destination code, display section codes | direct Library route, direct Firestore target, identity overwrite instruction | governed_package | archive_ready | Future Commercial V2 outbox interface | Archive governed readers | Must target `SEC-ARC` / `PLG-ARC-IN` | No direct section storage |
| `commercial_v2_registration_package_drafts` | CREATED | CREATED | Commercial V2 Owner | Draft registration package candidate. | primary specialty, display section codes, validation state | publication command, Library write path, unrelated identity data | governed_provider_package | draft_operational | Future Commercial V2 draft runtime | Commercial V2 owner only | Archive handoff required when finalized | Draft only, no external write |
| `commercial_v2_generation_package_drafts` | CREATED | CREATED | Publishing / Commercial V2 Owner | Draft generated asset package candidate. | output type, approval state, package metadata | generated binary storage, direct publishing command, direct Library write | governed_publishing_package | draft_operational | Future generation runtime only | Publishing/Commercial V2 owner | Archive handoff required when finalized | No public publishing without approval |

## Validation

Firebase changed: NO

Firestore changed: NO

Storage rules changed: NO

Missing collection cards: 0

Missing rule cards: 0

FINAL STATUS: COMMERCIAL_V2_FIREBASE_GOVERNANCE_MATRIX_COMPLETE
