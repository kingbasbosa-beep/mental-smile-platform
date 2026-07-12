import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ClientLocalSessionState {
  const ClientLocalSessionState({
    required this.active,
    this.selectedImageReference,
    this.selectedNote,
    this.temporaryPreferences = const <String, String>{},
    this.temporarySessionFlags = const <String, bool>{},
  });

  final bool active;
  final String? selectedImageReference;
  final String? selectedNote;
  final Map<String, String> temporaryPreferences;
  final Map<String, bool> temporarySessionFlags;

  bool get isEmpty =>
      !active &&
      selectedImageReference == null &&
      selectedNote == null &&
      temporaryPreferences.isEmpty &&
      temporarySessionFlags.isEmpty;
}

abstract class ClientLocalSessionStorage {
  Future<String?> readString(String key);
  Future<bool?> readBool(String key);
  Future<bool> writeString(String key, String value);
  Future<bool> writeBool(String key, bool value);
  Future<bool> remove(String key);
}

class SharedPreferencesClientLocalSessionStorage
    implements ClientLocalSessionStorage {
  const SharedPreferencesClientLocalSessionStorage();

  @override
  Future<String?> readString(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  @override
  Future<bool?> readBool(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  @override
  Future<bool> writeString(String key, String value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  @override
  Future<bool> writeBool(String key, bool value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }
}

class ClientLocalSessionStore {
  const ClientLocalSessionStore({
    ClientLocalSessionStorage storage =
        const SharedPreferencesClientLocalSessionStorage(),
  }) : _storage = storage;

  static const String activeKey = 'platform_core.client_session.active';
  static const String imageReferenceKey =
      'platform_core.client_session.selected_image_reference';
  static const String selectedNoteKey =
      'platform_core.client_session.selected_note';
  static const String preferencesKey =
      'platform_core.client_session.temporary_preferences';
  static const String flagsKey =
      'platform_core.client_session.temporary_session_flags';

  static const Set<String> forbiddenFieldNames = <String>{
    'password',
    'token',
    'secret',
    'email',
    'phone',
    'uid',
    'userId',
    'authToken',
    'surveyText',
    'suggestionText',
    'complaintText',
    'providerData',
    'centerData',
  };

  final ClientLocalSessionStorage _storage;

  Future<bool> startSession() {
    return _storage.writeBool(activeKey, true);
  }

  Future<bool> saveClientImageReference(String reference) {
    _rejectForbidden('selectedImageReference');
    return _storage.writeString(imageReferenceKey, reference);
  }

  Future<bool> saveSelectedNote(String selectedNote) {
    _rejectForbidden('selectedNote');
    return _storage.writeString(selectedNoteKey, selectedNote);
  }

  Future<bool> savePreference(String key, String value) async {
    _rejectForbidden(key);
    final state = await readSession();
    final updated = <String, String>{
      ...state.temporaryPreferences,
      key: value,
    };
    return _storage.writeString(preferencesKey, jsonEncode(updated));
  }

  Future<bool> saveSessionFlag(String key, bool value) async {
    _rejectForbidden(key);
    final state = await readSession();
    final updated = <String, bool>{
      ...state.temporarySessionFlags,
      key: value,
    };
    return _storage.writeString(flagsKey, jsonEncode(updated));
  }

  Future<ClientLocalSessionState> readSession() async {
    final active = await _storage.readBool(activeKey) ?? false;
    final selectedImageReference = await _storage.readString(
      imageReferenceKey,
    );
    final selectedNote = await _storage.readString(selectedNoteKey);
    final preferences = _decodeStringMap(
      await _storage.readString(preferencesKey),
    );
    final flags = _decodeBoolMap(await _storage.readString(flagsKey));

    return ClientLocalSessionState(
      active: active,
      selectedImageReference: selectedImageReference,
      selectedNote: selectedNote,
      temporaryPreferences: preferences,
      temporarySessionFlags: flags,
    );
  }

  Future<bool> clearSession() async {
    var cleared = true;
    for (final key in <String>[
      activeKey,
      imageReferenceKey,
      selectedNoteKey,
      preferencesKey,
      flagsKey,
    ]) {
      try {
        cleared = await _storage.remove(key) && cleared;
      } catch (_) {
        cleared = false;
      }
    }
    return cleared;
  }

  Map<String, Object?> safeSignalContext() {
    return const <String, Object?>{};
  }

  static bool isForbiddenFieldName(String key) {
    return forbiddenFieldNames.contains(key);
  }

  static Map<String, String> _decodeStringMap(String? raw) {
    if (raw == null || raw.isEmpty) return const <String, String>{};
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, Object?>) return const <String, String>{};
    return decoded.map(
      (key, value) => MapEntry(key, value?.toString() ?? ''),
    );
  }

  static Map<String, bool> _decodeBoolMap(String? raw) {
    if (raw == null || raw.isEmpty) return const <String, bool>{};
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, Object?>) return const <String, bool>{};
    return decoded.map(
      (key, value) => MapEntry(key, value == true),
    );
  }

  static void _rejectForbidden(String key) {
    if (isForbiddenFieldName(key)) {
      throw ArgumentError.value(key, 'key', 'Forbidden client session field.');
    }
  }
}
