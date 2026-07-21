import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class SharedWellbeingRoomCard extends StatelessWidget {
  const SharedWellbeingRoomCard({
    super.key,
    required this.isCompact,
    this.routeName = Routes.accessibilityCheckin,
  });

  static const String _checkinCardIcon =
      'assets/platform/wellbeing/accessibility_checkin_card_icon.png';

  final bool isCompact;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final width = isCompact ? 118.0 : 140.0;
    const title =
        '\u0637\u0645\u0651\u0646\u0627 \u0639\u0644\u064a\u0643 \u{1F33F}';
    const subtitle =
        '\u0627\u0637\u0645\u0626\u0646\u0627\u0646 \u0648\u062f\u0639\u0645';
    const semanticLabel =
        '\u0637\u0645\u0651\u0646\u0627 \u0639\u0644\u064a\u0643\u060c '
        '\u0627\u0642\u062a\u0631\u0627\u062d\u060c '
        '\u0634\u0643\u0648\u0649\u060c '
        '\u0631\u0633\u0627\u0644\u0629 \u062f\u0639\u0645\u060c '
        '\u0645\u0634\u0643\u0644\u0629 \u062a\u0642\u0646\u064a\u0629\u060c '
        '\u0634\u0627\u0631\u0643\u0646\u0627 \u0631\u0623\u064a\u0643';

    return Semantics(
      button: true,
      label: semanticLabel,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 8 : 10,
            vertical: isCompact ? 8 : 10,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.64),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFC8952D),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _checkinCardIcon,
                    width: isCompact ? 23 : 27,
                    height: isCompact ? 23 : 27,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.spa_outlined,
                      color: const Color(0xFFFFE8A3),
                      size: isCompact ? 21 : 25,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AccessibilityGuideIcon(size: isCompact ? 12 : 14),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                title,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFE8A3),
                  fontSize: 12.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                subtitle,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE0C174),
                  fontSize: 8.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
