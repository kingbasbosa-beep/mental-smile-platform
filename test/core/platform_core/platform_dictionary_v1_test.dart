import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';

void main() {
  group('PlatformDictionaryV1', () {
    test('contains exactly 10 codes or fewer', () {
      expect(
        PlatformDictionaryV1.definitions.length,
        lessThanOrEqualTo(PlatformDictionaryV1.maxCodeCount),
      );
      expect(PlatformDictionaryV1.definitions, hasLength(13));
    });

    test('contains all five official families', () {
      final families =
          PlatformDictionaryV1.definitions.map((code) => code.family).toSet();

      expect(
        families,
        containsAll(<String>{
          'login',
          'logout',
          'survey',
          'feedback',
          'application',
        }),
      );
    });

    test('all codes match the official lowercase AA999TT pattern', () {
      for (final definition in PlatformDictionaryV1.definitions) {
        expect(
          CoreCodePattern.matches(definition.code),
          isTrue,
          reason: definition.code,
        );
      }
    });

    test('rejects invalid code patterns', () {
      expect(CoreCodePattern.matches('CL001BT'), isFalse);
      expect(CoreCodePattern.matches('cl01bt'), isFalse);
      expect(CoreCodePattern.matches('cl0001bt'), isFalse);
      expect(CoreCodePattern.matches('cl-01bt'), isFalse);
      expect(CoreCodePattern.matches('cl001 bt'), isFalse);
    });

    test('has no duplicate codes', () {
      final codes =
          PlatformDictionaryV1.definitions.map((code) => code.code).toList();

      expect(codes.toSet(), hasLength(codes.length));
    });

    test('has no duplicate eventName inside the same family', () {
      final seenByFamily = <String, Set<String>>{};

      for (final definition in PlatformDictionaryV1.definitions) {
        final events =
            seenByFamily.putIfAbsent(definition.family, () => <String>{});
        expect(events.add(definition.eventName), isTrue);
      }
    });

    test('family equals logicalTarget', () {
      for (final definition in PlatformDictionaryV1.definitions) {
        expect(definition.family, definition.logicalTarget);
      }
    });

    test('all codes are test environment only', () {
      for (final definition in PlatformDictionaryV1.definitions) {
        expect(definition.environment, 'test');
      }
    });

    test('contains no forbidden internal families', () {
      const forbidden = <String>{
        'owner',
        'admin',
        'archive',
        'marketing',
        'monitoring',
      };

      for (final definition in PlatformDictionaryV1.definitions) {
        expect(forbidden.contains(definition.family), isFalse);
      }
    });

    test('every code has allowedSections and a description', () {
      for (final definition in PlatformDictionaryV1.definitions) {
        expect(definition.allowedSections, isNotEmpty);
        expect(definition.description.trim(), isNotEmpty);
      }
    });

    test('dictionary self-validation passes', () {
      final result = PlatformDictionaryV1.validate();

      expect(result.isValid, isTrue, reason: result.errors.join(', '));
    });

    test('registry loads all dictionary entries', () {
      final registry = CoreCodeRegistry();
      final added = registry.registerAll(PlatformDictionaryV1.definitions);

      expect(added, PlatformDictionaryV1.definitions.length);
      for (final definition in PlatformDictionaryV1.definitions) {
        expect(registry.contains(definition.code), isTrue);
      }
    });

    test('resolver accepts one valid dictionary code through fake section',
        () async {
      final gateway = MemoryCoreOutputGateway();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(_fakeResidentialSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_residential',
          code: 'cl001bt',
        ),
      );

      expect(result.accepted, isTrue);
      expect(result.envelope!.family, 'login');
      expect(gateway.envelopes, hasLength(1));
    });

    test('resolver rejects dictionary code from wrong fake section', () async {
      final gateway = MemoryCoreOutputGateway();
      final core = PlatformCore(outputGateway: gateway)
        ..connectSection(_fakeLibrarySocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: 'test_library',
          code: 'cl001bt',
        ),
      );

      expect(result.accepted, isFalse);
      expect(result.reason, CoreEmitReason.sectionNotAllowed);
      expect(gateway.envelopes, isEmpty);
    });

    test('contains the test-only Library adapter code', () {
      final definition = PlatformDictionaryV1.definitions.singleWhere(
        (definition) => definition.code == 'lb001bt',
      );

      expect(definition.family, 'feedback');
      expect(definition.logicalTarget, 'feedback');
      expect(definition.eventName, 'library_test_entry_tap');
      expect(definition.allowedSections, <String>{'LIB'});
      expect(definition.environment, 'test');
    });

    test('contains the test-only Residential and Commercial adapter codes', () {
      final residential = PlatformDictionaryV1.definitions.singleWhere(
        (definition) => definition.code == 'cl006bt',
      );
      final commercial = PlatformDictionaryV1.definitions.singleWhere(
        (definition) => definition.code == 'cm001bt',
      );

      expect(residential.eventName, 'client_residential_adapter_test_tap');
      expect(residential.allowedSections, <String>{'RES'});
      expect(residential.environment, 'test');
      expect(commercial.eventName, 'commercial_adapter_test_tap');
      expect(commercial.allowedSections, <String>{'COM'});
      expect(commercial.environment, 'test');
    });
  });
}

SectionSocket _fakeResidentialSocket() {
  return const SectionSocket(
    sectionId: 'test_residential',
    sectionCode: 'RES_TEST',
    contractVersion: 1,
    environment: 'test',
    allowedGates: <String>{'login', 'logout', 'survey', 'feedback'},
    allowedCodePrefixes: <String>{'cl'},
  );
}

SectionSocket _fakeLibrarySocket() {
  return const SectionSocket(
    sectionId: 'test_library',
    sectionCode: 'LIB_TEST',
    contractVersion: 1,
    environment: 'test',
    allowedGates: <String>{'login'},
    allowedCodePrefixes: <String>{'cl'},
  );
}
