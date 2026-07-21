import 'package:flutter/widgets.dart';

class LocalizedSpeechRequest {
  const LocalizedSpeechRequest({
    required this.sectionId,
    required this.localizationKey,
    required this.text,
    required this.locale,
    this.semanticLabel,
  });

  final String sectionId;
  final String localizationKey;
  final String text;
  final Locale locale;
  final String? semanticLabel;
}

abstract class LocalizedSpeechEngine {
  Future<void> speak(String text);
}

class LocalizedSpeechResult {
  const LocalizedSpeechResult._({required this.spoken, required this.code});

  const LocalizedSpeechResult.spoken() : this._(spoken: true, code: 'spoken');
  const LocalizedSpeechResult.failed(String code)
    : this._(spoken: false, code: code);

  final bool spoken;
  final String code;
}

class LocalizedSpeechService {
  const LocalizedSpeechService({LocalizedSpeechEngine? engine})
    : _engine = engine;

  static const LocalizedSpeechService instance = LocalizedSpeechService();

  final LocalizedSpeechEngine? _engine;

  Future<LocalizedSpeechResult> speak(LocalizedSpeechRequest request) async {
    final text = request.text.trim();
    if (text.isEmpty) {
      return const LocalizedSpeechResult.failed('empty_text');
    }
    await _engine?.speak(text);
    return const LocalizedSpeechResult.spoken();
  }
}
