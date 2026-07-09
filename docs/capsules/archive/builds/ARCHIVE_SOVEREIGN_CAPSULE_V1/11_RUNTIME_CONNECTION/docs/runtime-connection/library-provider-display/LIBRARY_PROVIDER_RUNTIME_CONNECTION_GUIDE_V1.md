# LIBRARY_PROVIDER_RUNTIME_CONNECTION_GUIDE_V1

Status: ACTIVE

Operation: RUN-7 Library + Provider Display Governed Archive Runtime Connection

## Purpose

Connect first controlled Library, Specialists Display, and Centers Display runtime signals to the governed Archive pipeline through `archive_signal_events`.

## Runtime Path

Section Signal

-> Local Emitter

-> Aggregation Point

-> Package Builder

-> Archive Signal Event Writer

-> Firestore `archive_signal_events`

-> Archive Intake

## Connected Lanes

| Lane | Source Section | Outbox | Destination | Magnet |
|---|---|---|---|---|
| Library Home / Category | `SEC-LIB` | `PLG-LIB-OUT` | `ARC-SIG-LIB-HOME-001` | `LIB-MAG-HOME` |
| Specialists Display | `SEC-LIB-SP` | `PLG-LIB-SP-OUT` | `ARC-SIG-LIB-SP-001` | `LIB-MAG-SPECIALISTS` |
| Centers Display | `SEC-LIB-CTR` | `PLG-LIB-CTR-OUT` | `ARC-SIG-LIB-CTR-001` | `LIB-MAG-CENTERS` |

## Connected Signal Codes

| Lane | Signal Codes |
|---|---|
| Library | `L.S.001.VIEW`, `L.C.001.OPEN` |
| Specialists | `L.S.003.VIEW`, `L.C.003.OPEN` |
| Centers | `L.S.004.VIEW`, `L.C.004.OPEN` |

## Runtime Files

| File | Responsibility |
|---|---|
| `lib/features/library/signals/library_signal_emitter.dart` | Emits existing local signal payloads and invokes the controlled Archive writer. |
| `lib/features/library/signals/library_aggregation_point.dart` | Existing local aggregation/debug point. |
| `lib/features/library/signals/library_archive_signal_package_builder.dart` | Resolves section/outbox/destination/magnet and builds the event package. |
| `lib/features/library/signals/library_archive_signal_event_writer.dart` | Writes to Firestore and fails safely. |

## Session Guard

The writer keeps a lightweight in-memory session guard so view signals emitted during Flutter rebuilds do not create repeated Archive documents for the same signal/source/action tuple.

## Final Status

LIBRARY_PROVIDER_RUNTIME_CONNECTION_GUIDE_CREATED
