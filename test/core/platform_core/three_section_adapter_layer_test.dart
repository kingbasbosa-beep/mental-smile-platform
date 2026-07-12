import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/commercial/platform_core/commercial_section_adapter.dart';
import 'package:mental_smile_os/features/library/platform_core/library_section_adapter.dart';
import 'package:mental_smile_os/features/residential/platform_core/residential_section_adapter.dart';

void main() {
  group('ResidentialSectionAdapter phase 4B', () {
    test('creates valid socket', () {
      const adapter = ResidentialSectionAdapter();
      final socket = adapter.createSocket();

      expect(socket.sectionId, ResidentialSectionAdapter.sectionId);
      expect(socket.sectionCode, 'RES');
      expect(socket.socketId, PlatformSocketIds.socket01);
      expect(socket.environment, 'test');
      expect(
        socket.allowedGates,
        <String>{'login', 'logout', 'survey', 'feedback'},
      );
      expect(socket.allowedCodePrefixes, <String>{'cl'});
    });

    test('test code is accepted and other adapter codes are rejected',
        () async {
      final gateway = MemoryCoreOutputGateway();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(const ResidentialSectionAdapter().createSocket());

      final accepted = await core.emit(
        const CoreSignalRequest(
          sectionId: ResidentialSectionAdapter.sectionId,
          code: ResidentialSectionAdapter.testCode,
        ),
      );
      final commercialCode = await core.emit(
        const CoreSignalRequest(
          sectionId: ResidentialSectionAdapter.sectionId,
          code: CommercialSectionAdapter.testCode,
        ),
      );
      final libraryCode = await core.emit(
        const CoreSignalRequest(
          sectionId: ResidentialSectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
        ),
      );

      expect(accepted.accepted, isTrue);
      expect(accepted.envelope!.sourceSectionId,
          ResidentialSectionAdapter.sectionId);
      expect(commercialCode.accepted, isFalse);
      expect(libraryCode.accepted, isFalse);
      expect(gateway.envelopes, hasLength(1));
    });
  });

  group('CommercialSectionAdapter phase 4B', () {
    test('creates valid socket', () {
      const adapter = CommercialSectionAdapter();
      final socket = adapter.createSocket();

      expect(socket.sectionId, CommercialSectionAdapter.sectionId);
      expect(socket.sectionCode, 'COM');
      expect(socket.socketId, PlatformSocketIds.socket02);
      expect(socket.environment, 'test');
      expect(
        socket.allowedGates,
        <String>{'login', 'logout', 'survey', 'feedback', 'application'},
      );
      expect(socket.allowedCodePrefixes, <String>{'sp', 'ct', 'cm'});
    });

    test('test code is accepted and other adapter codes are rejected',
        () async {
      final gateway = MemoryCoreOutputGateway();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(const CommercialSectionAdapter().createSocket());

      final accepted = await core.emit(
        const CoreSignalRequest(
          sectionId: CommercialSectionAdapter.sectionId,
          code: CommercialSectionAdapter.testCode,
        ),
      );
      final residentialCode = await core.emit(
        const CoreSignalRequest(
          sectionId: CommercialSectionAdapter.sectionId,
          code: ResidentialSectionAdapter.testCode,
        ),
      );
      final libraryCode = await core.emit(
        const CoreSignalRequest(
          sectionId: CommercialSectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
        ),
      );

      expect(accepted.accepted, isTrue);
      expect(accepted.envelope!.sourceSectionId,
          CommercialSectionAdapter.sectionId);
      expect(residentialCode.accepted, isFalse);
      expect(libraryCode.accepted, isFalse);
      expect(gateway.envelopes, hasLength(1));
    });
  });

  group('Library adapter compatibility phase 4B', () {
    test('remains valid on SOCKET_03 and accepts lb001bt', () async {
      final gateway = MemoryCoreOutputGateway();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(const LibrarySectionAdapter().createSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.envelope!.sourceSectionId, LibrarySectionAdapter.sectionId);
      expect(
          const LibrarySectionAdapter().createSocket().socketId, 'SOCKET_03');
    });
  });

  group('PlatformAdapterRegistry phase 4B', () {
    test('registers all three adapters without collisions', () {
      final registry = _threeAdapterRegistry();

      expect(registry.length, 3);
      expect(registry.adapterForSectionCode('RES'), isNotNull);
      expect(registry.adapterForSectionCode('COM'), isNotNull);
      expect(registry.adapterForSectionCode('LIB'), isNotNull);
      expect(
          registry.createSockets().map((socket) => socket.socketId).toSet(), {
        PlatformSocketIds.socket01,
        PlatformSocketIds.socket02,
        PlatformSocketIds.socket03,
      });
    });

    test('rejects duplicate section IDs and socket claims', () {
      final registry = PlatformAdapterRegistry();
      final first = registry.register(const ResidentialSectionAdapter());
      final duplicateSection =
          registry.register(const ResidentialSectionAdapter());
      final duplicateSocket = registry.register(
        const CommercialSectionAdapter(socketId: PlatformSocketIds.socket01),
      );

      expect(first.registered, isTrue);
      expect(duplicateSection.registered, isFalse);
      expect(
        duplicateSection.reason,
        PlatformAdapterRegistrationReason.duplicateSectionId,
      );
      expect(duplicateSocket.registered, isFalse);
      expect(duplicateSocket.reason,
          PlatformAdapterRegistrationReason.wrongSocket);
    });

    test('rejects wrong socket declarations', () {
      final registry = PlatformAdapterRegistry();
      final residential = registry.register(
        const ResidentialSectionAdapter(socketId: PlatformSocketIds.socket02),
      );
      final commercial = registry.register(
        const CommercialSectionAdapter(socketId: PlatformSocketIds.socket01),
      );

      expect(residential.registered, isFalse);
      expect(residential.reason, PlatformAdapterRegistrationReason.wrongSocket);
      expect(commercial.registered, isFalse);
      expect(commercial.reason, PlatformAdapterRegistrationReason.wrongSocket);
    });
  });

  group('Three-section simultaneous connection phase 4B', () {
    test('connects three adapters and keeps reserved sockets free', () {
      final dock = DockRegistry();
      final registry = _threeAdapterRegistry();

      final results = <DockConnectionResult>[
        for (final socket in registry.createSockets()) dock.connect(socket),
      ];

      expect(results.every((result) => result.connected), isTrue);
      expect(dock.slots, hasLength(3));
      expect(dock.slotForSocket(PlatformSocketIds.socket01), isNotNull);
      expect(dock.slotForSocket(PlatformSocketIds.socket02), isNotNull);
      expect(dock.slotForSocket(PlatformSocketIds.socket03), isNotNull);
      expect(dock.socketRegistry.reservedSockets, hasLength(7));
    });

    test('disconnects and reconnects Commercial without affecting others', () {
      final dock = DockRegistry();
      final registry = _threeAdapterRegistry();
      for (final socket in registry.createSockets()) {
        dock.connect(socket);
      }

      final disconnected = dock.disconnect(CommercialSectionAdapter.sectionId);
      final reconnected = dock.connect(
        const CommercialSectionAdapter().createSocket(),
      );

      expect(disconnected, isTrue);
      expect(reconnected.connected, isTrue);
      expect(dock.slotFor(ResidentialSectionAdapter.sectionId), isNotNull);
      expect(dock.slotFor(LibrarySectionAdapter.sectionId), isNotNull);
      expect(dock.slotFor(CommercialSectionAdapter.sectionId), isNotNull);
    });
  });

  group('Three-section signal delivery phase 4B', () {
    test('accepted envelopes have correct source section IDs', () async {
      final gateway = MemoryCoreOutputGateway();
      final core = _coreWithThreeAdapters(outputGateway: gateway);

      final residential = await core.emit(
        const CoreSignalRequest(
          sectionId: ResidentialSectionAdapter.sectionId,
          code: ResidentialSectionAdapter.testCode,
        ),
      );
      final commercial = await core.emit(
        const CoreSignalRequest(
          sectionId: CommercialSectionAdapter.sectionId,
          code: CommercialSectionAdapter.testCode,
        ),
      );
      final library = await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
        ),
      );

      expect(residential.envelope!.sourceSectionId,
          ResidentialSectionAdapter.sectionId);
      expect(commercial.envelope!.sourceSectionId,
          CommercialSectionAdapter.sectionId);
      expect(
          library.envelope!.sourceSectionId, LibrarySectionAdapter.sectionId);
      expect(gateway.envelopes, hasLength(3));
    });

    test('fake Firestore writer receives correct logical target', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithThreeAdapters(
        outputGateway: FirebaseCoreOutputGateway(writer: writer),
      );

      await core.emit(
        const CoreSignalRequest(
          sectionId: ResidentialSectionAdapter.sectionId,
          code: ResidentialSectionAdapter.testCode,
          context: <String, Object?>{'surface': 'residential_adapter_probe'},
        ),
      );
      await core.emit(
        const CoreSignalRequest(
          sectionId: CommercialSectionAdapter.sectionId,
          code: CommercialSectionAdapter.testCode,
          context: <String, Object?>{'surface': 'commercial_adapter_probe'},
        ),
      );
      await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
          context: <String, Object?>{'surface': 'library_adapter_probe'},
        ),
      );

      expect(writer.writes, hasLength(3));
      expect(
        writer.writes.map((write) => write.data['logicalTarget']).toSet(),
        <Object?>{'feedback'},
      );
      expect(
        writer.writes.map((write) => write.data['sourceSectionId']).toSet(),
        <Object?>{
          ResidentialSectionAdapter.sectionId,
          CommercialSectionAdapter.sectionId,
          LibrarySectionAdapter.sectionId,
        },
      );
    });

    test('wrong section and unknown code never call writer', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithThreeAdapters(
        outputGateway: FirebaseCoreOutputGateway(writer: writer),
      );

      final wrongSection = await core.emit(
        const CoreSignalRequest(
          sectionId: ResidentialSectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
        ),
      );
      final unknownCode = await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: 'lb999bt',
        ),
      );

      expect(wrongSection.accepted, isFalse);
      expect(unknownCode.accepted, isFalse);
      expect(writer.writes, isEmpty);
    });

    test('gateway failure remains fail-soft', () async {
      final core = _coreWithThreeAdapters(outputGateway: _FailingGateway());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: CommercialSectionAdapter.sectionId,
          code: CommercialSectionAdapter.testCode,
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isFalse);
      expect(result.reason, CoreEmitReason.gatewayFailure);
      expect(result.envelope, isNotNull);
    });
  });

  group('Dictionary and language phase 4B', () {
    test('dictionary and language validate after adapter code additions', () {
      final dictionary = PlatformDictionaryV1.validate();
      final language = PlatformLanguage.validate();

      expect(dictionary.isValid, isTrue, reason: dictionary.errors.join(', '));
      expect(language, isEmpty);
      expect(PlatformDictionaryV1.definitions, hasLength(13));
      expect(PlatformDictionaryV1.definitions.length, lessThanOrEqualTo(15));
      expect(PlatformLanguage.sectionCodes, <String>{'RES', 'COM', 'LIB'});
      expect(PlatformLanguage.adapterTestPrefixes, <String>{'cl', 'cm', 'lb'});
    });

    test('contains no forbidden internal sections', () {
      const forbidden = <String>{
        'OWN',
        'ADMIN',
        'ARCHIVE',
        'MARKETING',
        'MONITORING',
      };

      expect(PlatformLanguage.sectionCodes.intersection(forbidden), isEmpty);
    });
  });
}

PlatformAdapterRegistry _threeAdapterRegistry() {
  return PlatformAdapterRegistry()
    ..register(const ResidentialSectionAdapter())
    ..register(const CommercialSectionAdapter())
    ..register(const LibrarySectionAdapter());
}

PlatformCore _coreWithThreeAdapters(
    {required CoreOutputGateway outputGateway}) {
  final registry = _threeAdapterRegistry();
  final core = PlatformCore(outputGateway: outputGateway);
  for (final socket in registry.createSockets()) {
    core.connectSection(socket);
  }
  return core;
}

class _FakeCoreFirestoreWriter implements CoreFirestoreWriter {
  final List<_FakeWrite> writes = <_FakeWrite>[];

  @override
  Future<void> write({
    required String collection,
    required String documentId,
    required Map<String, Object?> data,
  }) async {
    writes.add(
      _FakeWrite(
        collection: collection,
        documentId: documentId,
        data: data,
      ),
    );
  }
}

class _FakeWrite {
  const _FakeWrite({
    required this.collection,
    required this.documentId,
    required this.data,
  });

  final String collection;
  final String documentId;
  final Map<String, Object?> data;
}

class _FailingGateway implements CoreOutputGateway {
  @override
  Future<void> emit(CoreSignalEnvelope envelope) {
    throw StateError('gateway unavailable');
  }
}
