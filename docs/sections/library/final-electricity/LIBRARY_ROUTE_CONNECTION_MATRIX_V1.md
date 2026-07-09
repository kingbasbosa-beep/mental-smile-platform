# LIBRARY_ROUTE_CONNECTION_MATRIX_V1

Status: FINAL ROUTE CONNECTION MATRIX

## Active Library Route Groups

| Route Constant | Path | Destination | Route Card | Owner | Consumers | Dependencies | Status |
|---|---|---|---|---|---|---|---|
| `Routes.portalLibrary` | `/library` | `LibraryPage` | CREATED | Library Owner | Splash/Public navigation | Library UI | ACTIVE |
| `Routes.webLibrary` | `/web/library` | `LibraryPage` | CREATED | Library Owner | Web/Public navigation | Library UI | ACTIVE_ALIAS |
| `Routes.libraryProviderSpecialists` | `/library/providers/specialists` | `LibrarySpecialistsPage` | CREATED | Library Owner | Library Home | Provider branch UI | ACTIVE |
| `Routes.libraryProviderCenters` | `/library/providers/centers` | `LibraryCentersPage` | CREATED | Library Owner | Library Home | Provider branch UI | ACTIVE |
| `Routes.libraryProviderSpecialists*` | `/library/providers/specialists/*` | `LibraryProviderBranchPage` | CREATED | Library Owner | Specialists Display | Category branch UI | ACTIVE_CATEGORY_BRANCHES |
| `Routes.libraryProviderCenters*` | `/library/providers/centers/*` | `LibraryProviderBranchPage` | CREATED | Library Owner | Centers Display | Category branch UI | ACTIVE_CATEGORY_BRANCHES |

## Future Destination Placeholders

| Route Constant | Path | Destination | Status |
|---|---|---|---|
| `Routes.commercialV2WebLibrary` | `/commercial-v2/web/library` | `CommercialV2WebLibraryPage` | FOUNDATION_PLACEHOLDER |
| `Routes.commercialV2WebSpecialists` | `/commercial-v2/web/specialists` | `CommercialV2WebSpecialistsPage` | FOUNDATION_PLACEHOLDER |
| `Routes.commercialV2WebCenters` | `/commercial-v2/web/centers` | `CommercialV2WebCentersPage` | FOUNDATION_PLACEHOLDER |

## Removed Exposure Validation

| Exposure | Count |
|---|---:|
| Chat routes | 0 |
| Old module aliases | 0 |
| Library policy runtime route | 0 |
| Hidden compatibility routes | 0 |
| Orphan Library routes | 0 |

FINAL STATUS: LIBRARY_ROUTE_CONNECTION_MATRIX_COMPLETE
