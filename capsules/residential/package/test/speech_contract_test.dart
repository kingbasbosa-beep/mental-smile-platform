import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:mental_smile_residential_capsule/src/contracts/speech_contracts.dart';

import '../test_support/fake_contracts.dart';

void main() {
  test(
    'fake speech engine remains test-only and receives speech text',
    () async {
      final engine = FakeLowLevelSpeechEngine();
      final service = LocalizedSpeechService(engine: engine);

      final result = await service.speak(
        const LocalizedSpeechRequest(
          sectionId: 'residential',
          localizationKey: 'key',
          text: 'hello',
          locale: Locale('en'),
        ),
      );

      expect(result.spoken, isTrue);
      expect(engine.spoken, ['hello']);
    },
  );
}
