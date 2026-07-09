# Commercial V2 Owner Decisions Required V1

Date: 2026-07-02
Mode: Investigation only

## Safe To Remove

- Do not revive `/commercial-v2/web/library`.
- Do not revive `/commercial-v2/web/specialists`.
- Do not revive `/commercial-v2/web/centers`.
- Do not create active CV2 registration routes until registration runtime is intentionally approved.

## Needs Owner Decision

| Decision | Options | Reason |
|---|---|---|
| Library provider branch routes | keep pending, hide until content exists, or merge into category lists | Branch pages are reachable but content is future-ready rather than complete. |
| CV2 registration entry points | remain `ROUTE_PENDING`, create governed registration runtime later, or remove visible shortcut cards | No active CV2 registration route exists. |
| CV2 as public gateway | keep as public showcase, merge into Library gateway, or make it Owner-only | It currently duplicates part of Library navigation. |
| Support and Accessibility provider links | keep as contextual helpers or route users to Library only | They duplicate Specialists/Centers entry points. |
| `[S] City` public discovery skeletons | keep as signal-first future public surfaces, remove from active runtime, or route to current public/Library paths | They are active public pages with future/placeholder discovery language adjacent to Commercial V2 and Library. |

## Must Keep

- `/commercial-v2/web` as the only active CV2 showcase route.
- `/web/library` as the real Library route.
- `/library/providers/specialists` as the Specialists category list.
- `/library/providers/centers` as the Centers category list.
- `CV2_SIG_OPEN_LIBRARY` first runtime write path until superseded by a broader governed signal plan.

## Must Merge

- No immediate code merge recommended during this audit.
- Governance merge recommended: declare that Commercial V2 showcase cards are entry signals, not destination ownership.

## Future Candidate

- Expand `archive_signal_events` writes to Specialists and Centers only after explicit owner approval and matching Archive destinations/rules.
- Create CV2 registration runtime only through a separate governed operation.
- Decide whether active branch pages should wait behind content availability gates.
- Decide whether `[S] City` public discovery skeletons should remain active while Commercial V2 and Library are the current public path.
