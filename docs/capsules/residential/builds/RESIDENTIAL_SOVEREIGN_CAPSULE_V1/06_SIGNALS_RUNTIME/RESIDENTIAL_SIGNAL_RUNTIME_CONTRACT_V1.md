# RESIDENTIAL_SIGNAL_RUNTIME_CONTRACT_V1

Status: SNAPSHOTTED

## Purpose

Describe the copied Residential signal runtime.

## Copied Files

- `lib/features/residential/signals/residential_signal_codes.dart`
- `lib/features/residential/signals/residential_signal_payload.dart`
- `lib/features/residential/signals/residential_signal_registry.dart`
- `lib/features/residential/signals/residential_signal_emitter.dart`
- `lib/features/residential/signals/residential_aggregation_point.dart`
- `lib/features/residential/signals/residential_archive_signal_package_builder.dart`
- `lib/features/residential/signals/residential_archive_signal_event_writer.dart`

## Contract

| Field | Value |
|---|---|
| source_section_code | `SEC-RES` |
| source_outbox_plug | `PLG-RES-OUT` |
| destination_section_code | `SEC-ARC` |
| destination_inbox_plug | `PLG-ARC-IN` |
| archive_destination_code | `ARC-SIG-RES-TOOLS-001` |
| package_family | `signal_event` |
| magnet_code | `RES-MAG-TOOLS` |
| privacy_class | `anonymous_navigation_signal` |
| retention_class | `operational_summary` |
| guard_status | `accepted` |
| quarantine_reason | `NONE` |
| Firestore target | `archive_signal_events` |

## Safety

The Residential signal runtime must not include identity fields, diagnosis, free personal text, credentials, secret tokens, Firestore user documents, or direct writes to another section.

If Firestore is unavailable, runtime navigation must continue and the write must fail safely.

FINAL STATUS: RESIDENTIAL_SIGNAL_RUNTIME_SNAPSHOTTED
