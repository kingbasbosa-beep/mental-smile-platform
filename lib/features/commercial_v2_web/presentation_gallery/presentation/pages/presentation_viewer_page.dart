import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation_gallery/domain/models/presentation_card.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation_gallery/presentation/widgets/presentation_asset_image.dart';

class PresentationViewerPage extends StatefulWidget {
  const PresentationViewerPage({
    super.key,
    required this.presentations,
    required this.initialIndex,
  });

  final List<PresentationCard> presentations;
  final int initialIndex;

  @override
  State<PresentationViewerPage> createState() => _PresentationViewerPageState();
}

class _PresentationViewerPageState extends State<PresentationViewerPage> {
  late final PageController _pageController;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index =
        widget.initialIndex.clamp(0, widget.presentations.length - 1).toInt();
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    if (index < 0 || index >= widget.presentations.length) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.presentations.length;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: count,
              onPageChanged: (index) => setState(() => _index = index),
              itemBuilder: (context, index) {
                return _ZoomablePresentationPage(
                  key: ValueKey<String>(widget.presentations[index].id),
                  presentation: widget.presentations[index],
                );
              },
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _ViewerControl(
                          label: 'Back',
                          icon: Icons.arrow_back_rounded,
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                        const Spacer(),
                        _PageIndicator(current: _index + 1, total: count),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _ViewerControl(
                          label: 'Previous',
                          icon: Icons.arrow_back_ios_new_rounded,
                          onPressed:
                              _index == 0 ? null : () => _goTo(_index - 1),
                        ),
                        _ViewerControl(
                          label: 'Next',
                          trailingIcon: Icons.arrow_forward_ios_rounded,
                          onPressed: _index == count - 1
                              ? null
                              : () => _goTo(_index + 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ZoomablePresentationPage extends StatefulWidget {
  const _ZoomablePresentationPage({super.key, required this.presentation});

  final PresentationCard presentation;

  @override
  State<_ZoomablePresentationPage> createState() =>
      _ZoomablePresentationPageState();
}

class _ZoomablePresentationPageState extends State<_ZoomablePresentationPage> {
  late final TransformationController _controller;
  bool _zoomed = false;

  @override
  void initState() {
    super.initState();
    _controller = TransformationController()..addListener(_syncZoomState);
  }

  @override
  void dispose() {
    _controller.removeListener(_syncZoomState);
    _controller.dispose();
    super.dispose();
  }

  void _syncZoomState() {
    final zoomed = _controller.value.getMaxScaleOnAxis() > 1.05;
    if (zoomed == _zoomed || !mounted) return;
    setState(() => _zoomed = zoomed);
  }

  void _toggleZoom() {
    setState(() {
      if (_zoomed) {
        _controller.value = Matrix4.identity();
        _zoomed = false;
      } else {
        _controller.value = Matrix4.identity()..scaleByDouble(2.35, 2.35, 1, 1);
        _zoomed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onDoubleTap: _toggleZoom,
      child: Center(
        child: InteractiveViewer(
          transformationController: _controller,
          minScale: 1,
          maxScale: 4,
          panEnabled: _zoomed,
          scaleEnabled: true,
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 72),
            child: Center(
              child: PresentationAssetImage(
                presentation: widget.presentation,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.58),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.38),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        child: Text(
          '$current / $total',
          style: const TextStyle(
            color: Color(0xFFFFE7B2),
            fontSize: 14,
            fontWeight: FontWeight.w800,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}

class _ViewerControl extends StatelessWidget {
  const _ViewerControl({
    required this.label,
    this.icon,
    this.trailingIcon,
    required this.onPressed,
  });

  final String label;
  final IconData? icon;
  final IconData? trailingIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return Opacity(
      opacity: enabled ? 1 : 0.38,
      child: Material(
        color: Colors.black.withValues(alpha: 0.58),
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: const Color(0xFFFFE7B2), size: 18),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFFFE7B2),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
                ),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    trailingIcon,
                    color: const Color(0xFFFFE7B2),
                    size: 18,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
