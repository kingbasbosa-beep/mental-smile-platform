# COMMERCIAL_V2_DISPLAY_SECTION_REGISTRY_V1

Status: ACTIVE DISPLAY SECTION REGISTRY

## Rule

Display Sections represent where the provider wishes to appear inside discovery/library surfaces.

They are package routing codes.

They are not identity.

## Display Sections

| Display Section ID | Code | Label | Destination Meaning | Package Routing Status |
|---|---|---|---|---|
| `CV2-DSP-001` | `DSP-LIBRARY` | Library | Public Library display. | ACTIVE_CODE |
| `CV2-DSP-002` | `DSP-SPECIALISTS` | Specialists | Specialist display section. | ACTIVE_CODE |
| `CV2-DSP-003` | `DSP-CENTERS` | Centers | Center display section. | ACTIVE_CODE |

## Boundary

Display Section codes travel through packages from `PLG-CV2-OUT`.

They do not become direct Library routes.

They do not overwrite Primary Specialty.

FINAL STATUS: COMMERCIAL_V2_DISPLAY_SECTION_REGISTRY_COMPLETE
