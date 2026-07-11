class SectionSocket {
  const SectionSocket({
    required this.sectionId,
    required this.sectionCode,
    required this.contractVersion,
    required this.environment,
    required this.allowedGates,
    required this.allowedCodePrefixes,
    this.socketId,
  });

  final String sectionId;
  final String sectionCode;
  final int contractVersion;
  final String environment;
  final Set<String> allowedGates;
  final Set<String> allowedCodePrefixes;
  final String? socketId;

  bool allowsGate(String gate) => allowedGates.contains(gate);

  bool allowsCodePrefix(String code) {
    return allowedCodePrefixes.any(code.startsWith);
  }
}
