import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';

void main() {
  group('ProductionFirebaseCoreOutputGateway', () {
    test('maps each production family to its final collection', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _productionCore(writer);

      await core.emit(
        const CoreSignalRequest(
          sectionId: 'residential',
          code: 'cl016bt',
        ),
      );
      await core.emit(
        const CoreSignalRequest(
          sectionId: 'residential',
          code: 'cl012sb',
        ),
      );
      await core.emit(
        const CoreSignalRequest(
          sectionId: 'residential',
          code: 'cl014sb',
        ),
      );
      await core.emit(
        const CoreSignalRequest(
          sectionId: 'commercial',
          code: 'sp010bt',
        ),
      );
      await core.emit(
        const CoreSignalRequest(
          sectionId: 'commercial',
          code: 'sp014sb',
        ),
      );

      expect(
        writer.writes.map((write) => write.collection),
        <String>[
          ProductionSignalCollections.logout,
          ProductionSignalCollections.survey,
          ProductionSignalCollections.feedback,
          ProductionSignalCollections.login,
          ProductionSignalCollections.application,
        ],
      );
    });

    test('writes production document shape and source', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _productionCore(writer);

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'residential',
          code: 'cl014sb',
          context: <String, Object?>{
            'surface': 'client_suggestion',
            'formType': 'suggestion',
            'status': 'submitted',
          },
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isTrue);
      expect(writer.writes.single.documentId, result.envelope!.signalId);
      expect(writer.writes.single.data.keys.toSet(), <String>{
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
      });
      expect(writer.writes.single.data['environment'], 'production');
      expect(writer.writes.single.data['source'], 'central_platform_core');
    });

    test('probe-only test code is rejected before writer', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = _productionCore(writer);

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'residential',
          code: 'cl006bt',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.environmentMismatch);
      expect(writer.writes, isEmpty);
    });

    test('unknown target is rejected by gateway fail-soft', () async {
      final writer = _FakeCoreFirestoreWriter();
      final core = PlatformCore(
        codeRegistry: CoreCodeRegistry(<CoreCodeDefinition>[
          const CoreCodeDefinition(
            code: 'zz001bt',
            family: 'unknown',
            eventName: 'unknown_target',
            logicalTarget: 'unknown',
            allowedSections: <String>{'RES'},
            enabled: true,
            environment: 'production',
            schemaVersion: 1,
            description: 'Unknown production target test.',
            usage: 'runtime',
          ),
        ]),
        outputGateway: ProductionFirebaseCoreOutputGateway(writer: writer),
      )..connectSection(
          const SectionSocket(
            sectionId: 'residential',
            sectionCode: 'RES',
            contractVersion: 1,
            environment: 'production',
            allowedGates: <String>{'unknown'},
            allowedCodePrefixes: <String>{'zz'},
          ),
        );

      final result = await core.emit(
        const CoreSignalRequest(sectionId: 'residential', code: 'zz001bt'),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isFalse);
      expect(result.reason, CoreEmitReason.gatewayFailure);
      expect(writer.writes, isEmpty);
    });

    test('writer exception remains fail-soft', () async {
      final writer = _FakeCoreFirestoreWriter(shouldThrow: true);
      final core = _productionCore(writer);

      final result = await core.emit(
        const CoreSignalRequest(sectionId: 'commercial', code: 'ct014sb'),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isFalse);
      expect(result.reason, CoreEmitReason.gatewayFailure);
    });
  });
}

PlatformCore _productionCore(_FakeCoreFirestoreWriter writer) {
  return PlatformCore(
    outputGateway: ProductionFirebaseCoreOutputGateway(writer: writer),
  )
    ..connectSection(_productionResidentialSocket())
    ..connectSection(_productionCommercialSocket());
}

SectionSocket _productionResidentialSocket() {
  return const SectionSocket(
    sectionId: 'residential',
    sectionCode: 'RES',
    contractVersion: 1,
    environment: 'production',
    allowedGates: <String>{'login', 'logout', 'survey', 'feedback'},
    allowedCodePrefixes: <String>{'cl'},
  );
}

SectionSocket _productionCommercialSocket() {
  return const SectionSocket(
    sectionId: 'commercial',
    sectionCode: 'COM',
    contractVersion: 1,
    environment: 'production',
    allowedGates: <String>{
      'login',
      'logout',
      'survey',
      'feedback',
      'application'
    },
    allowedCodePrefixes: <String>{'sp', 'ct', 'cm'},
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
