# LIBRARY_ROUTE_EXCERPTS_V1

Status: SNAPSHOTTED

## Route Constants

```dart
static const webLibrary = '/web/library';
static const libraryProviderSpecialists = '/library/providers/specialists';
static const libraryProviderCenters = '/library/providers/centers';
```

## Router Cases

```dart
case Routes.webLibrary:
  return MaterialPageRoute(
    builder: (_) => LibraryPage(
      initialCategoryKey: _libraryCategoryKey(settings),
    ),
    settings: settings,
  );

case Routes.libraryProviderSpecialists:
  return MaterialPageRoute(
    builder: (_) => const LibrarySpecialistsPage(),
    settings: settings,
  );

case Routes.libraryProviderCenters:
  return MaterialPageRoute(
    builder: (_) => const LibraryCentersPage(),
    settings: settings,
  );
```

FINAL STATUS: LIBRARY_ROUTES_SNAPSHOTTED
