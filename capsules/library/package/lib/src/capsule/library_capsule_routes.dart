import 'package:flutter/material.dart';

typedef LibraryCapsulePageBuilder = Widget Function(BuildContext context);

class LibraryCapsuleRouteDescriptor {
  const LibraryCapsuleRouteDescriptor({
    required this.routeCode,
    required this.routePath,
    required this.destinationName,
    required this.owner,
    required this.requiredCapability,
    required this.lifecycleRequirement,
    required this.builder,
  });

  final String routeCode;
  final String routePath;
  final String destinationName;
  final String owner;
  final String requiredCapability;
  final String lifecycleRequirement;
  final LibraryCapsulePageBuilder builder;
}

class LibraryCapsuleRoutes {
  const LibraryCapsuleRoutes._();

  static const webLibrary = '/web/library';
  static const knowledgeCards = '/web/library/know-your-right/cards';
  static const knowledgeArticleViewer = '/web/library/know-your-right/article';
  static const libraryProviderSpecialists = '/library/providers/specialists';
  static const libraryProviderCenters = '/library/providers/centers';

  static final descriptors = <LibraryCapsuleRouteDescriptor>[
    _descriptor(
      'MS-LIB-ROUTE-001',
      webLibrary,
      'LibraryPage',
      'LIBRARY',
      'library_home',
    ),
    _descriptor(
      'MS-LIB-ROUTE-002',
      knowledgeCards,
      'KnowledgeCardsPage',
      'LIBRARY_CONTENT',
      'knowledge_cards',
    ),
    _descriptor(
      'MS-LIB-ROUTE-003',
      knowledgeArticleViewer,
      'KnowledgeArticleViewerPage',
      'LIBRARY_ARTICLE',
      'article_viewer',
    ),
    _descriptor(
      'MS-LIB-ROUTE-004',
      libraryProviderSpecialists,
      'LibrarySpecialistsPage',
      'LIBRARY_PROVIDER_CONTENT',
      'specialists_branch',
    ),
    _descriptor(
      'MS-LIB-ROUTE-005',
      libraryProviderCenters,
      'LibraryCentersPage',
      'LIBRARY_PROVIDER_CONTENT',
      'centers_branch',
    ),
  ];

  static LibraryCapsuleRouteDescriptor _descriptor(
    String code,
    String path,
    String destination,
    String owner,
    String capability,
  ) {
    return LibraryCapsuleRouteDescriptor(
      routeCode: code,
      routePath: path,
      destinationName: destination,
      owner: owner,
      requiredCapability: capability,
      lifecycleRequirement: 'MATERIALIZED_UNMOUNTED_OR_TEST',
      builder: (_) => _LibraryCapsuleRoutePage(
        routeCode: code,
        routePath: path,
        destination: destination,
        owner: owner,
      ),
    );
  }
}

class _LibraryCapsuleRoutePage extends StatelessWidget {
  const _LibraryCapsuleRoutePage({
    required this.routeCode,
    required this.routePath,
    required this.destination,
    required this.owner,
  });

  final String routeCode;
  final String routePath;
  final String destination;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [Text(routeCode), Text(routePath), Text('owner: $owner')],
      ),
    );
  }
}
