import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_smile_residential_capsule/src/contracts/locale_contracts.dart';
import 'package:mental_smile_residential_capsule/src/capsule/residential_capsule_routes.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';

class Generation2SplashPage extends ConsumerStatefulWidget {
  const Generation2SplashPage({super.key});

  @override
  ConsumerState<Generation2SplashPage> createState() =>
      _Generation2SplashPageState();
}

class _Generation2SplashPageState extends ConsumerState<Generation2SplashPage> {
  static const String _mobileBackground =
      'packages/mental_smile_residential_capsule/assets/images/mobile/splash/background_mobile.webp.png';
  static const String _tabletBackground =
      'packages/mental_smile_residential_capsule/assets/images/mobile/splash/background_tablet.webp.png';
  static const double _backgroundScale = 0.96;

  static const List<_G2SplashAction> _actions = [
    _G2SplashAction(
      label: 'Ù…ÙˆØ¨ÙŠÙ„',
      assetPath:
          'packages/mental_smile_residential_capsule/assets/images/mobile/splash/btn_mobile.webp.png',
      routeName: Routes.generation2MobileLoginSelection,
    ),
    _G2SplashAction(
      label: 'Ø¯ÙŠØ³ÙƒØªÙˆØ¨',
      assetPath:
          'packages/mental_smile_residential_capsule/assets/images/mobile/splash/btn_desktop.webp.png',
      routeName: Routes.legacySplash,
    ),
    _G2SplashAction(
      label: 'Ø§Ù„Ù„ØºØ©',
      assetPath:
          'packages/mental_smile_residential_capsule/assets/images/mobile/splash/btn_language.webp.png',
      isLanguageAction: true,
    ),
  ];

  String _backgroundFor(BoxConstraints constraints) {
    final isPortrait = constraints.maxHeight > constraints.maxWidth;
    final isMobile =
        constraints.maxWidth < 700 ||
        (isPortrait && constraints.maxWidth < 900);
    return isMobile ? _mobileBackground : _tabletBackground;
  }

  Future<void> _setLanguage(String code) async {
    await LocaleStorage().write(code);
    ref.read(localeProvider.notifier).state = Locale(code);
  }

  Future<void> _showLanguageSelector() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.black,
      barrierColor: Colors.black.withValues(alpha: 0.62),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        final currentLocale =
            ref.read(localeProvider) ?? Localizations.localeOf(context);
        final currentCode = currentLocale.languageCode.toLowerCase();
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _LanguageChoice(
                    label: 'Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©',
                    selected: currentCode == 'ar',
                    onPressed: () async {
                      await _setLanguage('ar');
                      if (context.mounted) Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 12),
                  _LanguageChoice(
                    label: 'English',
                    selected: currentCode == 'en',
                    onPressed: () async {
                      await _setLanguage('en');
                      if (context.mounted) Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openAction(_G2SplashAction action) {
    if (action.isLanguageAction) {
      _showLanguageSelector();
      return;
    }

    final routeName = action.routeName;
    if (routeName == null) return;
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, _) {
            final mediaSize = MediaQuery.sizeOf(context);
            final shellWidth = mediaSize.width > 430 ? 390.0 : mediaSize.width;
            final shellConstraints = BoxConstraints.tightFor(
              width: shellWidth,
              height: mediaSize.height,
            );
            final isMobile = shellWidth < 700;
            final maxWidth = shellWidth;
            final imageSize = isMobile ? 104.0 : 132.0;

            return Center(
              child: SizedBox(
                width: shellWidth,
                height: mediaSize.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: Transform.scale(
                        scale: _backgroundScale,
                        child: Image.asset(
                          _backgroundFor(shellConstraints),
                          width: shellWidth,
                          height: mediaSize.height,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          excludeFromSemantics: true,
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.06),
                            Colors.black.withValues(
                              alpha: isMobile ? 0.18 : 0.10,
                            ),
                            Colors.black.withValues(
                              alpha: isMobile ? 0.46 : 0.34,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            isMobile ? 16 : 42,
                            20,
                            isMobile ? 16 : 42,
                            isMobile ? 20 : 34,
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: maxWidth),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              spacing: isMobile ? 8 : 18,
                              runSpacing: isMobile ? 12 : 24,
                              children: [
                                for (final action in _actions)
                                  _G2SplashButton(
                                    action: action,
                                    imageSize: imageSize,
                                    compact: isMobile,
                                    onPressed: () => _openAction(action),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _G2SplashAction {
  const _G2SplashAction({
    required this.label,
    required this.assetPath,
    this.routeName,
    this.isLanguageAction = false,
  });

  final String label;
  final String assetPath;
  final String? routeName;
  final bool isLanguageAction;
}

class _G2SplashButton extends StatefulWidget {
  const _G2SplashButton({
    required this.action,
    required this.imageSize,
    required this.compact,
    required this.onPressed,
  });

  final _G2SplashAction action;
  final double imageSize;
  final bool compact;
  final VoidCallback onPressed;

  @override
  State<_G2SplashButton> createState() => _G2SplashButtonState();
}

class _G2SplashButtonState extends State<_G2SplashButton> {
  bool _pressed = false;
  bool _hovered = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.compact ? 132.0 : 140.0;
    final textWidth = widget.compact ? 132.0 : 140.0;
    final scale = _pressed ? 0.95 : (_hovered ? 1.04 : 1.0);

    return Semantics(
      button: true,
      label: widget.action.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) => _setPressed(true),
          onTapCancel: () => _setPressed(false),
          onTapUp: (_) => _setPressed(false),
          onTap: widget.onPressed,
          child: SizedBox(
            width: width,
            child: AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: widget.imageSize,
                    height: widget.imageSize,
                    child: Image.asset(
                      widget.action.assetPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: textWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.action.label,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Color(0xFFFFE8A3),
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          const AccessibilityGuideIcon(
                            size: 18,
                            tooltipIconSize: 96,
                          ),
                        ],
                      ),
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

class _LanguageChoice extends StatelessWidget {
  const _LanguageChoice({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: selected ? Colors.black : const Color(0xFFFFE8A3),
          backgroundColor: selected
              ? const Color(0xFFE0C174)
              : Colors.transparent,
          side: BorderSide(
            color: const Color(0xFFE0C174).withValues(alpha: 0.78),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(width: 8),
            const AccessibilityGuideIcon(size: 18, tooltipIconSize: 96),
          ],
        ),
      ),
    );
  }
}
