import 'package:flutter/material.dart';
import 'package:mental_smile_os/l10n/shared/shared_localizations.dart';

class AccessibilityGuideIcon extends StatelessWidget {
  const AccessibilityGuideIcon({
    super.key,
    this.size = 26,
    this.tooltipIconSize = 96,
    this.onPressed,
    this.tooltip,
    this.semanticLabel,
  });

  static const String assetPath =
      'assets/icons/accessibility/ms_accessibility_guide.webp.png';

  final double size;
  final double tooltipIconSize;
  final VoidCallback? onPressed;
  final String? tooltip;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return AccessibilityGuideImagePreviewTooltip(
      size: size,
      previewSize: tooltipIconSize,
      onPressed: onPressed,
      tooltip: tooltip,
      semanticLabel: semanticLabel,
    );
  }
}

class AccessibilityGuideImagePreviewTooltip extends StatefulWidget {
  const AccessibilityGuideImagePreviewTooltip({
    super.key,
    this.size = 26,
    this.previewSize = 96,
    this.onPressed,
    this.tooltip,
    this.semanticLabel,
  });

  final double size;
  final double previewSize;
  final VoidCallback? onPressed;
  final String? tooltip;
  final String? semanticLabel;

  @override
  State<AccessibilityGuideImagePreviewTooltip> createState() =>
      _AccessibilityGuideImagePreviewTooltipState();
}

class _AccessibilityGuideImagePreviewTooltipState
    extends State<AccessibilityGuideImagePreviewTooltip> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered == value) return;
    setState(() => _hovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final sharedL10n = SharedLocalizations.of(context);
    final tooltip = widget.tooltip ?? sharedL10n.applicationSpeechTooltip;
    final semanticLabel =
        widget.semanticLabel ?? sharedL10n.applicationSpeechSemanticLabel;
    final enabled = widget.onPressed != null;

    final icon = Semantics(
      button: enabled,
      enabled: enabled,
      label: semanticLabel,
      child: Image.asset(
        AccessibilityGuideIcon.assetPath,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.contain,
      ),
    );

    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
        onEnter: (_) => _setHovered(true),
        onExit: (_) => _setHovered(false),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onPressed,
              child: SizedBox(
                width: widget.size + 18,
                height: widget.size + 18,
                child: Center(child: icon),
              ),
            ),
            Positioned(
              bottom: widget.size + 18,
              child: IgnorePointer(
                child: AnimatedOpacity(
                  opacity: _hovered ? 1 : 0,
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  child: AnimatedScale(
                    scale: _hovered ? 1 : 0.95,
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeOut,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.78),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFC8952D)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.38),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 128,
                        height: 128,
                        child: Center(
                          child: Transform.scale(
                            scale: 1.55,
                            child: Image.asset(
                              AccessibilityGuideIcon.assetPath,
                              width: widget.previewSize,
                              height: widget.previewSize,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
