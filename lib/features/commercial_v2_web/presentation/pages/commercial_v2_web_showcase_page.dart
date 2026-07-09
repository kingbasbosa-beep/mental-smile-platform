import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_smile_os/app/locale_provider.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation/widgets/commercial_v2_web_background.dart';
import 'package:mental_smile_os/features/presentation_gallery/data/presentation_gallery_repository.dart';
import 'package:mental_smile_os/features/presentation_gallery/domain/models/presentation_card.dart';
import 'package:mental_smile_os/features/presentation_gallery/presentation/pages/presentation_viewer_page.dart';
import 'package:mental_smile_os/features/presentation_gallery/presentation/widgets/presentation_asset_image.dart';

class CommercialV2WebShowcasePage extends ConsumerStatefulWidget {
  const CommercialV2WebShowcasePage({super.key});

  @override
  ConsumerState<CommercialV2WebShowcasePage> createState() =>
      _CommercialV2WebShowcasePageState();
}

class _CommercialV2WebShowcasePageState
    extends ConsumerState<CommercialV2WebShowcasePage> {
  static const String _heroAsset =
      'assets/branding/web/website_hero_top_v2.png';

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _openRoute(String route) {
    Navigator.of(context).pushNamed(route);
  }

  void _switchLocale(String languageCode) {
    ref.read(localeProvider.notifier).state = Locale(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode != 'en';
    final copy = _WebsiteCopy.forLocale(isArabic);
    final direction = isArabic ? TextDirection.rtl : TextDirection.ltr;

    return CommercialV2WebBackground(
      textDirection: direction,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final isMobile = width < 640;
          final horizontalPadding = isMobile ? 16.0 : 32.0;

          return Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: FractionallySizedBox(
                  widthFactor: isMobile ? 1.0 : 0.88,
                  heightFactor: isMobile ? 1.0 : 0.88,
                  child: Image.asset(
                    _heroAsset,
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                    excludeFromSemantics: true,
                  ),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xD9000000),
                      Color(0x99000000),
                      Color(0xE6000000),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  isMobile ? 8 : 14,
                  horizontalPadding,
                  34,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1440),
                    child: Column(
                      children: [
                        SizedBox(height: isMobile ? 20 : 26),
                        _HeroSection(
                          isMobile: isMobile,
                        ),
                        SizedBox(height: isMobile ? 24 : 32),
                        const _PlatformGuidesCarousel(),
                        SizedBox(height: isMobile ? 24 : 32),
                        const _LandingPresentationCarousel(),
                        SizedBox(height: isMobile ? 24 : 32),
                        _TrustBar(copy: copy),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: isMobile ? 12 : 20,
                      top: isMobile ? 10 : 16,
                    ),
                    child: _LanguageSwitch(
                      isArabic: isArabic,
                      onArabic: () => _switchLocale('ar'),
                      onEnglish: () => _switchLocale('en'),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: isMobile ? 12 : 20,
                      top: isMobile ? 10 : 16,
                    ),
                    child: _HeroFloatingActions(
                      onOpenDesktop: () => _openRoute(Routes.legacySplash),
                      onOpenApp: () => _openRoute(Routes.splash),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeroFloatingActions extends StatelessWidget {
  const _HeroFloatingActions({
    required this.onOpenDesktop,
    required this.onOpenApp,
  });

  final VoidCallback onOpenDesktop;
  final VoidCallback onOpenApp;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 640;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FloatingHeroAction(
          label: 'ديسكتوب',
          icon: Icons.desktop_windows_rounded,
          onPressed: onOpenDesktop,
          compact: compact,
        ),
        SizedBox(width: compact ? 8 : 10),
        _FloatingHeroAction(
          label: 'موبايل',
          icon: Icons.phone_iphone_rounded,
          onPressed: onOpenApp,
          compact: compact,
        ),
      ],
    );
  }
}

class _FloatingHeroAction extends StatefulWidget {
  const _FloatingHeroAction({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.compact,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool compact;

  @override
  State<_FloatingHeroAction> createState() => _FloatingHeroActionState();
}

class _FloatingHeroActionState extends State<_FloatingHeroAction> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.label,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedScale(
          scale: _hovered ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOutCubic,
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: widget.onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.symmetric(
                horizontal: widget.compact ? 10 : 12,
                vertical: widget.compact ? 8 : 9,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: _hovered ? 0.66 : 0.50),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: const Color(0xFFD7A936).withValues(
                    alpha: _hovered ? 0.72 : 0.42,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC8952D).withValues(
                      alpha: _hovered ? 0.18 : 0.10,
                    ),
                    blurRadius: _hovered ? 18 : 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    color: const Color(0xFFFFE3A1),
                    size: widget.compact ? 16 : 18,
                  ),
                  SizedBox(width: widget.compact ? 5 : 6),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: const Color(0xFFFFE3A1),
                      fontSize: widget.compact ? 11 : 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: isMobile ? 150 : 250);
  }
}

class _PlatformGuidesCarousel extends StatefulWidget {
  const _PlatformGuidesCarousel();

  @override
  State<_PlatformGuidesCarousel> createState() =>
      _PlatformGuidesCarouselState();
}

class _PlatformGuidesCarouselState extends State<_PlatformGuidesCarousel> {
  static const List<_PlatformGuide> _guides = [
    _PlatformGuide(
      assetPath:
          'assets/library/platform_guides/platform_guide_desktop.webp.png',
    ),
    _PlatformGuide(
      assetPath:
          'assets/library/platform_guides/platform_guide_mobile.webp.png',
    ),
    _PlatformGuide(
      assetPath:
          'assets/library/platform_guides/platform_guide_content_access.webp.png',
    ),
    _PlatformGuide(
      assetPath: 'assets/library/platform_guides/platform_official_links.webp',
      fallbackAssetPath:
          'assets/library/backgrounds/official_links_background.webp.png',
      routeName: Routes.officialPlatformLinks,
    ),
  ];

  PageController? _controller;
  double? _viewportFraction;
  double _page = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextFraction = _fractionFor(MediaQuery.sizeOf(context).width);
    if (_viewportFraction != nextFraction) {
      _configureController(nextFraction);
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_syncPage);
    _controller?.dispose();
    super.dispose();
  }

  double _fractionFor(double width) {
    if (width < 640) return 0.88;
    if (width < 1024) return 0.50;
    return 0.35;
  }

  void _configureController(double fraction) {
    final previousPage =
        _controller?.hasClients == true ? _controller!.page ?? _page : _page;
    final initialPage =
        previousPage.round().clamp(0, _guides.length - 1).toInt();

    _controller?.removeListener(_syncPage);
    _controller?.dispose();
    _viewportFraction = fraction;
    _page = initialPage.toDouble();
    _controller = PageController(
      initialPage: initialPage,
      viewportFraction: fraction,
    )..addListener(_syncPage);
  }

  void _syncPage() {
    final controller = _controller;
    if (controller == null) return;
    final nextPage = controller.page ?? _page;
    if ((nextPage - _page).abs() < 0.001) return;
    setState(() => _page = nextPage);
  }

  void _openGuide(int index) {
    final guide = _guides[index];
    if (guide.routeName != null) {
      Navigator.of(context).pushNamed(guide.routeName!);
      return;
    }

    final viewerGuides = [
      for (final item in _guides)
        if (item.routeName == null)
          PresentationCard(
            id: item.assetPath,
            assetPath: item.assetPath,
            fallbackAssetPath: item.fallbackAssetPath,
          ),
    ];

    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (_, animation, __) => FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ),
          child: PresentationViewerPage(
            presentations: viewerGuides,
            initialIndex: index.clamp(0, viewerGuides.length - 1).toInt(),
          ),
        ),
        transitionDuration: const Duration(milliseconds: 220),
        reverseTransitionDuration: const Duration(milliseconds: 180),
      ),
    );
  }

  int get _currentIndex {
    final currentPage =
        _controller?.hasClients == true ? _controller!.page ?? _page : _page;
    return currentPage.round().clamp(0, _guides.length - 1).toInt();
  }

  void _goToGuide(int index) {
    if (index < 0 || index >= _guides.length) return;
    _controller?.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null) return const SizedBox.shrink();

    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 640;
    final tablet = width >= 640 && width < 1024;
    final height = compact
        ? 220.0
        : tablet
            ? 292.0
            : 360.0;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1360),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height,
              child: PageView.builder(
                controller: controller,
                itemCount: _guides.length,
                padEnds: true,
                clipBehavior: Clip.none,
                physics: const PageScrollPhysics(),
                itemBuilder: (context, index) {
                  final distance = (_page - index).abs().clamp(0.0, 1.0);
                  final scale = 1 - (distance * (compact ? 0.07 : 0.055));

                  return Center(
                    child: AnimatedScale(
                      scale: scale,
                      duration: const Duration(milliseconds: 260),
                      curve: Curves.easeOutCubic,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: compact ? 8 : 12),
                        child: _PlatformGuideCard(
                          guide: _guides[index],
                          semanticLabel: 'Platform guide ${index + 1}',
                          onTap: () => _openGuide(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _LandingCarouselControls(
              compact: compact,
              onLeft: _currentIndex == _guides.length - 1
                  ? null
                  : () => _goToGuide(_currentIndex + 1),
              onRight: _currentIndex == 0
                  ? null
                  : () => _goToGuide(_currentIndex - 1),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformGuide {
  const _PlatformGuide({
    required this.assetPath,
    this.fallbackAssetPath,
    this.routeName,
  });

  final String assetPath;
  final String? fallbackAssetPath;
  final String? routeName;
}

class _PlatformGuideCard extends StatefulWidget {
  const _PlatformGuideCard({
    required this.guide,
    required this.semanticLabel,
    required this.onTap,
  });

  final _PlatformGuide guide;
  final String semanticLabel;
  final VoidCallback onTap;

  @override
  State<_PlatformGuideCard> createState() => _PlatformGuideCardState();
}

class _PlatformGuideCardState extends State<_PlatformGuideCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    const radius = 24.0;

    return Semantics(
      button: true,
      label: widget.semanticLabel,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: const Color(0xFFE8BE62).withValues(
                alpha: _hovered ? 0.82 : 0.48,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE8BE62).withValues(
                  alpha: _hovered ? 0.20 : 0.10,
                ),
                blurRadius: _hovered ? 24 : 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: widget.onTap,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  widget.guide.assetPath,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (_, __, ___) {
                    final fallback = widget.guide.fallbackAssetPath;
                    if (fallback == null) return const SizedBox.shrink();
                    return Image.asset(
                      fallback,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LandingPresentationCarousel extends StatefulWidget {
  const _LandingPresentationCarousel();

  @override
  State<_LandingPresentationCarousel> createState() =>
      _LandingPresentationCarouselState();
}

class _LandingPresentationCarouselState
    extends State<_LandingPresentationCarousel> {
  late final List<PresentationCard> _presentations;
  PageController? _controller;
  double? _viewportFraction;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _presentations =
        const AssetPresentationGalleryRepository().loadPresentations();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextFraction = _fractionFor(MediaQuery.sizeOf(context).width);
    if (_viewportFraction != nextFraction) {
      _configureController(nextFraction);
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_syncPage);
    _controller?.dispose();
    super.dispose();
  }

  double _fractionFor(double width) {
    if (width < 640) return 0.86;
    if (width < 1024) return 0.50;
    return 0.40;
  }

  void _configureController(double fraction) {
    final previousPage =
        _controller?.hasClients == true ? _controller!.page ?? _page : _page;
    final initialPage =
        previousPage.round().clamp(0, _presentations.length - 1).toInt();

    _controller?.removeListener(_syncPage);
    _controller?.dispose();
    _viewportFraction = fraction;
    _page = initialPage.toDouble();
    _controller = PageController(
      initialPage: initialPage,
      viewportFraction: fraction,
    )..addListener(_syncPage);
  }

  void _syncPage() {
    final controller = _controller;
    if (controller == null) return;
    final nextPage = controller.page ?? _page;
    if ((nextPage - _page).abs() < 0.001) return;
    setState(() => _page = nextPage);
  }

  void _openViewer(int index) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (_, animation, __) => FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ),
          child: PresentationViewerPage(
            presentations: _presentations,
            initialIndex: index,
          ),
        ),
        transitionDuration: const Duration(milliseconds: 220),
        reverseTransitionDuration: const Duration(milliseconds: 180),
      ),
    );
  }

  int get _currentIndex {
    final currentPage =
        _controller?.hasClients == true ? _controller!.page ?? _page : _page;
    return currentPage.round().clamp(0, _presentations.length - 1).toInt();
  }

  void _goToPresentation(int index) {
    if (index < 0 || index >= _presentations.length) return;
    _controller?.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null) return const SizedBox.shrink();

    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 640;
    final tablet = width >= 640 && width < 1024;
    final height = compact
        ? 188.0
        : tablet
            ? 242.0
            : 300.0;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1360),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height,
              child: PageView.builder(
                controller: controller,
                itemCount: _presentations.length,
                padEnds: true,
                clipBehavior: Clip.none,
                physics: const PageScrollPhysics(),
                itemBuilder: (context, index) {
                  final distance = (_page - index).abs().clamp(0.0, 1.0);
                  final scale = 1.0 - (distance * (compact ? 0.075 : 0.055));

                  return Center(
                    child: AnimatedScale(
                      scale: scale,
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: compact ? 8 : 12),
                        child: _LandingPresentationCard(
                          presentation: _presentations[index],
                          onTap: () => _openViewer(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _LandingCarouselControls(
              compact: compact,
              onLeft: _currentIndex == _presentations.length - 1
                  ? null
                  : () => _goToPresentation(_currentIndex + 1),
              onRight: _currentIndex == 0
                  ? null
                  : () => _goToPresentation(_currentIndex - 1),
            ),
          ],
        ),
      ),
    );
  }
}

class _LandingPresentationCard extends StatefulWidget {
  const _LandingPresentationCard({
    required this.presentation,
    required this.onTap,
  });

  final PresentationCard presentation;
  final VoidCallback onTap;

  @override
  State<_LandingPresentationCard> createState() =>
      _LandingPresentationCardState();
}

class _LandingPresentationCardState extends State<_LandingPresentationCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    const radius = 22.0;

    return Semantics(
      button: true,
      label: 'Presentation image',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: const Color(0xFF080704),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: const Color(0xFFFFD98A).withValues(
                alpha: _hovered ? 0.68 : 0.36,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE7A94C).withValues(
                  alpha: _hovered ? 0.20 : 0.10,
                ),
                blurRadius: _hovered ? 24 : 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: widget.onTap,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: PresentationAssetImage(
                  presentation: widget.presentation,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LandingCarouselControls extends StatelessWidget {
  const _LandingCarouselControls({
    required this.compact,
    required this.onLeft,
    required this.onRight,
  });

  final bool compact;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: compact ? 8 : 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: [
          _LandingCarouselControl(
            icon: Icons.arrow_forward_ios_rounded,
            compact: compact,
            onPressed: onLeft,
          ),
          SizedBox(width: compact ? 14 : 18),
          _LandingCarouselControl(
            icon: Icons.arrow_back_ios_new_rounded,
            compact: compact,
            onPressed: onRight,
          ),
        ],
      ),
    );
  }
}

class _LandingCarouselControl extends StatefulWidget {
  const _LandingCarouselControl({
    required this.icon,
    required this.compact,
    required this.onPressed,
  });

  final IconData icon;
  final bool compact;
  final VoidCallback? onPressed;

  @override
  State<_LandingCarouselControl> createState() =>
      _LandingCarouselControlState();
}

class _LandingCarouselControlState extends State<_LandingCarouselControl> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final size = widget.compact ? 42.0 : 48.0;

    return Opacity(
      opacity: enabled ? 1 : 0.36,
      child: MouseRegion(
        cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedScale(
          scale: _hovered && enabled ? 1.05 : 1,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
          child: Material(
            color: Colors.black.withValues(alpha: _hovered ? 0.62 : 0.46),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: widget.onPressed,
              child: SizedBox(
                width: size,
                height: size,
                child: Icon(
                  widget.icon,
                  color: const Color(0xFFFFE3A1),
                  size: widget.compact ? 18 : 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TrustBar extends StatelessWidget {
  const _TrustBar({required this.copy});

  final _WebsiteCopy copy;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.44),
          border: Border.all(
            color: const Color(0xFFD7A936).withValues(alpha: 0.45),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 12,
            children: [
              _TrustItem(icon: Icons.groups_rounded, label: copy.openForAll),
              _TrustItem(icon: Icons.verified_outlined, label: copy.reliable),
              _TrustItem(icon: Icons.person_outline_rounded, label: copy.human),
              _TrustItem(icon: Icons.favorite_border_rounded, label: copy.real),
              _TrustItem(icon: Icons.security_rounded, label: copy.privacy),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageSwitch extends StatelessWidget {
  const _LanguageSwitch({
    required this.isArabic,
    required this.onArabic,
    required this.onEnglish,
  });

  final bool isArabic;
  final VoidCallback onArabic;
  final VoidCallback onEnglish;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.38),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFD7A936)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageSegment(
            label: 'عربي',
            selected: isArabic,
            onPressed: onArabic,
          ),
          _LanguageSegment(
            label: 'English',
            selected: !isArabic,
            onPressed: onEnglish,
          ),
        ],
      ),
    );
  }
}

class _LanguageSegment extends StatelessWidget {
  const _LanguageSegment({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: selected ? const Color(0xFFFFE7AD) : Colors.white70,
        backgroundColor:
            selected ? const Color(0xFFC8952D).withValues(alpha: 0.28) : null,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 0),
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  const _TrustItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFFD7A936), size: 24),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFFFE7AD),
            fontSize: 14,
            fontWeight: FontWeight.w800,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}

class _WebsiteCopy {
  const _WebsiteCopy({
    required this.isArabic,
    required this.brandSubtitle,
    required this.heroHeadline,
    required this.heroSubtitle,
    required this.openApp,
    required this.explorePlatform,
    required this.support,
    required this.knowledge,
    required this.recovery,
    required this.accessibility,
    required this.openForAll,
    required this.reliable,
    required this.human,
    required this.real,
    required this.privacy,
  });

  final bool isArabic;
  final String brandSubtitle;
  final String heroHeadline;
  final String heroSubtitle;
  final String openApp;
  final String explorePlatform;
  final String support;
  final String knowledge;
  final String recovery;
  final String accessibility;
  final String openForAll;
  final String reliable;
  final String human;
  final String real;
  final String privacy;

  static _WebsiteCopy forLocale(bool isArabic) {
    if (!isArabic) {
      return const _WebsiteCopy(
        isArabic: false,
        brandSubtitle: 'Mental Smile Platform',
        heroHeadline: 'You do not have to walk alone.',
        heroSubtitle:
            'An Arabic-first platform helping people and families discover support, knowledge, tools, resources, providers, and centers in a clearer and more human way.',
        openApp: 'Open App',
        explorePlatform: 'Explore Platform',
        support: 'Support',
        knowledge: 'Knowledge',
        recovery: 'Recovery',
        accessibility: 'Accessibility',
        openForAll: 'Open for everyone',
        reliable: 'Trusted resources',
        human: 'Designed for you',
        real: 'Human support',
        privacy: 'Privacy matters',
      );
    }

    return const _WebsiteCopy(
      isArabic: true,
      brandSubtitle: 'منصة منتال سمايل',
      heroHeadline: 'أنت لا تمشي وحدك',
      heroSubtitle:
          'منصة عربية تساعد الأفراد والأسر على اكتشاف الدعم والمعرفة والأدوات والموارد ومقدمي الخدمات والمراكز بطريقة أوضح وأكثر إنسانية.',
      openApp: 'فتح التطبيق',
      explorePlatform: 'استكشاف المنصة',
      support: 'الدعم',
      knowledge: 'المعرفة',
      recovery: 'التعافي',
      accessibility: 'الوصول',
      openForAll: 'متاح للجميع',
      reliable: 'موارد موثوقة',
      human: 'تصميم مخصص لك',
      real: 'دعم إنساني حقيقي',
      privacy: 'خصوصيتك آمنة',
    );
  }
}
