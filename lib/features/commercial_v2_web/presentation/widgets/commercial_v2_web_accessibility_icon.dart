import 'package:flutter/material.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class CommercialV2WebAccessibilityIcon extends StatelessWidget {
  const CommercialV2WebAccessibilityIcon({
    super.key,
    this.size = 22,
    this.onPressed,
  });

  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AccessibilityGuideIcon(size: size, onPressed: onPressed);
  }
}
