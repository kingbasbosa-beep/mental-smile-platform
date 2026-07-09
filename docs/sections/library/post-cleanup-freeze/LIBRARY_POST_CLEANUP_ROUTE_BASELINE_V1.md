# LIBRARY_POST_CLEANUP_ROUTE_BASELINE_V1

Status: CURRENT ROUTE BASELINE

## Active Library Routes

| Route Constant | Path | Destination | Status |
|---|---|---|---|
| `Routes.portalLibrary` | `/library` | `LibraryPage` | ACTIVE |
| `Routes.webLibrary` | `/web/library` | `LibraryPage` | ACTIVE_ALIAS |
| `Routes.libraryProviderSpecialists` | `/library/providers/specialists` | `LibrarySpecialistsPage` | ACTIVE |
| `Routes.libraryProviderCenters` | `/library/providers/centers` | `LibraryCentersPage` | ACTIVE |
| `Routes.libraryProviderSpecialists*` | `/library/providers/specialists/*` | `LibraryProviderBranchPage` | ACTIVE_CATEGORY_BRANCHES |
| `Routes.libraryProviderCenters*` | `/library/providers/centers/*` | `LibraryProviderBranchPage` | ACTIVE_CATEGORY_BRANCHES |

## Future Publishing Destination Routes

| Route Constant | Path | Destination | Status |
|---|---|---|---|
| `Routes.commercialV2WebLibrary` | `/commercial-v2/web/library` | `CommercialV2WebLibraryPage` | FOUNDATION_PLACEHOLDER |
| `Routes.commercialV2WebSpecialists` | `/commercial-v2/web/specialists` | `CommercialV2WebSpecialistsPage` | FOUNDATION_PLACEHOLDER |
| `Routes.commercialV2WebCenters` | `/commercial-v2/web/centers` | `CommercialV2WebCentersPage` | FOUNDATION_PLACEHOLDER |

## Removed Route Exposure

| Exposure | Count |
|---|---:|
| Old module library aliases | 0 |
| Chat routes | 0 |
| Hidden chat routes | 0 |
| Compatibility layer routes | 0 |
| Deprecated runtime routes | 0 |
| Library policy runtime routes | 0 |

## Verification

Targeted source search confirmed no active route dependencies on:

- Chat
- Old module library alias
- Hidden AI chat
- Deprecated compatibility layer
- Library policy runtime page

FINAL STATUS: LIBRARY_POST_CLEANUP_ROUTE_BASELINE_COMPLETED
