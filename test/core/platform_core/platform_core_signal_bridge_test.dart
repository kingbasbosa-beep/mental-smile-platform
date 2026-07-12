import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/commercial/platform_core/commercial_section_adapter.dart';
import 'package:mental_smile_os/features/residential/platform_core/residential_section_adapter.dart';

void main() {
  group('PlatformCoreSignalBridge phase 5', () {
    test('accepted signal writes correct document through fake writer',
        () async {
      final writer = _FakeCoreFirestoreWriter();
      final bridge = PlatformCoreSignalBridge(
        adapter: const ResidentialSectionAdapter(),
        outputGateway: FirebaseCoreOutputGateway(writer: writer),
      );

      final result = await bridge.emit(
        code: 'cl012sb',
        context: const <String, Object?>{
          'surface': 'client_checkin',
          'formType': 'checkin',
          'status': 'submitted',
        },
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isTrue);
      expect(writer.writes, hasLength(1));
      expect(writer.writes.single.data['code'], 'cl012sb');
      expect(
        writer.writes.single.data['sourceSectionId'],
        ResidentialSectionAdapter.sectionId,
      );
      expect(
        writer.writes.single.data['context'],
        <String, Object?>{
          'surface': 'client_checkin',
          'formType': 'checkin',
          'status': 'submitted',
        },
      );
    });

    test('wrong section never reaches writer', () async {
      final writer = _FakeCoreFirestoreWriter();
      final bridge = PlatformCoreSignalBridge(
        adapter: const ResidentialSectionAdapter(),
        outputGateway: FirebaseCoreOutputGateway(writer: writer),
      );

      final result = await bridge.emit(
        code: 'sp010bt',
        context: const <String, Object?>{
          'surface': 'specialist_login',
          'actorType': 'specialist',
          'status': 'success',
        },
      );

      expect(result.accepted, isFalse);
      expect(writer.writes, isEmpty);
    });

    test('unknown code never reaches writer', () async {
      final writer = _FakeCoreFirestoreWriter();
      final bridge = PlatformCoreSignalBridge(
        adapter: const CommercialSectionAdapter(),
        outputGateway: FirebaseCoreOutputGateway(writer: writer),
      );

      final result = await bridge.emit(
        code: 'sp999bt',
        context: const <String, Object?>{
          'surface': 'specialist_login',
          'actorType': 'specialist',
          'status': 'success',
        },
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.unknownCode);
      expect(writer.writes, isEmpty);
    });

    test('gateway exception remains fail-soft', () async {
      final bridge = PlatformCoreSignalBridge(
        adapter: const CommercialSectionAdapter(),
        outputGateway: _FailingGateway(),
      );

      final result = await bridge.emit(
        code: 'ct010bt',
        context: const <String, Object?>{
          'surface': 'center_login',
          'actorType': 'center',
          'status': 'success',
        },
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isFalse);
      expect(result.reason, CoreEmitReason.gatewayFailure);
      expect(result.envelope, isNotNull);
    });

    test('approved metadata is accepted', () async {
      final bridge = PlatformCoreSignalBridge(
        adapter: const CommercialSectionAdapter(),
        outputGateway: MemoryCoreOutputGateway(),
      );

      final result = await bridge.emit(
        code: 'sp014sb',
        context: const <String, Object?>{
          'surface': 'specialist_application',
          'actorType': 'specialist',
          'formType': 'application',
          'status': 'submitted',
          'submissionStatus': 'submitted',
          'actionType': 'application',
        },
      );

      expect(result.accepted, isTrue);
    });

    test('privacy context rejects PII and content keys', () async {
      const blockedContexts = <Map<String, Object?>>[
        <String, Object?>{'email': 'person@example.com'},
        <String, Object?>{'phone': '123'},
        <String, Object?>{'uid': 'abc'},
        <String, Object?>{'password': 'secret'},
        <String, Object?>{'note': 'private note'},
        <String, Object?>{'text': 'full text'},
        <String, Object?>{'image': 'image.png'},
        <String, Object?>{'file': 'file.pdf'},
      ];

      for (final context in blockedContexts) {
        final writer = _FakeCoreFirestoreWriter();
        final bridge = PlatformCoreSignalBridge(
          adapter: const ResidentialSectionAdapter(),
          outputGateway: FirebaseCoreOutputGateway(writer: writer),
        );

        final result = await bridge.emit(code: 'cl014sb', context: context);

        expect(result.accepted, isFalse, reason: context.keys.single);
        expect(result.reason, CoreEmitReason.invalidContext);
        expect(writer.writes, isEmpty);
      }
    });
  });
}

class _FakeCoreFirestoreWriter implements CoreFirestoreWriter {
  final List<_FakeWrite> writes = <_FakeWrite>[];

  @override
  Future<void> write({
    required String collection,
    required String documentId,
    required Map<String, Object?> data,
  }) async {
    writes.add(_FakeWrite(collection: collection, data: data));
  }
}

class _FakeWrite {
  const _FakeWrite({required this.collection, required this.data});

  final String collection;
  final Map<String, Object?> data;
}

class _FailingGateway implements CoreOutputGateway {
  @override
  Future<void> emit(CoreSignalEnvelope envelope) {
    throw StateError('gateway unavailable');
  }
}
