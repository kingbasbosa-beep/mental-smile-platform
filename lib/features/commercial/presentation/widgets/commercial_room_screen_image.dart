import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommercialRoomScreenPlacement {
  const CommercialRoomScreenPlacement({
    required this.width,
    required this.height,
    required this.left,
    required this.top,
  });

  final double width;
  final double height;
  final double left;
  final double top;
}

class CommercialRoomScreenImage extends StatefulWidget {
  const CommercialRoomScreenImage({
    super.key,
    required this.storageKey,
    required this.placement,
  });

  final String storageKey;
  final CommercialRoomScreenPlacement placement;

  @override
  State<CommercialRoomScreenImage> createState() =>
      _CommercialRoomScreenImageState();
}

class _CommercialRoomScreenImageState extends State<CommercialRoomScreenImage> {
  Uint8List? _bytes;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  @override
  void didUpdateWidget(covariant CommercialRoomScreenImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.storageKey != widget.storageKey) {
      _loadSavedImage();
    }
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString(widget.storageKey);
    Uint8List? decoded;
    if (encoded != null && encoded.isNotEmpty) {
      try {
        decoded = base64Decode(encoded);
      } on FormatException {
        decoded = null;
      }
    }
    if (!mounted) return;
    setState(() {
      _bytes = decoded;
      _loading = false;
    });
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      imageQuality: 88,
    );
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    if (!mounted || bytes.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.storageKey, base64Encode(bytes));
    if (!mounted) return;
    setState(() => _bytes = bytes);
  }

  Future<void> _removeImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(widget.storageKey);
    if (!mounted) return;
    setState(() => _bytes = null);
  }

  @override
  Widget build(BuildContext context) {
    final placement = widget.placement;
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.28),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (_bytes != null)
                    Image.memory(
                      _bytes!,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    )
                  else
                    _RoomScreenPhotoPlaceholder(loading: _loading),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: 6,
            end: 6,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AccessibilityGuideIcon(size: 18),
                const SizedBox(width: 6),
                _ScreenControlButton(
                  tooltip: 'تغيير صورة الشاشة',
                  icon: Icons.edit_outlined,
                  onPressed: _pickImage,
                ),
                if (_bytes != null) ...[
                  const SizedBox(width: 6),
                  _ScreenControlButton(
                    tooltip: 'إزالة صورة الشاشة',
                    icon: Icons.close,
                    onPressed: _removeImage,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _RoomScreenGateway extends StatelessWidget {
  const _RoomScreenGateway({
    required this.loading,
    required this.logoAsset,
  });

  final bool loading;
  final String logoAsset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              loading
                  ? Icons.hourglass_empty_outlined
                  : Icons.add_photo_alternate_outlined,
              color: const Color(0xFFFFE8A3).withValues(alpha: 0.84),
              size: 26,
            ),
            const SizedBox(height: 8),
            Text(
              loading ? 'جاري التحميل' : 'اختار صورة تحبها',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFFFE8A3).withValues(alpha: 0.84),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoomScreenPhotoPlaceholder extends StatelessWidget {
  const _RoomScreenPhotoPlaceholder({required this.loading});

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              loading
                  ? Icons.hourglass_empty_outlined
                  : Icons.add_photo_alternate_outlined,
              color: const Color(0xFFFFE8A3).withValues(alpha: 0.84),
              size: 26,
            ),
            const SizedBox(height: 8),
            Text(
              loading
                  ? '\u062c\u0627\u0631\u064a \u0627\u0644\u062a\u062d\u0645\u064a\u0644'
                  : '\u0627\u062e\u062a\u0627\u0631 \u0635\u0648\u0631\u0629 \u062a\u062d\u0628\u0647\u0627',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFFFE8A3).withValues(alpha: 0.84),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreenControlButton extends StatelessWidget {
  const _ScreenControlButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.black.withValues(alpha: 0.58),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: 28,
            height: 28,
            child: Icon(
              icon,
              color: const Color(0xFFFFE8A3),
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class ComputerAppsGrid extends StatelessWidget {
  const ComputerAppsGrid({
    super.key,
    required this.loading,
    this.returnRoute = Routes.splash,
  });

  final bool loading;
  final String returnRoute;

  static const List<_ComputerAppItem> _items = [
    _ComputerAppItem(
      label: '\u0627\u0644\u0645\u0643\u062a\u0628\u0629',
      assetPath: 'assets/icons/library.png',
      routeName: Routes.webLibrary,
    ),
    _ComputerAppItem(
      label: '\u0627\u0644\u0623\u062e\u0635\u0627\u0626\u064a\u0648\u0646',
      assetPath: 'assets/icons/specialists.png',
      routeName: Routes.libraryProviderSpecialists,
    ),
    _ComputerAppItem(
      label: '\u0627\u0644\u0645\u0631\u0627\u0643\u0632',
      assetPath: 'assets/icons/centers.png',
      routeName: Routes.libraryProviderCenters,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: Icon(
          Icons.hourglass_empty_outlined,
          color: Color(0xFFFFE8A3),
          size: 22,
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.24),
      ),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 10,
          children: [
            for (final item in _items)
              _ComputerAppIcon(item: item, returnRoute: returnRoute),
          ],
        ),
      ),
    );
  }
}

class _ComputerAppIcon extends StatefulWidget {
  const _ComputerAppIcon({
    required this.item,
    required this.returnRoute,
  });

  final _ComputerAppItem item;
  final String returnRoute;

  @override
  State<_ComputerAppIcon> createState() => _ComputerAppIconState();
}

class _ComputerAppIconState extends State<_ComputerAppIcon> {
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
          child: SizedBox(
            width: 58,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  widget.item.assetPath,
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.apps_rounded,
                    color: Color(0xFFFFE8A3),
                    size: 30,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.item.label,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
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

class _ComputerAppItem {
  const _ComputerAppItem({
    required this.label,
    required this.assetPath,
    required this.routeName,
  });

  final String label;
  final String assetPath;
  final String routeName;
}

// ignore: unused_element
class _RoomScreenGatewayV2 extends StatelessWidget {
  const _RoomScreenGatewayV2({
    required this.loading,
    required this.logoAsset,
  });

  final bool loading;
  final String logoAsset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Image.asset(
                logoAsset,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.public_rounded,
                  color: const Color(0xFFFFE8A3).withValues(alpha: 0.9),
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  loading
                      ? Icons.hourglass_empty_outlined
                      : Icons.touch_app_outlined,
                  color: const Color(0xFFFFE8A3).withValues(alpha: 0.88),
                  size: 14,
                ),
                const SizedBox(width: 5),
                const AccessibilityGuideIcon(size: 14),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              loading ? 'جاري التحميل' : 'شاهد حساباتنا',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFFFFE8A3).withValues(alpha: 0.88),
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
