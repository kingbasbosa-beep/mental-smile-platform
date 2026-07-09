# LIBRARY_FIREBASE_FIRESTORE_RULES_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index Library Firebase / Firestore rules references.

## Firestore Target

`archive_signal_events`

## Active Rule Branches

| Function | Section | Destination | Magnet | Signal Codes |
|---|---|---|---|---|
| `firstLibraryHomeSignalValid` | `SEC-LIB` / `PLG-LIB-OUT` | `ARC-SIG-LIB-HOME-001` | `LIB-MAG-HOME` | `L.S.001.VIEW`, `L.C.001.OPEN` |
| `firstLibrarySpecialistsSignalValid` | `SEC-LIB-SP` / `PLG-LIB-SP-OUT` | `ARC-SIG-LIB-SP-001` | `LIB-MAG-SPECIALISTS` | `L.S.003.VIEW`, `L.C.003.OPEN` |
| `firstLibraryCentersSignalValid` | `SEC-LIB-CTR` / `PLG-LIB-CTR-OUT` | `ARC-SIG-LIB-CTR-001` | `LIB-MAG-CENTERS` | `L.S.004.VIEW`, `L.C.004.OPEN` |

## Rule Boundaries

Create only. Update/delete denied. Reads restricted. Identity, diagnosis, free personal text, credentials, and secret tokens are not allowed.

Current status: ACTIVE FIREBASE/FIRESTORE SNAPSHOT.
