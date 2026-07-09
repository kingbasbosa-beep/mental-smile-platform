import 'package:flutter/material.dart';

import 'commercial_v2_web_accessibility_icon.dart';

class CommercialV2WebShowcaseCard extends StatefulWidget {
  const CommercialV2WebShowcaseCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<CommercialV2WebShowcaseCard> createState() =>
      _CommercialV2WebShowcaseCardState();
}

class _CommercialV2WebShowcaseCardState
    extends State<CommercialV2WebShowcaseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.title,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 210,
            height: 150,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: _hovered ? 0.62 : 0.46),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFFFD77A).withValues(
                  alpha: _hovered ? 0.88 : 0.48,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFC8952D).withValues(
                    alpha: _hovered ? 0.32 : 0.14,
                  ),
                  blurRadius: _hovered ? 26 : 14,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: const Color(0xFFFFE8A3),
                      size: 40,
                    ),
                    const SizedBox(width: 10),
                    const CommercialV2WebAccessibilityIcon(size: 22),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
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
