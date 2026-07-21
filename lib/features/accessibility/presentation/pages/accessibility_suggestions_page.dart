import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/features/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_os/l10n/accessibility/accessibility_localizations.dart';
import 'package:mental_smile_os/l10n/residential/residential_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/links/safe_external_link_launcher.dart';

class AccessibilitySuggestionsPage extends StatefulWidget {
  const AccessibilitySuggestionsPage({super.key});

  @override
  State<AccessibilitySuggestionsPage> createState() =>
      _AccessibilitySuggestionsPageState();
}

class _AccessibilitySuggestionsPageState
    extends State<AccessibilitySuggestionsPage> {
  static const String _background =
      'assets/accessibility/accessibility_suggestions/accessibility_suggestions_papyrus_background.png';
  static const String _adminWhatsAppNumber = '201014116531';

  final TextEditingController _toolNameController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.accessibilitySuggestionsView,
      sourceScreen: 'Accessibility Suggestions',
      sourceWidget: 'AccessibilitySuggestionsPage',
      action: 'view',
    );
  }

  @override
  void dispose() {
    _toolNameController.dispose();
    _reasonController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  Future<void> _speakLocalizedLabel(
    BuildContext context, {
    required String localizationKey,
    required String localizedText,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Suggestions',
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

  Future<void> _submitSuggestion(AccessibilityLocalizations l10n) async {
    final toolName = _toolNameController.text.trim();
    final reason = _reasonController.text.trim();
    final link = _linkController.text.trim();

    if (toolName.isEmpty || reason.isEmpty) {
      ResidentialSignalEmitter.emit(
        signalCode: ResidentialSignalCode.blockedState,
        sourceScreen: 'Accessibility Suggestions',
        sourceWidget: 'SuggestionForm',
        action: 'validation_blocked',
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.applicationAccessibilitySuggestionsValidation,
          ),
        ),
      );
      return;
    }

    final message = l10n.applicationAccessibilitySuggestionsWhatsappMessage(
      toolName,
      reason,
      link.isEmpty ? l10n.applicationAccessibilitySuggestionsNotAttached : link,
    );

    final uri = Uri.https(
      'wa.me',
      '/$_adminWhatsAppNumber',
      <String, String>{'text': message},
    );

    final opened = await SafeExternalLinkLauncher.openUri(context, uri);
    if (!opened) return;
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.suggestionSubmit,
      sourceScreen: 'Accessibility Suggestions',
      sourceWidget: 'SuggestionSubmitButton',
      action: 'submit_suggestion_external_whatsapp',
    );
    if (!mounted) return;

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFFF1D0),
        title: Text(
          l10n.applicationAccessibilitySuggestionsSuccessTitle,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Color(0xFF7A4A00),
            fontWeight: FontWeight.w800,
          ),
        ),
        content: Text(
          l10n.applicationAccessibilitySuggestionsSuccessBody,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Color(0xFF3A2A18),
            fontSize: 16,
            height: 1.45,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
                ResidentialLocalizations.of(context).applicationClientDialogOk),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                          constraints:
                              BoxConstraints(maxWidth: contentMaxWidth),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Semantics(
                                header: true,
                                label: l10n
                                    .applicationAccessibilitySuggestionsCardTitle,
                                child: _SpeakableText(
                                  text:
                                      '💡 ${l10n.applicationAccessibilitySuggestionsCardTitle}',
                                  onSpeak: () => _speakLocalizedLabel(
                                    context,
                                    localizationKey:
                                        'applicationAccessibilitySuggestionsCardTitle',
                                    localizedText: l10n
                                        .applicationAccessibilitySuggestionsCardTitle,
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
                                    '🛠️ ${l10n.applicationAccessibilitySuggestionsCardSubtitle}',
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilitySuggestionsCardSubtitle',
                                  localizedText: l10n
                                      .applicationAccessibilitySuggestionsCardSubtitle,
                                ),
                                style: const TextStyle(
                                  color: Color(0xFF3A2A18),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 24),
                              _SuggestionField(
                                controller: _toolNameController,
                                icon: '💡',
                                label: l10n
                                    .applicationAccessibilitySuggestionsLabelName,
                                hint: l10n
                                    .applicationAccessibilitySuggestionsHintName,
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilitySuggestionsLabelName',
                                  localizedText: l10n
                                      .applicationAccessibilitySuggestionsLabelName,
                                ),
                              ),
                              const SizedBox(height: 14),
                              _SuggestionField(
                                controller: _reasonController,
                                icon: '📝',
                                label: l10n
                                    .applicationAccessibilitySuggestionsLabelReason,
                                hint: l10n
                                    .applicationAccessibilitySuggestionsHintReason,
                                maxLines: 5,
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilitySuggestionsLabelReason',
                                  localizedText: l10n
                                      .applicationAccessibilitySuggestionsLabelReason,
                                ),
                              ),
                              const SizedBox(height: 14),
                              _SuggestionField(
                                controller: _linkController,
                                icon: '🔗',
                                label: l10n
                                    .applicationAccessibilitySuggestionsLabelLink,
                                hint: l10n
                                    .applicationAccessibilitySuggestionsHintLink,
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilitySuggestionsLabelLink',
                                  localizedText: l10n
                                      .applicationAccessibilitySuggestionsLabelLink,
                                ),
                              ),
                              const SizedBox(height: 22),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Semantics(
                                    button: true,
                                    label: l10n
                                        .applicationAccessibilitySuggestionsSubmitButton,
                                    child: TextButton(
                                      onPressed: () => _submitSuggestion(l10n),
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
                                      child: Text(
                                        '📨 ${l10n.applicationAccessibilitySuggestionsSubmitButton}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  AccessibilityGuideIcon(
                                    size: 24,
                                    onPressed: () => _speakLocalizedLabel(
                                      context,
                                      localizationKey:
                                          'applicationAccessibilitySuggestionsSubmitButton',
                                      localizedText: l10n
                                          .applicationAccessibilitySuggestionsSubmitButton,
                                    ),
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

class _SuggestionField extends StatelessWidget {
  const _SuggestionField({
    required this.controller,
    required this.icon,
    required this.label,
    required this.hint,
    required this.onSpeak,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String icon;
  final String label;
  final String hint;
  final VoidCallback onSpeak;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                '$icon $label',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  color: Color(0xFF8B5E34),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
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
        const SizedBox(height: 6),
        Semantics(
          label: label,
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: const Color(0x33FFF1D0),
              hintStyle: const TextStyle(color: Color(0xAA5C4228)),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x668B5E34)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF8B5E34),
                  width: 1.4,
                ),
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF3A2A18),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
