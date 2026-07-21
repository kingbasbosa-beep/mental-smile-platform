import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_request.dart';

abstract class LocalizedSpeechEngine {
  Future<List<String>> languages();

  Future<void> setLanguage(String language);

  Future<void> stop();

  Future<void> speak(String text);

  Future<void> dispose();
}

class FlutterTtsLocalizedSpeechEngine implements LocalizedSpeechEngine {
  FlutterTtsLocalizedSpeechEngine({FlutterTts? tts})
      : _tts = tts ?? FlutterTts();

  final FlutterTts _tts;

  @override
  Future<List<String>> languages() async {
    final result = await _tts.getLanguages;
    if (result is List) {
      return result.map((value) => value.toString()).toList(growable: false);
    }
    return const <String>[];
  }

  @override
  Future<void> setLanguage(String language) async {
    await _tts.setLanguage(language);
  }

  @override
  Future<void> stop() async {
    await _tts.stop();
  }

  @override
  Future<void> speak(String text) async {
    await _tts.speak(text);
  }

  @override
  Future<void> dispose() async {
    await _tts.stop();
  }
}

class LocalizedSpeechResult {
  const LocalizedSpeechResult._({
    required this.spoken,
    required this.code,
  });

  const LocalizedSpeechResult.spoken() : this._(spoken: true, code: 'spoken');

  const LocalizedSpeechResult.failed(String code)
      : this._(spoken: false, code: code);

  final bool spoken;
  final String code;
}

class LocalizedSpeechService {
  LocalizedSpeechService({
    LocalizedSpeechEngine Function()? engineFactory,
    DateTime Function()? now,
    Duration debounceWindow = const Duration(milliseconds: 180),
  })  : _engineFactory =
            engineFactory ?? (() => FlutterTtsLocalizedSpeechEngine()),
        _now = now ?? DateTime.now,
        _debounceWindow = debounceWindow;

  static final LocalizedSpeechService instance = LocalizedSpeechService();

  final LocalizedSpeechEngine Function() _engineFactory;
  final DateTime Function() _now;
  final Duration _debounceWindow;

  LocalizedSpeechEngine? _engine;
  DateTime? _lastTapAt;
  String? _lastLocalizationKey;

  Future<LocalizedSpeechResult> speak(LocalizedSpeechRequest request) async {
    assert(request.sectionId.trim().isNotEmpty);
    assert(request.localizationKey.trim().isNotEmpty);
    assert(request.text.isNotEmpty);

    final text = request.text.trim();
    if (text.isEmpty) {
      return const LocalizedSpeechResult.failed('empty_text');
    }

    final engine = _engine ??= _engineFactory();
    try {
      await engine.stop();

      final now = _now();
      final isRapidRepeat = _lastTapAt != null &&
          now.difference(_lastTapAt!) < _debounceWindow &&
          _lastLocalizationKey == request.localizationKey;
      _lastTapAt = now;
      _lastLocalizationKey = request.localizationKey;
      if (isRapidRepeat) {
        return const LocalizedSpeechResult.failed('debounced');
      }

      final language = await resolveLanguage(request.locale, engine);
      await engine.setLanguage(language);
      await engine.speak(text);
      return const LocalizedSpeechResult.spoken();
    } catch (_) {
      return const LocalizedSpeechResult.failed('engine_failure');
    }
  }

  Future<String> resolveLanguage(
    Locale locale,
    LocalizedSpeechEngine engine,
  ) async {
    final candidates = languageCandidates(locale);
    final available = await engine.languages();
    if (available.isEmpty) {
      return candidates.first;
    }

    final normalized = available
        .map((language) => language.toLowerCase().replaceAll('_', '-'))
        .toSet();
    for (final candidate in candidates) {
      final normalizedCandidate = candidate.toLowerCase();
      if (normalized.contains(normalizedCandidate)) {
        return candidate;
      }
    }
    for (final candidate in candidates) {
      final languageCode = candidate.split('-').first.toLowerCase();
      if (normalized.any((language) => language == languageCode)) {
        return languageCode;
      }
    }
    return candidates.first;
  }

  List<String> languageCandidates(Locale locale) {
    switch (locale.languageCode.toLowerCase()) {
      case 'ar':
        return const <String>['ar-EG', 'ar'];
      case 'en':
        return const <String>['en-US', 'en'];
      default:
        return const <String>['en-US', 'en'];
    }
  }

  Future<void> stop() async {
    await _engine?.stop();
  }

  Future<void> dispose() async {
    await _engine?.dispose();
    _engine = null;
  }
}
