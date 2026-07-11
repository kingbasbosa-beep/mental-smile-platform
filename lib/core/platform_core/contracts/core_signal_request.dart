class CoreSignalRequest {
  const CoreSignalRequest({
    required this.sectionId,
    required this.code,
    this.context = const <String, Object?>{},
  });

  final String sectionId;
  final String code;
  final Map<String, Object?> context;
}
