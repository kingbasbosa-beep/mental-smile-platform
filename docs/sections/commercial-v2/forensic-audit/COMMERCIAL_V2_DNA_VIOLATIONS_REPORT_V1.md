# Commercial V2 DNA Violations Report V1

Date: 2026-07-02
Mode: Investigation only

## Violations / Risks Detected

| Category | Finding | Severity | Notes |
|---|---|---|---|
| Duplicate navigation hubs | CV2, Library, Admin, Support, and Accessibility can all lead to Specialists/Centers | WARNING | Acceptable only if each keeps a distinct role. |
| Screen owning another section | CV2 showcase opens Library-owned screens | WARNING | Current behavior is navigation only; CV2 must not own Library runtime/content. |
| Placeholder residue | Old `/commercial-v2/web/library`, `/specialists`, `/centers` are historical and no longer routed | INFO | No active router cases found, but external bookmarks may still hit not-found behavior. |
| Pending active surfaces | Library branch routes are reachable and display future-content readiness text | WARNING | These are active routes with incomplete content function. |
| Active public skeletons | `[S] City` routes expose future discovery pages for Library, providers, centers, marketplace, and related catalogs | WARNING | These are not CV2 routes, but they overlap public discovery responsibility. |
| Registration gap | CV2 registration shortcuts are visible as pending; no active route exists | INFO | Correct if explicitly pending, violation if treated as active. |
| Duplicate responsibilities | Provider discovery appears through Library, CV2, Support, Accessibility, and Admin | WARNING | Needs owner classification of each entry point. |
| Circular navigation | Provider pages return to `/web/library`; Library can reopen provider pages | INFO | Expected browse loop, not a functional bug. |
| Unreachable routes | No unreachable Commercial V2 active route found; removed placeholder routes are legacy | INFO | Current CV2 route set is small. |

## No Evidence Found

- No direct Library write from Commercial V2 was found in inspected CV2 code.
- No direct Publishing write from Commercial V2 was found in inspected CV2 code.
- No active CV2 placeholder page files were found under active Commercial V2 page directory.
- Active adjacent public discovery skeletons do remain under `[S] City`.

## DNA Boundary Statement

Commercial V2 should remain a showcase and signal source. Library should remain the owner of Library, Specialists, Centers, and provider branch display surfaces.
