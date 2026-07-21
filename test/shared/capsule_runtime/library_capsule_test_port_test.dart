import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_compatibility_report.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_mode.dart';
import 'package:mental_smile_os/shared/capsule_runtime/library_test_host_adapters.dart';
import 'package:mental_smile_os/shared/capsule_runtime/library_test_port.dart';

void main() {
  const policy = LibraryCompatibilityPolicy();
  const descriptor = LibraryTestCapsuleDescriptorProvider.descriptor;

  group('Library compatibility policy', () {
    test('valid Library descriptor passes', () {
      final report = policy.validate(
        descriptor: descriptor,
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.compatible, isTrue);
      expect(report.failureCodes, isEmpty);
    });

    test('wrong capsule and section rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          capsuleId: 'MS-CAPSULE-LIB-WRONG',
          sectionId: 'WRONG',
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(
        report.failureCodes,
        containsAll(<String>[
          CapsuleCompatibilityFailureCode.capsuleIdMismatch,
          CapsuleCompatibilityFailureCode.sectionIdMismatch,
        ]),
      );
    });

    test('wrong port and mode rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(mode: LibraryTestCapsuleMode.active),
        portId: 'MS-PORT-LIB-WRONG',
      );

      expect(
        report.failureCodes,
        containsAll(<String>[
          CapsuleCompatibilityFailureCode.portIdMismatch,
          CapsuleCompatibilityFailureCode.modeNotAllowed,
        ]),
      );
    });

    test('wrong line rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          canonicalLines: <String>[
            ...descriptor.canonicalLines,
            'MS-LINE-UNKNOWN-01',
          ],
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.lineNotAllowed));
    });

    test('reserved line rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          canonicalLines: <String>[
            ...descriptor.canonicalLines,
            LibraryTestCapsuleDescriptorProvider.reservedLines.first,
          ],
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.reservedLineUsed));
    });

    test('runtime and route mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(runtimeFileCount: 27, routeCount: 4),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.routeCountMismatch));
    });

    test('signal mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(localSignalCount: 21),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.signalCountMismatch));
    });

    test('asset and localization mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          assetCount: 31,
          localizationKeyCount: 13,
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(
        report.failureCodes,
        containsAll(<String>[
          CapsuleCompatibilityFailureCode.assetCountMismatch,
          CapsuleCompatibilityFailureCode.localizationCountMismatch,
        ]),
      );
    });

    test('speech state mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          speechControlCount: 24,
          connectedSpeechCount: 1,
          pendingSpeechCount: 22,
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.speechStateMismatch));
    });

    test('content and editorial mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          runtimeContentCount: 0,
          editorialSourceCount: 2,
          organizationReferenceCount: 1,
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.requiredExportMissing));
    });

    test('Firebase and Storage contract mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          firebaseContractCount: 1,
          storageContractCount: 1,
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.firebaseContractMismatch));
      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.storageContractMismatch));
    });

    test('host import, export, schema, and forbidden mappings rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          requiredHostImports: const <String>[],
          providedExports: const <String>[],
          schemaFingerprint: 'wrong',
          forbiddenImports: const <String>['package:cloud_firestore'],
          unmappedItems: 1,
        ),
        portId: LibraryCapsuleTestPortConstants.testPortId,
      );

      expect(
        report.failureCodes,
        containsAll(<String>[
          CapsuleCompatibilityFailureCode.requiredImportMissing,
          CapsuleCompatibilityFailureCode.requiredExportMissing,
          CapsuleCompatibilityFailureCode.schemaFingerprintMismatch,
          CapsuleCompatibilityFailureCode.forbiddenDependency,
        ]),
      );
    });
  });

  group('Library mount and isolation', () {
    test('test mount succeeds', () async {
      final controller = LibraryCapsuleTestMountController();

      final result = await controller.mount();

      expect(result.mounted, isTrue);
      expect(result.mountState, CapsuleMountState.mountedTest);
      expect(controller.adapters.routes.enabled, isTrue);
      expect(controller.adapters.routes.registeredRoutes, hasLength(5));
    });

    test('failed compatibility prevents mount', () async {
      final adapters = _adapters();
      final controller = LibraryCapsuleTestMountController(
        descriptor: descriptor.copyWith(sectionId: 'WRONG'),
        adapters: adapters,
      );

      final result = await controller.mount();

      expect(result.mounted, isFalse);
      expect(result.mountState, CapsuleMountState.incompatible);
      expect(adapters.routes.enabled, isFalse);
    });

    test('production Firestore reads blocked by test adapter', () {
      final adapters = _adapters();

      expect(adapters.dataRead.readPublishedProfiles(), isFalse);
      expect(adapters.dataRead.productionReads, 0);
    });

    test('test local state isolated', () {
      final adapters = _adapters();

      expect(
        adapters.localState.key('library_home'),
        startsWith(LibraryCapsuleTestPortConstants.localStatePrefix),
      );
      expect(adapters.localState.localSignalTtl, const Duration(hours: 24));
    });

    test('test signals isolated', () {
      final adapters = _adapters();

      adapters.signals.append(
        capsuleId: 'MS-CAPSULE-LIB-BLUEPRINT',
        portId: LibraryCapsuleTestPortConstants.testPortId,
        instanceId: LibraryCapsuleTestPortConstants.instanceId,
        signalCode: 'L.S.001.VIEW',
      );

      expect(adapters.signals.records.single.testOnly, isTrue);
      expect(adapters.signals.productionWrites, 0);
    });

    test('speech and external actions remain local to test adapters', () async {
      final adapters = _adapters();

      await adapters.speech.speak('libraryProviderSpecialists');
      final opened = adapters.externalActions.open(
        Uri.parse('https://example.test/library-source'),
      );

      expect(adapters.speech.spoken, <String>['libraryProviderSpecialists']);
      expect(opened, isFalse);
      expect(adapters.externalActions.opened, hasLength(1));
    });

    test('unmount disposes resources', () async {
      final adapters = _adapters();
      final controller = LibraryCapsuleTestMountController(adapters: adapters);

      await controller.mount();
      await controller.unmount();

      expect(controller.state, CapsuleMountState.unmounted);
      expect(adapters.disposed, isTrue);
      expect(adapters.speech.stopped, isTrue);
      expect(adapters.routes.enabled, isFalse);
    });
  });

  group('Library boundary protection', () {
    test('public package entry not imported by Central runtime', () {
      final source = Directory('lib/shared/capsule_runtime')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('package:mental_smile_library_capsule')));
    });

    test(
        'Residential, Commercial, root implementation, Firebase imports absent',
        () {
      final source = Directory('capsules/library/package/lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('features/residential')));
      expect(source, isNot(contains('features/commercial')));
      expect(source, isNot(contains('package:mental_smile_os/')));
      expect(source, isNot(contains('package:cloud_firestore')));
      expect(source, isNot(contains('package:firebase_auth')));
      expect(source, isNot(contains('package:firebase_storage')));
    });

    test('initial route unchanged and test route hidden from public Library UI',
        () {
      expect(Routes.libraryCapsuleTest, '/__capsule_test/library');

      final appSource =
          File('lib/app/router/app_router.dart').readAsStringSync();
      expect(appSource, contains('LibraryPage()'));

      final publicFiles = <String>[
        'lib/features/splash/presentation/pages/splash_page.dart',
        'lib/features/library/presentation/pages/library_page.dart',
        'lib/features/library/knowledge_cards/presentation/pages/knowledge_cards_page.dart',
      ];
      for (final path in publicFiles) {
        final source = File(path).readAsStringSync();
        expect(source, isNot(contains(Routes.libraryCapsuleTest)));
      }
    });

    test('Platform Core untouched by Library test port', () {
      final source = Directory('lib/core/platform_core')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('library_test_port')));
      expect(source, isNot(contains('mental_smile_library_capsule')));
    });
  });
}

LibraryTestHostAdapters _adapters() {
  return LibraryTestHostAdapters(
    lifecycle: LibraryTestLifecycleAdapter(),
    routes: LibraryTestRouteNamespaceRegistry(
      namespace: LibraryCapsuleTestPortConstants.testRoute,
    ),
    dataRead: LibraryTestDataReadAdapter(),
    signals: LibraryTestSignalSink(),
    localState: const LibraryTestLocalStateNamespace(
      prefix: LibraryCapsuleTestPortConstants.localStatePrefix,
      instanceId: LibraryCapsuleTestPortConstants.instanceId,
    ),
    localization: LibraryTestLocalizationAdapter(),
    assets: LibraryTestAssetAdapter(),
    externalActions: LibraryTestExternalActionAdapter(),
    speech: LibraryTestSpeechAdapter(),
    content: LibraryTestContentAdapter(),
  );
}
