class CoreSignalEnvelope {
  const CoreSignalEnvelope({
    required this.signalId,
    required this.code,
    required this.family,
    required this.eventName,
    required this.logicalTarget,
    required this.sourceSectionId,
    required this.environment,
    required this.schemaVersion,
    required this.createdAt,
    required this.context,
  });

  final String signalId;
  final String code;
  final String family;
  final String eventName;
  final String logicalTarget;
  final String sourceSectionId;
  final String environment;
  final int schemaVersion;
  final DateTime createdAt;
  final Map<String, Object?> context;
}
