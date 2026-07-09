# OLD_SHOWCASE_BLOCK_ARCHIVE_MAP_V1

Date: 2026-06-28

Status: ARCHIVE_MAP_ONLY

Operation ID: OP-COMMERCIAL-V2-WEB-EMPTY-SECTION-AND-OLD-SHOWCASE-ARCHIVE-V1

## Purpose

Map the old Menu / Showcase / Public Display block as a frozen reference before building the clean Commercial V2 Web showcase section.

No runtime deletion was performed.

No old route deletion was performed.

No page deletion was performed.

## Frozen Old Showcase Block

| Item | Current Path / Route | Current Status | Archive Separation Decision |
|---|---|---|---|
| Portal Library alias | `/library` | Active old public portal/library route | Frozen as old showcase reference; not reused for new Commercial V2 Web foundation. |
| Web Library route | `/web/library` | Active library route | Frozen as existing library surface; not migrated in this operation. |
| Legacy-shaped library alias | `/module/library` | Active route alias to `LibraryPage` | Frozen/review before reuse; not used by new clean routes. |
| Library provider specialists | `/library/providers/specialists` | Active static branch surface | Existing reference only; not connected to new Commercial V2 Web in this phase. |
| Library provider centers | `/library/providers/centers` | Active static branch surface | Existing reference only; not connected to new Commercial V2 Web in this phase. |
| Specialist provider branches | `/library/providers/specialists/*` | Active static branch pages | Existing reference only; no migration. |
| Center provider branches | `/library/providers/centers/*` | Active static branch pages | Existing reference only; no migration. |
| S City home | `/s/city` | Active placeholder city surface | Frozen placeholder; not reused. |
| S City library | `/s/city/library` | Active placeholder route | Frozen placeholder; not reused. |
| S City providers | `/s/city/providers` | Active frozen Commercial V1 placeholder | Frozen old public provider placeholder; not reused. |
| S City centers | `/s/city/centers` | Active frozen Commercial V1 placeholder | Frozen old public center placeholder; not reused. |
| S City organizations | `/s/city/organizations` | Active placeholder route | Future candidate only; not reused. |
| S City programs | `/s/city/programs` | Active placeholder route | Future candidate only; not reused. |
| S City marketplace | `/s/city/marketplace` | Active placeholder with marketplace terminology | Frozen/review before any future exposure. |
| Old `/menu` route | `/menu` | Not active in current route constants | Historical old menu reference only. |
| Old `/home` route | `/home` | Not active in current route constants | Historical old home/menu reference only. |
| Old specialists module | `/module/specialists*` | Not active in current route constants | Historical old module reference only. |
| Old centers module | `/module/centers*` | Not active in current route constants | Historical old module reference only. |
| Specialist intermediate pages | `lib/features/commercial/presentation/pages/specialist_professional_profile_*.dart` | Some files remain unconnected | Frozen as source reference until later cleanup decision. |

## What Is Frozen

- Old Menu / Home public shell concepts.
- Old `/module/library` naming as a new-menu destination.
- Old `/module/specialists` and `/module/centers` route family.
- S City placeholder provider/center/marketplace surfaces.
- Any public discovery language tied to marketplace, booking, ranking, or legacy provider management.

## What Is Not Reused

- `/menu`
- `/home`
- `/module/library`
- `/module/specialists`
- `/module/centers`
- `/s/city/providers`
- `/s/city/centers`
- `/s/city/marketplace`
- Any old provider/center contact request flow.
- Any old booking/session/payment flow.

## What Remains Only As Reference

- Existing Library runtime and provider content branch pages.
- Existing S City placeholder pages.
- Existing Commercial room internal professional libraries.
- Existing unconnected Commercial profile intermediate pages.

## Future Cleanup Note

This archive map is a separation document only. It does not certify deletion, removal, or migration. A later cleanup block must decide whether old public/showcase routes are removed, redirected, or retained as historical compatibility surfaces.

## Final Confirmation

Old showcase archived as block: YES

Old routes deleted: NO

Old runtime deleted: NO

Data migration performed: NO

Firebase changed: NO

Firestore changed: NO
