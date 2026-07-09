# RESIDENTIAL_TEXT_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Provide a compact textual fingerprint of the current active Residential truth.

## Active Codes

| Code | Meaning | Status |
|---|---|---|
| `SEC-RES` | Residential section | ACTIVE |
| `PLG-RES-OUT` | Residential governed outbox | ACTIVE |
| `ARC-SIG-RES-TOOLS-001` | Residential Tool Signals Archive destination | ACTIVE |
| `RES-MAG-TOOLS` | Residential Tool Interest magnet | ACTIVE |
| `signal_event` | Archive package family | ACTIVE |

## Active Routes

- `/client/room`
- `/accessibility/room`
- `/accessibility/links`
- `/accessibility/tools`
- `/accessibility/suggestions`
- `/accessibility/community-tools`
- `/accessibility/checkin`
- `/accessibility/message-of-the-day`
- `/residential/exit-social-links`

## Active Cards

- Quick Access Room Five Cards
- Quick Access Feather Tool
- Quick Access Links Card
- Residential Exit Social Links Page Card
- R1 UI Element Signal Cards
- R13 route, Firestore, Storage, Aggregation, Signal connection cards

## Active Signals

Runtime signal files under `lib/features/residential/signals/` define Residential signal codes, payloads, emitter, aggregation point, package builder, and Archive event writer. Tool signals are allowed to write to `archive_signal_events` through `ARC-SIG-RES-TOOLS-001`.

## Active Archive Destinations

- `ARC-SIG-RES-TOOLS-001`
- `ARC-SEC-RES`
- `ARC-SIG-VAULT-RES`
- `ARC-PKG-VAULT-RES`

## Future Capsule Must Copy

Current active Residential source files, current Residential signal runtime files, current Residential docs, RUN-6 runtime connection docs, Archive destination/magnet registry rows, Firebase rule branches for `SEC-RES`, active assets and localization sources.

## Future Capsule Must Exclude

Retired legacy files, deleted pages, old Commercial/Client confusion, placeholder pages, inactive discovery-only claims, and historical docs not referenced by current Residential digital twin or current operations evidence.

## Owner Notes

Residential is the user-facing support room family. Preserve warmth, privacy, local-only notebook behavior, visual/audio-support icon behavior, and anonymous signal philosophy.

Current status: ACTIVE CERTIFIED INDEX SNAPSHOT.
