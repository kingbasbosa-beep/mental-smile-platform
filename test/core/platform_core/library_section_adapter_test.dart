import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/library/platform_core/library_section_adapter.dart';

void main() {
  group('LibrarySectionAdapter phase 4A', () {
    test('creates valid Library SectionSocket identity', () {
      const adapter = LibrarySectionAdapter();
      final socket = adapter.createSocket();

      expect(socket.sectionId, LibrarySectionAdapter.sectionId);
      expect(socket.sectionCode, 'LIB');
      expect(socket.socketId, PlatformSocketIds.socket03);
      expect(socket.contractVersion, 1);
      expect(socket.environment, 'test');
      expect(socket.allowedGates, <String>{'feedback'});
      expect(socket.allowedCodePrefixes, <String>{'lb'});
    });

    test('connects successfully to SOCKET_03', () {
      final dock = DockRegistry();
      const adapter = LibrarySectionAdapter();

      final result = dock.connect(adapter.createSocket());

      expect(result.connected, isTrue);
      expect(result.reason, DockConnectionReason.connected);
      expect(result.slot!.socketId, PlatformSocketIds.socket03);
    });

    test('is rejected from SOCKET_01', () {
      final dock = DockRegistry();
      const adapter =
          LibrarySectionAdapter(socketId: PlatformSocketIds.socket01);

      final result = dock.connect(adapter.createSocket());

      expect(result.connected, isFalse);
      expect(result.reason, DockConnectionReason.wrongSocket);
    });

    test('is rejected from SOCKET_02', () {
      final dock = DockRegistry();
      const adapter =
          LibrarySectionAdapter(socketId: PlatformSocketIds.socket02);

      final result = dock.connect(adapter.createSocket());

      expect(result.connected, isFalse);
      expect(result.reason, DockConnectionReason.wrongSocket);
    });

    test('duplicate Library connection is rejected', () {
      final dock = DockRegistry();
      const adapter = LibrarySectionAdapter();

      final first = dock.connect(adapter.createSocket());
      final second = dock.connect(adapter.createSocket());

      expect(first.connected, isTrue);
      expect(second.connected, isFalse);
      expect(second.reason, DockConnectionReason.duplicateSection);
    });

    test('lb001bt is accepted from Library adapter', () async {
      final gateway = MemoryCoreOutputGateway();
      const adapter = LibrarySectionAdapter();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(adapter.createSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
          context: <String, Object?>{
            'surface': 'library_phase_4a_adapter_probe',
          },
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isTrue);
      expect(result.envelope!.sourceSectionId, LibrarySectionAdapter.sectionId);
      expect(result.envelope!.code, 'lb001bt');
      expect(gateway.envelopes, hasLength(1));
    });

    test('lb001bt is rejected from Residential fake section', () async {
      final gateway = MemoryCoreOutputGateway();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(_residentialSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: LibrarySectionAdapter.testCode,
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.sectionNotAllowed);
      expect(gateway.envelopes, isEmpty);
    });

    test('wrong Library code is rejected', () async {
      final gateway = MemoryCoreOutputGateway();
      const adapter = LibrarySectionAdapter();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(adapter.createSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: 'lb999bt',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.unknownCode);
      expect(gateway.envelopes, isEmpty);
    });

    test('Firebase fake writer receives correct Library document', () async {
      final writer = _FakeCoreFirestoreWriter();
      const adapter = LibrarySectionAdapter();
      final core = PlatformCore(
        outputGateway: FirebaseCoreOutputGateway(writer: writer),
      )..connectSection(adapter.createSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
          context: <String, Object?>{
            'surface': 'library_phase_4a_adapter_probe',
          },
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isTrue);
      expect(writer.writes, hasLength(1));
      expect(writer.writes.single.collection, 'core_test_signal_events');
      expect(writer.writes.single.documentId, result.envelope!.signalId);
      expect(writer.writes.single.data['code'], 'lb001bt');
      expect(writer.writes.single.data['eventName'], 'library_test_entry_tap');
      expect(writer.writes.single.data['family'], 'feedback');
      expect(writer.writes.single.data['logicalTarget'], 'feedback');
      expect(
        writer.writes.single.data['sourceSectionId'],
        LibrarySectionAdapter.sectionId,
      );
      expect(writer.writes.single.data['environment'], 'test');
      expect(
        writer.writes.single.data['context'],
        <String, Object?>{'surface': 'library_phase_4a_adapter_probe'},
      );
    });
  });
}

SectionSocket _residentialSocket() {
  return const SectionSocket(
    sectionId: 'test_residential',
    sectionCode: 'RES_TEST',
    contractVersion: 1,
    environment: 'test',
    allowedGates: <String>{'feedback'},
    allowedCodePrefixes: <String>{'lb'},
    socketId: PlatformSocketIds.socket01,
  );
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
