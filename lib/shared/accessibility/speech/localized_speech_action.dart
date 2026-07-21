import 'package:flutter/material.dart';
import 'package:mental_smile_os/l10n/shared/shared_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_request.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_service.dart';

Future<void> speakLocalizedText(
  BuildContext context, {
  required String sectionId,
  required String localizationKey,
  required String text,
  String? semanticLabel,
  LocalizedSpeechService? service,
}) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  final result = await (service ?? LocalizedSpeechService.instance).speak(
    LocalizedSpeechRequest(
      sectionId: sectionId,
      localizationKey: localizationKey,
      text: text,
      locale: Localizations.localeOf(context),
      semanticLabel: semanticLabel,
    ),
  );

  if (!context.mounted || result.spoken) return;
  messenger?.showSnackBar(
    SnackBar(
      content: Text(
        SharedLocalizations.of(context).applicationSpeechUnavailable,
      ),
    ),
  );
}
