# FIRESTORE_RULE_PURIFICATION_MATRIX_V1

Status: COMPLETE

## Active Rule Matrix

| Rule Path | Read | Create | Update | Delete | Ownership |
|---|---|---|---|---|---|
| `clinicians/{clinicianId}` | Declaration reviewer, own doc, visibility-ready public | Own clinician self-create | Own incomplete profile update | DENIED | Clinician / Declaration Review |
| `centers/{centerId}` | Declaration reviewer, own doc, visibility-ready public | Own center self-create | Own incomplete profile update | DENIED | Center / Declaration Review |
| `clinician_profile_change_requests/{requestId}` | Declaration reviewer only | DENIED | DENIED | DENIED | Declaration Review |
| `center_profile_change_requests/{requestId}` | Declaration reviewer only | DENIED | DENIED | DENIED | Declaration Review |
| `support_requests/{requestId}` | Support observer or creator | Signed-in structured support only | DENIED | DENIED | Support Observer / Residential |
| `system_domains/{docId}` | Owner or registry steward | DENIED | DENIED | DENIED | Owner / Registry |
| `signal_events/{signalId}` | Owner/Monitoring/Support or actor | Exact legacy signal schema only | DENIED | DENIED | Signal Service, pending Archive migration |
| `archive_signal_events/{eventId}` | Owner or monitoring operator | Exact governed Archive signal contracts only | DENIED | DENIED | Archive |

## Removed Branches

- `provider_contact_requests`
- `center_contact_requests`
- `chat_threads`
- `chat_threads/{threadId}/messages`
- `chat_escalations`
- `chat_escalations/{escalationId}/reports`
- `signal_aggregates`

Final Status: FIRESTORE_RULE_PURIFICATION_COMPLETE
