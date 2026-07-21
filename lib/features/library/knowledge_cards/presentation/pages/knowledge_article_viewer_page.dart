import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mental_smile_os/features/library/knowledge_cards/data/knowledge_card_repository.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/domain/models/knowledge_card.dart';
import 'package:mental_smile_os/shared/links/safe_external_link_launcher.dart';

class KnowledgeArticleViewerPage extends StatefulWidget {
  KnowledgeArticleViewerPage({
    super.key,
    required this.card,
    KnowledgeCardRepository? repository,
  }) : repository = repository ?? AssetKnowledgeCardRepository();

  final KnowledgeCard card;
  final KnowledgeCardRepository repository;

  @override
  State<KnowledgeArticleViewerPage> createState() =>
      _KnowledgeArticleViewerPageState();
}

class _KnowledgeArticleViewerPageState extends State<KnowledgeArticleViewerPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<Future<String>?> _markdownFutures;
  late final List<ScrollController> _scrollControllers;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: KnowledgeArticleTab.values.length,
      vsync: this,
    )..addListener(_handleTabChange);
    _markdownFutures = List<Future<String>?>.filled(
      KnowledgeArticleTab.values.length,
      null,
    );
    _scrollControllers = [
      for (var i = 0; i < KnowledgeArticleTab.values.length; i++)
        ScrollController(),
    ];
    _ensureMarkdownFuture(0);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    for (final controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _ensureMarkdownFuture(int index) {
    _markdownFutures[index] ??= widget.repository.loadMarkdown(
      card: widget.card,
      tab: KnowledgeArticleTab.values[index],
    );
  }

  void _handleTabChange() {
    final next = _tabController.index;
    if (_selectedIndex == next || !mounted) return;
    _ensureMarkdownFuture(next);
    setState(() => _selectedIndex = next);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: const Color(0xFFFFE7B2),
          elevation: 0,
          title: const SizedBox.shrink(),
        ),
        body: Column(
          children: [
            _ArticleTabBar(controller: _tabController),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeOutCubic,
                child: _MarkdownTabPane(
                  key: ValueKey<int>(_selectedIndex),
                  future: _markdownFutures[_selectedIndex]!,
                  card: widget.card,
                  scrollController: _scrollControllers[_selectedIndex],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleTabBar extends StatelessWidget {
  const _ArticleTabBar({required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 700;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        compact ? 14 : 28,
        compact ? 8 : 14,
        compact ? 14 : 28,
        compact ? 10 : 16,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 920),
          child: TabBar(
            controller: controller,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: const Color(0xFFD8A13F).withValues(alpha: 0.20),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFFFD98A).withValues(alpha: 0.62),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: const Color(0xFFFFD47A),
            unselectedLabelColor:
                const Color(0xFFFFE7B2).withValues(alpha: 0.72),
            labelPadding: EdgeInsets.symmetric(horizontal: compact ? 8 : 10),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: compact ? 15 : 17,
              height: 1.2,
            ),
            tabs: const [
              Tab(child: _ArticleTabButtonLabel(label: 'الصفحة الأولى')),
              Tab(child: _ArticleTabButtonLabel(label: 'الصفحة الثانية')),
              Tab(child: _ArticleTabButtonLabel(label: 'الصفحة الثالثة')),
              Tab(child: _ArticleTabButtonLabel(label: 'المصادر')),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticleTabButtonLabel extends StatelessWidget {
  const _ArticleTabButtonLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 128, minHeight: 52),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF080704).withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.26),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _MarkdownTabPane extends StatelessWidget {
  const _MarkdownTabPane({
    super.key,
    required this.future,
    required this.card,
    required this.scrollController,
  });

  final Future<String> future;
  final KnowledgeCard card;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFFFD47A)),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFFFE7B2)),
              ),
            ),
          );
        }

        final markdown = snapshot.data ?? '';
        return SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.fromLTRB(
            MediaQuery.sizeOf(context).width < 700 ? 18 : 34,
            22,
            MediaQuery.sizeOf(context).width < 700 ? 18 : 34,
            42,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: SelectionArea(
                child: MarkdownBody(
                  data: markdown,
                  selectable: true,
                  softLineBreak: true,
                  extensionSet: md.ExtensionSet.gitHubFlavored,
                  onTapLink: (text, href, title) =>
                      _openMarkdownLink(context, href),
                  sizedImageBuilder: (config) {
                    return _MarkdownImage(
                      uri: config.uri,
                      card: card,
                      width: config.width,
                      height: config.height,
                    );
                  },
                  styleSheet: _markdownStyle(context),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MarkdownImage extends StatelessWidget {
  const _MarkdownImage({
    required this.uri,
    required this.card,
    this.width,
    this.height,
  });

  final Uri uri;
  final KnowledgeCard card;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final source = uri.toString();
    final isRemote = uri.scheme == 'http' || uri.scheme == 'https';
    final path = source.startsWith('assets/')
        ? source
        : 'assets/content/library/know_your_right/${card.folderName}/$source';

    final image = isRemote
        ? Image.network(
            source,
            width: width,
            height: height,
            fit: BoxFit.contain,
          )
        : Image.asset(
            path,
            width: width,
            height: height,
            fit: BoxFit.contain,
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: image,
      ),
    );
  }
}

MarkdownStyleSheet _markdownStyle(BuildContext context) {
  const textColor = Color(0xFFFFEFD0);
  const gold = Color(0xFFFFD47A);
  final compact = MediaQuery.sizeOf(context).width < 700;

  final base = TextStyle(
    color: textColor,
    fontSize: compact ? 17 : 19,
    height: 1.8,
    fontWeight: FontWeight.w500,
  );

  return MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
    p: base,
    h1: base.copyWith(
      color: gold,
      fontSize: compact ? 28 : 36,
      height: 1.35,
      fontWeight: FontWeight.w900,
    ),
    h2: base.copyWith(
      color: gold,
      fontSize: compact ? 24 : 30,
      height: 1.4,
      fontWeight: FontWeight.w900,
    ),
    h3: base.copyWith(
      color: gold,
      fontSize: compact ? 21 : 24,
      height: 1.45,
      fontWeight: FontWeight.w900,
    ),
    listBullet: base.copyWith(color: gold, fontWeight: FontWeight.w900),
    strong: base.copyWith(color: gold, fontWeight: FontWeight.w900),
    em: base.copyWith(fontStyle: FontStyle.italic),
    a: base.copyWith(
      color: const Color(0xFF93D7FF),
      decoration: TextDecoration.underline,
      decorationColor: const Color(0xFF93D7FF),
    ),
    blockquote: base.copyWith(
      color: const Color(0xFFFFE7B2),
      fontStyle: FontStyle.italic,
    ),
    code: const TextStyle(
      color: Color(0xFFFFE7B2),
      backgroundColor: Color(0xFF1B1007),
      fontFamily: 'monospace',
    ),
    codeblockDecoration: BoxDecoration(
      color: const Color(0xFF1B1007),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: const Color(0xFFFFD98A).withValues(alpha: 0.22),
      ),
    ),
    horizontalRuleDecoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.24),
          width: 1,
        ),
      ),
    ),
    tableHead: base.copyWith(color: gold, fontWeight: FontWeight.w900),
    tableBody: base.copyWith(fontSize: compact ? 15 : 16),
    tableBorder: TableBorder.all(
      color: const Color(0xFFFFD98A).withValues(alpha: 0.22),
    ),
    tableCellsPadding: const EdgeInsets.all(10),
    blockquoteDecoration: BoxDecoration(
      color: const Color(0xFFD8A13F).withValues(alpha: 0.10),
      borderRadius: BorderRadius.circular(14),
      border: BorderDirectional(
        start: BorderSide(
          color: const Color(0xFFFFD47A).withValues(alpha: 0.62),
          width: 3,
        ),
      ),
    ),
  );
}

Future<void> _openMarkdownLink(BuildContext context, String? href) async {
  if (href == null || href.trim().isEmpty) return;
  await SafeExternalLinkLauncher.open(context, href);
}
