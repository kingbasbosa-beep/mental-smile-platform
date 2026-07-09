# LIBRARY_PROVIDER_FIRESTORE_RULES_REPORT_V1

Status: ACTIVE

## Rule Change

`firestore.rules` was extended for the RUN-7 Library/provider display runtime connection.

Rules changed: YES

## Collection

`archive_signal_events`

## Allowed Creates

| Rule Helper | Source | Destination | Signals |
|---|---|---|---|
| `firstLibraryHomeSignalValid` | `SEC-LIB` / `PLG-LIB-OUT` | `ARC-SIG-LIB-HOME-001` | `L.S.001.VIEW`, `L.C.001.OPEN` |
| `firstLibrarySpecialistsSignalValid` | `SEC-LIB-SP` / `PLG-LIB-SP-OUT` | `ARC-SIG-LIB-SP-001` | `L.S.003.VIEW`, `L.C.003.OPEN` |
| `firstLibraryCentersSignalValid` | `SEC-LIB-CTR` / `PLG-LIB-CTR-OUT` | `ARC-SIG-LIB-CTR-001` | `L.S.004.VIEW`, `L.C.004.OPEN` |

## Preserved Rules

- Read remains restricted to owner/monitoring operator.
- Update remains denied.
- Delete remains denied.
- Extra fields remain denied by exact key validation.

## Deploy Command

`firebase deploy --only firestore:rules`

## Final Status

LIBRARY_PROVIDER_FIRESTORE_RULES_REPORT_CREATED
