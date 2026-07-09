# Commercial V2 Route Survival Matrix V1

Date: 2026-07-02
Mode: Investigation only

| Route | Screen | Purpose | Used By | Should Survive? |
|---|---|---|---|---|
| `/commercial-v2/web` | `CommercialV2WebShowcasePage` | Commercial V2 public showcase gateway | Admin TV, direct URL | YES |
| `/web/library` | `LibraryPage` | Main Library display | CV2, Admin TV, direct URL, provider back buttons | YES |
| `/library/providers/specialists` | `LibrarySpecialistsPage` | Specialist category list | CV2, Library, Admin TV, Support, Accessibility | YES |
| `/library/providers/centers` | `LibraryCentersPage` | Center category list | CV2, Library, Admin TV, Support, Accessibility | YES |
| 10 specialist branch routes | `LibraryProviderBranchPage` | Specialist branch content surfaces | Specialist category cards | OWNER DECISION |
| 10 center branch routes | `LibraryProviderBranchPage` | Center branch content surfaces | Center category cards | OWNER DECISION |
| `/commercial-v2/web/library` | none active | old CV2 placeholder Library path | historical only | NO |
| `/commercial-v2/web/specialists` | none active | old CV2 placeholder Specialists path | historical only | NO |
| `/commercial-v2/web/centers` | none active | old CV2 placeholder Centers path | historical only | NO |
| CV2 specialist registration route | none active | expected registration destination | Admin pending shortcut only | OWNER DECISION |
| CV2 center registration route | none active | expected registration destination | Admin pending shortcut only | OWNER DECISION |
| `/s/city` | `SCityDistrictPage` | public city center skeleton | `[S] Surface Index`, direct URL | OWNER DECISION |
| `/s/city/library` | `SWebSurfacePage` | future public Library discovery skeleton | `[S] City`, direct URL | OWNER DECISION |
| `/s/city/providers` | `SWebSurfacePage` | legacy/frozen provider discovery placeholder | `[S] City`, direct URL | OWNER DECISION |
| `/s/city/centers` | `SWebSurfacePage` | legacy/frozen center discovery placeholder | `[S] City`, direct URL | OWNER DECISION |
| `/s/city/services` | `SWebSurfacePage` | future public service catalog | `[S] City`, direct URL | OWNER DECISION |
| `/s/city/tools` | `SWebSurfacePage` | future public tool catalog | `[S] City`, direct URL | OWNER DECISION |
| `/s/city/organizations` | `SWebSurfacePage` | future organization directory | `[S] City`, direct URL | OWNER DECISION |
| `/s/city/programs` | `SWebSurfacePage` | future program catalog | `[S] City`, direct URL | OWNER DECISION |
| `/s/city/marketplace` | `SWebSurfacePage` | future marketplace surface | `[S] City`, direct URL | OWNER DECISION |

## Survival Summary

- Must keep: 4 active public/display routes.
- Owner decision: 20 Library branch routes, 2 CV2 registration route gaps, and 9 adjacent `[S] City` public discovery skeleton routes.
- Safe not to revive: 3 legacy Commercial V2 placeholder paths.
