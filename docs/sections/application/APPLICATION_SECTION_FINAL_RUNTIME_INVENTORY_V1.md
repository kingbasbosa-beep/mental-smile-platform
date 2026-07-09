# APPLICATION SECTION FINAL RUNTIME INVENTORY V1

Operation ID: OP-APPLICATION-SECTION-OPERATIONAL-FREEZE-BLOCK-V1

Classification allowed: ACTIVE / ARCHIVE_ONLY

## Runtime Surfaces

| Runtime Item | File / Owner | Classification | Notes |
| --- | --- | --- | --- |
| Splash | `lib/features/splash/presentation/pages/splash_page.dart` | ACTIVE | Application entry gateway. |
| Client Room | `lib/features/client/presentation/pages/client_room_page.dart` | ACTIVE | Quick Access residential surface. |
| Accessibility Room | `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | ACTIVE | Accessibility residential surface. |
| Residential Exit Social Portal | `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart` | ACTIVE | Residential-owned exit and return-to-splash destination. |
| Unified Start reference | `/commercial-v2/start` | ACTIVE | Provider / Center / Owner Access destination from Splash. |
| Legacy Login destination | `/login` | ARCHIVE_ONLY | Not exposed on Splash after finalization; retained as historical/legacy route. |
| Old owner/admin/monitoring login destinations | router-protected legacy/auth flows | ARCHIVE_ONLY | Not Application entry surfaces. |

## Runtime Systems Not Connected

| System | Classification | Notes |
| --- | --- | --- |
| Application Aggregation runtime | ARCHIVE_ONLY | Documented foundation only; no runtime connection. |
| Complaint runtime | ARCHIVE_ONLY | Guidance only; no collection or workflow. |
| Monitoring connection | ARCHIVE_ONLY | Not connected from Application. |
| Administrative connection | ARCHIVE_ONLY | Not connected from Application. |

Freeze Status:

PASS
