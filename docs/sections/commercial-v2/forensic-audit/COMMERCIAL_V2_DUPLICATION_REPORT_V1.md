# Commercial V2 Duplication Report V1

Date: 2026-07-02
Mode: Investigation only

## Duplicate Responsibilities

| Duplication Area | Screens / Files | Explanation | Risk |
|---|---|---|---|
| Public gateway to Library | `CommercialV2WebShowcasePage`, `LibraryPage` provider content section | CV2 exposes Library, Specialists, and Centers as showcase destinations; Library also exposes Specialists and Centers from inside Library. | Low if CV2 is only a public interest gateway; medium if CV2 starts owning Library content. |
| Provider menu surfaces | CV2 showcase cards, Library provider content cards, Accessibility check-in, Support entry | Multiple entry points lead to the same Specialists and Centers routes. | Medium: owner may perceive duplicate hubs unless each entry has a distinct purpose. |
| Specialist/Center discovery | `LibrarySpecialistsPage`, `LibraryCentersPage`, branch pages | Category lists and branch pages form a directory skeleton, but branch pages still wait for published assets. | Medium: active routes can feel like incomplete runtime. |
| Registration expectation | Admin shortcuts `SEC-CV2-REG-SP`, `SEC-CV2-REG-CTR`; CV2 signal codes include registration package readiness | UI has pending registration shortcut cards and signals know future registration package state, but no active CV2 registration route was found. | Low if visibly pending; high if promoted as active. |
| Historical Commercial V2 placeholders | old `/commercial-v2/web/library`, `/specialists`, `/centers` | Placeholder paths were previously active; current registry points to real Library routes. | Low current runtime risk; high if external bookmarks still target removed paths. |
| Adjacent public discovery skeletons | `/s/city/library`, `/s/city/providers`, `/s/city/centers`, `/s/city/marketplace` | `[S] City` has future public discovery surfaces that overlap conceptually with Library, Specialists, Centers, and marketplace/provider discovery. | Medium: active public skeletons can be mistaken for current Commercial V2 or Library runtime. |

## Why They Are Duplicated

- Commercial V2 is a public showcase and interest gateway.
- Library is the real display owner for Library, Specialists, Centers, and branch content.
- Admin Operations Room is an Owner quick-inspection cockpit.
- Accessibility and Support modules add contextual entry paths into provider discovery.
- `[S] City` is a signal-first public discovery skeleton that predates or sits beside the current Commercial V2/Library public path.

## Governance Read

The duplication is mostly navigational, not data/runtime duplication. The main risk is responsibility blur: Commercial V2 must not become the owner of Library screens or provider content.
