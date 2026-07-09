# ARCHIVE_LANGUAGE_QUARANTINE_DESTINATION_CARD_V1

Status: ACTIVE ARCHIVE DESTINATION CARD

## Destination Identity

| Field | Value |
|---|---|
| Destination Title | Archive Language Quarantine |
| Archive Destination Code | `ARC-ERR-LANG-001` |
| Archive Section | `ARC-SEC-ERR` |
| Destination Type | Quarantine destination |
| Owner | Archive Owner |
| Review Owner | Archive Language Owner |

## Purpose

Hold invalid or suspicious traffic objects until reviewed.

## Acceptance Rule

This destination accepts only rejected traffic objects emitted by the Archive Language Guard. It is not a normal package, signal, summary, dispatch, or section destination.

## Required Quarantine Fields

| Field | Required | Purpose |
|---|---|---|
| `quarantine_id` | YES | Unique quarantine record id. |
| `alarm_code` | YES | Alarm code from `ARCHIVE_LANGUAGE_ALARM_CODE_REGISTRY_V1.md`. |
| `severity` | YES | Severity from `ARCHIVE_LANGUAGE_ALARM_SEVERITY_GUIDE_V1.md`. |
| `source_section_code` | YES | Source section claimed by the traffic unit. |
| `source_outbox_plug` | YES | Source outbox plug claimed by the traffic unit. |
| `attempted_destination_code` | YES | Original attempted Archive destination or invalid target. |
| `attempted_destination_inbox` | YES | Original attempted destination inbox when present; `MISSING` when absent. |
| `magnet_code` | YES | Magnet code claimed by the traffic unit; `MISSING` when absent. |
| `package_family` | YES | Package family claimed by the traffic unit; `NONE` when not a package. |
| `signal_family` | YES | Signal family claimed by the traffic unit; `NONE` when not a signal. |
| `broken_sentence` | YES | Original invalid traffic sentence. |
| `failure_reason` | YES | Human-readable reason for rejection. |
| `suggested_correction` | YES | Suggested correction when possible; `OWNER_REVIEW_REQUIRED` when unknown. |
| `review_owner` | YES | Owner responsible for review. |
| `review_status` | YES | Current review state. |
| `created_at` | YES | Creation timestamp. |

## Review Status Values

| Status | Meaning |
|---|---|
| `PENDING_REVIEW` | Record is waiting for owner review. |
| `CORRECTION_PROPOSED` | Suggested correction is available. |
| `APPROVED_FOR_REPLAY` | Owner approved corrected replay through Archive. |
| `REJECTED_PERMANENTLY` | Object must never enter normal flow. |
| `ESCALATED` | Owner escalated the record for security or governance review. |

FINAL STATUS: ARCHIVE_LANGUAGE_QUARANTINE_DESTINATION_CARD_COMPLETE
