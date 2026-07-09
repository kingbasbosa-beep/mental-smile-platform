# SIGNALS_MAGNETS_RUNTIME_CONTRACT_V1

Signal DNA: event_id, source_section_code, source_outbox_plug, destination_section_code, destination_inbox_plug, archive_destination_code, package_family, signal_code, magnet_code, privacy_class, retention_class, payload_minimal, created_at, guard_status, quarantine_reason, trace_id.

Lifecycle: UI event -> local emitter -> aggregation point -> package builder -> writer -> archive_signal_events -> Archive Intake -> Code Gate -> Language Guard -> Destination Resolution -> Archive Inbox -> future aggregation.

Privacy: anonymous_navigation_signal. Retention: operational_summary.
