class PlatformSocketIds {
  const PlatformSocketIds._();

  static const String socket01 = 'SOCKET_01';
  static const String socket02 = 'SOCKET_02';
  static const String socket03 = 'SOCKET_03';
  static const String socket04 = 'SOCKET_04';
  static const String socket05 = 'SOCKET_05';
  static const String socket06 = 'SOCKET_06';
  static const String socket07 = 'SOCKET_07';
  static const String socket08 = 'SOCKET_08';
  static const String socket09 = 'SOCKET_09';
  static const String socket10 = 'SOCKET_10';

  static const List<String> all = <String>[
    socket01,
    socket02,
    socket03,
    socket04,
    socket05,
    socket06,
    socket07,
    socket08,
    socket09,
    socket10,
  ];
}

enum PlatformSocketStatus { connected, reserved }

class PlatformSocketDefinition {
  const PlatformSocketDefinition({
    required this.socketId,
    required this.socketNumber,
    required this.displayName,
    required this.status,
    this.connectedSectionId,
    this.connectedSectionCode,
    this.contractVersion,
  });

  final String socketId;
  final int socketNumber;
  final String displayName;
  final PlatformSocketStatus status;
  final String? connectedSectionId;
  final String? connectedSectionCode;
  final int? contractVersion;
}

class PlatformSocketRegistry {
  PlatformSocketRegistry({
    Iterable<PlatformSocketDefinition> definitions = phase3Definitions,
  }) {
    final socketNumbers = <int>{};
    for (final definition in definitions) {
      if (_definitionsById.containsKey(definition.socketId)) {
        _errors.add('duplicate_socket:${definition.socketId}');
        continue;
      }
      if (!socketNumbers.add(definition.socketNumber)) {
        _errors.add('duplicate_socket_number:${definition.socketNumber}');
        continue;
      }
      _definitionsById[definition.socketId] = definition;
    }
  }

  static const int socketCount = 10;

  static const List<PlatformSocketDefinition> phase3Definitions =
      <PlatformSocketDefinition>[
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket01,
      socketNumber: 1,
      displayName: 'Residential Socket',
      status: PlatformSocketStatus.connected,
      connectedSectionId: 'MS-SECTION-RESIDENTIAL',
      connectedSectionCode: 'RES',
      contractVersion: 1,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket02,
      socketNumber: 2,
      displayName: 'Commercial Socket',
      status: PlatformSocketStatus.connected,
      connectedSectionId: 'MS-SECTION-COMMERCIAL',
      connectedSectionCode: 'COM',
      contractVersion: 1,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket03,
      socketNumber: 3,
      displayName: 'Library Socket',
      status: PlatformSocketStatus.connected,
      connectedSectionId: 'MS-SECTION-LIBRARY',
      connectedSectionCode: 'LIB',
      contractVersion: 1,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket04,
      socketNumber: 4,
      displayName: 'Reserved Socket 04',
      status: PlatformSocketStatus.reserved,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket05,
      socketNumber: 5,
      displayName: 'Reserved Socket 05',
      status: PlatformSocketStatus.reserved,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket06,
      socketNumber: 6,
      displayName: 'Reserved Socket 06',
      status: PlatformSocketStatus.reserved,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket07,
      socketNumber: 7,
      displayName: 'Reserved Socket 07',
      status: PlatformSocketStatus.reserved,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket08,
      socketNumber: 8,
      displayName: 'Reserved Socket 08',
      status: PlatformSocketStatus.reserved,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket09,
      socketNumber: 9,
      displayName: 'Reserved Socket 09',
      status: PlatformSocketStatus.reserved,
    ),
    PlatformSocketDefinition(
      socketId: PlatformSocketIds.socket10,
      socketNumber: 10,
      displayName: 'Reserved Socket 10',
      status: PlatformSocketStatus.reserved,
    ),
  ];

  final Map<String, PlatformSocketDefinition> _definitionsById =
      <String, PlatformSocketDefinition>{};
  final List<String> _errors = <String>[];

  List<String> get errors => List<String>.unmodifiable(_errors);

  bool get isValid {
    return _errors.isEmpty && _definitionsById.length == socketCount;
  }

  List<PlatformSocketDefinition> get definitions {
    return List<PlatformSocketDefinition>.unmodifiable(
      _definitionsById.values.toList()
        ..sort((a, b) => a.socketNumber.compareTo(b.socketNumber)),
    );
  }

  List<PlatformSocketDefinition> get connectedSockets {
    return definitions
        .where(
            (definition) => definition.status == PlatformSocketStatus.connected)
        .toList(growable: false);
  }

  List<PlatformSocketDefinition> get reservedSockets {
    return definitions
        .where(
            (definition) => definition.status == PlatformSocketStatus.reserved)
        .toList(growable: false);
  }

  bool contains(String socketId) => _definitionsById.containsKey(socketId);

  PlatformSocketDefinition? definitionFor(String socketId) {
    return _definitionsById[socketId];
  }
}
