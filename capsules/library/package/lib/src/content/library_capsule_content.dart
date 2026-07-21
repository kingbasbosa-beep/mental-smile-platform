class LibraryCapsuleContentItem {
  const LibraryCapsuleContentItem({
    required this.contentCode,
    required this.contentId,
    required this.contentType,
    required this.runtimeBoundary,
  });

  final String contentCode;
  final String contentId;
  final String contentType;
  final String runtimeBoundary;
}

class LibraryCapsuleContentRegistry {
  const LibraryCapsuleContentRegistry._();

  static const items = <LibraryCapsuleContentItem>[
    LibraryCapsuleContentItem(
      contentCode: 'MS-LIB-CONTENT-WHY_ME_ADDICTED',
      contentId: 'why_me_addicted',
      contentType: 'knowledge_card',
      runtimeBoundary: 'RUNTIME_CONTENT',
    ),
    LibraryCapsuleContentItem(
      contentCode: 'MS-LIB-CONTENT-COMING_SOON_01',
      contentId: 'coming_soon_01',
      contentType: 'knowledge_card',
      runtimeBoundary: 'COMING_SOON_CONTENT',
    ),
    LibraryCapsuleContentItem(
      contentCode: 'MS-LIB-CONTENT-COMING_SOON_02',
      contentId: 'coming_soon_02',
      contentType: 'knowledge_card',
      runtimeBoundary: 'COMING_SOON_CONTENT',
    ),
    LibraryCapsuleContentItem(
      contentCode: 'MS-LIB-CONTENT-COMING_SOON_03',
      contentId: 'coming_soon_03',
      contentType: 'knowledge_card',
      runtimeBoundary: 'COMING_SOON_CONTENT',
    ),
  ];

  static const runtimeContentItems = 1;
  static const editorialSources = 3;
  static const organizationReferences = 0;
}
