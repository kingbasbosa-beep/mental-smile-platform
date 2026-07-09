import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class AccessibilityMessageOfDayPage extends StatelessWidget {
  const AccessibilityMessageOfDayPage({super.key});

  static const String _background =
      'assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png';

  List<String> _messages(AppLocalizations l10n) => [
        l10n.applicationAccessibilityMessage1,
        l10n.applicationAccessibilityMessage2,
        l10n.applicationAccessibilityMessage3,
        l10n.applicationAccessibilityMessage4,
        l10n.applicationAccessibilityMessage5,
        l10n.applicationAccessibilityMessage6,
        l10n.applicationAccessibilityMessage7,
        l10n.applicationAccessibilityMessage8,
        l10n.applicationAccessibilityMessage9,
        l10n.applicationAccessibilityMessage10,
        l10n.applicationAccessibilityMessage11,
        l10n.applicationAccessibilityMessage12,
        l10n.applicationAccessibilityMessage13,
        l10n.applicationAccessibilityMessage14,
        l10n.applicationAccessibilityMessage15,
        l10n.applicationAccessibilityMessage16,
        l10n.applicationAccessibilityMessage17,
        l10n.applicationAccessibilityMessage18,
        l10n.applicationAccessibilityMessage19,
        l10n.applicationAccessibilityMessage20,
      ];

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Message of Day',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }

  void _selectRandom(BuildContext context, AppLocalizations l10n) {
    final messages = _messages(l10n);
    final message = messages[Random().nextInt(messages.length)];
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
                                label: l10n.applicationClientFeatherNotebook,
                                child: _SpeakableText(
                                  text:
                                      '🌿 ${l10n.applicationClientFeatherNotebook}',
                                  onSpeak: () => _showSpeechPlaceholder(context,
                                      l10n.applicationClientFeatherNotebook),
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
                                onSpeak: () => _showSpeechPlaceholder(context,
                                    l10n.applicationAccessibilityDialogSelectMessage),
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
                                onSpeak: () => _showSpeechPlaceholder(context,
                                    l10n.applicationAccessibilityDialogRandomMessage),
                              ),
                              const SizedBox(height: 16),
                              for (final message in _messages(l10n))
                                _MessageOption(
                                  text: message,
                                  onPressed: () =>
                                      _selectMessage(context, message),
                                  onSpeak: () =>
                                      _showSpeechPlaceholder(context, message),
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
