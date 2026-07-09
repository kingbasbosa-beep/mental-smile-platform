# LIBRARY_SIGNAL_EMITTER_MAP_V1

Status: ACTIVE

| Source File | Source Widget | Signal Code | Emitter |
|---|---|---|---|
| `library_page.dart` | `LibraryPage.initState` | L.S.001.VIEW | `LibrarySignalEmitter.emit` |
| `library_page.dart` | `InitialCategoryRoute` | L.C.001.OPEN | `LibrarySignalEmitter.emit` |
| `library_page.dart` | `LibraryCarousel` | L.B.001.TAP / L.B.002.TAP | `LibrarySignalEmitter.emit` |
| `library_page.dart` | `LibraryPolicyButton` | L.B.004.TAP | `LibrarySignalEmitter.emit` |
| `library_page.dart` | `LibraryBackButton` | L.B.003.TAP | `LibrarySignalEmitter.emit` |
| `library_page.dart` | `LibraryProviderContentCard` | L.C.003.OPEN / L.C.004.OPEN | `LibrarySignalEmitter.emit` |
| `library_page.dart` | `LibraryCategoryCard` | L.C.001.OPEN | `LibrarySignalEmitter.emit` |
| `library_provider_content_pages.dart` | `LibrarySpecialistsPage` | L.S.003.VIEW | `LibrarySignalEmitter.emit` |
| `library_provider_content_pages.dart` | `LibraryCentersPage` | L.S.004.VIEW | `LibrarySignalEmitter.emit` |
| `library_provider_content_pages.dart` | `LibraryProviderBranchPage` | L.S.005.VIEW | `LibrarySignalEmitter.emit` |
| `library_provider_content_pages.dart` | `ProviderBackBar` | L.B.003.TAP | `LibrarySignalEmitter.emit` |
| `library_provider_content_pages.dart` | `ProviderCategoryCard` | L.C.005.OPEN | `LibrarySignalEmitter.emit` |

Signals remaining unwired:

- Future search/filter/sort controls: RESERVED, no active UI yet.
- Future public profile opening: RESERVED, no active profile cards yet.
- Future external resources/registration/support actions: RESERVED, no active governed runtime action yet.
