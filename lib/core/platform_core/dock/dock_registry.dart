import '../contracts/section_socket.dart';
import '../registry/platform_section_registry.dart';
import '../socket/platform_socket_registry.dart';

enum DockSlotStatus { empty, connected, active, disabled }

enum DockConnectionReason {
  connected,
  duplicateSection,
  dockFull,
  unknownSocket,
  reservedSocket,
  wrongSocket,
  socketOccupied,
}

class DockConnectionResult {
  const DockConnectionResult({
    required this.connected,
    required this.reason,
    this.slot,
  });

  final bool connected;
  final DockConnectionReason reason;
  final DockSlot? slot;
}

class DockSlot {
  const DockSlot({
    required this.index,
    required this.socketId,
    required this.socket,
    required this.status,
  });

  final int index;
  final String socketId;
  final SectionSocket socket;
  final DockSlotStatus status;

  DockSlot copyWith({DockSlotStatus? status}) {
    return DockSlot(
      index: index,
      socketId: socketId,
      socket: socket,
      status: status ?? this.status,
    );
  }
}

class DockRegistry {
  DockRegistry({
    PlatformSocketRegistry? socketRegistry,
    PlatformSectionRegistry? sectionRegistry,
    this.maxSlots = PlatformSocketRegistry.socketCount,
  })  : socketRegistry = socketRegistry ?? PlatformSocketRegistry(),
        sectionRegistry = sectionRegistry ?? PlatformSectionRegistry();

  final int maxSlots;
  final PlatformSocketRegistry socketRegistry;
  final PlatformSectionRegistry sectionRegistry;
  final Map<String, DockSlot> _slotsBySectionId = <String, DockSlot>{};
  final Map<String, DockSlot> _slotsBySocketId = <String, DockSlot>{};

  List<DockSlot> get slots {
    return List<DockSlot>.unmodifiable(
      _slotsBySectionId.values.toList()
        ..sort((a, b) => a.index.compareTo(b.index)),
    );
  }

  bool contains(String sectionId) => _slotsBySectionId.containsKey(sectionId);

  DockSlot? slotFor(String sectionId) => _slotsBySectionId[sectionId];

  DockSlot? slotForSocket(String socketId) => _slotsBySocketId[socketId];

  DockConnectionResult connect(SectionSocket socket) {
    if (_slotsBySectionId.containsKey(socket.sectionId)) {
      return const DockConnectionResult(
        connected: false,
        reason: DockConnectionReason.duplicateSection,
      );
    }
    if (_slotsBySectionId.length >= maxSlots) {
      return const DockConnectionResult(
        connected: false,
        reason: DockConnectionReason.dockFull,
      );
    }

    final sectionDefinition =
        sectionRegistry.definitionForCode(socket.sectionCode);
    final socketId = socket.socketId ?? sectionDefinition?.defaultSocketId;
    if (socketId == null) {
      return const DockConnectionResult(
        connected: false,
        reason: DockConnectionReason.unknownSocket,
      );
    }

    final platformSocket = socketRegistry.definitionFor(socketId);
    if (platformSocket == null) {
      return const DockConnectionResult(
        connected: false,
        reason: DockConnectionReason.unknownSocket,
      );
    }
    if (platformSocket.status == PlatformSocketStatus.reserved) {
      return const DockConnectionResult(
        connected: false,
        reason: DockConnectionReason.reservedSocket,
      );
    }
    if (sectionDefinition != null &&
        sectionDefinition.defaultSocketId != socketId) {
      return const DockConnectionResult(
        connected: false,
        reason: DockConnectionReason.wrongSocket,
      );
    }
    if (_slotsBySocketId.containsKey(socketId)) {
      return const DockConnectionResult(
        connected: false,
        reason: DockConnectionReason.socketOccupied,
      );
    }

    final slot = DockSlot(
      index: platformSocket.socketNumber - 1,
      socketId: socketId,
      socket: socket,
      status: DockSlotStatus.connected,
    );
    _slotsBySectionId[socket.sectionId] = slot;
    _slotsBySocketId[socketId] = slot;
    return DockConnectionResult(
      connected: true,
      reason: DockConnectionReason.connected,
      slot: slot,
    );
  }

  bool disconnect(String sectionId) {
    final removed = _slotsBySectionId.remove(sectionId);
    if (removed == null) return false;
    _slotsBySocketId.remove(removed.socketId);
    return true;
  }

  bool setStatus(String sectionId, DockSlotStatus status) {
    final slot = _slotsBySectionId[sectionId];
    if (slot == null) return false;
    final updated = slot.copyWith(status: status);
    _slotsBySectionId[sectionId] = updated;
    _slotsBySocketId[slot.socketId] = updated;
    return true;
  }
}
