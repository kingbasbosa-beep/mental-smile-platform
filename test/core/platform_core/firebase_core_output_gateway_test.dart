import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';

void main() {
  group('FirebaseCoreOutputGateway', () {
    test('accepted test envelope writes to core_test_signal_events', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer);

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
          context: <String, Object?>{'surface': 'phase_2b_test_harness'},
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isTrue);
      expect(writer.writes, hasLength(1));
      expect(writer.writes.single.collection, 'core_test_signal_events');
    });

    test('document ID equals signalId', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer);

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
        ),
      );

      expect(writer.writes.single.documentId, result.envelope!.signalId);
      expect(writer.writes.single.data['signalId'], result.envelope!.signalId);
    });

    test('all required fields are written', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer);

      await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
          context: <String, Object?>{'surface': 'phase_2b_test_harness'},
        ),
      );

      expect(
        writer.writes.single.data.keys.toSet(),
        <String>{
          'signalId',
          'code',
          'family',
          'eventName',
          'logicalTarget',
          'sourceSectionId',
          'environment',
          'schemaVersion',
          'createdAt',
          'context',
          'source',
        },
      );
    });

    test('source is fixed to central_platform_core_phase_2b', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer);

      await core.emit(
        const CoreSignalRequest(sectionId: 'test_residential', code: 'cl001bt'),
      );

      expect(
        writer.writes.single.data['source'],
        'central_platform_core_phase_2b',
      );
    });

    test('test environment is accepted', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer);

      final result = await core.emit(
        const CoreSignalRequest(sectionId: 'test_residential', code: 'cl001bt'),
      );

      expect(result.accepted, isTrue);
      expect(writer.writes.single.data['environment'], 'test');
    });

    test('production environment is rejected by gateway', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = PlatformCore(
        codeRegistry: CoreCodeRegistry(<CoreCodeDefinition>[
          const CoreCodeDefinition(
            code: 'cl001bt',
            family: 'login',
            eventName: 'client_login_entry_tap',
            logicalTarget: 'login',
            allowedSections: <String>{'RES_TEST'},
            enabled: true,
            environment: 'production',
            schemaVersion: 1,
            description: 'Production rejection test.',
          ),
        ]),
        outputGateway: FirebaseCoreOutputGateway(writer: writer),
      )..connectSection(
          const SectionSocket(
            sectionId: 'test_residential',
            sectionCode: 'RES_TEST',
            contractVersion: 1,
            environment: 'production',
            allowedGates: <String>{'login'},
            allowedCodePrefixes: <String>{'cl'},
          ),
        );

      final result = await core.emit(
        const CoreSignalRequest(sectionId: 'test_residential', code: 'cl001bt'),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isFalse);
      expect(result.reason, CoreEmitReason.gatewayFailure);
      expect(writer.writes, isEmpty);
    });

    test('unsafe context is rejected before write', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer);

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
          context: <String, Object?>{'token': 'secret'},
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.invalidContext);
      expect(writer.writes, isEmpty);
    });

    test('writer exception remains fail-soft', () async {
      final writer = _FakeCoreFirestoreWriter(shouldThrow: true);
      final core = _coreWithFirebaseGateway(writer);

      final result = await core.emit(
        const CoreSignalRequest(sectionId: 'test_residential', code: 'cl001bt'),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isFalse);
      expect(result.reason, CoreEmitReason.gatewayFailure);
    });

    test('rejected code never calls Firestore writer', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer);

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'unknown01',
        ),
      );

      expect(result.accepted, isFalse);
      expect(writer.writes, isEmpty);
    });

    test('wrong section never calls Firestore writer', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _coreWithFirebaseGateway(writer)
        ..connectSection(
          const SectionSocket(
            sectionId: 'test_library',
            sectionCode: 'LIB_TEST',
            contractVersion: 1,
            environment: 'test',
            allowedGates: <String>{'login'},
            allowedCodePrefixes: <String>{'cl'},
          ),
        );

      final result = await core.emit(
        const CoreSignalRequest(sectionId: 'test_library', code: 'cl001bt'),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.sectionNotAllowed);
      expect(writer.writes, isEmpty);
    });

    test('memory and noop gateways still work', () async {
      final memory = MemoryCoreOutputGateway();
      final memoryCore = PlatformCore(outputGateway: memory)
        ..connectSection(_fakeSocket());
      final noopCore =
          PlatformCore(outputGateway: const NoopCoreOutputGateway())
            ..connectSection(_fakeSocket());

      final memoryResult = await memoryCore.emit(
        const CoreSignalRequest(sectionId: 'test_residential', code: 'cl001bt'),
      );
      final noopResult = await noopCore.emit(
        const CoreSignalRequest(sectionId: 'test_residential', code: 'cl001bt'),
      );

      expect(memoryResult.outputDelivered, isTrue);
      expect(noopResult.outputDelivered, isTrue);
      expect(memory.envelopes, hasLength(1));
    });
  });
}

PlatformCore _coreWithFirebaseGateway(_FakeCoreFirestoreWriter writer) {
  return PlatformCore(outputGateway: FirebaseCoreOutputGateway(writer: writer))
    ..connectSection(_fakeSocket());
}

SectionSocket _fakeSocket() {
  return const SectionSocket(
    sectionId: 'test_residential',
    sectionCode: 'RES_TEST',
    contractVersion: 1,
    environment: 'test',
    allowedGates: <String>{'login', 'logout', 'survey', 'feedback'},
    allowedCodePrefixes: <String>{'cl'},
  );
}

class _FakeCoreFirestoreWriter implements CoreFirestoreWriter {
  _FakeCoreFirestoreWriter({this.shouldThrow = false});

  final bool shouldThrow;
  final List<_FakeWrite> writes = <_FakeWrite>[];

  @override
  Future<void> write({
    required String collection,
    required String documentId,
    required Map<String, Object?> data,
  }) async {
    if (shouldThrow) {
      throw StateError('fake writer failure');
    }
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
