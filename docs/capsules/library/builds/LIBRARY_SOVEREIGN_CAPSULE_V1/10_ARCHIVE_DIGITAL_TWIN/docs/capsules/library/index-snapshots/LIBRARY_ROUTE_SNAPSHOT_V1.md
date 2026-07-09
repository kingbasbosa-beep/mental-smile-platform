# LIBRARY_ROUTE_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index active Library routes.

## Active Routes

| Route Constant | Path | Screen | Status |
|---|---|---|---|
| `Routes.webLibrary` | `/web/library` | `LibraryPage` | ACTIVE_CURRENT |
| `Routes.libraryProviderSpecialists` | `/library/providers/specialists` | `LibrarySpecialistsPage` | ACTIVE_CURRENT |
| `Routes.libraryProviderCenters` | `/library/providers/centers` | `LibraryCentersPage` | ACTIVE_CURRENT |

## Branch Routing

Provider branch pages are owned by Library provider content runtime and return to `Routes.webLibrary` through the active Back-to-Library behavior.

## Future Capsule Must Copy

Route constants and router cases from `lib/app/router/routes.dart` and `lib/app/router/app_router.dart`.

## Future Capsule Must Exclude

Retired `/web/library/policy`, old portal `/library`, and any placeholder CV2 library routes.

Current status: ACTIVE ROUTE SNAPSHOT.
