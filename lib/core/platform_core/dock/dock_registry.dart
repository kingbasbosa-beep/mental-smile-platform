import '../contracts/section_socket.dart';

enum DockSlotStatus { empty, connected, active, disabled }

enum DockConnectionReason { connected, duplicateSection, dockFull }

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
    required this.socket,
    required this.status,
  });

  final int index;
  final SectionSocket socket;
  final DockSlotStatus status;

  DockSlot copyWith({DockSlotStatus? status}) {
    return DockSlot(
      index: index,
      socket: socket,
      status: status ?? this.status,
    );
  }
}

class DockRegistry {
  DockRegistry({this.maxSlots = 10});

  final int maxSlots;
  final Map<String, DockSlot> _slotsBySectionId = <String, DockSlot>{};

  List<DockSlot> get slots {
    return List<DockSlot>.unmodifiable(
      _slotsBySectionId.values.toList()
        ..sort((a, b) => a.index.compareTo(b.index)),
    );
  }

  bool contains(String sectionId) => _slotsBySectionId.containsKey(sectionId);

  DockSlot? slotFor(String sectionId) => _slotsBySectionId[sectionId];

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

    final slot = DockSlot(
      index: _nextIndex(),
      socket: socket,
      status: DockSlotStatus.connected,
    );
    _slotsBySectionId[socket.sectionId] = slot;
    return DockConnectionResult(
      connected: true,
      reason: DockConnectionReason.connected,
      slot: slot,
    );
  }

  bool disconnect(String sectionId) {
    return _slotsBySectionId.remove(sectionId) != null;
  }

  bool setStatus(String sectionId, DockSlotStatus status) {
    final slot = _slotsBySectionId[sectionId];
    if (slot == null) return false;
    _slotsBySectionId[sectionId] = slot.copyWith(status: status);
    return true;
  }

  int _nextIndex() {
    if (_slotsBySectionId.isEmpty) return 0;
    return _slotsBySectionId.values
            .map((slot) => slot.index)
            .reduce((a, b) => a > b ? a : b) +
        1;
  }
}
