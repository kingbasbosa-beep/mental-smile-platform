# CV2 First Write Payload Rule Alignment V1

Date: 2026-07-02

## Collection

`archive_signal_events`

## Exact Document Fields

- `event_id`
- `source_section_code`
- `source_outbox_plug`
- `destination_section_code`
- `destination_inbox_plug`
- `archive_destination_code`
- `package_family`
- `signal_code`
- `magnet_code`
- `privacy_class`
- `retention_class`
- `payload_minimal`
- `created_at`
- `guard_status`
- `quarantine_reason`
- `trace_id`

## Expected Values

| Field | Value |
|---|---|
| `source_section_code` | `SEC-CV2` |
| `source_outbox_plug` | `PLG-CV2-OUT` |
| `destination_section_code` | `SEC-ARC` |
| `destination_inbox_plug` | `PLG-ARC-IN` |
| `archive_destination_code` | `ARC-SIG-CV2-SHOWCASE-001` |
| `package_family` | `signal_event` |
| `signal_code` | `CV2_SIG_OPEN_LIBRARY` |
| `magnet_code` | `CV2-MAG-LIBRARY-INTEREST` |
| `privacy_class` | `anonymous_navigation_signal` |
| `retention_class` | `operational_summary` |
| `guard_status` | `accepted` |
| `quarantine_reason` | `NONE` |

## `payload_minimal`

Allowed keys only:

- `source_screen`
- `source_widget`
- `action`
- `runtime_version`

Expected values:

- `source_screen = Commercial V2 Web Showcase`
- `source_widget = library showcase card`
- `action = open_section`
- `runtime_version = commercial-v2-c2-local-v1`

## Rule Alignment

| Rule Check | Status |
|---|---|
| Field set exact | MATCH |
| Document id equals `event_id` | MATCH |
| `created_at` timestamp | MATCH |
| Identity fields absent | MATCH |
| Route/screen target absent | MATCH |
| Direct Library target absent | MATCH |
| Direct Publishing target absent | MATCH |

