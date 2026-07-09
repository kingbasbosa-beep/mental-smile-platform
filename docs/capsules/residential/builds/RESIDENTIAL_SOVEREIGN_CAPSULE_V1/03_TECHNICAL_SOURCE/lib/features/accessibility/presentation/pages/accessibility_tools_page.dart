import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessibilityToolsPage extends StatelessWidget {
  const AccessibilityToolsPage({super.key});

  static const String _background =
      'assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png';

  List<_ToolSection> _sections(AppLocalizations l10n) => [
        _ToolSection(
          title: l10n.applicationAccessibilityToolsSectionWriting,
          tools: <_AssistiveTool>[
            _AssistiveTool(
              titleAr: 'شات جي بي تي',
              titleEn: 'ChatGPT',
              descriptionAr: l10n.applicationAccessibilityToolsChatGptDesc,
              url: 'https://chatgpt.com/',
            ),
            _AssistiveTool(
              titleAr: 'جيميني',
              titleEn: 'Gemini',
              descriptionAr: l10n.applicationAccessibilityToolsGeminiDesc,
              url: 'https://gemini.google.com/',
            ),
            _AssistiveTool(
              titleAr: 'كوبايلوت',
              titleEn: 'Copilot',
              descriptionAr: l10n.applicationAccessibilityToolsCopilotDesc,
              url: 'https://copilot.microsoft.com/',
            ),
            _AssistiveTool(
              titleAr: 'الكتابة بالصوت',
              titleEn: 'Voice typing',
              descriptionAr: l10n.applicationAccessibilityToolsVoiceTypingDesc,
              url: 'https://support.google.com/docs/answer/4492226',
            ),
          ],
        ),
        _ToolSection(
          title: l10n.applicationAccessibilityToolsSectionCommunication,
          tools: <_AssistiveTool>[
            _AssistiveTool(
              titleAr: 'ترجمة جوجل',
              titleEn: 'Google Translate',
              descriptionAr:
                  l10n.applicationAccessibilityToolsGoogleTranslateDesc,
              url: 'https://translate.google.com/',
            ),
            _AssistiveTool(
              titleAr: 'مترجم مايكروسوفت',
              titleEn: 'Microsoft Translator',
              descriptionAr:
                  l10n.applicationAccessibilityToolsMicrosoftTranslatorDesc,
              url: 'https://www.microsoft.com/translator/',
            ),
            _AssistiveTool(
              titleAr: 'ديب إل',
              titleEn: 'DeepL',
              descriptionAr: l10n.applicationAccessibilityToolsDeepLDesc,
              url: 'https://www.deepl.com/translator',
            ),
            const _AssistiveTool(
              titleAr: 'محادثة مترجم مايكروسوفت',
              titleEn: 'Microsoft Translator conversation mode',
              descriptionAr: 'ترجمة محادثات مباشرة',
              url: 'https://www.microsoft.com/translator/business/live/',
            ),
          ],
        ),
        _ToolSection(
          title: l10n.applicationAccessibilityToolsSectionVisual,
          tools: <_AssistiveTool>[
            _AssistiveTool(
              titleAr: 'سيينج إيه آي',
              titleEn: 'Seeing AI',
              descriptionAr: l10n.applicationAccessibilityToolsSeeingAIDesc,
              url: 'https://www.microsoft.com/en-us/ai/seeing-ai',
            ),
            _AssistiveTool(
              titleAr: 'لوك آوت من جوجل',
              titleEn: 'Lookout by Google',
              descriptionAr: l10n.applicationAccessibilityToolsLookoutDesc,
              url:
                  'https://support.google.com/accessibility/android/answer/9031274',
            ),
          ],
        ),
        _ToolSection(
          title: l10n.applicationAccessibilityToolsSectionAudio,
          tools: <_AssistiveTool>[
            _AssistiveTool(
              titleAr: 'النسخ النصي المباشر',
              titleEn: 'Live Transcribe',
              descriptionAr:
                  l10n.applicationAccessibilityToolsLiveTranscribeDesc,
              url:
                  'https://play.google.com/store/apps/details?id=com.google.audio.hearing.visualization.accessibility.scribe',
            ),
            _AssistiveTool(
              titleAr: 'ترجمة يوتيوب النصية',
              titleEn: 'YouTube captions',
              descriptionAr:
                  l10n.applicationAccessibilityToolsYoutubeCaptionsDesc,
              url: 'https://support.google.com/youtube/answer/100078',
            ),
          ],
        ),
        _ToolSection(
          title: l10n.applicationAccessibilityToolsSectionReading,
          tools: <_AssistiveTool>[
            _AssistiveTool(
              titleAr: 'القراءة بصوت عالٍ',
              titleEn: 'Read Aloud',
              descriptionAr: l10n.applicationAccessibilityToolsReadAloudDesc,
              url: 'https://readaloud.app/',
            ),
            _AssistiveTool(
              titleAr: 'القارئ الشامل',
              titleEn: 'Immersive Reader',
              descriptionAr:
                  l10n.applicationAccessibilityToolsImmersiveReaderDesc,
              url:
                  'https://support.microsoft.com/en-us/topic/use-immersive-reader-in-microsoft-edge-78a7a17d-52e1-47ee-b0ac-eff8539015e1',
            ),
          ],
        ),
        _ToolSection(
          title: l10n.applicationAccessibilityToolsSectionDaily,
          tools: <_AssistiveTool>[
            _AssistiveTool(
              titleAr: 'كن عيني',
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
    final l10n = AppLocalizations.of(context)!;
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
                                label:
                                    l10n.applicationAccessibilityToolsCardTitle,
                                child: _SpeakableText(
                                  text:
                                      '🧰 ${l10n.applicationAccessibilityToolsCardTitle}',
                                  onSpeak: () => _showSpeechPlaceholder(context,
                                      l10n.applicationAccessibilityToolsCardTitle),
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
                                    '💬 ${l10n.applicationAccessibilityToolsCardSubtitle}',
                                onSpeak: () => _showSpeechPlaceholder(context,
                                    l10n.applicationAccessibilityToolsCardSubtitle),
                                style: const TextStyle(
                                  color: Color(0xFF3A2A18),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 24),
                              for (final section in _sections(l10n)) ...[
                                _ToolSectionHeader(title: section.title),
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

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Tools',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

class _ToolSectionHeader extends StatelessWidget {
  const _ToolSectionHeader({required this.title});

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
                  '📍 $title',
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
                onPressed: () => _showSpeechPlaceholder(context, title),
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

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Tools',
      sourceWidget: 'ToolSectionAudioIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

class _ToolRow extends StatelessWidget {
  const _ToolRow({required this.tool});

  final _AssistiveTool tool;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                    text: '🛠️ ${tool.titleAr}',
                    onSpeak: () =>
                        _showSpeechPlaceholder(context, tool.titleAr),
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
                        onPressed: () => _openExternal(tool.url),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF1D5F63),
                          side: const BorderSide(color: Color(0x881D5F63)),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          '🔗 ${l10n.applicationAccessibilityToolsOpen}',
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
                        onPressed: () =>
                            _showSpeechPlaceholder(context, tool.titleAr),
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

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Tools',
      sourceWidget: 'ToolRowAudioIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

Future<void> _openExternal(String url) async {
  ResidentialSignalEmitter.emit(
    signalCode: ResidentialSignalCode.accessibilityToolOpen,
    sourceScreen: 'Accessibility Tools',
    sourceWidget: 'ToolRowOpenButton',
    action: 'open_external_tool',
  );
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
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

class _ToolSection {
  const _ToolSection({
    required this.title,
    required this.tools,
  });

  final String title;
  final List<_AssistiveTool> tools;
}

class _AssistiveTool {
  const _AssistiveTool({
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.url,
  });

  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final String url;
}
