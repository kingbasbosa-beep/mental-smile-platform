# LIBRARY_ROUTE_REGISTRY_V1

## Purpose

Register active Library routes and public display route aliases.

## Route Registry

| Route ID | Route Constant | Path | Page | Status | Owner |
|---|---|---|---|---|---|
| LIB-RTE-001 | Routes.portalLibrary | `/library` | LibraryPage | ACTIVE | Library Owner |
| LIB-RTE-002 | Routes.webLibrary | `/web/library` | LibraryPage | ACTIVE_ALIAS | Library Owner |
| LIB-RTE-004 | Routes.webLibraryPolicy | `/web/library/policy` | LibraryPolicyPage | ACTIVE | Governance Owner |
| LIB-RTE-005 | Routes.libraryProviderSpecialists | `/library/providers/specialists` | LibrarySpecialistsPage | ACTIVE | Provider Content Owner |
| LIB-RTE-006 | Routes.libraryProviderCenters | `/library/providers/centers` | LibraryCentersPage | ACTIVE | Center Content Owner |
| LIB-RTE-007 | Routes.libraryProviderSpecialists* | `/library/providers/specialists/*` | LibraryProviderBranchPage | ACTIVE | Provider Content Owner |
| LIB-RTE-008 | Routes.libraryProviderCenters* | `/library/providers/centers/*` | LibraryProviderBranchPage | ACTIVE | Center Content Owner |
| LIB-RTE-009 | Routes.commercialV2WebLibrary | `/commercial-v2/web/library` | CommercialV2WebLibraryPage | FOUNDATION_PLACEHOLDER | Commercial V2 Web Owner |
| LIB-RTE-010 | Routes.commercialV2WebSpecialists | `/commercial-v2/web/specialists` | CommercialV2WebSpecialistsPage | FOUNDATION_PLACEHOLDER | Commercial V2 Web Owner |
| LIB-RTE-011 | Routes.commercialV2WebCenters | `/commercial-v2/web/centers` | CommercialV2WebCentersPage | FOUNDATION_PLACEHOLDER | Commercial V2 Web Owner |
| LIB-RTE-012 | Routes.commercialSpecialistProfessionalLibrary | `/commercial/specialist/professional-library` | SpecialistProfessionalLibraryPage | ACTIVE_REFERENCE_LIBRARY | Specialist Room Owner |
| LIB-RTE-013 | Routes.commercialCenterProfessionalLibrary | `/commercial/center/professional-library` | CenterProfessionalLibraryPage | ACTIVE_REFERENCE_LIBRARY | Center Room Owner |

## Validation

Every active route documented: YES

Missing route cards: 0

## Final Status

LIBRARY_ROUTE_REGISTRY_CREATED
