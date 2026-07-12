import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';

void main() {
  group('ClientLocalSessionStore', () {
    test('empty session starts correctly', () async {
      final store = ClientLocalSessionStore(storage: _MemorySessionStorage());

      final empty = await store.readSession();
      expect(empty.isEmpty, isTrue);

      await store.startSession();
      final started = await store.readSession();
      expect(started.active, isTrue);
    });

    test('saves and reads selected note, preference, flag, and image reference',
        () async {
      final storage = _MemorySessionStorage();
      final store = ClientLocalSessionStore(storage: storage);

      await store.startSession();
      await store.saveSelectedNote('chosen local note');
      await store.savePreference('theme', 'calm');
      await store.saveSessionFlag('supportSpaceOpen', true);
      await store.saveClientImageReference('local/path/image.png');

      final state = await store.readSession();
      expect(state.selectedNote, 'chosen local note');
      expect(state.temporaryPreferences, <String, String>{'theme': 'calm'});
      expect(state.temporarySessionFlags, <String, bool>{
        'supportSpaceOpen': true,
      });
      expect(state.selectedImageReference, 'local/path/image.png');
    });

    test('session survives store reload with same persistence', () async {
      final storage = _MemorySessionStorage();
      final first = ClientLocalSessionStore(storage: storage);
      await first.saveSelectedNote('persisted local note');

      final second = ClientLocalSessionStore(storage: storage);
      final state = await second.readSession();

      expect(state.selectedNote, 'persisted local note');
    });

    test('logout clear removes note, image reference, preferences, and flags',
        () async {
      final store = ClientLocalSessionStore(storage: _MemorySessionStorage());
      await store.startSession();
      await store.saveSelectedNote('local note');
      await store.saveClientImageReference('local/path/image.png');
      await store.savePreference('theme', 'calm');
      await store.saveSessionFlag('supportSpaceOpen', true);

      final cleared = await store.clearSession();
      final state = await store.readSession();

      expect(cleared, isTrue);
      expect(state.isEmpty, isTrue);
    });

    test('clear failure does not throw', () async {
      final store = ClientLocalSessionStore(
        storage: _MemorySessionStorage(throwOnRemove: true),
      );
      await store.saveSelectedNote('local note');

      final cleared = await store.clearSession();

      expect(cleared, isFalse);
    });

    test('session data never enters signal context', () {
      const store = ClientLocalSessionStore();

      expect(store.safeSignalContext(), isEmpty);
    });

    test('password, email, uid, and phone cannot be stored', () async {
      final store = ClientLocalSessionStore(storage: _MemorySessionStorage());

      expect(
        store.savePreference('password', 'secret'),
        throwsArgumentError,
      );
      expect(
        store.savePreference('email', 'person@example.com'),
        throwsArgumentError,
      );
      expect(
        store.savePreference('uid', 'abc'),
        throwsArgumentError,
      );
      expect(
        store.savePreference('phone', '123'),
        throwsArgumentError,
      );
    });
  });
}

class _MemorySessionStorage implements ClientLocalSessionStorage {
  _MemorySessionStorage({this.throwOnRemove = false});

  final bool throwOnRemove;
  final Map<String, Object?> _values = <String, Object?>{};

  @override
  Future<String?> readString(String key) async {
    return _values[key] as String?;
  }

  @override
  Future<bool?> readBool(String key) async {
    return _values[key] as bool?;
  }

  @override
  Future<bool> writeString(String key, String value) async {
    _values[key] = value;
    return true;
  }

  @override
  Future<bool> writeBool(String key, bool value) async {
    _values[key] = value;
    return true;
  }

  @override
  Future<bool> remove(String key) async {
    if (throwOnRemove) {
      throw StateError('clear failed');
    }
    _values.remove(key);
    return true;
  }
}
