# RESIDENTIAL_TOOL_SIGNAL_CONNECTION_V1

Status: ACTIVE

## Connection

The Residential emitter continues to build the existing local `ResidentialSignalPayload` and send it to `ResidentialAggregationPoint.collect(payload)`.

After local aggregation, tool usage payloads are handed to `ResidentialArchiveSignalEventWriter.writeToolSignal(payload)`.

Non-tool signals are skipped by the writer.

## Runtime Files

| File | Responsibility |
|---|---|
| `lib/features/residential/signals/residential_signal_emitter.dart` | Emits Residential signals and invokes the tool-only Archive writer after local aggregation. |
| `lib/features/residential/signals/residential_aggregation_point.dart` | Existing local aggregation/debug point, unchanged in behavior. |
| `lib/features/residential/signals/residential_archive_signal_package_builder.dart` | Builds the exact governed Archive event package. |
| `lib/features/residential/signals/residential_archive_signal_event_writer.dart` | Writes the package to `archive_signal_events` and fails safely on errors. |

## Navigation

Navigation behavior is unchanged. Firestore failure is logged and contained by the writer.

## Final Status

RESIDENTIAL_TOOL_SIGNAL_CONNECTION_CREATED
