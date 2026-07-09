# RESIDENTIAL_SIGNAL_RUNTIME_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index Residential signal runtime, writers, builders, and Archive package shape.

## Source Folders / Files

| File | Purpose | Status |
|---|---|---|
| `lib/features/residential/signals/residential_signal_codes.dart` | Signal code constants | ACTIVE |
| `residential_signal_payload.dart` | Local signal payload model | ACTIVE |
| `residential_signal_registry.dart` | Signal metadata and allowed families | ACTIVE |
| `residential_signal_emitter.dart` | Emits local signal and invokes writer for tool signals | ACTIVE |
| `residential_aggregation_point.dart` | Local aggregation/debug point | ACTIVE |
| `residential_archive_signal_package_builder.dart` | Builds `archive_signal_events` package | ACTIVE |
| `residential_archive_signal_event_writer.dart` | Writes safe package and fails safely | ACTIVE |

## Active Codes

- `SEC-RES`
- `PLG-RES-OUT`
- `SEC-ARC`
- `PLG-ARC-IN`
- `ARC-SIG-RES-TOOLS-001`
- `RES-MAG-TOOLS`
- `signal_event`

## Active Signals

Screen view signals include `R.S.002.VIEW` through active Client/Accessibility pages. Governed Firestore writes are tool-only and accepted only under the Residential tool destination.

## Active Firebase / Rules References

`firestore.rules` allows create-only `archive_signal_events` for the exact Residential branch. Update/delete denied by the collection rule.

## Future Capsule Must Copy

All active `lib/features/residential/signals/` files, RUN-6 runtime connection docs, Firestore rule excerpt, and Archive destination/magnet references.

## Future Capsule Must Exclude

Signal builders/writers from other sections, old generic signal runtime, identity fields, diagnosis, free personal text, direct section writes.

Owner notes: Tool signals are anonymous UI interaction only.

Current status: ACTIVE SIGNAL RUNTIME SNAPSHOT.
