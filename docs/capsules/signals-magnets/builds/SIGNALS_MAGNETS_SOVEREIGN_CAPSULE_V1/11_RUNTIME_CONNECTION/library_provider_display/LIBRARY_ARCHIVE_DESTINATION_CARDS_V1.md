# LIBRARY_ARCHIVE_DESTINATION_CARDS_V1

Status: ACTIVE

## Destination Cards

| Destination | Human Title | Source Section | Source Outbox | Accepted Signals | Magnet |
|---|---|---|---|---|---|
| `ARC-SIG-LIB-HOME-001` | Library Home / Category Signals | `SEC-LIB` | `PLG-LIB-OUT` | `L.S.001.VIEW`, `L.C.001.OPEN` | `LIB-MAG-HOME` |
| `ARC-SIG-LIB-SP-001` | Library Specialists Display Signals | `SEC-LIB-SP` | `PLG-LIB-SP-OUT` | `L.S.003.VIEW`, `L.C.003.OPEN` | `LIB-MAG-SPECIALISTS` |
| `ARC-SIG-LIB-CTR-001` | Library Centers Display Signals | `SEC-LIB-CTR` | `PLG-LIB-CTR-OUT` | `L.S.004.VIEW`, `L.C.004.OPEN` | `LIB-MAG-CENTERS` |

## Shared Contract

| Field | Value |
|---|---|
| Destination Section | `SEC-ARC` |
| Destination Inbox | `PLG-ARC-IN` |
| Package Family | `signal_event` |
| Privacy Class | `anonymous_navigation_signal` |
| Retention Class | `operational_summary` |
| Firestore Target | `archive_signal_events` |

## Blocked Paths

- Direct route target.
- Direct screen target.
- Direct section writes.
- Storage writes.
- Publishing writes.
- Identity-bearing payloads.

## Final Status

LIBRARY_ARCHIVE_DESTINATION_CARDS_CREATED
