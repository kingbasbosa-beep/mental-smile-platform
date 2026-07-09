# PLATFORM_FIREBASE_PURIFICATION_REPORT_V1

Status: COMPLETE

Operation: Platform Final Firebase Purification - Block B

Date: 2026-07-02

## Purpose

Purify Firebase / Firestore governance so active runtime sections retain only current governed rule branches, collection references, and indexes.

Covered Verification:

- Commercial
- Residential
- Library
- Archive
- Owner

## Firestore Rules Removed

| Removed Rule Branch / Helper | Classification | Reason |
|---|---|---|
| `provider_contact_requests` | LEGACY / UNUSED | No active runtime caller. Old provider contact flow removed. |
| `center_contact_requests` | LEGACY / UNUSED | No active runtime caller. Old center contact flow removed. |
| `chat_threads` | LEGACY / DEAD_RUNTIME | No active routed chat runtime caller. |
| `chat_threads/{threadId}/messages` | LEGACY / DEAD_RUNTIME | Parent chat runtime removed from active rules. |
| `chat_escalations` | LEGACY / DEAD_RUNTIME | No active routed escalation runtime caller. |
| `chat_escalations/{escalationId}/reports` | LEGACY / DEAD_RUNTIME | Parent escalation runtime removed from active rules. |
| `signal_aggregates` | UNUSED_RULE_BRANCH | No active writer and no active current reader dependency. |
| `profileRequestCreateValid` | UNUSED_WRITE_BRANCH | No active runtime creates profile change request documents. |
| `ownClinicianProfileRequest` | UNUSED_READ_BRANCH | No active self-reader path needed after create closure. |
| `ownCenterProfileRequest` | UNUSED_READ_BRANCH | No active self-reader path needed after create closure. |
| chat/escalation helper functions | UNUSED_HELPERS | Removed with chat/escalation branches. |

## Firestore Indexes Removed

| Removed Index | Reason |
|---|---|
| `chat_threads` composite index | Chat runtime rule branch removed. |
| `messages` collection-group index | Chat message rule branch removed. |
| `support_requests` composite indexes | Active support room only orders by `createdAt`; no composite query remains. |
| profile change request composite indexes | Active declaration review reads snapshots without those composite filters. |

## Active Firestore Surfaces Preserved

| Collection | Owner | Active Use | Rule Status |
|---|---|---|---|
| `archive_signal_events` | Archive | Governed runtime signal intake for CV2, Residential tools, Library, Provider Display | CREATE_ONLY / EXACT_SCHEMA |
| `clinicians` | Clinician / Declaration Review / Account Access | Account access and declaration observation | ACTIVE_RESTRICTED |
| `centers` | Center / Declaration Review / Account Access | Account access and declaration observation | ACTIVE_RESTRICTED |
| `clinician_profile_change_requests` | Declaration Review | Read-only declaration observation | READ_ONLY_DECLARATION_REVIEW |
| `center_profile_change_requests` | Declaration Review | Read-only declaration observation | READ_ONLY_DECLARATION_REVIEW |
| `support_requests` | Support Observer / Residential support flow | Structured support request create and support-room read | ACTIVE_RESTRICTED |
| `system_domains` | Owner / Registry Steward | Governance status read | READ_ONLY_GOVERNANCE |
| `signal_events` | Legacy signal service / Support flow | Still referenced by active fail-soft support signal runtime | ACTIVE_RESTRICTED_PENDING_ARCHIVE_MIGRATION |

## Validation

| Check | Result |
|---|---|
| Unused rules | 0 active known unused branches |
| Duplicate rules | 0 |
| Legacy collections in active rules | 0 known unreferenced legacy branches |
| Identity leakage in Archive signal writes | NO |
| Collection ownership documented | YES |
| Broken rule references | 0 |
| Broken destination references | 0 |
| Archive ownership | CONFIRMED for `archive_signal_events` |
| Operations registry updated | YES |
| Operations index updated | YES |

## Deployment Note

Rules and indexes were edited locally. Owner must deploy when ready:

```powershell
firebase deploy --only firestore:rules,firestore:indexes
```

## Final Verdict

PLATFORM_FIREBASE_PURIFICATION_COMPLETED
