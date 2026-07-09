# Global First Firestore Rules Proposal V1

Status: DOCUMENTATION_ONLY_NOT_APPLIED
Runtime effect: none

## Rule Decision

Live `firestore.rules` was not changed in this operation.

Reason:

- The first connection needs Owner manual review before any live write surface is opened.
- Existing rules do not yet include the proposed Archive collections.
- The safest RUN-1 output is a rules proposal, not a silent rules expansion.

## Proposed Rule Principles

- Archive collections are write-minimal and read-restricted.
- Client-side update and delete are disabled.
- First write allows only exact schema keys.
- No identity fields are permitted.
- `archive_language_quarantine` must require an alarm code, failure reason, source, attempted destination, review owner, and review status.
- All non-Archive direct section signal collections remain out of scope for first write.

## Proposed Collections

```text
archive_signal_events
archive_inbox_packages
archive_language_quarantine
archive_dispatch_packages
archive_summary_events
```

## Pseudocode Gate

```text
allow create archive_signal_events:
  if signed in or approved public signal policy exists
  and keys are only approved first schema fields
  and no forbidden identity fields exist
  and source_section_code == SEC-CV2
  and source_outbox_plug == PLG-CV2-OUT
  and destination_section_code == SEC-ARC
  and destination_inbox_plug == PLG-ARC-IN
  and archive_destination_code == DST-ARC-INBOX
  and signal_code in approved first signal codes
  and privacy_class is present
  and retention_class is present
  and guard_status in approved guard statuses
```

## Implementation Gate

Rules required before first write: YES
Rules applied in this operation: NO
Ready for live write under current rules: NO

