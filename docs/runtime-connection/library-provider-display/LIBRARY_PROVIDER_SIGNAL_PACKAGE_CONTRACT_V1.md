# LIBRARY_PROVIDER_SIGNAL_PACKAGE_CONTRACT_V1

Status: ACTIVE

## Collection

`archive_signal_events`

## Exact Document Fields

| Field | Required | Notes |
|---|---|---|
| `event_id` | YES | Must match document id. |
| `source_section_code` | YES | `SEC-LIB`, `SEC-LIB-SP`, or `SEC-LIB-CTR`. |
| `source_outbox_plug` | YES | Matching Library/provider display outbox. |
| `destination_section_code` | YES | `SEC-ARC` |
| `destination_inbox_plug` | YES | `PLG-ARC-IN` |
| `archive_destination_code` | YES | Matching Library destination code. |
| `package_family` | YES | `signal_event` |
| `signal_code` | YES | One connected first-write signal code. |
| `magnet_code` | YES | Matching Library magnet code. |
| `privacy_class` | YES | `anonymous_navigation_signal` |
| `retention_class` | YES | `operational_summary` |
| `payload_minimal` | YES | Minimal UI context only. |
| `created_at` | YES | Server timestamp. |
| `guard_status` | YES | `accepted` |
| `quarantine_reason` | YES | `NONE` |
| `trace_id` | YES | `trace_` plus event id. |

## `payload_minimal`

Allowed keys:

- `source_screen`
- `source_widget`
- `action`
- `runtime_version`

## Identity Exclusion

The package does not include uid, email, phone, IP, diagnosis, free personal text, credentials, secret tokens, route targets, screen targets, or direct section targets.

## Final Status

LIBRARY_PROVIDER_SIGNAL_PACKAGE_CONTRACT_CREATED
