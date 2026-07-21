import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'local_section_signal_record.dart';

typedef LocalSignalClock = DateTime Function();

abstract class LocalSectionSignalStorage {
  Future<List<String>> read(String key);

  Future<bool> write(String key, List<String> values);
}

class SharedPreferencesLocalSectionSignalStorage
    implements LocalSectionSignalStorage {
  const SharedPreferencesLocalSectionSignalStorage();

  @override
  Future<List<String>> read(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(key) ?? <String>[];
  }

  @override
  Future<bool> write(String key, List<String> values) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setStringList(key, values);
  }
}

class LocalSectionSignalAppendResult {
  const LocalSectionSignalAppendResult({
    required this.stored,
    required this.recordId,
    required this.reason,
    required this.rejectedContextKeys,
  });

  final bool stored;
  final String? recordId;
  final String reason;
  final List<String> rejectedContextKeys;
}

class LocalSectionSignalBuffer {
  LocalSectionSignalBuffer({
    LocalSectionSignalStorage storage =
        const SharedPreferencesLocalSectionSignalStorage(),
    LocalSignalClock? clock,
  }) : _storage = storage,
       _clock = clock ?? DateTime.now;

  static const Duration ttl = Duration(hours: 24);
  static const int maxRecordsPerSection = 200;

  static const String residentialSection = 'residential';
  static const String commercialSection = 'commercial';
  static const String librarySection = 'library';

  static const Map<String, String> storageKeys = <String, String>{
    residentialSection: 'mental_smile_local_signals_residential',
    commercialSection: 'mental_smile_local_signals_commercial',
    librarySection: 'mental_smile_local_signals_library',
  };

  static const Set<String> deniedContextKeys = <String>{
    'answer',
    'answers',
    'bytes',
    'centerData',
    'clientData',
    'content',
    'description',
    'device',
    'downloadUrl',
    'email',
    'file',
    'fullName',
    'image',
    'message',
    'note',
    'notes',
    'password',
    'phone',
    'profile',
    'providerData',
    'secret',
    'session',
    'specialistData',
    'text',
    'token',
    'uid',
    'userId',
  };

  final LocalSectionSignalStorage _storage;
  final LocalSignalClock _clock;

  Future<LocalSectionSignalAppendResult> append({
    required String sectionId,
    required String code,
    required String eventName,
    required Map<String, Object?> context,
  }) async {
    final storageKey = storageKeys[sectionId];
    if (storageKey == null) {
      return const LocalSectionSignalAppendResult(
        stored: false,
        recordId: null,
        reason: 'unknown_section',
        rejectedContextKeys: <String>[],
      );
    }

    final sanitized = sanitizeContext(context);
    final now = _clock().toUtc();
    final recordId = '${sectionId}_${now.microsecondsSinceEpoch}_$code';
    final record = LocalSectionSignalRecord(
      id: recordId,
      sectionId: sectionId,
      code: code,
      eventName: eventName,
      createdAt: now,
      expiresAt: now.add(ttl),
      safeContext: sanitized.context,
    );

    try {
      final records = await _readActiveRecords(storageKey, now);
      final nextRecords = <LocalSectionSignalRecord>[...records, record];
      final cappedRecords = _capNewest(nextRecords);
      final stored = await _storage.write(
        storageKey,
        cappedRecords
            .map((entry) => jsonEncode(entry.toJson()))
            .toList(growable: false),
      );

      return LocalSectionSignalAppendResult(
        stored: stored,
        recordId: recordId,
        reason: stored ? 'stored_locally' : 'storage_declined',
        rejectedContextKeys: sanitized.rejectedKeys,
      );
    } catch (_) {
      return LocalSectionSignalAppendResult(
        stored: false,
        recordId: recordId,
        reason: 'storage_failure',
        rejectedContextKeys: sanitized.rejectedKeys,
      );
    }
  }

  Future<List<LocalSectionSignalRecord>> readActive(String sectionId) async {
    final storageKey = storageKeys[sectionId];
    if (storageKey == null) return <LocalSectionSignalRecord>[];

    final now = _clock().toUtc();
    try {
      final records = await _readActiveRecords(storageKey, now);
      final cappedRecords = _capNewest(records);
      await _storage.write(
        storageKey,
        cappedRecords
            .map((entry) => jsonEncode(entry.toJson()))
            .toList(growable: false),
      );
      return cappedRecords;
    } catch (_) {
      return <LocalSectionSignalRecord>[];
    }
  }

  Future<void> cleanup(String sectionId) async {
    await readActive(sectionId);
  }

  static LocalSignalSanitizedContext sanitizeContext(
    Map<String, Object?> context,
  ) {
    final safe = <String, Object?>{};
    final rejected = <String>[];

    for (final entry in context.entries) {
      final key = entry.key;
      final value = entry.value;
      if (_isDeniedKey(key) || !_isSafeValue(value)) {
        rejected.add(key);
        continue;
      }
      safe[key] = value;
    }

    return LocalSignalSanitizedContext(
      context: Map<String, Object?>.unmodifiable(safe),
      rejectedKeys: List<String>.unmodifiable(rejected),
    );
  }

  Future<List<LocalSectionSignalRecord>> _readActiveRecords(
    String storageKey,
    DateTime now,
  ) async {
    final encodedRecords = await _storage.read(storageKey);
    final records = <LocalSectionSignalRecord>[];

    for (final encodedRecord in encodedRecords) {
      final decoded = jsonDecode(encodedRecord);
      if (decoded is! Map) continue;
      final record = LocalSectionSignalRecord.fromJson(
        decoded.map<String, Object?>(
          (key, value) => MapEntry<String, Object?>(key.toString(), value),
        ),
      );
      if (record == null) continue;
      if (!record.expiresAt.isAfter(now)) continue;
      records.add(record);
    }

    return records;
  }

  List<LocalSectionSignalRecord> _capNewest(
    List<LocalSectionSignalRecord> records,
  ) {
    final ordered = <LocalSectionSignalRecord>[...records]
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    if (ordered.length <= maxRecordsPerSection) {
      return ordered;
    }
    return ordered.sublist(ordered.length - maxRecordsPerSection);
  }

  static bool _isDeniedKey(String key) {
    final normalized = key.trim().toLowerCase();
    return deniedContextKeys.any(
      (blockedKey) => normalized == blockedKey.toLowerCase(),
    );
  }

  static bool _isSafeValue(Object? value) {
    if (value == null || value is bool || value is int || value is double) {
      return true;
    }
    if (value is String) {
      return value.length <= 120 && !value.contains('://');
    }
    return false;
  }
}

class LocalSignalSanitizedContext {
  const LocalSignalSanitizedContext({
    required this.context,
    required this.rejectedKeys,
  });

  final Map<String, Object?> context;
  final List<String> rejectedKeys;
}
