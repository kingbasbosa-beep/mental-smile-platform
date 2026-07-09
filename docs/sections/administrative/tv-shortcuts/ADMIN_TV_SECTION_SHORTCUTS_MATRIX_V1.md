# ADMIN_TV_SECTION_SHORTCUTS_MATRIX_V1

Status: ACTIVE

## Purpose

Define the Administrative / Operations Room TV section shortcut widgets for Owner and Operations quick review during publishing, marketing, QA, and visual inspection.

## Shortcut Matrix

| Section Code | Destination Purpose | UI State | Route Used | Notes |
|---|---|---|---|---|
| `SEC-LIB` | Library Display | ACTIVE | `Routes.webLibrary` | Opens Library directly. |
| `SEC-RES` | Client Room | ACTIVE | `Routes.clientRoom` | Opens existing direct Client Room route without adding login logic. |
| `SEC-CV2-REG-SP` | Specialist Registration | ROUTE_PENDING | None | Disabled card because no direct Commercial V2 Specialist registration route exists. |
| `SEC-CV2-REG-CTR` | Center Registration | ROUTE_PENDING | None | Disabled card because no direct Commercial V2 Center registration route exists. |
| `SEC-LIB-SP` | Library Specialists | ACTIVE | `Routes.libraryProviderSpecialists` | Opens Library Specialists display section. |
| `SEC-LIB-CTR` | Library Centers | ACTIVE | `Routes.libraryProviderCenters` | Opens Library Centers display section. |
| `SEC-CV2` | Commercial V2 Web | ACTIVE | `Routes.commercialV2Web` | Opens Commercial V2 web/showcase section. |

## UI Rule

Shortcut cards use section codes as the primary label. Disabled shortcuts show `ROUTE_PENDING`.

FINAL STATUS: ADMIN_TV_SECTION_SHORTCUTS_MATRIX_COMPLETE
