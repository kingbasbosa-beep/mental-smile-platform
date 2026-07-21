class PlatformSocketIds {
  const PlatformSocketIds._();

  static const socket01 = 'SOCKET_01';
}

abstract class PlatformSectionAdapter {
  String get adapterDefaultSocketId;
  String get adapterTestCode;
  SectionSocket createSocket();
}

class SectionSocket {
  const SectionSocket({
    required this.sectionId,
    required this.sectionCode,
    required this.contractVersion,
    required this.environment,
    required this.allowedGates,
    required this.allowedCodePrefixes,
    required this.socketId,
  });

  final String sectionId;
  final String sectionCode;
  final int contractVersion;
  final String environment;
  final Set<String> allowedGates;
  final Set<String> allowedCodePrefixes;
  final String socketId;
}

class CoreEmitResult {
  const CoreEmitResult({required this.accepted, this.reason = 'unmounted'});

  final bool accepted;
  final String reason;
}

class PlatformCoreSignalBridge {
  const PlatformCoreSignalBridge({required this.adapter});

  final PlatformSectionAdapter adapter;

  Future<CoreEmitResult> emit({
    required String code,
    Map<String, Object?> context = const <String, Object?>{},
  }) async {
    return const CoreEmitResult(accepted: false);
  }
}
