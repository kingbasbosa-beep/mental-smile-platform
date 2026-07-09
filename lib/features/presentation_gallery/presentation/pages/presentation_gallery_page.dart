import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/presentation_gallery/data/presentation_gallery_repository.dart';
import 'package:mental_smile_os/features/presentation_gallery/domain/models/presentation_card.dart';
import 'package:mental_smile_os/features/presentation_gallery/presentation/pages/presentation_viewer_page.dart';
import 'package:mental_smile_os/features/presentation_gallery/presentation/widgets/presentation_asset_image.dart';

class PresentationGalleryPage extends StatefulWidget {
  const PresentationGalleryPage({
    super.key,
    this.repository = const AssetPresentationGalleryRepository(),
  });

  final PresentationGalleryRepository repository;

  @override
  State<PresentationGalleryPage> createState() =>
      _PresentationGalleryPageState();
}

class _PresentationGalleryPageState extends State<PresentationGalleryPage> {
  late final List<PresentationCard> _presentations;
  PageController? _controller;
  double? _viewportFraction;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _presentations = widget.repository.loadPresentations();
  }

  @override
  void dispose() {
    _controller?.removeListener(_syncPage);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextFraction = _fractionFor(MediaQuery.sizeOf(context).width);
    if (_viewportFraction != nextFraction) {
      _configureController(nextFraction);
    }
  }

  double _fractionFor(double width) {
    if (width < 700) return 0.86;
    if (width < 1024) return 0.50;
    return 0.38;
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 700;
    final controller = _controller;
    if (controller == null) return const SizedBox.shrink();
    final height = math.min(
      MediaQuery.sizeOf(context).height * (compact ? 0.46 : 0.52),
      compact ? 330.0 : 440.0,
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: const Color(0xFFFFE7B2),
          elevation: 0,
          title: const SizedBox.shrink(),
        ),
        body: Center(
          child: SizedBox(
            height: height,
            child: PageView.builder(
              controller: controller,
              itemCount: _presentations.length,
              padEnds: true,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                final distance = (_page - index).abs().clamp(0.0, 1.0);
                final scale = 1.0 - (distance * (compact ? 0.08 : 0.06));

                return AnimatedScale(
                  scale: scale,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: compact ? 8 : 12),
                    child: _PresentationGalleryCard(
                      presentation: _presentations[index],
                      onTap: () => _openViewer(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PresentationGalleryCard extends StatefulWidget {
  const _PresentationGalleryCard({
    required this.presentation,
    required this.onTap,
  });

  final PresentationCard presentation;
  final VoidCallback onTap;

  @override
  State<_PresentationGalleryCard> createState() =>
      _PresentationGalleryCardState();
}

class _PresentationGalleryCardState extends State<_PresentationGalleryCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 700;
    final radius = compact ? 20.0 : 24.0;

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
                alpha: _hovered ? 0.72 : 0.40,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE7A94C).withValues(
                  alpha: _hovered ? 0.22 : 0.12,
                ),
                blurRadius: _hovered ? 26 : 18,
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
