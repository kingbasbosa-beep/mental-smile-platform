import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('residential speech layer does not import commercial or library code',
      () {
    final files = Directory('lib/features/residential/speech')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));

    for (final file in files) {
      final source = file.readAsStringSync();
      expect(source, isNot(contains('flutter_tts')));
      expect(source, isNot(contains('CommercialLocalizations')));
      expect(source, isNot(contains('LibraryLocalizations')));
      expect(source, isNot(contains('features/commercial')));
      expect(source, isNot(contains('features/library')));
    }
  });

  test('residential and accessibility speech uses residential boundary', () {
    final files = <String>[
      'lib/features/client/presentation/pages/client_room_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_room_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_links_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_tools_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart',
    ];

    for (final path in files) {
      final source = File(path).readAsStringSync();
      expect(source, contains('ResidentialSpeechGenerator'));
      expect(source, contains('ResidentialSpeechNode'));
      expect(source, isNot(contains('localized_speech_action.dart')));
      expect(source, isNot(contains('speakLocalizedText(')));
    }
  });

  test('residential speech generator rejects mojibake before speaking', () {
    final source = File(
      'lib/features/residential/speech/residential_speech_generator.dart',
    ).readAsStringSync();

    expect(source, contains('_containsMojibake'));
    expect(
      RegExp(r"value\.contains\('[^']+'\)").allMatches(source).length,
      greaterThanOrEqualTo(5),
    );
  });

  test('remaining speaker gaps are statically closed', () {
    final scopedFiles = <String>[
      'lib/features/splash/presentation/pages/splash_page.dart',
      'lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart',
      'lib/features/client/presentation/pages/client_room_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_room_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_links_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_tools_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart',
      'lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart',
      'lib/shared/generation2_mobile/generation2_mobile_room_scaffold.dart',
    ];
    final source =
        scopedFiles.map((path) => File(path).readAsStringSync()).join('\n');

    expect(source, isNot(contains('const AccessibilityGuideIcon(')));
    expect(source, isNot(contains('AccessibilityGuideIcon()')));
    expect(source, isNot(contains('localizedText: localizationKey')));
    expect(source, isNot(contains('localizedText: resolvedText')));
    expect(source, isNot(contains('localizationKey: resolvedKey')));
    expect(source, isNot(contains('runtimeLabel')));
    expect(source, isNot(contains('speakLocalizedText(')));
  });

  test('dynamic speaker lists carry explicit localization keys', () {
    final clientRoom = File(
      'lib/features/client/presentation/pages/client_room_page.dart',
    ).readAsStringSync();
    final accessibilityLinks = File(
      'lib/features/accessibility/presentation/pages/accessibility_links_page.dart',
    ).readAsStringSync();
    final accessibilityRoom = File(
      'lib/features/accessibility/presentation/pages/accessibility_room_page.dart',
    ).readAsStringSync();
    final messageOfDay = File(
      'lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart',
    ).readAsStringSync();

    expect(clientRoom, contains('speechKey:'));
    expect(clientRoom, contains('speechText:'));
    expect(clientRoom, contains('titleKey:'));
    expect(accessibilityLinks, contains('titleKey:'));
    expect(accessibilityLinks, contains('final String key;'));
    expect(accessibilityRoom, contains('_ResidentialNotebookMessage'));
    expect(messageOfDay, contains('_LocalizedMessage'));
  });
}
