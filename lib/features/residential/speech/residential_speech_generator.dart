import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/speech/residential_speech_node.dart';
import 'package:mental_smile_os/l10n/shared/shared_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_request.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_service.dart';

class ResidentialSpeechGenerator {
  const ResidentialSpeechGenerator({
    LocalizedSpeechService? service,
  }) : _service = service;

  static const ResidentialSpeechGenerator instance =
      ResidentialSpeechGenerator();

  final LocalizedSpeechService? _service;

  Future<void> speak(
    BuildContext context,
    ResidentialSpeechNode node,
  ) async {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (_containsMojibake(node.localizedText)) {
      _showUnavailable(context, messenger);
      return;
    }

    final result = await (_service ?? LocalizedSpeechService.instance).speak(
      LocalizedSpeechRequest(
        sectionId: node.sectionId,
        localizationKey: node.localizationKey,
        text: node.localizedText,
        locale: Localizations.localeOf(context),
        semanticLabel: node.semanticLabel,
      ),
    );

    if (!context.mounted || result.spoken) return;
    _showUnavailable(context, messenger);
  }

  void _showUnavailable(
    BuildContext context,
    ScaffoldMessengerState? messenger,
  ) {
    if (!context.mounted) return;
    messenger?.showSnackBar(
      SnackBar(
        content: Text(
          SharedLocalizations.of(context).applicationSpeechUnavailable,
        ),
      ),
    );
  }

  bool _containsMojibake(String value) {
    return value.contains('Ø') ||
        value.contains('Ù') ||
        value.contains('Ã') ||
        value.contains('Â') ||
        value.contains('â');
  }

  Future<void> speakGroup(
    BuildContext context,
    ResidentialSpeechGroupNode node,
  ) {
    return speak(context, node.toSpeechNode());
  }
}
