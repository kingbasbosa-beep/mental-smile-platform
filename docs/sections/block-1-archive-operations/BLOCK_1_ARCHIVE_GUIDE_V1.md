# BLOCK_1_ARCHIVE_GUIDE_V1

Status: ACTIVE_GUIDE
Block: BLOCK 1 - Archive + Operations
Runtime Route: `/commercial/admin/archive`
Runtime Page: `Block1ArchiveDashboardPage`

## Purpose

The Archive Dashboard is the operational memory center for Mental Smile.

It converts discovered documentation, assets, localization, reports, cards, guides, snapshots, registries, and frozen history into a searchable and auditable archive surface.

## Source Model

Current source mode:

- Local filesystem snapshot
- `docs/`
- `assets/`
- `lib/l10n/`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

No fake counters are allowed.

If a live source is not connected, it is shown as:

`Not Connected Yet`

## Dashboard Capabilities

- Global counters
- Global search
- Section filter
- Status filter
- Type filter
- Section dashboard
- Inventory samples
- Dependency list
- Health score
- Completion score
- Missing items list

## Runtime Rules

- No Firebase dependency
- No Firestore dependency
- No file deletion
- No archive mutation
- No automatic document creation from runtime
- No fake completion

## Current Limitation

The current Archive Dashboard is powered by a generated snapshot. A future Archive Reader may connect it to live indexed archive files.

