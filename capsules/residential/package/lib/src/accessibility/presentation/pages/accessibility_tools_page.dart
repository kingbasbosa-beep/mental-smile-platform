import 'package:flutter/material.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_residential_capsule/src/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_residential_capsule/src/localization/accessibility/accessibility_localizations.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_actions.dart';

class AccessibilityToolsPage extends StatelessWidget {
  const AccessibilityToolsPage({super.key});

  static const String _background =
      'packages/mental_smile_residential_capsule/assets/accessibility/accessibility_tools/accessibility_tools_papyrus_background.png';

  List<_ToolSection> _sections(AccessibilityLocalizations l10n) => [
    _ToolSection(
      titleKey: 'applicationAccessibilityToolsSectionWriting',
      title: l10n.applicationAccessibilityToolsSectionWriting,
      tools: <_AssistiveTool>[
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsChatGptTitle',
          titleAr: l10n.applicationAccessibilityToolsChatGptTitle,
          titleEn: 'ChatGPT',
          descriptionAr: l10n.applicationAccessibilityToolsChatGptDesc,
          url: 'https://chatgpt.com/',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsGeminiTitle',
          titleAr: l10n.applicationAccessibilityToolsGeminiTitle,
          titleEn: 'Gemini',
          descriptionAr: l10n.applicationAccessibilityToolsGeminiDesc,
          url: 'https://gemini.google.com/',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsCopilotTitle',
          titleAr: l10n.applicationAccessibilityToolsCopilotTitle,
          titleEn: 'Copilot',
          descriptionAr: l10n.applicationAccessibilityToolsCopilotDesc,
          url: 'https://copilot.microsoft.com/',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsVoiceTypingTitle',
          titleAr: l10n.applicationAccessibilityToolsVoiceTypingTitle,
          titleEn: 'Voice typing',
          descriptionAr: l10n.applicationAccessibilityToolsVoiceTypingDesc,
          url: 'https://support.google.com/docs/answer/4492226',
        ),
      ],
    ),
    _ToolSection(
      titleKey: 'applicationAccessibilityToolsSectionCommunication',
      title: l10n.applicationAccessibilityToolsSectionCommunication,
      tools: <_AssistiveTool>[
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsGoogleTranslateTitle',
          titleAr: l10n.applicationAccessibilityToolsGoogleTranslateTitle,
          titleEn: 'Google Translate',
          descriptionAr: l10n.applicationAccessibilityToolsGoogleTranslateDesc,
          url: 'https://translate.google.com/',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsMicrosoftTranslatorTitle',
          titleAr: l10n.applicationAccessibilityToolsMicrosoftTranslatorTitle,
          titleEn: 'Microsoft Translator',
          descriptionAr:
              l10n.applicationAccessibilityToolsMicrosoftTranslatorDesc,
          url: 'https://www.microsoft.com/translator/',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsDeepLTitle',
          titleAr: l10n.applicationAccessibilityToolsDeepLTitle,
          titleEn: 'DeepL',
          descriptionAr: l10n.applicationAccessibilityToolsDeepLDesc,
          url: 'https://www.deepl.com/translator',
        ),
        _AssistiveTool(
          titleKey:
              'applicationAccessibilityToolsMicrosoftTranslatorConversationTitle',
          titleAr: l10n
              .applicationAccessibilityToolsMicrosoftTranslatorConversationTitle,
          titleEn: 'Microsoft Translator conversation mode',
          descriptionAr: l10n
              .applicationAccessibilityToolsMicrosoftTranslatorConversationDesc,
          url: 'https://www.microsoft.com/translator/business/live/',
        ),
      ],
    ),
    _ToolSection(
      titleKey: 'applicationAccessibilityToolsSectionVisual',
      title: l10n.applicationAccessibilityToolsSectionVisual,
      tools: <_AssistiveTool>[
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsSeeingAITitle',
          titleAr: l10n.applicationAccessibilityToolsSeeingAITitle,
          titleEn: 'Seeing AI',
          descriptionAr: l10n.applicationAccessibilityToolsSeeingAIDesc,
          url: 'https://www.microsoft.com/en-us/ai/seeing-ai',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsLookoutTitle',
          titleAr: l10n.applicationAccessibilityToolsLookoutTitle,
          titleEn: 'Lookout by Google',
          descriptionAr: l10n.applicationAccessibilityToolsLookoutDesc,
          url:
              'https://support.google.com/accessibility/android/answer/9031274',
        ),
      ],
    ),
    _ToolSection(
      titleKey: 'applicationAccessibilityToolsSectionAudio',
      title: l10n.applicationAccessibilityToolsSectionAudio,
      tools: <_AssistiveTool>[
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsLiveTranscribeTitle',
          titleAr: l10n.applicationAccessibilityToolsLiveTranscribeTitle,
          titleEn: 'Live Transcribe',
          descriptionAr: l10n.applicationAccessibilityToolsLiveTranscribeDesc,
          url:
              'https://play.google.com/store/apps/details?id=com.google.audio.hearing.visualization.accessibility.scribe',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsYoutubeCaptionsTitle',
          titleAr: l10n.applicationAccessibilityToolsYoutubeCaptionsTitle,
          titleEn: 'YouTube captions',
          descriptionAr: l10n.applicationAccessibilityToolsYoutubeCaptionsDesc,
          url: 'https://support.google.com/youtube/answer/100078',
        ),
      ],
    ),
    _ToolSection(
      titleKey: 'applicationAccessibilityToolsSectionReading',
      title: l10n.applicationAccessibilityToolsSectionReading,
      tools: <_AssistiveTool>[
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsReadAloudTitle',
          titleAr: l10n.applicationAccessibilityToolsReadAloudTitle,
          titleEn: 'Read Aloud',
          descriptionAr: l10n.applicationAccessibilityToolsReadAloudDesc,
          url: 'https://readaloud.app/',
        ),
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsImmersiveReaderTitle',
          titleAr: l10n.applicationAccessibilityToolsImmersiveReaderTitle,
          titleEn: 'Immersive Reader',
          descriptionAr: l10n.applicationAccessibilityToolsImmersiveReaderDesc,
          url:
              'https://support.microsoft.com/en-us/topic/use-immersive-reader-in-microsoft-edge-78a7a17d-52e1-47ee-b0ac-eff8539015e1',
        ),
      ],
    ),
    _ToolSection(
      titleKey: 'applicationAccessibilityToolsSectionDaily',
      title: l10n.applicationAccessibilityToolsSectionDaily,
      tools: <_AssistiveTool>[
        _AssistiveTool(
          titleKey: 'applicationAccessibilityToolsBeMyEyesTitle',
          titleAr: l10n.applicationAccessibilityToolsBeMyEyesTitle,
          titleEn: 'Be My Eyes',
          descriptionAr: l10n.applicationAccessibilityToolsBeMyEyesDesc,
          url: 'https://www.bemyeyes.com/',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.accessibilityToolsView,
      sourceScreen: 'Accessibility Tools',
      sourceWidget: 'AccessibilityToolsPage',
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
                  final horizontalPadding = isDesktop ? 60.0 : 24.0;
                  final contentMaxWidth = isDesktop ? 900.0 : 800.0;

                  return ListView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      34,
                      horizontalPadding,
                      40,
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
                          constraints: BoxConstraints(
                            maxWidth: contentMaxWidth,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Semantics(
                                header: true,
                                label:
                                    l10n.applicationAccessibilityToolsCardTitle,
                                child: _SpeakableText(
                                  text:
                                      'ðŸ§° ${l10n.applicationAccessibilityToolsCardTitle}',
                                  onSpeak: () => _speakLocalizedLabel(
                                    context,
                                    localizationKey:
                                        'applicationAccessibilityToolsCardTitle',
                                    localizedText: l10n
                                        .applicationAccessibilityToolsCardTitle,
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xFF7A4A00),
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              _SpeakableText(
                                text:
                                    'ðŸ’¬ ${l10n.applicationAccessibilityToolsCardSubtitle}',
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilityToolsCardSubtitle',
                                  localizedText: l10n
                                      .applicationAccessibilityToolsCardSubtitle,
                                ),
                                style: const TextStyle(
                                  color: Color(0xFF3A2A18),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 24),
                              for (final section in _sections(l10n)) ...[
                                _ToolSectionHeader(
                                  titleKey: section.titleKey,
                                  title: section.title,
                                ),
                                const SizedBox(height: 8),
                                for (final tool in section.tools)
                                  _ToolRow(tool: tool),
                                const SizedBox(height: 14),
                              ],
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

  Future<void> _speakLocalizedLabel(
    BuildContext context, {
    required String localizationKey,
    required String localizedText,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Tools',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: 'accessibility',
        localizationKey: localizationKey,
        localizedText: localizedText,
      ),
    );
  }
}

class _ToolSectionHeader extends StatelessWidget {
  const _ToolSectionHeader({required this.titleKey, required this.title});

  final String titleKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Semantics(
          header: true,
          label: title,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  'ðŸ“ $title',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF8B5E34),
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              AccessibilityGuideIcon(
                size: 24,
                onPressed: () => _speakLocalizedLabel(
                  context,
                  localizationKey: titleKey,
                  localizedText: title,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const SizedBox(
          width: double.infinity,
          child: Divider(color: Color(0x99B6842F), thickness: 1.4),
        ),
      ],
    );
  }

  Future<void> _speakLocalizedLabel(
    BuildContext context, {
    required String localizationKey,
    required String localizedText,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Tools',
      sourceWidget: 'ToolSectionAudioIcon',
      action: 'request_audio_support',
    );
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: 'accessibility',
        localizationKey: localizationKey,
        localizedText: localizedText,
      ),
    );
  }
}

class _ToolRow extends StatelessWidget {
  const _ToolRow({required this.tool});

  final _AssistiveTool tool;

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    return Semantics(
      button: true,
      label: '${tool.titleAr}. ${tool.descriptionAr}',
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0x18C99A38),
              border: Border.all(color: const Color(0x668B5E34)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _SpeakableText(
                    text: 'ðŸ› ï¸ ${tool.titleAr}',
                    onSpeak: () => _speakLocalizedLabel(
                      context,
                      localizationKey: tool.titleKey,
                      localizedText: tool.titleAr,
                    ),
                    style: const TextStyle(
                      color: Color(0xFF3A2A18),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    tool.titleEn,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      color: Color(0xFF5C4228),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    tool.descriptionAr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF3A2A18),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () => _openExternal(context, tool.url),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF1D5F63),
                          side: const BorderSide(color: Color(0x881D5F63)),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          'ðŸ”— ${l10n.applicationAccessibilityToolsOpen}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AccessibilityGuideIcon(
                        size: 24,
                        onPressed: () => _speakLocalizedLabel(
                          context,
                          localizationKey: tool.titleKey,
                          localizedText: tool.titleAr,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _speakLocalizedLabel(
    BuildContext context, {
    required String localizationKey,
    required String localizedText,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Tools',
      sourceWidget: 'ToolRowAudioIcon',
      action: 'request_audio_support',
    );
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: 'accessibility',
        localizationKey: localizationKey,
        localizedText: localizedText,
      ),
    );
  }
}

Future<void> _openExternal(BuildContext context, String url) async {
  ResidentialSignalEmitter.emit(
    signalCode: ResidentialSignalCode.accessibilityToolOpen,
    sourceScreen: 'Accessibility Tools',
    sourceWidget: 'ToolRowOpenButton',
    action: 'open_external_tool',
  );
  await SafeExternalLinkLauncher.open(context, url);
}

class _SpeakableText extends StatelessWidget {
  const _SpeakableText({
    required this.text,
    required this.onSpeak,
    required this.style,
  });

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
            text,
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

class _ToolSection {
  const _ToolSection({
    required this.titleKey,
    required this.title,
    required this.tools,
  });

  final String titleKey;
  final String title;
  final List<_AssistiveTool> tools;
}

class _AssistiveTool {
  _AssistiveTool({
    required this.titleKey,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.url,
  });

  final String titleKey;
  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final String url;
}
