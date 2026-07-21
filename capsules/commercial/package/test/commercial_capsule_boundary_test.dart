import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'package has no direct Firebase, Storage, Residential, or Library imports',
    () {
      final source = Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('package:cloud_firestore')));
      expect(source, isNot(contains('package:firebase_auth')));
      expect(source, isNot(contains('package:firebase_core')));
      expect(source, isNot(contains('package:firebase_storage')));
      expect(source, isNot(contains('features/residential')));
      expect(source, isNot(contains('features/library')));
      expect(source, isNot(contains('package:mental_smile_os/')));
    },
  );
}
