import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_smile_os/app/locale_provider.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/core/storage/locale_storage.dart';
import 'package:mental_smile_os/features/generation2_mobile_entry/presentation/pages/generation2_mobile_selection_pages.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class Generation2MobileLoginSelectionPage extends ConsumerStatefulWidget {
  const Generation2MobileLoginSelectionPage({super.key});

  @override
  ConsumerState<Generation2MobileLoginSelectionPage> createState() =>
      _Generation2MobileLoginSelectionPageState();
}

class _Generation2MobileLoginSelectionPageState
    extends ConsumerState<Generation2MobileLoginSelectionPage> {
  static const String _mobileBackground =
      'assets/images/mobile/login/background_mobile.webp';
  static const String _tabletBackground =
      'assets/images/mobile/login/background_tablet.webp';
  static const double _backgroundScale = 0.96;

  static final List<_G2LoginAction> _actions = [
    _G2LoginAction(
      label: 'أصدقاء',
      assetPath: 'assets/images/mobile/splash/btn_friend.webp',
      imageScale: 1.08,
      builder: (_) => const Generation2MobileFriendsSelectionPage(),
    ),
    _G2LoginAction(
      label: 'داعمين',
      assetPath: 'assets/images/mobile/splash/btn_supporter.webp',
      imageScale: 0.86,
      builder: (_) => const Generation2MobileSupportersSelectionPage(),
    ),
  ];

  String _backgroundFor(BoxConstraints constraints) {
    final isPortrait = constraints.maxHeight > constraints.maxWidth;
    final isMobile = constraints.maxWidth < 700 ||
        (isPortrait && constraints.maxWidth < 900);
    return isMobile ? _mobileBackground : _tabletBackground;
  }

  Future<void> _setLanguage(String code) async {
    await LocaleStorage().write(code);
    ref.read(localeProvider.notifier).state = Locale(code);
  }

  void _openAction(_G2LoginAction action) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: action.builder),
    );
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
                    label: 'العربية',
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
            final imageSize = isMobile ? 92.0 : 106.0;
            final actionButtonWidth = isMobile ? 116.0 : 132.0;
            final actionCenterX = shellWidth / 2;
            final topActionOffset = shellWidth * 0.105;
            final topActionTop = mediaSize.height * 0.315;

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
                            Colors.black.withValues(alpha: 0.12),
                            Colors.black
                                .withValues(alpha: isMobile ? 0.28 : 0.18),
                            Colors.black
                                .withValues(alpha: isMobile ? 0.62 : 0.48),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.paddingOf(context).top + 10,
                      left: 56,
                      child: _BackButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.splash),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.paddingOf(context).top + 20,
                      right: 54,
                      child: const DaleelAssistant(
                        iconOnly: true,
                        guideAssetPath:
                            'assets/branding/guides/mobile_login_selection_guide.png',
                        surveyTitle: 'رأيك يهمنا',
                        surveyIntro:
                            'ساعدنا في تحسين شاشة اختيار الدخول إلى منصة Mental Smile.\n\n'
                            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
                        suggestionsPlaceholder:
                            'اكتب أي اقتراح يساعدنا في تطوير شاشة اختيار الدخول...',
                        sections:
                            DaleelAssistantSurvey.mobileLoginSelectionSections,
                        extraTextFields: [
                          DaleelSurveyTextFieldData(
                            sectionTitle: 'اقتراحات لتحسين تجربة الاستخدام',
                            label: 'شاركنا أفكارك',
                            placeholder:
                                'اكتب أي اقتراح يساعدنا في تحسين سهولة استخدام الصفحة أو إضافة وسائل مساعدة جديدة...',
                          ),
                        ],
                        suggestionsTitle: 'القسم الثالث\nاقتراحات عامة',
                        suggestionsLabel: 'اقتراحاتك تهمنا',
                      ),
                    ),
                    Positioned(
                      top: topActionTop,
                      left: actionCenterX +
                          topActionOffset -
                          actionButtonWidth / 2,
                      width: actionButtonWidth,
                      child: _G2IdentityButton(
                        action: _actions[0],
                        imageSize: imageSize,
                        compact: isMobile,
                        onPressed: () => _openAction(_actions[0]),
                      ),
                    ),
                    Positioned(
                      top: topActionTop,
                      left: actionCenterX -
                          topActionOffset -
                          actionButtonWidth / 2,
                      width: actionButtonWidth,
                      child: _G2IdentityButton(
                        action: _actions[1],
                        imageSize: imageSize,
                        compact: isMobile,
                        onPressed: () => _openAction(_actions[1]),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.paddingOf(context).bottom +
                          (isMobile ? 48 : 56),
                      left: 0,
                      right: 0,
                      child: Center(
                        child: _LanguageAction(
                          onPressed: _showLanguageSelector,
                          imageSize: imageSize,
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

class _G2LoginAction {
  const _G2LoginAction({
    required this.label,
    required this.assetPath,
    required this.imageScale,
    required this.builder,
  });

  final String label;
  final String assetPath;
  final double imageScale;
  final WidgetBuilder builder;
}

class _G2IdentityButton extends StatefulWidget {
  const _G2IdentityButton({
    required this.action,
    required this.imageSize,
    required this.compact,
    required this.onPressed,
  });

  final _G2LoginAction action;
  final double imageSize;
  final bool compact;
  final VoidCallback onPressed;

  @override
  State<_G2IdentityButton> createState() => _G2IdentityButtonState();
}

class _G2IdentityButtonState extends State<_G2IdentityButton> {
  bool _pressed = false;
  bool _hovered = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.compact ? 116.0 : 132.0;
    final labelHeight = widget.compact ? 30.0 : 34.0;
    final scale = _pressed ? 0.94 : (_hovered ? 1.05 : 1.0);

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
              duration: const Duration(milliseconds: 140),
              curve: Curves.easeOutBack,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox.square(
                    dimension: widget.imageSize,
                    child: Center(
                      child: Image.asset(
                        widget.action.assetPath,
                        width: widget.imageSize * widget.action.imageScale,
                        height: widget.imageSize * widget.action.imageScale,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -8),
                    child: SizedBox(
                      width: width,
                      height: labelHeight,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.action.label,
                              style: const TextStyle(
                                color: Color(0xFFECECEC),
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0,
                                shadows: [
                                  Shadow(
                                    color: Color(0xCCFFFFFF),
                                    blurRadius: 7,
                                  ),
                                  Shadow(
                                    color: Color(0x77D4AF37),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 4),
                            const AccessibilityGuideIcon(
                              size: 16,
                              tooltipIconSize: 96,
                            ),
                          ],
                        ),
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

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.4),
          shape: BoxShape.circle,
          border:
              Border.all(color: const Color(0xFFFFE8A3).withValues(alpha: 0.5)),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          textDirection: TextDirection.ltr,
          color: Color(0xFFFFE8A3),
          size: 20,
        ),
      ),
    );
  }
}

class _LanguageAction extends StatelessWidget {
  const _LanguageAction({
    required this.onPressed,
    required this.imageSize,
  });

  final VoidCallback onPressed;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/mobile/splash/btn_language.webp',
            width: imageSize,
            height: imageSize,
            fit: BoxFit.contain,
          ),
          Transform.translate(
            offset: const Offset(0, -8),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'اللغة',
                  style: TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(width: 4),
                AccessibilityGuideIcon(size: 16),
              ],
            ),
          ),
        ],
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
          backgroundColor:
              selected ? const Color(0xFFE0C174) : Colors.transparent,
          side: BorderSide(
            color: const Color(0xFFE0C174).withValues(alpha: 0.78),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
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
            const AccessibilityGuideIcon(
              size: 18,
              tooltipIconSize: 96,
            ),
          ],
        ),
      ),
    );
  }
}
