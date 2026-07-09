# First Archive Signal Event Schema V1

Status: IMPLEMENTED_FOR_FIRST_CONTROLLED_WRITE
Runtime effect: first controlled Archive signal write enabled

## Target Collection

```text
archive_signal_events
```

## Exact Document Fields

The first controlled signal event contains only:

| Field | Required | First Value |
| --- | --- | --- |
| `event_id` | YES | Runtime-generated safe id; also Firestore document id |
| `source_section_code` | YES | `SEC-CV2` |
| `source_outbox_plug` | YES | `PLG-CV2-OUT` |
| `destination_section_code` | YES | `SEC-ARC` |
| `destination_inbox_plug` | YES | `PLG-ARC-IN` |
| `archive_destination_code` | YES | `ARC-SIG-CV2-SHOWCASE-001` |
| `package_family` | YES | `signal_event` |
| `signal_code` | YES | `CV2_SIG_OPEN_LIBRARY` |
| `magnet_code` | YES | `CV2-MAG-LIBRARY-INTEREST` |
| `privacy_class` | YES | `anonymous_navigation_signal` |
| `retention_class` | YES | `operational_summary` |
| `payload_minimal` | YES | Structured non-personal source/action data |
| `created_at` | YES | Firestore server timestamp |
| `guard_status` | YES | `accepted` |
| `quarantine_reason` | YES | `NONE` |
| `trace_id` | YES | Runtime-generated safe trace id |

## Payload Minimal Shape

```json
{
  "source_screen": "Commercial V2 Web Showcase",
  "source_widget": "library showcase card",
  "action": "open_section",
  "runtime_version": "commercial-v2-c2-local-v1"
}
```

## Forbidden Fields

The write must not include:

- `uid`
- `email`
- `phone`
- IP address
- diagnosis
- free personal text
- credentials
- secret tokens
- direct Library target
- direct Publishing target
- route target
- screen target
- Firestore collection as package target

FINAL STATUS: FIRST_ARCHIVE_SIGNAL_EVENT_SCHEMA_IMPLEMENTED
