import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_room_screen_image.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class CommercialRoomTvApps extends StatelessWidget {
  const CommercialRoomTvApps({
    super.key,
    required this.placement,
    this.returnRoute = Routes.splash,
  });

  final CommercialRoomScreenPlacement placement;
  final String returnRoute;

  static const List<_TvAppItem> _items = [
    _TvAppItem(
      label: '\u0627\u0644\u0645\u0643\u062a\u0628\u0629',
      assetPath: 'assets/icons/library.png',
      routeName: Routes.webLibrary,
    ),
    _TvAppItem(
      label: '\u0627\u0644\u0623\u062e\u0635\u0627\u0626\u064a\u0648\u0646',
      assetPath: 'assets/icons/specialists.png',
      routeName: Routes.libraryProviderSpecialists,
    ),
    _TvAppItem(
      label: '\u0627\u0644\u0645\u0631\u0627\u0643\u0632',
      assetPath: 'assets/icons/centers.png',
      routeName: Routes.libraryProviderCenters,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 26,
          runSpacing: 18,
          children: [
            for (final item in _items)
              _TvAppWidget(item: item, returnRoute: returnRoute),
          ],
        ),
      ),
    );
  }
}

class _TvAppWidget extends StatefulWidget {
  const _TvAppWidget({
    required this.item,
    required this.returnRoute,
  });

  final _TvAppItem item;
  final String returnRoute;

  @override
  State<_TvAppWidget> createState() => _TvAppWidgetState();
}

class _TvAppWidgetState extends State<_TvAppWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          widget.item.routeName,
          arguments: {'returnRoute': widget.returnRoute},
        ),
        child: AnimatedScale(
          scale: _hovered ? 1.06 : 1,
          duration: const Duration(milliseconds: 130),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 130),
            width: 168,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: _hovered ? 0.46 : 0.34),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: AccessibilityGuideIcon(size: 18),
                ),
                Image.asset(
                  widget.item.assetPath,
                  width: 118,
                  height: 118,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.apps_rounded,
                    color: Color(0xFFFFE8A3),
                    size: 92,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TvAppItem {
  const _TvAppItem({
    required this.label,
    required this.assetPath,
    required this.routeName,
  });

  final String label;
  final String assetPath;
  final String routeName;
}
