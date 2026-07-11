import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';

void main() {
  group('Central Platform Core phase 1', () {
    late MemoryCoreOutputGateway memoryGateway;
    late PlatformCore core;

    setUp(() {
      memoryGateway = MemoryCoreOutputGateway();
      core = PlatformCore(outputGateway: memoryGateway);
    });

    test('connects a valid fake section', () {
      final result = core.connectSection(_fakeResidentialSocket());

      expect(result.connected, isTrue);
      expect(result.reason, DockConnectionReason.connected);
      expect(core.dockRegistry.contains('test_residential'), isTrue);
    });

    test('rejects duplicate section connection', () {
      core.connectSection(_fakeResidentialSocket());

      final result = core.connectSection(_fakeResidentialSocket());

      expect(result.connected, isFalse);
      expect(result.reason, DockConnectionReason.duplicateSection);
      expect(core.dockRegistry.slots, hasLength(1));
    });

    test('disconnects a section', () {
      core.connectSection(_fakeResidentialSocket());

      final disconnected = core.disconnectSection('test_residential');

      expect(disconnected, isTrue);
      expect(core.dockRegistry.contains('test_residential'), isFalse);
    });

    test('accepts a registered code from an allowed section', () async {
      core.connectSection(_fakeResidentialSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
          context: <String, Object?>{'surface': 'test'},
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.reason, CoreEmitReason.accepted);
      expect(result.envelope, isNotNull);
      expect(result.envelope!.logicalTarget, 'login');
      expect(memoryGateway.envelopes, hasLength(1));
    });

    test('rejects a missing code', () async {
      core.connectSection(_fakeResidentialSocket());

      final result = await core.emit(
        const CoreSignalRequest(sectionId: 'test_residential', code: ''),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.missingCode);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects an unknown code', () async {
      core.connectSection(_fakeResidentialSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'unknown001',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.unknownCode);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects code when section is not connected', () async {
      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'missing_section',
          code: 'cl001bt',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.sectionNotConnected);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects code not allowed for section', () async {
      final registry = CoreCodeRegistry(<CoreCodeDefinition>[
        const CoreCodeDefinition(
          code: 'fb999bt',
          family: 'feedback',
          eventName: 'other_feedback_button_tap',
          logicalTarget: 'feedback',
          allowedSections: <String>{'OTHER_TEST'},
          enabled: true,
          environment: 'test',
          schemaVersion: 1,
          description: 'Other feedback tap.',
        ),
      ]);
      final customCore = PlatformCore(
        codeRegistry: registry,
        outputGateway: memoryGateway,
      )..connectSection(_fakeResidentialSocket());

      final result = await customCore.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'fb999bt',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.sectionNotAllowed);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects disabled code', () async {
      final registry = CoreCodeRegistry(<CoreCodeDefinition>[
        const CoreCodeDefinition(
          code: 'sv001sb',
          family: 'survey',
          eventName: 'survey_button_tap',
          logicalTarget: 'survey',
          allowedSections: <String>{'SURVEY_TEST'},
          enabled: false,
          environment: 'test',
          schemaVersion: 1,
          description: 'Disabled survey test code.',
        ),
      ]);
      final customCore = PlatformCore(
        codeRegistry: registry,
        outputGateway: memoryGateway,
      )..connectSection(_fakeSurveySocket());

      final result = await customCore.emit(
        const CoreSignalRequest(
          sectionId: 'test_survey',
          code: 'sv001sb',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.codeDisabled);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects environment mismatch', () async {
      final registry = CoreCodeRegistry(<CoreCodeDefinition>[
        const CoreCodeDefinition(
          code: 'cl003bt',
          family: 'login',
          eventName: 'client_login_button_tap',
          logicalTarget: 'login',
          allowedSections: <String>{'RES_TEST'},
          enabled: true,
          environment: 'prod',
          schemaVersion: 1,
          description: 'Production mismatch test code.',
        ),
      ]);
      final customCore = PlatformCore(
        codeRegistry: registry,
        outputGateway: memoryGateway,
      )..connectSection(_fakeResidentialSocket());

      final result = await customCore.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl003bt',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.environmentMismatch);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects gate not allowed for section', () async {
      core.connectSection(_fakeResidentialSocket(allowedGates: {'login'}));

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl004sb',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.gateNotAllowed);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects prefix not allowed for section', () async {
      core.connectSection(
        _fakeResidentialSocket(allowedCodePrefixes: {'fb'}),
      );

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.prefixNotAllowed);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('rejects unsafe context without throwing', () async {
      core.connectSection(_fakeResidentialSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
          context: <String, Object?>{'token': 'secret'},
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.invalidContext);
      expect(memoryGateway.envelopes, isEmpty);
    });

    test('noop gateway completes without writing', () async {
      final noopCore =
          PlatformCore(outputGateway: const NoopCoreOutputGateway())
            ..connectSection(_fakeResidentialSocket());

      final result = await noopCore.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.reason, CoreEmitReason.accepted);
    });

    test('memory gateway can clear stored envelopes', () async {
      core.connectSection(_fakeResidentialSocket());
      await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
        ),
      );

      memoryGateway.clear();

      expect(memoryGateway.envelopes, isEmpty);
    });

    test('gateway failure remains fail-soft', () async {
      final failingCore = PlatformCore(outputGateway: _FailingGateway())
        ..connectSection(_fakeResidentialSocket());

      final result = await failingCore.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.outputDelivered, isFalse);
      expect(result.reason, CoreEmitReason.gatewayFailure);
      expect(result.envelope, isNotNull);
    });

    test('dock limit is respected', () {
      final registry = DockRegistry(maxSlots: 1);
      final first = registry.connect(_fakeResidentialSocket());
      final second = registry.connect(
        const SectionSocket(
          sectionId: 'test_commercial',
          sectionCode: 'COM_TEST',
          contractVersion: 1,
          environment: 'test',
          allowedGates: <String>{'login'},
          allowedCodePrefixes: <String>{'cl'},
        ),
      );

      expect(first.connected, isTrue);
      expect(second.connected, isFalse);
      expect(second.reason, DockConnectionReason.dockFull);
    });
  });
}

SectionSocket _fakeResidentialSocket({
  Set<String> allowedGates = const <String>{'login', 'feedback'},
  Set<String> allowedCodePrefixes = const <String>{'cl', 'fb'},
}) {
  return SectionSocket(
    sectionId: 'test_residential',
    sectionCode: 'RES_TEST',
    contractVersion: 1,
    environment: 'test',
    allowedGates: allowedGates,
    allowedCodePrefixes: allowedCodePrefixes,
  );
}

SectionSocket _fakeSurveySocket() {
  return const SectionSocket(
    sectionId: 'test_survey',
    sectionCode: 'SURVEY_TEST',
    contractVersion: 1,
    environment: 'test',
    allowedGates: <String>{'survey'},
    allowedCodePrefixes: <String>{'sv'},
    socketId: PlatformSocketIds.socket02,
  );
}

class _FailingGateway implements CoreOutputGateway {
  @override
  Future<void> emit(CoreSignalEnvelope envelope) {
    throw StateError('gateway unavailable');
  }
}
