# RESIDENTIAL_RUNTIME_CONNECTION_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index the Residential RUN-6 governed runtime connection.

## Runtime Flow

Residential Tool

-> Residential Signal Emitter

-> Residential Aggregation Point

-> Residential Package Builder

-> `archive_signal_events`

-> Archive Intake

## Active Runtime Files

- `residential_signal_emitter.dart`
- `residential_aggregation_point.dart`
- `residential_archive_signal_package_builder.dart`
- `residential_archive_signal_event_writer.dart`
- `residential_signal_registry.dart`
- `residential_signal_codes.dart`
- `residential_signal_payload.dart`

## Active Docs

- `RESIDENTIAL_FIRST_RUNTIME_WRITE_GUIDE_V1.md`
- `RESIDENTIAL_TOOL_SIGNAL_CONNECTION_V1.md`
- `RESIDENTIAL_ARCHIVE_DESTINATION_CARD_V1.md`
- `RESIDENTIAL_PACKAGE_CONTRACT_V1.md`
- `RESIDENTIAL_FIRST_MANUAL_TEST_CARD_V1.md`
- `RESIDENTIAL_RUNTIME_CERTIFICATE_V1.md`
- `RESIDENTIAL_RUNTIME_COMPLETION_REPORT_V1.md`

## Active Package Fields

`event_id`, `source_section_code`, `source_outbox_plug`, `destination_section_code`, `destination_inbox_plug`, `archive_destination_code`, `package_family`, `signal_code`, `magnet_code`, `privacy_class`, `retention_class`, `payload_minimal`, `created_at`, `guard_status`, `quarantine_reason`, `trace_id`.

## Future Capsule Must Copy

Runtime files, package contract, writer/builder docs, Firestore branch reference, Archive destination/magnet evidence.

## Future Capsule Must Exclude

Aggregation dashboards, analytics, summaries, AI, monitoring engine, identity capture.

Owner notes: Fail-safe write behavior must not block navigation.

Current status: ACTIVE RUNTIME CONNECTION SNAPSHOT.
