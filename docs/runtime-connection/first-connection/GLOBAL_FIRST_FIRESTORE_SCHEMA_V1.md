# Global First Firestore Schema V1

Status: PROPOSED_MINIMAL_SCHEMA
Runtime effect: none

## Required Fields

Every first runtime object must include:

| Field | Required | Notes |
| --- | --- | --- |
| `package_id` | YES | Use `NA_SIGNAL_ONLY` for signal-only first write. |
| `event_id` | YES | Unique signal event id. |
| `source_section_code` | YES | First path: `SEC-CV2`. |
| `source_outbox_plug` | YES | First path: `PLG-CV2-OUT`. |
| `destination_section_code` | YES | First path: `SEC-ARC`. |
| `destination_inbox_plug` | YES | First path: `PLG-ARC-IN`. |
| `archive_destination_code` | YES | First path: `DST-ARC-INBOX`. |
| `package_family` | YES | Use `SIGNAL_EVENT_ONLY` for first write. |
| `signal_code` | YES | First path: `CV2_SIG_OPEN_LIBRARY`. |
| `magnet_code` | YES | First path: `CV2-MAG-LIBRARY-INTEREST`. |
| `privacy_class` | YES | First path: `anonymous_navigation_signal`. |
| `retention_class` | YES | First path: `operational_summary`. |
| `payload_minimal` | YES | Structured, no free personal text. |
| `created_at` | YES | Server timestamp or trusted runtime timestamp. |
| `guard_status` | YES | `PENDING_GUARD`, `ACCEPTED`, or `QUARANTINED`. |
| `quarantine_reason` | YES | `NONE` when accepted. |
| `trace_id` | YES | End-to-end trace id. |

## Excluded Fields

The first runtime write must not include:

- `uid`
- `email`
- `phone`
- IP address
- diagnosis
- free personal text
- credentials
- secret tokens
- provider private documents
- account access notes

## First Payload Shape

```json
{
  "package_id": "NA_SIGNAL_ONLY",
  "event_id": "evt_cv2_open_library_001",
  "source_section_code": "SEC-CV2",
  "source_outbox_plug": "PLG-CV2-OUT",
  "destination_section_code": "SEC-ARC",
  "destination_inbox_plug": "PLG-ARC-IN",
  "archive_destination_code": "DST-ARC-INBOX",
  "package_family": "SIGNAL_EVENT_ONLY",
  "signal_code": "CV2_SIG_OPEN_LIBRARY",
  "magnet_code": "CV2-MAG-LIBRARY-INTEREST",
  "privacy_class": "anonymous_navigation_signal",
  "retention_class": "operational_summary",
  "payload_minimal": {
    "source_screen": "Commercial V2 Web Showcase",
    "source_widget": "Library shortcut",
    "action": "open_library"
  },
  "guard_status": "PENDING_GUARD",
  "quarantine_reason": "NONE",
  "trace_id": "trace_cv2_first_signal_001"
}
```

