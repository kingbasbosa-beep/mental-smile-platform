import '../contracts/platform_section_adapter.dart';
import '../contracts/section_socket.dart';
import '../socket/platform_socket_registry.dart';
import 'platform_section_registry.dart';

enum PlatformAdapterRegistrationReason {
  registered,
  duplicateSectionId,
  duplicateSectionCode,
  duplicateSocket,
  unknownSection,
  unknownSocket,
  wrongSocket,
}

class PlatformAdapterRegistrationResult {
  const PlatformAdapterRegistrationResult({
    required this.registered,
    required this.reason,
    this.socket,
  });

  final bool registered;
  final PlatformAdapterRegistrationReason reason;
  final SectionSocket? socket;
}

class PlatformAdapterRegistry {
  PlatformAdapterRegistry({
    PlatformSocketRegistry? socketRegistry,
    PlatformSectionRegistry? sectionRegistry,
  })  : socketRegistry = socketRegistry ?? PlatformSocketRegistry(),
        sectionRegistry = sectionRegistry ?? PlatformSectionRegistry();

  final PlatformSocketRegistry socketRegistry;
  final PlatformSectionRegistry sectionRegistry;
  final Map<String, PlatformSectionAdapter> _adaptersBySectionId =
      <String, PlatformSectionAdapter>{};
  final Map<String, PlatformSectionAdapter> _adaptersBySectionCode =
      <String, PlatformSectionAdapter>{};
  final Map<String, PlatformSectionAdapter> _adaptersBySocketId =
      <String, PlatformSectionAdapter>{};

  List<PlatformSectionAdapter> get adapters {
    return List<PlatformSectionAdapter>.unmodifiable(
      _adaptersBySectionId.values,
    );
  }

  int get length => _adaptersBySectionId.length;

  PlatformAdapterRegistrationResult register(PlatformSectionAdapter adapter) {
    final socket = adapter.createSocket();
    final section = sectionRegistry.definitionForCode(socket.sectionCode);
    final socketId = socket.socketId;

    if (section == null) {
      return const PlatformAdapterRegistrationResult(
        registered: false,
        reason: PlatformAdapterRegistrationReason.unknownSection,
      );
    }
    if (socketId == null || !socketRegistry.contains(socketId)) {
      return PlatformAdapterRegistrationResult(
        registered: false,
        reason: PlatformAdapterRegistrationReason.unknownSocket,
        socket: socket,
      );
    }
    if (section.defaultSocketId != socketId ||
        adapter.adapterDefaultSocketId != socketId) {
      return PlatformAdapterRegistrationResult(
        registered: false,
        reason: PlatformAdapterRegistrationReason.wrongSocket,
        socket: socket,
      );
    }
    if (_adaptersBySectionId.containsKey(socket.sectionId)) {
      return PlatformAdapterRegistrationResult(
        registered: false,
        reason: PlatformAdapterRegistrationReason.duplicateSectionId,
        socket: socket,
      );
    }
    if (_adaptersBySectionCode.containsKey(socket.sectionCode)) {
      return PlatformAdapterRegistrationResult(
        registered: false,
        reason: PlatformAdapterRegistrationReason.duplicateSectionCode,
        socket: socket,
      );
    }
    if (_adaptersBySocketId.containsKey(socketId)) {
      return PlatformAdapterRegistrationResult(
        registered: false,
        reason: PlatformAdapterRegistrationReason.duplicateSocket,
        socket: socket,
      );
    }

    _adaptersBySectionId[socket.sectionId] = adapter;
    _adaptersBySectionCode[socket.sectionCode] = adapter;
    _adaptersBySocketId[socketId] = adapter;
    return PlatformAdapterRegistrationResult(
      registered: true,
      reason: PlatformAdapterRegistrationReason.registered,
      socket: socket,
    );
  }

  PlatformSectionAdapter? adapterForSectionId(String sectionId) {
    return _adaptersBySectionId[sectionId];
  }

  PlatformSectionAdapter? adapterForSectionCode(String sectionCode) {
    return _adaptersBySectionCode[sectionCode];
  }

  List<SectionSocket> createSockets() {
    return List<SectionSocket>.unmodifiable(
      _adaptersBySectionId.values.map((adapter) => adapter.createSocket()),
    );
  }
}
