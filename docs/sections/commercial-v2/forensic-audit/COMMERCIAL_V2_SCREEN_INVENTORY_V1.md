# Commercial V2 Screen Inventory V1

Date: 2026-07-02
Mode: Investigation only

## Screens

| File | Widget | Route(s) | Entry Points | Exit Points | Buttons | Purpose | Current Owner |
|---|---|---|---|---|---|---|---|
| `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart` | `CommercialV2WebShowcasePage` | `/commercial-v2/web` | direct URL, Admin TV `SEC-CV2` shortcut | `/web/library`, `/library/providers/specialists`, `/library/providers/centers` | Library, Specialists, Centers showcase cards | Commercial V2 public showcase gateway | SEC-CV2 |
| `lib/features/commercial_v2_web/presentation/widgets/commercial_v2_web_showcase_card.dart` | `CommercialV2WebShowcaseCard` | used inside `/commercial-v2/web` | showcase page loop | card tap route supplied by registry | card body with accessibility icon | Reusable CV2 showcase card | SEC-CV2 |
| `lib/features/commercial_v2_web/presentation/widgets/commercial_v2_web_background.dart` | `CommercialV2WebBackground` | used inside `/commercial-v2/web` | showcase page | none | none | Visual wrapper | SEC-CV2 |
| `lib/features/library/presentation/pages/library_page.dart` | `LibraryPage` | `/web/library` | direct URL, CV2 Library card, Admin TV `SEC-LIB`, Library back buttons | provider cards to Specialists and Centers, standard Library internal cards | provider content cards and Library content cards | Main Library display | SEC-LIB |
| `lib/features/library/presentation/pages/library_page.dart` | `_LibraryProviderContentSection` | inside `LibraryPage` | Library page | Specialists, Centers | two provider content cards | Library-owned provider entry area | SEC-LIB |
| `lib/features/library/presentation/pages/library_provider_content_pages.dart` | `LibrarySpecialistsPage` | `/library/providers/specialists` | direct URL, CV2 Specialists card, Admin TV `SEC-LIB-SP`, Library provider content card, Accessibility check-in, Support entry | specialist branch pages, back to Library | category cards, back controls | Specialist provider category list | SEC-LIB |
| `lib/features/library/presentation/pages/library_provider_content_pages.dart` | `LibraryCentersPage` | `/library/providers/centers` | direct URL, CV2 Centers card, Admin TV `SEC-LIB-CTR`, Library provider content card, Accessibility check-in, Support entry | center branch pages, back to Library | category cards, back controls | Center provider category list | SEC-LIB |
| `lib/features/library/presentation/pages/library_provider_content_pages.dart` | `LibraryProviderBranchPage` | 20 provider branch routes | Specialist and Center category list pages | Back to Library | Back to Library | Future provider content branch surface | SEC-LIB |
| `lib/features/commercial/presentation/pages/admin_room_page.dart` | Admin section shortcut widgets | Admin Operations Room route | Owner Operations Room | `/commercial-v2/web`, `/web/library`, Specialists, Centers | section shortcut cards | Owner quick inspection entry points | SEC-ADM |
| `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart` | accessibility check-in page | accessibility route | accessibility room | Specialists, Centers | link/action rows | Secondary access path into Library provider directories | Accessibility |
| `lib/features/modules/presentation/pages/support_entry_page.dart` | support entry page | support issue selector/module routes | support module | Specialists, Centers | support entry buttons | Secondary support path into Library provider directories | Support Module |
| `lib/features/s_city/presentation/pages/s_city_district_page.dart` | `SCityDistrictPage` | `/s/city` | direct URL, `[S] Surface Index` | internal `[S] City` navigation cards | city cards | Public city discovery skeleton | `[S] City` |
| `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | `SWebSurfacePage` | `/s/city/library`, `/s/city/providers`, `/s/city/centers`, `/s/city/services`, `/s/city/tools`, `/s/city/organizations`, `/s/city/programs`, `/s/city/marketplace` | direct URL, `[S] City` navigation | sibling `[S] City` surfaces | surface navigation chips/cards | Signal-first public discovery placeholder surface | `[S] City` |

## Screen Status Notes

- Commercial V2 registration pages were not found in the active route set.
- The 20 Library provider branch routes are reachable, but the branch surface describes future published content readiness. They are therefore marked PENDING in the route forensic report.
- No active Commercial V2 placeholder screen files were found under `lib/features/commercial_v2_web/presentation/pages/` after the earlier placeholder cleanup.
- Adjacent `[S] City` public surfaces are active route screens and should be considered in future public-web cleanup, but they are not owned by Commercial V2.
