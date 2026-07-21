import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_smile_residential_capsule/src/contracts/locale_contracts.dart';
import 'package:mental_smile_residential_capsule/src/capsule/residential_capsule_routes.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_localizations.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_residential_capsule/src/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_actions.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  static const String _officialWebsiteUrl =
      'https://mental-smile-platform.web.app';

  bool _languagePressed = false;

  @override
  void initState() {
    super.initState();
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.splashView,
      sourceScreen: 'Splash',
      sourceWidget: 'SplashPage',
      action: 'view',
    );
  }

  String _backgroundAsset(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return 'packages/mental_smile_residential_capsule/assets/branding/splash/splash_mobile_v1.jpg';
    }

    if (width < 1100) {
      return 'packages/mental_smile_residential_capsule/assets/branding/splash/splash_tablet_v1.jpg';
    }

    return 'packages/mental_smile_residential_capsule/assets/branding/splash/splash_web_v1.jpg';
  }

  Future<void> _toggleLocale(Locale locale) async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.languageToggleTap,
      sourceScreen: 'Splash',
      sourceWidget: 'LanguageToggle',
      action: 'toggle_locale',
    );
    final nextCode = locale.languageCode.toLowerCase() == 'ar' ? 'en' : 'ar';
    await LocaleStorage().write(nextCode);
    ref.read(localeProvider.notifier).state = Locale(nextCode);
  }

  Future<void> _openOfficialWebsite() async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.officialWebsiteOpen,
      sourceScreen: 'Splash',
      sourceWidget: 'OfficialWebsiteButton',
      action: 'open_external',
    );
    final opened = await SafeExternalLinkLauncher.open(
      context,
      _officialWebsiteUrl,
    );
    if (!opened) return;
  }

  Future<void> _speakAppText({
    required String localizationKey,
    required String localizedText,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Splash',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: 'app',
        localizationKey: localizationKey,
        localizedText: localizedText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bg = _backgroundAsset(context);
    final languageIconSize = MediaQuery.sizeOf(context).width < 700
        ? 46.0
        : 60.0;
    final locale = ref.watch(localeProvider);
    final activeLocale = locale ?? Localizations.localeOf(context);
    final isArabic = activeLocale.languageCode.toLowerCase() == 'ar';
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    final topActionRight = isMobile ? 24.0 : 96.0;
    final mobileShortcutRight =
        topActionRight + languageIconSize + (isMobile ? 50.0 : 70.0);
    final l10n = AppSectionLocalizations.of(context);

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: Image.asset(bg, fit: BoxFit.cover)),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: 0.25)),
            ),
            Positioned(
              top: 20,
              right: topActionRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AccessibilityGuideIcon(
                    size: 20,
                    tooltipIconSize: 96,
                    onPressed: () => _speakAppText(
                      localizationKey: 'applicationSplashLanguageSwitch',
                      localizedText: l10n.applicationSplashLanguageSwitch,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Tooltip(
                    message: isArabic ? 'English' : 'Arabic',
                    child: GestureDetector(
                      onTapDown: (_) => setState(() => _languagePressed = true),
                      onTapCancel: () =>
                          setState(() => _languagePressed = false),
                      onTapUp: (_) => setState(() => _languagePressed = false),
                      onTap: () => _toggleLocale(activeLocale),
                      child: AnimatedScale(
                        scale: _languagePressed ? 0.96 : 1,
                        duration: const Duration(milliseconds: 120),
                        curve: Curves.easeOutCubic,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(
                              alpha: _languagePressed ? 0.24 : 0.14,
                            ),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: const Color(0xFFFFE8A3).withValues(
                                alpha: _languagePressed ? 0.56 : 0.34,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFD4AF37).withValues(
                                  alpha: _languagePressed ? 0.44 : 0.28,
                                ),
                                blurRadius: _languagePressed ? 24 : 18,
                                spreadRadius: _languagePressed ? 2 : 1,
                              ),
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.22),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'packages/mental_smile_residential_capsule/assets/branding/language/en_gold.png',
                            width: languageIconSize,
                            height: languageIconSize,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                isArabic ? 'EN' : 'AR',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFE8A3),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 18,
              right: mobileShortcutRight,
              child: _SplashMobileShortcut(
                imageSize: languageIconSize,
                label: l10n.applicationSplashMobileShortcut,
                onSpeak: () => _speakAppText(
                  localizationKey: 'applicationSplashMobileShortcut',
                  localizedText: l10n.applicationSplashMobileShortcut,
                ),
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(Routes.generation2MobileLoginSelection);
                },
              ),
            ),
            Positioned(
              top: 24,
              left: isMobile ? 24 : 96,
              child: const DaleelAssistant(
                guideAssetPath:
                    'packages/mental_smile_residential_capsule/assets/branding/guides/welcome_screen_guide.png',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: isMobile ? 24 : 92, left: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _SplashPrimaryAction(
                      label: l10n.applicationSplashClientFriend,
                      icon: Icons.flash_on_rounded,
                      onSpeak: () => _speakAppText(
                        localizationKey: 'applicationSplashClientFriend',
                        localizedText: l10n.applicationSplashClientFriend,
                      ),
                      onTap: () {
                        ResidentialSignalEmitter.emit(
                          signalCode: ResidentialSignalCode.quickAccessTap,
                          sourceScreen: 'Splash',
                          sourceWidget: 'QuickAccessButton',
                          action: 'navigate_client_room',
                        );
                        Navigator.of(context).pushNamed(Routes.clientRoom);
                      },
                    ),
                    const SizedBox(height: 10),
                    _SplashPrimaryAction(
                      label: l10n.applicationSplashAccessibilityFriend,
                      icon: Icons.accessibility_new_rounded,
                      onSpeak: () => _speakAppText(
                        localizationKey: 'applicationSplashAccessibilityFriend',
                        localizedText:
                            l10n.applicationSplashAccessibilityFriend,
                      ),
                      onTap: () {
                        ResidentialSignalEmitter.emit(
                          signalCode:
                              ResidentialSignalCode.accessibilityAccessTap,
                          sourceScreen: 'Splash',
                          sourceWidget: 'AccessibilityAccessButton',
                          action: 'navigate_accessibility_room',
                        );
                        Navigator.of(
                          context,
                        ).pushNamed(Routes.accessibilityRoom);
                      },
                    ),
                    const SizedBox(height: 10),
                    _SplashSecondaryAction(
                      label: l10n.applicationSplashCommercialAccess,
                      icon: Icons.business_center_outlined,
                      onSpeak: () => _speakAppText(
                        localizationKey: 'applicationSplashCommercialAccess',
                        localizedText: l10n.applicationSplashCommercialAccess,
                      ),
                      onPressed: () {
                        ResidentialSignalEmitter.emit(
                          signalCode: ResidentialSignalCode.commercialAccessTap,
                          sourceScreen: 'Splash',
                          sourceWidget: 'CommercialAccessButton',
                          action: 'navigate_commercial_access',
                        );
                        Navigator.of(
                          context,
                        ).pushNamed(Routes.commercialAccess);
                      },
                    ),
                    const SizedBox(height: 10),
                    _SplashSecondaryAction(
                      label: l10n.applicationSplashOfficialWebsite,
                      icon: Icons.public_rounded,
                      publicWeb: true,
                      onSpeak: () => _speakAppText(
                        localizationKey: 'applicationSplashOfficialWebsite',
                        localizedText: l10n.applicationSplashOfficialWebsite,
                      ),
                      onPressed: _openOfficialWebsite,
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

class DaleelAssistant extends StatelessWidget {
  const DaleelAssistant({super.key, required this.guideAssetPath});

  final String guideAssetPath;

  void _openDaleel(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.58),
      isScrollControlled: true,
      builder: (sheetContext) => _DaleelHomeSheet(
        parentContext: context,
        guideAssetPath: guideAssetPath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppSectionLocalizations.of(context);
    return Semantics(
      button: true,
      label: l10n.applicationSplashDaleelTitle,
      child: Tooltip(
        message: l10n.applicationSplashDaleelTitle,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => _openDaleel(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.54),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: const Color(0xFFFFE8A3).withValues(alpha: 0.58),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD4AF37).withValues(alpha: 0.22),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.explore_outlined,
                  color: Color(0xFFFFE8A3),
                  size: 18,
                ),
                const SizedBox(width: 7),
                Text(
                  l10n.applicationSplashDaleelTitle,
                  style: const TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
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

class _DaleelHomeSheet extends StatelessWidget {
  const _DaleelHomeSheet({
    required this.parentContext,
    required this.guideAssetPath,
  });

  final BuildContext parentContext;
  final String guideAssetPath;

  void _openGuide(BuildContext context) {
    Navigator.of(context).pop();
    showDialog<void>(
      context: parentContext,
      builder: (dialogContext) =>
          _DaleelGuideDialog(guideAssetPath: guideAssetPath),
    );
  }

  void _openSurvey(BuildContext context) {
    Navigator.of(context).pop();
    showModalBottomSheet<void>(
      context: parentContext,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.62),
      isScrollControlled: true,
      builder: (surveyContext) => const _DaleelSurveySheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 520),
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            decoration: BoxDecoration(
              color: const Color(0xF20A0702),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE0C174).withValues(alpha: 0.72),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.42),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.explore_outlined,
                      color: Color(0xFFFFE8A3),
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Ã˜Â¯Ã™â€žÃ™Å Ã™â€žÃ™Æ’',
                      style: TextStyle(
                        color: Color(0xFFFFE8A3),
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _DaleelChoiceButton(
                  icon: Icons.menu_book_outlined,
                  title: 'Ã˜Â¯Ã™â€žÃ™Å Ã™â€ž Ã˜Â§Ã™â€žÃ˜ÂµÃ™ÂÃ˜Â­Ã˜Â©',
                  buttonLabel:
                      'Ã™ÂÃ˜ÂªÃ˜Â­ Ã˜Â¯Ã™â€žÃ™Å Ã™â€ž Ã˜Â§Ã™â€žÃ˜ÂµÃ™ÂÃ˜Â­Ã˜Â©',
                  onPressed: () => _openGuide(context),
                ),
                const SizedBox(height: 12),
                _DaleelChoiceButton(
                  icon: Icons.rate_review_outlined,
                  title: 'Ã˜Â±Ã˜Â£Ã™Å Ã™Æ’ Ã™Å Ã™â€¡Ã™â€¦Ã™â€ Ã˜Â§',
                  buttonLabel:
                      'Ã™ÂÃ˜ÂªÃ˜Â­ Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¨Ã™Å Ã˜Â§Ã™â€ ',
                  onPressed: () => _openSurvey(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DaleelChoiceButton extends StatelessWidget {
  const _DaleelChoiceButton({
    required this.icon,
    required this.title,
    required this.buttonLabel,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.42),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFFE8A3), size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFFFE8A3),
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 0,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFE0C174),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              buttonLabel,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class _DaleelGuideDialog extends StatelessWidget {
  const _DaleelGuideDialog({required this.guideAssetPath});

  final String guideAssetPath;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: const Color(0xF2070501),
        insetPadding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: const Color(0xFFE0C174).withValues(alpha: 0.76),
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120, maxHeight: 760),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Ã˜Â¯Ã™â€žÃ™Å Ã™â€ž Ã˜Â§Ã™â€žÃ˜ÂµÃ™ÂÃ˜Â­Ã˜Â© Ã˜Â§Ã™â€žÃ˜ÂªÃ˜Â±Ã˜Â­Ã™Å Ã˜Â¨Ã™Å Ã˜Â©',
                        style: TextStyle(
                          color: Color(0xFFFFE8A3),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Color(0xFFFFE8A3),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  child: InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 4,
                    child: Center(
                      child: Image.asset(
                        guideAssetPath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Padding(
                            padding: const EdgeInsets.all(28),
                            child: Text(
                              'Ã™â€žÃ™â€¦ Ã™Å Ã˜ÂªÃ™â€¦ Ã˜Â§Ã™â€žÃ˜Â¹Ã˜Â«Ã™Ë†Ã˜Â± Ã˜Â¹Ã™â€žÃ™â€° Ã˜ÂµÃ™Ë†Ã˜Â±Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â¯Ã™â€žÃ™Å Ã™â€ž Ã™ÂÃ™Å :\n$guideAssetPath',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFFFE8A3),
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaleelSurveySheet extends StatefulWidget {
  const _DaleelSurveySheet();

  @override
  State<_DaleelSurveySheet> createState() => _DaleelSurveySheetState();
}

class _DaleelSurveySheetState extends State<_DaleelSurveySheet> {
  static const List<_DaleelSurveySectionData> _sections = [
    _DaleelSurveySectionData(
      title: 'Ã˜ÂµÃ˜Â¯Ã™Å Ã™â€šÃ™Å  Ã˜Â§Ã™â€žÃ˜Â¹Ã™â€¦Ã™Å Ã™â€ž',
      questions: [
        'Ã™Ë†Ã˜Â¶Ã™Ë†Ã˜Â­ Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã™â€¦',
        'Ã˜Â´Ã™Æ’Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â²Ã˜Â±',
        'Ã˜Â³Ã˜Â±Ã˜Â¹Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¬Ã˜Â§Ã˜Â¨Ã˜Â©',
      ],
    ),
    _DaleelSurveySectionData(
      title: 'Ã˜ÂµÃ˜Â¯Ã™Å Ã™â€šÃ™Å  Ã˜Â§Ã™â€žÃ™â€¦Ã™â€¦Ã™Å Ã˜Â²',
      questions: [
        'Ã™Ë†Ã˜Â¶Ã™Ë†Ã˜Â­ Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã™â€¦',
        'Ã˜Â´Ã™Æ’Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â²Ã˜Â±',
        'Ã˜Â³Ã˜Â±Ã˜Â¹Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¬Ã˜Â§Ã˜Â¨Ã˜Â©',
      ],
    ),
    _DaleelSurveySectionData(
      title:
          'Ã˜Â¯Ã˜Â®Ã™Ë†Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â£Ã˜Â®Ã˜ÂµÃ˜Â§Ã˜Â¦Ã™Å Ã™Å Ã™â€  Ã™Ë†Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â±Ã˜Â§Ã™Æ’Ã˜Â²',
      questions: [
        'Ã™Ë†Ã˜Â¶Ã™Ë†Ã˜Â­ Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã™â€¦',
        'Ã˜Â´Ã™Æ’Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â²Ã˜Â±',
        'Ã˜Â³Ã˜Â±Ã˜Â¹Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¬Ã˜Â§Ã˜Â¨Ã˜Â©',
      ],
    ),
    _DaleelSurveySectionData(
      title: 'Ã˜Â§Ã™â€žÃ™â€¦Ã™Ë†Ã™â€šÃ˜Â¹ Ã˜Â§Ã™â€žÃ˜Â±Ã˜Â³Ã™â€¦Ã™Å ',
      questions: [
        'Ã™Ë†Ã˜Â¶Ã™Ë†Ã˜Â­ Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã™â€¦',
        'Ã˜Â´Ã™Æ’Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â²Ã˜Â±',
        'Ã˜Â³Ã˜Â±Ã˜Â¹Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¬Ã˜Â§Ã˜Â¨Ã˜Â©',
      ],
    ),
    _DaleelSurveySectionData(
      title: 'Ã˜ÂªÃ˜ÂºÃ™Å Ã™Å Ã˜Â± Ã˜Â§Ã™â€žÃ™â€žÃ˜ÂºÃ˜Â©',
      questions: [
        'Ã™Ë†Ã˜Â¶Ã™Ë†Ã˜Â­ Ã˜Â§Ã™â€žÃ™Ë†Ã˜Â¸Ã™Å Ã™ÂÃ˜Â©',
        'Ã˜Â´Ã™Æ’Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â²Ã˜Â±',
        'Ã˜Â³Ã˜Â±Ã˜Â¹Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¬Ã˜Â§Ã˜Â¨Ã˜Â©',
      ],
    ),
    _DaleelSurveySectionData(
      title:
          'Ã˜Â§Ã™â€žÃ˜Â¹Ã™Ë†Ã˜Â¯Ã˜Â© Ã™â€žÃ™â€žÃ™â€ Ã˜Â³Ã˜Â®Ã˜Â© Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â®Ã˜ÂµÃ˜ÂµÃ˜Â© Ã™â€žÃ™â€žÃ™â€¦Ã™Ë†Ã˜Â¨Ã˜Â§Ã™Å Ã™â€ž',
      questions: [
        'Ã™Ë†Ã˜Â¶Ã™Ë†Ã˜Â­ Ã˜Â§Ã™â€žÃ™Ë†Ã˜Â¸Ã™Å Ã™ÂÃ˜Â©',
        'Ã˜Â´Ã™Æ’Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â²Ã˜Â±',
        'Ã˜Â³Ã˜Â±Ã˜Â¹Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¬Ã˜Â§Ã˜Â¨Ã˜Â©',
      ],
    ),
    _DaleelSurveySectionData(
      title: 'Ã˜Â§Ã™â€žÃ˜Â´Ã˜Â§Ã˜Â´Ã˜Â© Ã˜Â¨Ã˜Â´Ã™Æ’Ã™â€ž Ã˜Â¹Ã˜Â§Ã™â€¦',
      questions: [
        'Ã˜Â§Ã™â€žÃ˜Â£Ã™â€žÃ™Ë†Ã˜Â§Ã™â€  Ã™Ë†Ã˜Â§Ã™â€žÃ™â€¡Ã™Ë†Ã™Å Ã˜Â©',
        'Ã™Ë†Ã˜Â¶Ã™Ë†Ã˜Â­ Ã˜Â§Ã™â€žÃ˜ÂµÃ™ÂÃ˜Â­Ã˜Â©',
        'Ã˜Â³Ã™â€¡Ã™Ë†Ã™â€žÃ˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â®Ã˜Â¯Ã˜Â§Ã™â€¦',
        'Ã˜Â³Ã˜Â±Ã˜Â¹Ã˜Â© Ã˜Â§Ã™â€žÃ˜ÂµÃ™ÂÃ˜Â­Ã˜Â©',
      ],
    ),
  ];

  final Map<String, String> _answers = {};
  final TextEditingController _suggestionsController = TextEditingController();

  @override
  void dispose() {
    _suggestionsController.dispose();
    super.dispose();
  }

  String _keyFor(String section, String question) => '$section / $question';

  void _submitSurvey() {
    debugPrint(
      'Daleel welcome survey: answers=$_answers, suggestions=${_suggestionsController.text}',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Ã˜ÂªÃ™â€¦ Ã˜Â§Ã˜Â³Ã˜ÂªÃ™â€šÃ˜Â¨Ã˜Â§Ã™â€ž Ã˜Â±Ã˜Â£Ã™Å Ã™Æ’ Ã˜Â¯Ã˜Â§Ã˜Â®Ã™â€ž Ã™â€¡Ã˜Â°Ã™â€¡ Ã˜Â§Ã™â€žÃ˜Â¬Ã™â€žÃ˜Â³Ã˜Â© Ã™ÂÃ™â€šÃ˜Â·.',
        ),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.88,
          decoration: BoxDecoration(
            color: const Color(0xFA080500),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            border: Border(
              top: BorderSide(
                color: const Color(0xFFE0C174).withValues(alpha: 0.68),
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Ã˜Â±Ã˜Â£Ã™Å Ã™Æ’ Ã™ÂÃ™Å  Ã˜Â§Ã™â€žÃ˜Â´Ã˜Â§Ã˜Â´Ã˜Â© Ã˜Â§Ã™â€žÃ˜ÂªÃ˜Â±Ã˜Â­Ã™Å Ã˜Â¨Ã™Å Ã˜Â©',
                        style: TextStyle(
                          color: Color(0xFFFFE8A3),
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Color(0xFFFFE8A3),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                  children: [
                    for (final section in _sections)
                      _DaleelSurveySection(
                        data: section,
                        answers: _answers,
                        keyFor: _keyFor,
                        onChanged: (key, value) {
                          setState(() {
                            _answers[key] = value;
                          });
                        },
                      ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _suggestionsController,
                      minLines: 3,
                      maxLines: 5,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(color: Color(0xFFFFE8A3)),
                      decoration: InputDecoration(
                        labelText:
                            'Ã˜Â§Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â§Ã˜Â­Ã˜Â§Ã˜ÂªÃ™Æ’ Ã˜ÂªÃ™â€¡Ã™â€¦Ã™â€ Ã˜Â§',
                        hintText:
                            'Ã˜Â§Ã™Æ’Ã˜ÂªÃ˜Â¨ Ã˜Â£Ã™Å  Ã™â€¦Ã™â€žÃ˜Â§Ã˜Â­Ã˜Â¸Ã˜Â© Ã˜Â£Ã™Ë† Ã˜Â§Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â§Ã˜Â­ Ã™Å Ã˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã™â€ Ã˜Â§ Ã™â€ Ã˜Â·Ã™Ë†Ã™â€˜Ã˜Â± Ã˜Â§Ã™â€žÃ˜Â´Ã˜Â§Ã˜Â´Ã˜Â©...',
                        labelStyle: const TextStyle(color: Color(0xFFE0C174)),
                        hintStyle: TextStyle(
                          color: const Color(
                            0xFFFFE8A3,
                          ).withValues(alpha: 0.62),
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.045),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF9B6A19),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFFE8A3),
                            width: 1.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _submitSurvey,
                      icon: const Icon(Icons.send_rounded),
                      label: const Text(
                        'Ã˜Â¥Ã˜Â±Ã˜Â³Ã˜Â§Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â±Ã˜Â£Ã™Å ',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE0C174),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaleelSurveySectionData {
  const _DaleelSurveySectionData({
    required this.title,
    required this.questions,
  });

  final String title;
  final List<String> questions;
}

class _DaleelSurveySection extends StatelessWidget {
  const _DaleelSurveySection({
    required this.data,
    required this.answers,
    required this.keyFor,
    required this.onChanged,
  });

  final _DaleelSurveySectionData data;
  final Map<String, String> answers;
  final String Function(String section, String question) keyFor;
  final void Function(String key, String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            data.title,
            style: const TextStyle(
              color: Color(0xFFFFE8A3),
              fontSize: 17,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 10),
          for (final question in data.questions)
            _DaleelSurveyQuestion(
              question: question,
              value: answers[keyFor(data.title, question)],
              onChanged: (value) =>
                  onChanged(keyFor(data.title, question), value),
            ),
        ],
      ),
    );
  }
}

class _DaleelSurveyQuestion extends StatelessWidget {
  const _DaleelSurveyQuestion({
    required this.question,
    required this.value,
    required this.onChanged,
  });

  static const List<String> _options = [
    'Ã™â€¦Ã™â€¦Ã˜ÂªÃ˜Â§Ã˜Â²',
    'Ã˜Â¬Ã™Å Ã˜Â¯',
    'Ã™Å Ã˜Â­Ã˜ÂªÃ˜Â§Ã˜Â¬ Ã˜ÂªÃ˜Â·Ã™Ë†Ã™Å Ã˜Â±',
  ];

  final String question;
  final String? value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Color(0xFFE0C174),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 7),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in _options)
                ChoiceChip(
                  label: Text(option),
                  selected: value == option,
                  onSelected: (_) => onChanged(option),
                  selectedColor: const Color(0xFFE0C174),
                  backgroundColor: Colors.black.withValues(alpha: 0.34),
                  labelStyle: TextStyle(
                    color: value == option
                        ? Colors.black
                        : const Color(0xFFFFE8A3),
                    fontWeight: FontWeight.w800,
                  ),
                  side: BorderSide(
                    color: const Color(0xFFE0C174).withValues(alpha: 0.52),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SplashPrimaryAction extends StatelessWidget {
  const _SplashPrimaryAction({
    required this.label,
    required this.icon,
    required this.onSpeak,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onSpeak;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = SharedLocalizations.of(context);

    return Semantics(
      button: true,
      label: '$label. ${l10n.applicationAccessibilityListenSupport}.',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: 220),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFF4C2), Color(0xFFD4AF37), Color(0xFF7A4E12)],
            ),
            border: Border.all(color: const Color(0xFFFFE8A3), width: 1.3),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD4AF37).withValues(alpha: 0.65),
                blurRadius: 24,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFFF4F1E8), size: 20),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF4F1E8),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 6,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              AccessibilityGuideIcon(
                size: 18,
                tooltipIconSize: 96,
                onPressed: onSpeak,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashSecondaryAction extends StatelessWidget {
  const _SplashSecondaryAction({
    required this.label,
    required this.icon,
    required this.onSpeak,
    required this.onPressed,
    this.publicWeb = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onSpeak;
  final VoidCallback onPressed;
  final bool publicWeb;

  @override
  Widget build(BuildContext context) {
    final l10n = SharedLocalizations.of(context);

    return Semantics(
      button: true,
      label: '$label. ${l10n.applicationAccessibilityListenSupport}.',
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        style: TextButton.styleFrom(
          foregroundColor: publicWeb
              ? const Color(0xFFFFF1C2)
              : const Color(0xFFFFE8A3),
          backgroundColor: Colors.black.withValues(
            alpha: publicWeb ? 0.27 : 0.20,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
            side: BorderSide(
              color: const Color(0xFFFFE8A3).withValues(alpha: 0.34),
              width: publicWeb ? 1.2 : 1,
            ),
          ),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 0,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            AccessibilityGuideIcon(
              size: 17,
              tooltipIconSize: 96,
              onPressed: onSpeak,
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashMobileShortcut extends StatelessWidget {
  const _SplashMobileShortcut({
    required this.imageSize,
    required this.label,
    required this.onSpeak,
    required this.onTap,
  });

  final double imageSize;
  final String label;
  final VoidCallback onSpeak;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: const Color(0xFFFFE8A3).withValues(alpha: 0.34),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD4AF37).withValues(alpha: 0.28),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.22),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Image.asset(
                'packages/mental_smile_residential_capsule/assets/images/mobile/splash/btn_mobile.webp.png',
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontSize: 14,
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
                AccessibilityGuideIcon(
                  size: 16,
                  tooltipIconSize: 96,
                  onPressed: onSpeak,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
