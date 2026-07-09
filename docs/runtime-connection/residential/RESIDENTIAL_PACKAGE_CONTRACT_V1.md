# RESIDENTIAL_PACKAGE_CONTRACT_V1

Status: ACTIVE

## Collection

`archive_signal_events`

## Exact Document Fields

| Field | Required | Notes |
|---|---|---|
| `event_id` | YES | Must match the document id. |
| `source_section_code` | YES | `SEC-RES` |
| `source_outbox_plug` | YES | `PLG-RES-OUT` |
| `destination_section_code` | YES | `SEC-ARC` |
| `destination_inbox_plug` | YES | `PLG-ARC-IN` |
| `archive_destination_code` | YES | `ARC-SIG-RES-TOOLS-001` |
| `package_family` | YES | `signal_event` |
| `signal_code` | YES | One allowed Residential `R.T.*` tool signal. |
| `magnet_code` | YES | `RES-MAG-TOOLS` |
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

## Identity Leakage

Identity fields are not part of the package contract.

Blocked examples:

- uid
- email
- phone
- IP
- diagnosis
- free personal text
- credentials
- secret tokens

## Final Status

RESIDENTIAL_PACKAGE_CONTRACT_CREATED
