import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final lib = Directory('lib');

  test(
    'capsule source has no root implementation or cross-capsule imports',
    () {
      final source = lib
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('package:mental_smile_os/')));
      expect(source, isNot(contains('features/commercial')));
      expect(source, isNot(contains('features/library')));
      expect(source, isNot(contains('package:cloud_firestore')));
      expect(source, isNot(contains('package:firebase_')));
      expect(source, isNot(contains('package:flutter_tts')));
    },
  );
}
