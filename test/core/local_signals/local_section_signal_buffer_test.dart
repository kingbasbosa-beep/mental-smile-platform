import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/local_signals/local_section_signal_buffer.dart';

void main() {
  group('LocalSectionSignalBuffer', () {
    test('stores active non-core signals per section', () async {
      final storage = _MemoryLocalSectionSignalStorage();
      final buffer = LocalSectionSignalBuffer(
        storage: storage,
        clock: () => DateTime.utc(2026, 7, 15, 10),
      );

      final result = await buffer.append(
        sectionId: LocalSectionSignalBuffer.residentialSection,
        code: 'R.S.001.VIEW',
        eventName: 'Screen Presence',
        context: const <String, Object?>{
          'surface': 'client_room',
          'actionType': 'view',
        },
      );

      expect(result.stored, isTrue);
      final records = await buffer.readActive(
        LocalSectionSignalBuffer.residentialSection,
      );
      expect(records, hasLength(1));
      expect(records.single.code, 'R.S.001.VIEW');
      expect(records.single.expiresAt, DateTime.utc(2026, 7, 16, 10));
    });

    test('removes expired records on read', () async {
      final storage = _MemoryLocalSectionSignalStorage();
      const key = 'mental_smile_local_signals_library';
      storage.values[key] = <String>[
        jsonEncode(<String, Object?>{
          'id': 'old',
          'sectionId': 'library',
          'code': 'L.S.001.VIEW',
          'eventName': 'Library Screen Presence',
          'createdAt': DateTime.utc(2026, 7, 14, 9).toIso8601String(),
          'expiresAt': DateTime.utc(2026, 7, 15, 9).toIso8601String(),
          'safeContext': <String, Object?>{'surface': 'library'},
        }),
      ];
      final buffer = LocalSectionSignalBuffer(
        storage: storage,
        clock: () => DateTime.utc(2026, 7, 15, 10),
      );

      final records = await buffer.readActive(
        LocalSectionSignalBuffer.librarySection,
      );

      expect(records, isEmpty);
      expect(storage.values[key], isEmpty);
    });

    test('keeps only newest 200 records per section', () async {
      var index = 0;
      final storage = _MemoryLocalSectionSignalStorage();
      final buffer = LocalSectionSignalBuffer(
        storage: storage,
        clock: () => DateTime.utc(2026, 7, 15, 10, 0, index++),
      );

      for (var i = 0; i < 205; i += 1) {
        await buffer.append(
          sectionId: LocalSectionSignalBuffer.commercialSection,
          code: 'CV2_SIG_OPEN_LIBRARY',
          eventName: 'Commercial V2 Showcase Navigation',
          context: <String, Object?>{'sequence': i},
        );
      }

      final records = await buffer.readActive(
        LocalSectionSignalBuffer.commercialSection,
      );
      expect(records, hasLength(200));
      expect(records.first.safeContext['sequence'], 5);
      expect(records.last.safeContext['sequence'], 204);
    });

    test('rejects unsafe context fields before local storage', () {
      final sanitized = LocalSectionSignalBuffer.sanitizeContext(
        const <String, Object?>{
          'surface': 'client_room',
          'email': 'person@example.com',
          'message': 'private message',
          'downloadUrl': 'https://example.com/private.png',
          'longText':
              'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopq',
        },
      );

      expect(sanitized.context, containsPair('surface', 'client_room'));
      expect(sanitized.context.containsKey('email'), isFalse);
      expect(sanitized.context.containsKey('message'), isFalse);
      expect(sanitized.context.containsKey('downloadUrl'), isFalse);
      expect(sanitized.context.containsKey('longText'), isFalse);
      expect(
        sanitized.rejectedKeys,
        containsAll(<String>['email', 'message', 'downloadUrl', 'longText']),
      );
    });

    test('section buffers use separate storage keys', () async {
      final storage = _MemoryLocalSectionSignalStorage();
      final buffer = LocalSectionSignalBuffer(
        storage: storage,
        clock: () => DateTime.utc(2026, 7, 15, 10),
      );

      await buffer.append(
        sectionId: LocalSectionSignalBuffer.residentialSection,
        code: 'R.S.001.VIEW',
        eventName: 'Screen Presence',
        context: const <String, Object?>{'surface': 'client_room'},
      );
      await buffer.append(
        sectionId: LocalSectionSignalBuffer.librarySection,
        code: 'L.S.001.VIEW',
        eventName: 'Library Screen Presence',
        context: const <String, Object?>{'surface': 'library'},
      );

      expect(
        storage.values.keys,
        containsAll(<String>[
          'mental_smile_local_signals_residential',
          'mental_smile_local_signals_library',
        ]),
      );
    });

    test('storage failure returns a result without throwing', () async {
      final buffer = LocalSectionSignalBuffer(
        storage: _ThrowingLocalSectionSignalStorage(),
        clock: () => DateTime.utc(2026, 7, 15, 10),
      );

      final result = await buffer.append(
        sectionId: LocalSectionSignalBuffer.librarySection,
        code: 'L.S.001.VIEW',
        eventName: 'Library Screen Presence',
        context: const <String, Object?>{'surface': 'library'},
      );

      expect(result.stored, isFalse);
      expect(result.reason, 'storage_failure');
    });
  });
}

class _MemoryLocalSectionSignalStorage implements LocalSectionSignalStorage {
  final Map<String, List<String>> values = <String, List<String>>{};

  @override
  Future<List<String>> read(String key) async {
    return List<String>.of(values[key] ?? <String>[]);
  }

  @override
  Future<bool> write(String key, List<String> values) async {
    this.values[key] = List<String>.of(values);
    return true;
  }
}

class _ThrowingLocalSectionSignalStorage implements LocalSectionSignalStorage {
  @override
  Future<List<String>> read(String key) {
    throw StateError('storage unavailable');
  }

  @override
  Future<bool> write(String key, List<String> values) {
    throw StateError('storage unavailable');
  }
}
