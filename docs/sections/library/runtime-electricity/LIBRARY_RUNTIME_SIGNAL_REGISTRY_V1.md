# LIBRARY_RUNTIME_SIGNAL_REGISTRY_V1

Status: ACTIVE

Runtime files:

- `lib/features/library/signals/library_signal_codes.dart`
- `lib/features/library/signals/library_signal_payload.dart`
- `lib/features/library/signals/library_signal_registry.dart`
- `lib/features/library/signals/library_signal_emitter.dart`
- `lib/features/library/signals/library_aggregation_point.dart`

Architecture rule:

All Library signal-capable UI actions must call `LibrarySignalEmitter.emit(...)`.
`LibrarySignalEmitter` resolves metadata through `LibrarySignalRegistry` and sends the resulting payload to `LibraryAggregationPoint`.

Forbidden bypasses:

- Direct Firestore writes from Library UI.
- Direct Firebase writes from Library UI.
- Direct archive writes from Library UI.
- User identity fields inside signal payloads.
- Free-text content inside signal payloads.

Validation:

- Runtime Registry Created: YES
- Aggregation Point Created: YES
- Firestore Writes Created: NO
- Firebase Changed: NO
