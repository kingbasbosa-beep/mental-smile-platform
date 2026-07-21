class LocalSectionSignalRecord {
  const LocalSectionSignalRecord({
    required this.id,
    required this.sectionId,
    required this.code,
    required this.eventName,
    required this.createdAt,
    required this.expiresAt,
    required this.safeContext,
  });

  final String id;
  final String sectionId;
  final String code;
  final String eventName;
  final DateTime createdAt;
  final DateTime expiresAt;
  final Map<String, Object?> safeContext;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'sectionId': sectionId,
      'code': code,
      'eventName': eventName,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'expiresAt': expiresAt.toUtc().toIso8601String(),
      'safeContext': safeContext,
    };
  }

  static LocalSectionSignalRecord? fromJson(Map<String, Object?> json) {
    final id = json['id'];
    final sectionId = json['sectionId'];
    final code = json['code'];
    final eventName = json['eventName'];
    final createdAt = DateTime.tryParse(json['createdAt']?.toString() ?? '');
    final expiresAt = DateTime.tryParse(json['expiresAt']?.toString() ?? '');
    final context = json['safeContext'];

    if (id is! String ||
        sectionId is! String ||
        code is! String ||
        eventName is! String ||
        createdAt == null ||
        expiresAt == null ||
        context is! Map) {
      return null;
    }

    return LocalSectionSignalRecord(
      id: id,
      sectionId: sectionId,
      code: code,
      eventName: eventName,
      createdAt: createdAt.toUtc(),
      expiresAt: expiresAt.toUtc(),
      safeContext: Map<String, Object?>.unmodifiable(
        context.map<String, Object?>(
          (key, value) => MapEntry<String, Object?>(key.toString(), value),
        ),
      ),
    );
  }
}
