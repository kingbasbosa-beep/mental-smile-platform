import 'package:flutter/widgets.dart';

class LocalizedSpeechRequest {
  const LocalizedSpeechRequest({
    required this.sectionId,
    required this.localizationKey,
    required this.text,
    required this.locale,
    this.semanticLabel,
  })  : assert(sectionId.length > 0),
        assert(localizationKey.length > 0),
        assert(text.length > 0);

  final String sectionId;
  final String localizationKey;
  final String text;
  final Locale locale;
  final String? semanticLabel;
}
