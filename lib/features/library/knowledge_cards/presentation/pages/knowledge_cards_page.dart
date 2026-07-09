import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/data/knowledge_card_repository.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/domain/models/knowledge_card.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/presentation/pages/knowledge_article_viewer_page.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/presentation/widgets/knowledge_cards_rolling_carousel.dart';

class KnowledgeCardsPage extends StatefulWidget {
  const KnowledgeCardsPage({super.key});

  @override
  State<KnowledgeCardsPage> createState() => _KnowledgeCardsPageState();
}

class _KnowledgeCardsPageState extends State<KnowledgeCardsPage> {
  final KnowledgeCardRepository _repository = AssetKnowledgeCardRepository();
  PageController? _pageController;
  Future<List<KnowledgeCard>>? _cardsFuture;
  double _viewportFraction = 0.82;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _cardsFuture = _repository.loadCards();
    _syncPageController(_viewportFraction);
  }

  @override
  void dispose() {
    _pageController?.removeListener(_handlePageChange);
    _pageController?.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    if (!mounted) return;
    setState(() => _page = _pageController?.page ?? 0);
  }

  void _syncPageController(double viewportFraction) {
    if (_pageController != null && _viewportFraction == viewportFraction) {
      return;
    }

    final oldPage = _pageController?.hasClients == true
        ? (_pageController?.page ?? _page)
        : _page;

    _pageController?.removeListener(_handlePageChange);
    _pageController?.dispose();
    _viewportFraction = viewportFraction;
    _pageController = PageController(
      initialPage: oldPage.round().clamp(0, 999).toInt(),
      viewportFraction: viewportFraction,
    )..addListener(_handlePageChange);
    _page = oldPage;
  }

  void _goToPage(int targetIndex, int itemCount) {
    if (itemCount == 0) return;
    final clamped = targetIndex.clamp(0, itemCount - 1).toInt();
    _pageController?.animateToPage(
      clamped,
      duration: const Duration(milliseconds: 360),
      curve: Curves.easeOutCubic,
    );
  }

  void _openCard(KnowledgeCard card) {
    if (!card.enabled || card.future) return;
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        settings: RouteSettings(
          name: Routes.knowledgeArticleViewer,
          arguments: {'cardId': card.id},
        ),
        transitionDuration: const Duration(milliseconds: 360),
        reverseTransitionDuration: const Duration(milliseconds: 260),
        pageBuilder: (context, animation, secondaryAnimation) {
          return KnowledgeArticleViewerPage(
            card: card,
            repository: _repository,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          );
          return FadeTransition(
            opacity: curved,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.035),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            tooltip: 'Back',
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          foregroundColor: const Color(0xFFFFE7B2),
          title: const Text(
            '\u062d\u0642\u0643 \u062a\u0639\u0631\u0641',
            style: TextStyle(
              color: Color(0xFFFFD47A),
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<KnowledgeCard>>(
          future: _cardsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const _KnowledgeLoadingState();
            }
            if (snapshot.hasError) {
              return _KnowledgeErrorState(
                message: snapshot.error.toString(),
                onRetry: () {
                  setState(() {
                    _cardsFuture = _repository.loadCards();
                  });
                },
              );
            }

            final cards = snapshot.data ?? const <KnowledgeCard>[];
            return LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final isMobile = width < 700;
                final isTablet = width >= 700 && width < 1100;
                final viewportFraction = isMobile
                    ? 0.82
                    : isTablet
                        ? 0.56
                        : 0.31;
                _syncPageController(viewportFraction);

                return Shortcuts(
                  shortcuts: const <ShortcutActivator, Intent>{
                    SingleActivator(LogicalKeyboardKey.arrowLeft):
                        _PreviousCardIntent(),
                    SingleActivator(LogicalKeyboardKey.arrowRight):
                        _NextCardIntent(),
                  },
                  child: Actions(
                    actions: <Type, Action<Intent>>{
                      _PreviousCardIntent: CallbackAction<_PreviousCardIntent>(
                        onInvoke: (_) {
                          _goToPage(
                            (_pageController?.page ?? _page).round() - 1,
                            cards.length,
                          );
                          return null;
                        },
                      ),
                      _NextCardIntent: CallbackAction<_NextCardIntent>(
                        onInvoke: (_) {
                          _goToPage(
                            (_pageController?.page ?? _page).round() + 1,
                            cards.length,
                          );
                          return null;
                        },
                      ),
                    },
                    child: Focus(
                      autofocus: true,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              isMobile ? 18 : 34,
                              isMobile ? 14 : 28,
                              isMobile ? 18 : 34,
                              isMobile ? 8 : 16,
                            ),
                            child: const _KnowledgeCardsHeader(),
                          ),
                          Expanded(
                            child: KnowledgeCardsRollingCarousel(
                              controller: _pageController!,
                              page: _page,
                              cards: cards,
                              onCardPressed: _openCard,
                            ),
                          ),
                          KnowledgeCarouselControls(
                            compact: isMobile,
                            isRtl: isRtl,
                            onPrevious: () => _goToPage(
                              (_pageController?.page ?? _page).round() - 1,
                              cards.length,
                            ),
                            onNext: () => _goToPage(
                              (_pageController?.page ?? _page).round() + 1,
                              cards.length,
                            ),
                          ),
                          SizedBox(height: isMobile ? 12 : 28),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _KnowledgeCardsHeader extends StatelessWidget {
  const _KnowledgeCardsHeader();

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 700;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Knowledge Cards',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFFFD47A),
            fontSize: compact ? 30 : 44,
            fontWeight: FontWeight.w900,
            height: 1.05,
            shadows: const [
              Shadow(color: Colors.black, blurRadius: 16),
            ],
          ),
        ),
        SizedBox(height: compact ? 8 : 10),
        Container(
          width: compact ? 120 : 180,
          height: 1,
          color: const Color(0xFFFFD98A).withValues(alpha: 0.32),
        ),
      ],
    );
  }
}

class _KnowledgeLoadingState extends StatelessWidget {
  const _KnowledgeLoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFFFFD47A),
      ),
    );
  }
}

class _KnowledgeErrorState extends StatelessWidget {
  const _KnowledgeErrorState({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Color(0xFFFFD47A),
              size: 36,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFFFE7B2)),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviousCardIntent extends Intent {
  const _PreviousCardIntent();
}

class _NextCardIntent extends Intent {
  const _NextCardIntent();
}
