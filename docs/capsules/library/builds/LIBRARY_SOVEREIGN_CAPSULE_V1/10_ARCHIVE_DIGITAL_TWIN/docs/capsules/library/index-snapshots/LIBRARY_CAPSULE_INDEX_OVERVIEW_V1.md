# LIBRARY_CAPSULE_INDEX_OVERVIEW_V1

Status: COMPLETE

## Purpose

Create the Library capsule index overview for the future Library Sovereign Capsule.

## Source Folders / Files

| Source | Purpose | Capsule Action |
|---|---|---|
| `lib/features/library/` | Active Library runtime, provider display, and signal runtime | COPY |
| `lib/shared/accessibility/` | Audio/headphone visual-support icon helper used by Library cards | COPY_IF_REFERENCED |
| `lib/shared/utils/asset_path_utils.dart` | Asset path normalization used by Library UI | COPY_IF_REFERENCED |
| `docs/sections/library/` | Current Library cards, guides, pure DNA, runtime electricity, UI audio icon governance | COPY_ACTIVE_ONLY |
| `docs/runtime-connection/library-provider-display/` | Governed Library/provider display runtime connection docs | COPY_ACTIVE_ONLY |
| `docs/archive/topology/` | Archive destinations, magnets, vaults, and digital twin references | COPY_RELEVANT_EXCERPTS |

## Active Codes

| Code | Meaning |
|---|---|
| `SEC-LIB` | Library Home / Category section |
| `SEC-LIB-SP` | Library Specialists Display section |
| `SEC-LIB-CTR` | Library Centers Display section |
| `PLG-LIB-OUT` | Library outbox plug |
| `PLG-LIB-SP-OUT` | Specialists display outbox plug |
| `PLG-LIB-CTR-OUT` | Centers display outbox plug |
| `ARC-SIG-LIB-HOME-001` | Library Home / Category Signals |
| `ARC-SIG-LIB-SP-001` | Library Specialists Display Signals |
| `ARC-SIG-LIB-CTR-001` | Library Centers Display Signals |
| `LIB-MAG-HOME` | Library Home magnet |
| `LIB-MAG-SPECIALISTS` | Specialists Display magnet |
| `LIB-MAG-CENTERS` | Centers Display magnet |

## Active Routes

- `/web/library`
- `/library/providers/specialists`
- `/library/providers/centers`
- provider branch routes handled by Library provider content pages

## Active Signals

- `L.S.001.VIEW`
- `L.C.001.OPEN`
- `L.S.003.VIEW`
- `L.C.003.OPEN`
- `L.S.004.VIEW`
- `L.C.004.OPEN`

## Future Capsule Must Copy

Technical Library source, provider display source, signal runtime, route excerpts, Firestore branch excerpts, active assets, localization sources, active governance docs, Archive/Digital Twin references, and recovery instructions.

## Future Capsule Must Exclude

Retired policy page runtime, retired child/accessibility support destinations, placeholder routes, legacy docs as active truth, uncoded objects, runtime data, Firestore documents, credentials, and secrets.

Owner notes: Library Capsule V1 follows the Residential Sovereign Capsule architecture exactly.

Current status: ACTIVE LIBRARY CAPSULE INDEX OVERVIEW.
