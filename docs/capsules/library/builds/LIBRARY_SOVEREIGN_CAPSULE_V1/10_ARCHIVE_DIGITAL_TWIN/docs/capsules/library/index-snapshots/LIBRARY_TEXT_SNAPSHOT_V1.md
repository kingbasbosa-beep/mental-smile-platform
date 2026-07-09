# LIBRARY_TEXT_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Capture the active textual truth of the Library section.

## Active Truth

Library is the public/content display section for Mental Smile educational Library content and provider display discovery. Library owns the Library home, Specialists display, Centers display, provider branch pages, card/audio visual support, Back-to-Library behavior, and governed anonymous UI interaction signals into Archive.

## Active Routes

| Route | Screen |
|---|---|
| `/web/library` | `LibraryPage` |
| `/library/providers/specialists` | `LibrarySpecialistsPage` |
| `/library/providers/centers` | `LibraryCentersPage` |
| provider branch paths | `LibraryProviderBranchPage` through Library provider content routing |

## Active Archive Destinations

- `ARC-SIG-LIB-HOME-001`
- `ARC-SIG-LIB-SP-001`
- `ARC-SIG-LIB-CTR-001`

## Active Firebase / Rules Reference

`archive_signal_events` accepts narrow Library create branches for `SEC-LIB`, `SEC-LIB-SP`, and `SEC-LIB-CTR`.

## Future Capsule Must Exclude

No active legacy, no placeholders, no retired policy page runtime, no child/accessibility support sections as Library active truth.

Current status: ACTIVE LIBRARY TEXT SNAPSHOT.
