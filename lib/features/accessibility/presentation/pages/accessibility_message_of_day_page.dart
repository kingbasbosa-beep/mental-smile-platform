import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/features/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_os/l10n/accessibility/accessibility_localizations.dart';
import 'package:mental_smile_os/l10n/residential/residential_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class AccessibilityMessageOfDayPage extends StatelessWidget {
  const AccessibilityMessageOfDayPage({super.key});

  static const String _background =
      'assets/accessibility/accessibility_message_of_day/accessibility_message_of_day_papyrus_background.png';

  List<_LocalizedMessage> _messages(AccessibilityLocalizations l10n) => [
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage1',
          text: l10n.applicationAccessibilityMessage1,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage2',
          text: l10n.applicationAccessibilityMessage2,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage3',
          text: l10n.applicationAccessibilityMessage3,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage4',
          text: l10n.applicationAccessibilityMessage4,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage5',
          text: l10n.applicationAccessibilityMessage5,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage6',
          text: l10n.applicationAccessibilityMessage6,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage7',
          text: l10n.applicationAccessibilityMessage7,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage8',
          text: l10n.applicationAccessibilityMessage8,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage9',
          text: l10n.applicationAccessibilityMessage9,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage10',
          text: l10n.applicationAccessibilityMessage10,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage11',
          text: l10n.applicationAccessibilityMessage11,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage12',
          text: l10n.applicationAccessibilityMessage12,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage13',
          text: l10n.applicationAccessibilityMessage13,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage14',
          text: l10n.applicationAccessibilityMessage14,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage15',
          text: l10n.applicationAccessibilityMessage15,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage16',
          text: l10n.applicationAccessibilityMessage16,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage17',
          text: l10n.applicationAccessibilityMessage17,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage18',
          text: l10n.applicationAccessibilityMessage18,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage19',
          text: l10n.applicationAccessibilityMessage19,
        ),
        _LocalizedMessage(
          key: 'applicationAccessibilityMessage20',
          text: l10n.applicationAccessibilityMessage20,
        ),
      ];

  Future<void> _speakLocalizedLabel(
    BuildContext context, {
    required String localizationKey,
    required String localizedText,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Message of Day',
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

  void _selectRandom(BuildContext context, AccessibilityLocalizations l10n) {
    final messages = _messages(l10n);
    final message = messages[Random().nextInt(messages.length)].text;
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.motivationSelect,
      sourceScreen: 'Accessibility Message of Day',
      sourceWidget: 'RandomMessageButton',
      action: 'select_random_message',
    );
    Navigator.of(context).pop(message);
  }

  void _selectMessage(BuildContext context, String message) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.motivationSelect,
      sourceScreen: 'Accessibility Message of Day',
      sourceWidget: 'MessageOption',
      action: 'select_message',
    );
    Navigator.of(context).pop(message);
  }

  @override
  Widget build(BuildContext context) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.accessibilityMessageView,
      sourceScreen: 'Accessibility Message of Day',
      sourceWidget: 'AccessibilityMessageOfDayPage',
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
                  final horizontalPadding = isDesktop ? 96.0 : 24.0;
                  final contentMaxWidth = isDesktop ? 720.0 : 800.0;

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Semantics(
                                header: true,
                                label: ResidentialLocalizations.of(context)
                                    .applicationClientFeatherNotebook,
                                child: _SpeakableText(
                                  text:
                                      '🌿 ${ResidentialLocalizations.of(context).applicationClientFeatherNotebook}',
                                  onSpeak: () => _speakLocalizedLabel(
                                    context,
                                    localizationKey:
                                        'applicationClientFeatherNotebook',
                                    localizedText:
                                        ResidentialLocalizations.of(context)
                                            .applicationClientFeatherNotebook,
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
                                    '📝 ${l10n.applicationAccessibilityDialogSelectMessage}',
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilityDialogSelectMessage',
                                  localizedText: l10n
                                      .applicationAccessibilityDialogSelectMessage,
                                ),
                                style: const TextStyle(
                                  color: Color(0xFF3A2A18),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 24),
                              _MessageOption(
                                text: l10n
                                    .applicationAccessibilityDialogRandomMessage,
                                onPressed: () => _selectRandom(context, l10n),
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilityDialogRandomMessage',
                                  localizedText: l10n
                                      .applicationAccessibilityDialogRandomMessage,
                                ),
                              ),
                              const SizedBox(height: 16),
                              for (final message in _messages(l10n))
                                _MessageOption(
                                  text: message.text,
                                  onPressed: () =>
                                      _selectMessage(context, message.text),
                                  onSpeak: () => _speakLocalizedLabel(
                                    context,
                                    localizationKey: message.key,
                                    localizedText: message.text,
                                  ),
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

class _LocalizedMessage {
  const _LocalizedMessage({
    required this.key,
    required this.text,
  });

  final String key;
  final String text;
}

class _MessageOption extends StatelessWidget {
  const _MessageOption({
    required this.text,
    required this.onPressed,
    required this.onSpeak,
  });

  final String text;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Semantics(
              button: true,
              label: text,
              child: TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF1D5F63),
                  side: const BorderSide(color: Color(0x881D5F63)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          AccessibilityGuideIcon(
            size: 22,
            onPressed: onSpeak,
          ),
        ],
      ),
    );
  }
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
