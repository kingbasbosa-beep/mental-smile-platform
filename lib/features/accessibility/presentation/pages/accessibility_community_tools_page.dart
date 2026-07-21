import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/features/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_os/l10n/accessibility/accessibility_localizations.dart';
import 'package:mental_smile_os/l10n/residential/residential_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class AccessibilityCommunityToolsPage extends StatelessWidget {
  const AccessibilityCommunityToolsPage({super.key});

  static const String _background =
      'assets/accessibility/accessibility_community_tools/accessibility_community_tools_papyrus_background.png';

  Future<void> _speakLocalizedLabel(
    BuildContext context, {
    required String sectionId,
    required String localizationKey,
    required String text,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Community Tools',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: sectionId,
        localizationKey: localizationKey,
        localizedText: text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.accessibilityCommunityToolsView,
      sourceScreen: 'Accessibility Community Tools',
      sourceWidget: 'AccessibilityCommunityToolsPage',
      action: 'view',
    );
    final l10n = AccessibilityLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF2B1B0D),
      body: SafeArea(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 960),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_background),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= 900;
                  final isTablet =
                      constraints.maxWidth >= 600 && constraints.maxWidth < 900;
                  final horizontalPadding = isDesktop
                      ? 96.0
                      : isTablet
                          ? 48.0
                          : 24.0;
                  final contentMaxWidth = isDesktop
                      ? 720.0
                      : isTablet
                          ? 640.0
                          : constraints.maxWidth;

                  return ListView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      70,
                      horizontalPadding,
                      70,
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _AccessibilityCardBackButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: contentMaxWidth),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Semantics(
                                header: true,
                                label: ResidentialLocalizations.of(context)
                                    .applicationClientCommunityToolsTitle,
                                child: _SpeakableText(
                                  icon: '📱',
                                  text: ResidentialLocalizations.of(context)
                                      .applicationClientCommunityToolsTitle,
                                  onSpeak: () => _speakLocalizedLabel(context,
                                      sectionId: 'residential',
                                      localizationKey:
                                          'applicationClientCommunityToolsTitle',
                                      text: ResidentialLocalizations.of(context)
                                          .applicationClientCommunityToolsTitle),
                                  style: const TextStyle(
                                    color: Color(0xFF7A4A00),
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              _SpeakableText(
                                icon: '💬',
                                text: l10n
                                    .applicationAccessibilityCommunityToolsComingSoon,
                                onSpeak: () => _speakLocalizedLabel(context,
                                    sectionId: 'accessibility',
                                    localizationKey:
                                        'applicationAccessibilityCommunityToolsComingSoon',
                                    text: l10n
                                        .applicationAccessibilityCommunityToolsComingSoon),
                                style: const TextStyle(
                                  color: Color(0xFF3A2A18),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _SpeakableText(
                                icon: '🌿',
                                text: l10n
                                    .applicationAccessibilityCommunityToolsNote,
                                onSpeak: () => _speakLocalizedLabel(context,
                                    sectionId: 'accessibility',
                                    localizationKey:
                                        'applicationAccessibilityCommunityToolsNote',
                                    text: l10n
                                        .applicationAccessibilityCommunityToolsNote),
                                style: const TextStyle(
                                  color: Color(0xFF3A2A18),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 28),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Semantics(
                                    button: true,
                                    label: l10n
                                        .applicationAccessibilityCommunityToolsBackToRoom,
                                    child: TextButton.icon(
                                      onPressed: () {
                                        ResidentialSignalEmitter.emit(
                                          signalCode: ResidentialSignalCode
                                              .communityToolOpen,
                                          sourceScreen:
                                              'Accessibility Community Tools',
                                          sourceWidget: 'BackToRoomButton',
                                          action: 'return_accessibility_room',
                                        );
                                        Navigator.of(context).maybePop();
                                      },
                                      icon: const Icon(
                                          Icons.meeting_room_rounded),
                                      label: Text(
                                        '🚪 ${l10n.applicationAccessibilityCommunityToolsBackToRoom}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFF1D5F63),
                                        side: const BorderSide(
                                          color: Color(0x881D5F63),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  AccessibilityGuideIcon(
                                    size: 24,
                                    onPressed: () => _speakLocalizedLabel(
                                        context,
                                        sectionId: 'accessibility',
                                        localizationKey:
                                            'applicationAccessibilityCommunityToolsBackToRoom',
                                        text: l10n
                                            .applicationAccessibilityCommunityToolsBackToRoom),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AccessibilityCardBackButton extends StatelessWidget {
  const _AccessibilityCardBackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    return IconButton(
      tooltip: l10n.applicationAccessibilityCommunityToolsBackToRoom,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xFF1B1007).withValues(alpha: 0.55),
        side: BorderSide(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.58),
        ),
        fixedSize: const Size.square(44),
      ),
      icon: const Icon(
        Icons.arrow_back_rounded,
        textDirection: TextDirection.ltr,
        color: Color(0xFFFFE7B2),
      ),
    );
  }
}

class _SpeakableText extends StatelessWidget {
  const _SpeakableText({
    required this.icon,
    required this.text,
    required this.onSpeak,
    required this.style,
  });

  final String icon;
  final String text;
  final VoidCallback onSpeak;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            '$icon $text',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: style,
          ),
        ),
        const SizedBox(width: 8),
        AccessibilityGuideIcon(
          size: style.fontSize != null ? style.fontSize! + 4 : 26,
          onPressed: onSpeak,
        ),
      ],
    );
  }
}
