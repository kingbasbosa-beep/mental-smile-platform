class KnowledgeCard {
  const KnowledgeCard({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.folderName,
    required this.enabled,
    required this.future,
    required this.tags,
    required this.estimatedReadMinutes,
    this.difficulty = '',
  });

  final String id;
  final String title;
  final String imagePath;
  final String folderName;
  final bool enabled;
  final bool future;
  final List<String> tags;
  final int estimatedReadMinutes;
  final String difficulty;

  String get heroTag => 'knowledge_card_image_$id';
}

enum KnowledgeArticleTab {
  answer(
    title: '\u0627\u0641\u0647\u0645 \u0627\u0644\u0641\u0643\u0631\u0629',
    fileName: '01_answer.md',
  ),
  arabicSources(
    title: '\u0645\u0635\u0627\u062f\u0631 \u0639\u0631\u0628\u064a\u0629',
    fileName: '02_arabic_sources.md',
  ),
  englishSources(
    title:
        '\u0645\u0635\u0627\u062f\u0631 \u0639\u0627\u0644\u0645\u064a\u0629',
    fileName: '03_english_sources.md',
  ),
  globalReferences(
    title:
        '\u0627\u0644\u0645\u0631\u0627\u062c\u0639 \u0627\u0644\u0639\u0644\u0645\u064a\u0629',
    fileName: '04_global_references.md',
  );

  const KnowledgeArticleTab({
    required this.title,
    required this.fileName,
  });

  final String title;
  final String fileName;
}
