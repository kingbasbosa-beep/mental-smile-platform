import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_request.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_service.dart';

void main() {
  test('request preserves the localization key', () {
    const request = LocalizedSpeechRequest(
      sectionId: 'library',
      localizationKey: 'libraryProviderSpecialists',
      text: 'Specialists',
      locale: Locale('en'),
    );

    expect(request.localizationKey, 'libraryProviderSpecialists');
  });

  test('empty text is not spoken', () async {
    final engine = _FakeSpeechEngine();
    final service = LocalizedSpeechService(engineFactory: () => engine);

    final result = await service.speak(
      const LocalizedSpeechRequest(
        sectionId: 'library',
        localizationKey: 'libraryProviderSpecialists',
        text: '   ',
        locale: Locale('en'),
      ),
    );

    expect(result.spoken, isFalse);
    expect(engine.speakCalls, isEmpty);
  });

  test('new tap stops previous speech before speaking', () async {
    final engine = _FakeSpeechEngine(languages: const <String>['en-US']);
    final service = LocalizedSpeechService(engineFactory: () => engine);

    await service.speak(
      const LocalizedSpeechRequest(
        sectionId: 'library',
        localizationKey: 'libraryProviderSpecialists',
        text: 'Specialists',
        locale: Locale('en'),
      ),
    );
    await service.speak(
      const LocalizedSpeechRequest(
        sectionId: 'library',
        localizationKey: 'libraryProviderCenters',
        text: 'Centers',
        locale: Locale('en'),
      ),
    );

    expect(engine.events, <String>[
      'stop',
      'setLanguage:en-US',
      'speak',
      'stop',
      'setLanguage:en-US',
      'speak',
    ]);
  });

  test('Arabic requests an Arabic voice', () async {
    final engine =
        _FakeSpeechEngine(languages: const <String>['ar-EG', 'en-US']);
    final service = LocalizedSpeechService(engineFactory: () => engine);

    await service.speak(
      const LocalizedSpeechRequest(
        sectionId: 'library',
        localizationKey: 'libraryProviderSpecialists',
        text: 'نص',
        locale: Locale('ar'),
      ),
    );

    expect(engine.languagesSet, contains('ar-EG'));
  });

  test('English requests an English voice', () async {
    final engine = _FakeSpeechEngine(languages: const <String>['en-US']);
    final service = LocalizedSpeechService(engineFactory: () => engine);

    await service.speak(
      const LocalizedSpeechRequest(
        sectionId: 'library',
        localizationKey: 'libraryProviderCenters',
        text: 'Centers',
        locale: Locale('en'),
      ),
    );

    expect(engine.languagesSet, contains('en-US'));
  });

  test('engine failure returns fail-soft result', () async {
    final engine = _FakeSpeechEngine(throwOnSpeak: true);
    final service = LocalizedSpeechService(engineFactory: () => engine);

    final result = await service.speak(
      const LocalizedSpeechRequest(
        sectionId: 'library',
        localizationKey: 'libraryProviderCenters',
        text: 'Centers',
        locale: Locale('en'),
      ),
    );

    expect(result.spoken, isFalse);
    expect(result.code, 'engine_failure');
  });

  test('service does not store spoken text', () async {
    final engine = _FakeSpeechEngine(languages: const <String>['en-US']);
    final service = LocalizedSpeechService(engineFactory: () => engine);

    await service.speak(
      const LocalizedSpeechRequest(
        sectionId: 'library',
        localizationKey: 'libraryProviderCenters',
        text: 'Sensitive text should only reach the fake engine.',
        locale: Locale('en'),
      ),
    );

    expect(service.toString(), isNot(contains('Sensitive text')));
  });

  test('speech module has no Firebase import', () {
    final directory = Directory('lib/shared/accessibility/speech');
    final files = directory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));

    for (final file in files) {
      expect(file.readAsStringSync(), isNot(contains('firebase')));
    }
  });

  test('visible speech replacement widget was removed', () {
    expect(
      File('lib/shared/accessibility/speech/localized_speech_button.dart')
          .existsSync(),
      isFalse,
    );

    final dartSources = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))
        .where((file) => !file.path.contains('core\\platform_core'));

    for (final file in dartSources) {
      final source = file.readAsStringSync();
      expect(source, isNot(contains('LocalizedSpeechButton')));
    }
  });

  test('old speaker placeholder callbacks no longer show audio soon', () {
    final runtimeSources = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))
        .where((file) => !file.path.contains('core\\platform_core'))
        .where((file) => !file.path.contains('l10n\\'));

    for (final file in runtimeSources) {
      final source = file.readAsStringSync();
      expect(source, isNot(contains('_showSpeechPlaceholder')));
      expect(source, isNot(contains('_audioPlaceholder')));
      expect(source, isNot(contains('applicationAudioSoon')));
    }
  });

  test('connected Library headphone buttons use localization getters', () {
    final source =
        File('lib/features/library/presentation/pages/library_page.dart')
            .readAsStringSync();

    expect(source,
        contains("speechLocalizationKey: 'libraryProviderSpecialists'"));
    expect(source, contains("speechLocalizationKey: 'libraryProviderCenters'"));
    expect(source, contains('title: l10n.libraryProviderSpecialists'));
    expect(source, contains('title: l10n.libraryProviderCenters'));
    expect(source, contains("sectionId: 'library'"));
    expect(source, contains('speakLocalizedText'));
  });

  test('target placeholder identifiers have no routes or callers', () {
    final libraryFiles = Directory('lib/features/library')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));
    final combined =
        libraryFiles.map((file) => file.readAsStringSync()).join('\n');

    expect(combined, isNot(contains('CHILD_SUPPORT_COMING_SOON')));
    expect(combined, isNot(contains('SPECIAL_NEEDS_SUPPORT_COMING_SOON')));
  });
}

class _FakeSpeechEngine implements LocalizedSpeechEngine {
  _FakeSpeechEngine({
    this.throwOnSpeak = false,
    List<String> languages = const <String>[],
  }) : _languages = languages;

  final bool throwOnSpeak;
  final List<String> _languages;
  final List<String> events = <String>[];
  final List<String> speakCalls = <String>[];
  final List<String> languagesSet = <String>[];

  @override
  Future<void> dispose() async {
    events.add('dispose');
  }

  @override
  Future<List<String>> languages() async => _languages;

  @override
  Future<void> setLanguage(String language) async {
    languagesSet.add(language);
    events.add('setLanguage:$language');
  }

  @override
  Future<void> speak(String text) async {
    if (throwOnSpeak) {
      throw StateError('speech unavailable');
    }
    speakCalls.add(text);
    events.add('speak');
  }

  @override
  Future<void> stop() async {
    events.add('stop');
  }
}
