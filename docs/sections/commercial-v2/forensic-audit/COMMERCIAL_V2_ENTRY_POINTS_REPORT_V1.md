# Commercial V2 Entry Points Report V1

Date: 2026-07-02
Mode: Investigation only

## Library Entry Points

| Entry Point | Opens | Signal |
|---|---|---|
| Direct URL `/web/library` | `LibraryPage` | none from route open observed |
| Admin TV shortcut `SEC-LIB` | `/web/library` | none from shortcut observed in inspected snippet |
| Commercial V2 Library card | `/web/library` | `CV2_SIG_OPEN_LIBRARY` |
| Back-to-Library buttons from provider pages | `/web/library` | `LibrarySignalCode.backTap` |

## Specialists Entry Points

| Entry Point | Opens | Signal |
|---|---|---|
| Direct URL `/library/providers/specialists` | `LibrarySpecialistsPage` | `LibrarySignalCode.specialistsBranchView` on build |
| Admin TV shortcut `SEC-LIB-SP` | `/library/providers/specialists` | none from shortcut observed in inspected snippet |
| Commercial V2 Specialists card | `/library/providers/specialists` | `CV2_SIG_OPEN_SPECIALISTS` |
| Library provider content card | `/library/providers/specialists` | `LibrarySignalCode.providerSpecialistsOpen` |
| Accessibility check-in page | `/library/providers/specialists` | not audited beyond route reference |
| Support entry page | `/library/providers/specialists` | not audited beyond route reference |

## Centers Entry Points

| Entry Point | Opens | Signal |
|---|---|---|
| Direct URL `/library/providers/centers` | `LibraryCentersPage` | `LibrarySignalCode.centersBranchView` on build |
| Admin TV shortcut `SEC-LIB-CTR` | `/library/providers/centers` | none from shortcut observed in inspected snippet |
| Commercial V2 Centers card | `/library/providers/centers` | `CV2_SIG_OPEN_CENTERS` |
| Library provider content card | `/library/providers/centers` | `LibrarySignalCode.providerCentersOpen` |
| Accessibility check-in page | `/library/providers/centers` | not audited beyond route reference |
| Support entry page | `/library/providers/centers` | not audited beyond route reference |

## Commercial V2 Entry Points

| Entry Point | Opens | Status |
|---|---|---|
| Direct URL `/commercial-v2/web` | `CommercialV2WebShowcasePage` | ACTIVE |
| Admin TV shortcut `SEC-CV2` | `/commercial-v2/web` | ACTIVE |

## Registration Entry Points

| Entry Point | Opens | Status |
|---|---|---|
| Admin TV shortcut `SEC-CV2-REG-SP` | none | ROUTE_PENDING |
| Admin TV shortcut `SEC-CV2-REG-CTR` | none | ROUTE_PENDING |

