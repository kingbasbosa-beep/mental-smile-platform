import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';

void main() {
  group('Platform Socket Registry phase 3', () {
    test('contains exactly 10 fixed sockets', () {
      final registry = PlatformSocketRegistry();

      expect(registry.isValid, isTrue, reason: registry.errors.join(', '));
      expect(registry.definitions, hasLength(10));
      expect(registry.definitions.first.socketId, PlatformSocketIds.socket01);
      expect(registry.definitions.last.socketId, PlatformSocketIds.socket10);
    });

    test('connects Residential Commercial and Library sockets only', () {
      final registry = PlatformSocketRegistry();

      expect(registry.connectedSockets, hasLength(3));
      expect(
        registry.connectedSockets.map((socket) => socket.connectedSectionCode),
        containsAll(<String>{'RES', 'COM', 'LIB'}),
      );
    });

    test('keeps sockets 04 through 10 reserved', () {
      final registry = PlatformSocketRegistry();

      expect(registry.reservedSockets, hasLength(7));
      expect(
        registry.reservedSockets.map((socket) => socket.socketId),
        containsAll(<String>{
          PlatformSocketIds.socket04,
          PlatformSocketIds.socket05,
          PlatformSocketIds.socket06,
          PlatformSocketIds.socket07,
          PlatformSocketIds.socket08,
          PlatformSocketIds.socket09,
          PlatformSocketIds.socket10,
        }),
      );
    });

    test('detects duplicate socket definitions', () {
      final registry = PlatformSocketRegistry(
        definitions: const <PlatformSocketDefinition>[
          PlatformSocketDefinition(
            socketId: PlatformSocketIds.socket01,
            socketNumber: 1,
            displayName: 'First',
            status: PlatformSocketStatus.connected,
          ),
          PlatformSocketDefinition(
            socketId: PlatformSocketIds.socket01,
            socketNumber: 2,
            displayName: 'Duplicate',
            status: PlatformSocketStatus.connected,
          ),
        ],
      );

      expect(registry.isValid, isFalse);
      expect(registry.errors, contains('duplicate_socket:SOCKET_01'));
    });

    test('looks up sockets by platform socket code', () {
      final registry = PlatformSocketRegistry();
      final socket = registry.definitionFor(PlatformSocketIds.socket02);

      expect(socket, isNotNull);
      expect(socket!.displayName, 'Commercial Socket');
      expect(socket.connectedSectionCode, 'COM');
    });
  });

  group('Platform Section Registry phase 3', () {
    test('registers identity only for current sections', () {
      final registry = PlatformSectionRegistry();

      expect(registry.isValid, isTrue, reason: registry.errors.join(', '));
      expect(registry.definitions, hasLength(3));
      expect(registry.containsSectionCode('RES'), isTrue);
      expect(registry.containsSectionCode('COM'), isTrue);
      expect(registry.containsSectionCode('LIB'), isTrue);
    });

    test('detects duplicate sections', () {
      final registry = PlatformSectionRegistry(
        definitions: const <PlatformSectionDefinition>[
          PlatformSectionDefinition(
            sectionId: 'MS-SECTION-RESIDENTIAL',
            sectionCode: 'RES',
            sectionName: 'Residential',
            defaultSocketId: PlatformSocketIds.socket01,
            contractVersion: 1,
            supportedFamilies: <String>{'login'},
            environment: 'production',
          ),
          PlatformSectionDefinition(
            sectionId: 'MS-SECTION-RESIDENTIAL',
            sectionCode: 'RES_DUP',
            sectionName: 'Residential Duplicate',
            defaultSocketId: PlatformSocketIds.socket02,
            contractVersion: 1,
            supportedFamilies: <String>{'login'},
            environment: 'production',
          ),
        ],
      );

      expect(registry.isValid, isFalse);
      expect(registry.errors,
          contains('duplicate_section:MS-SECTION-RESIDENTIAL'));
    });

    test('maps official and test aliases to the same identity', () {
      final registry = PlatformSectionRegistry();

      expect(
        registry.definitionForCode('RES_TEST')!.sectionId,
        'MS-SECTION-RESIDENTIAL',
      );
      expect(
          registry.definitionForCode('RES_TEST')!.defaultSocketId, 'SOCKET_01');
    });
  });

  group('Dock Registry socket behavior', () {
    test('rejects unknown socket', () {
      final registry = DockRegistry();
      final result = registry.connect(_socket(socketId: 'SOCKET_99'));

      expect(result.connected, isFalse);
      expect(result.reason, DockConnectionReason.unknownSocket);
    });

    test('rejects reserved socket', () {
      final registry = DockRegistry();
      final result = registry.connect(
        _socket(
          sectionId: 'experimental_section',
          sectionCode: 'EXP_TEST',
          socketId: PlatformSocketIds.socket04,
        ),
      );

      expect(result.connected, isFalse);
      expect(result.reason, DockConnectionReason.reservedSocket);
    });

    test('rejects wrong socket for a registered section', () {
      final registry = DockRegistry();
      final result = registry.connect(
        _socket(socketId: PlatformSocketIds.socket02),
      );

      expect(result.connected, isFalse);
      expect(result.reason, DockConnectionReason.wrongSocket);
    });

    test('rejects a section connected to two sockets', () {
      final registry = DockRegistry();
      final first = registry.connect(_socket());
      final second = registry.connect(
        _socket(socketId: PlatformSocketIds.socket02),
      );

      expect(first.connected, isTrue);
      expect(second.connected, isFalse);
      expect(second.reason, DockConnectionReason.duplicateSection);
    });

    test('rejects occupied socket', () {
      final registry = DockRegistry();
      final first = registry.connect(
        _socket(
          sectionId: 'first_custom_section',
          sectionCode: 'FIRST_TEST',
          socketId: PlatformSocketIds.socket01,
        ),
      );
      final second = registry.connect(
        _socket(
          sectionId: 'second_custom_section',
          sectionCode: 'SECOND_TEST',
          socketId: PlatformSocketIds.socket01,
        ),
      );

      expect(first.connected, isTrue);
      expect(second.connected, isFalse);
      expect(second.reason, DockConnectionReason.socketOccupied);
    });

    test('disconnects and reconnects by the same socket', () {
      final registry = DockRegistry();
      final first = registry.connect(_socket());
      final disconnected = registry.disconnect('test_residential');
      final second = registry.connect(_socket());

      expect(first.connected, isTrue);
      expect(disconnected, isTrue);
      expect(second.connected, isTrue);
      expect(registry.slotForSocket(PlatformSocketIds.socket01), isNotNull);
    });
  });

  group('Platform Language phase 3', () {
    test(
        'validates socket, section, family, environment, and prefix consistency',
        () {
      final errors = PlatformLanguage.validate();

      expect(errors, isEmpty);
      expect(PlatformLanguage.sectionCodes,
          containsAll(<String>{'RES', 'COM', 'LIB'}));
      expect(PlatformLanguage.socketCodes, hasLength(10));
      expect(PlatformLanguage.signalFamilies, contains('login'));
      expect(PlatformLanguage.environments,
          containsAll(<String>{'test', 'production'}));
      expect(PlatformLanguage.codePrefixes,
          containsAll(<String>{'cl', 'sp', 'ct'}));
    });
  });
}

SectionSocket _socket({
  String sectionId = 'test_residential',
  String sectionCode = 'RES_TEST',
  String? socketId = PlatformSocketIds.socket01,
}) {
  return SectionSocket(
    sectionId: sectionId,
    sectionCode: sectionCode,
    contractVersion: 1,
    environment: 'test',
    allowedGates: const <String>{'login', 'logout', 'survey', 'feedback'},
    allowedCodePrefixes: const <String>{'cl', 'sp', 'ct'},
    socketId: socketId,
  );
}
