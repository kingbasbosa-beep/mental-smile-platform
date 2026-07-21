import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/l10n/commercial/commercial_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class CommercialAccessPage extends StatelessWidget {
  const CommercialAccessPage({super.key});

  static const Color _gold = Color(0xFFE0C174);
  static const Color _darkGold = Color(0xFF9B6A19);

  @override
  Widget build(BuildContext context) {
    final l10n = CommercialLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final showDaleel = constraints.maxWidth >= 900 &&
                constraints.maxWidth > constraints.maxHeight;

            return Stack(
              children: [
                PositionedDirectional(
                  top: 20,
                  end: 24,
                  child: _BackToSplashButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.splash,
                      (route) => false,
                    ),
                  ),
                ),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/branding/logo_primary.png',
                            width: 190,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 52),
                          _GoldAccessButton(
                            label: l10n.commercialAccessSpecialist,
                            onPressed: () => Navigator.of(context).pushNamed(
                              Routes.commercialSpecialistLogin,
                            ),
                          ),
                          const SizedBox(height: 18),
                          _GoldAccessButton(
                            label: l10n.commercialAccessCenter,
                            onPressed: () => Navigator.of(context).pushNamed(
                              Routes.commercialCenterLogin,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (showDaleel)
                  const Positioned(
                    top: 18,
                    left: 24,
                    child: DaleelAssistant(
                      guideAssetPath:
                          'assets/branding/guides/commercial_desktop_login.png',
                      surveyTitle: 'رأيك يهمنا',
                      surveyIntro: 'ساعدنا في تحسين شاشة اختيار نوع الدخول.\n\n'
                          'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
                      suggestionsPlaceholder:
                          'اكتب أي اقتراح يساعدنا في تحسين شاشة اختيار نوع الدخول...',
                      sections: DaleelAssistantSurvey.commercialAccessSections,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _BackToSplashButton extends StatefulWidget {
  const _BackToSplashButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_BackToSplashButton> createState() => _BackToSplashButtonState();
}

class _BackToSplashButtonState extends State<_BackToSplashButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = CommercialLocalizations.of(context);
    return Semantics(
      button: true,
      label: l10n.authBackToHome,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: _hovered ? 0.38 : 0.22),
              shape: BoxShape.circle,
              border: Border.all(
                color: CommercialAccessPage._gold.withValues(
                  alpha: _hovered ? 0.82 : 0.55,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: CommercialAccessPage._gold.withValues(
                    alpha: _hovered ? 0.28 : 0.14,
                  ),
                  blurRadius: _hovered ? 18 : 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Color(0xFFFFE8A3),
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class _GoldAccessButton extends StatelessWidget {
  const _GoldAccessButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              CommercialAccessPage._darkGold,
              CommercialAccessPage._gold,
              Color(0xFFFFE8A3),
              CommercialAccessPage._gold,
              CommercialAccessPage._darkGold,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: CommercialAccessPage._gold.withValues(alpha: 0.25),
              blurRadius: 22,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                label,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 10),
              const AccessibilityGuideIcon(
                size: 20,
                tooltipIconSize: 72,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
