# Global First Firestore Collection Plan V1

Status: PROPOSAL_ONLY
Runtime effect: none

## Archive-Owned First Collections

The first controlled connection must use Archive-owned durable collections only.

| Collection | Owner | First Test Role | Write Eligibility |
| --- | --- | --- | --- |
| `archive_inbox_packages` | Archive | Future package intake | Not first write |
| `archive_signal_events` | Archive | First anonymous signal event intake | First candidate |
| `archive_language_quarantine` | Archive | Invalid or suspicious object holding area | Required before broad traffic |
| `archive_dispatch_packages` | Archive | Future dispatch output package storage | Not first write |
| `archive_summary_events` | Archive | Future summary event storage | Not first write |

## Optional Future Collections

These are not part of the first runtime write.

| Collection | Status | Reason |
| --- | --- | --- |
| `residential_signal_events` | FUTURE_OPTIONAL | Would create section-owned signal storage; not first. |
| `library_signal_events` | FUTURE_OPTIONAL | Public display analytics may come later. |
| `commercial_v2_signal_events` | FUTURE_OPTIONAL | Avoid direct section-owned durable storage for first test. |
| `administrative_signal_events` | FUTURE_OPTIONAL | Administrative is not first runtime writer. |

## Collection Principle

No direct section-to-section durable writes.

All cross-section traffic must move through:

```text
Section Outbox -> Archive-owned plug storage -> Archive Destination -> Summary/Dispatch -> Destination Inbox
```

