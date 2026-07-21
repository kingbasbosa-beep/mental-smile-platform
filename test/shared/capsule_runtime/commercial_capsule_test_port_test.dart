import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_compatibility_report.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_mode.dart';
import 'package:mental_smile_os/shared/capsule_runtime/commercial_test_host_adapters.dart';
import 'package:mental_smile_os/shared/capsule_runtime/commercial_test_port.dart';

void main() {
  const policy = CommercialCompatibilityPolicy();
  const descriptor = CommercialTestCapsuleDescriptorProvider.descriptor;

  group('Commercial compatibility policy', () {
    test('valid Commercial descriptor passes', () {
      final report = policy.validate(
        descriptor: descriptor,
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.compatible, isTrue);
      expect(report.failureCodes, isEmpty);
    });

    test('wrong section rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(sectionId: 'WRONG'),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.sectionIdMismatch));
    });

    test('wrong port rejected', () {
      final report = policy.validate(
        descriptor: descriptor,
        portId: 'MS-PORT-COM-WRONG',
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.portIdMismatch));
    });

    test('wrong line rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          canonicalLines: <String>[
            ...descriptor.canonicalLines,
            'MS-LINE-UNKNOWN-01',
          ],
        ),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.lineNotAllowed));
    });

    test('reserved line rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          canonicalLines: <String>[
            ...descriptor.canonicalLines,
            CommercialTestCapsuleDescriptorProvider.reservedLines.first,
          ],
        ),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.reservedLineUsed));
    });

    test('route count mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(routeCount: 17),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.routeCountMismatch));
    });

    test('signal mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(coreSignalCount: 3),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.signalCountMismatch));
    });

    test('asset mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(assetCount: 38),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.assetCountMismatch));
    });

    test('localization mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(localizationKeyCount: 46),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.localizationCountMismatch));
    });

    test('Firebase usage mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(firebaseUsageCount: 4),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.firebaseContractMismatch));
    });

    test('Storage usage mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(storageUsageCount: 1),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.storageContractMismatch));
    });

    test('speech state mismatch rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(pendingSpeechCount: 14),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.speechStateMismatch));
    });

    test('17 controls, 2 connected, 15 pending accepted in TEST', () {
      final report = policy.validate(
        descriptor: descriptor,
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(report.compatible, isTrue);
      expect(descriptor.speechControlCount, 17);
      expect(descriptor.connectedSpeechCount, 2);
      expect(descriptor.pendingSpeechCount, 15);
    });

    test('same speech state rejected for ACTIVE promotion', () {
      final report = policy.validate(
        descriptor: descriptor,
        portId: CommercialCapsuleTestPortConstants.testPortId,
        activePromotion: true,
      );

      expect(report.failureCodes,
          contains(CapsuleCompatibilityFailureCode.speechStateMismatch));
    });

    test('forbidden features and legacy residue are rejected', () {
      final report = policy.validate(
        descriptor: descriptor.copyWith(
          forbiddenFeatureCount: 1,
          legacyResidueCount: 1,
        ),
        portId: CommercialCapsuleTestPortConstants.testPortId,
      );

      expect(
          report.failureCodes,
          containsAll(<String>[
            CapsuleCompatibilityFailureCode.forbiddenFeaturePresent,
            CapsuleCompatibilityFailureCode.legacyResiduePresent,
          ]));
    });
  });

  group('Commercial mount and isolation', () {
    test('test mount succeeds', () async {
      final controller = CommercialCapsuleTestMountController();

      final result = await controller.mount();

      expect(result.mounted, isTrue);
      expect(result.mountState, CapsuleMountState.mountedTest);
      expect(controller.adapters.routes.enabled, isTrue);
      expect(controller.adapters.routes.registeredRoutes, hasLength(18));
    });

    test('failed compatibility prevents mount', () async {
      final adapters = _adapters();
      final controller = CommercialCapsuleTestMountController(
        descriptor: descriptor.copyWith(sectionId: 'WRONG'),
        adapters: adapters,
      );

      final result = await controller.mount();

      expect(result.mounted, isFalse);
      expect(result.mountState, CapsuleMountState.incompatible);
      expect(adapters.routes.enabled, isFalse);
    });

    test('test Auth mutation blocked', () {
      final adapters = _adapters();

      expect(adapters.auth.createAccount(), isFalse);
      expect(adapters.auth.productionMutations, 0);
    });

    test('Production Firestore writes blocked', () {
      final adapters = _adapters();

      expect(adapters.data.write(), isFalse);
      expect(adapters.data.productionWrites, 0);
    });

    test('Production Storage upload blocked', () {
      final adapters = _adapters();

      expect(adapters.storage.upload('test/logo.png'), isFalse);
      expect(adapters.storage.productionUploads, 0);
      expect(adapters.storage.uploads, <String>['test/logo.png']);
    });

    test('test local state isolated', () {
      final adapters = _adapters();

      expect(
        adapters.localState.key('profile'),
        startsWith(CommercialCapsuleTestPortConstants.localStatePrefix),
      );
      expect(adapters.localState.localSignalTtl, const Duration(hours: 24));
    });

    test('test signals isolated', () {
      final adapters = _adapters();

      adapters.signals.append(
        capsuleId: 'MS-CAPSULE-COM-BLUEPRINT',
        portId: CommercialCapsuleTestPortConstants.testPortId,
        instanceId: CommercialCapsuleTestPortConstants.instanceId,
        signalCode: 'C.AUTH.001.SIGN_IN',
      );

      expect(adapters.signals.records.single.testOnly, isTrue);
      expect(adapters.signals.productionWrites, 0);
    });

    test('unmount disposes resources', () async {
      final adapters = _adapters();
      final controller = CommercialCapsuleTestMountController(
        adapters: adapters,
      );

      await controller.mount();
      adapters.storage.upload('test/logo.png');
      await controller.unmount();

      expect(controller.state, CapsuleMountState.unmounted);
      expect(adapters.disposed, isTrue);
      expect(adapters.speech.stopped, isTrue);
      expect(adapters.storage.uploads, isEmpty);
    });
  });

  group('Commercial boundary protection', () {
    test('public entry only imported by Central runtime', () {
      final source = Directory('lib/shared/capsule_runtime')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(
          source, isNot(contains('package:mental_smile_commercial_capsule')));
    });

    test('Residential, Library, root implementation, Firebase imports absent',
        () {
      final source = Directory('capsules/commercial/package/lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('features/residential')));
      expect(source, isNot(contains('features/library')));
      expect(source, isNot(contains('package:mental_smile_os/')));
      expect(source, isNot(contains('package:cloud_firestore')));
      expect(source, isNot(contains('package:firebase_auth')));
      expect(source, isNot(contains('package:firebase_storage')));
    });

    test('initial route unchanged and test route hidden', () {
      expect(Routes.commercialCapsuleTest, '/__capsule_test/commercial');

      final appSource =
          File('lib/app/router/app_router.dart').readAsStringSync();
      expect(appSource, contains('CommercialV2WebShowcasePage()'));

      final publicFiles = <String>[
        'lib/features/splash/presentation/pages/splash_page.dart',
        'lib/features/commercial/presentation/pages/commercial_access_page.dart',
        'lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart',
      ];
      for (final path in publicFiles) {
        final source = File(path).readAsStringSync();
        expect(source, isNot(contains(Routes.commercialCapsuleTest)));
      }
    });

    test('Platform Core untouched', () {
      final source = Directory('lib/core/platform_core')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('commercial_test_port')));
      expect(source, isNot(contains('mental_smile_commercial_capsule')));
    });
  });
}

CommercialTestHostAdapters _adapters() {
  return CommercialTestHostAdapters(
    lifecycle: CommercialTestLifecycleAdapter(),
    routes: CommercialTestRouteNamespaceRegistry(
      namespace: CommercialCapsuleTestPortConstants.testRoute,
    ),
    auth: CommercialTestAuthAdapter(),
    data: CommercialTestDataAdapter(),
    storage: CommercialTestStorageAdapter(),
    signals: CommercialTestSignalSink(),
    localState: const CommercialTestLocalStateNamespace(
      prefix: CommercialCapsuleTestPortConstants.localStatePrefix,
      instanceId: CommercialCapsuleTestPortConstants.instanceId,
    ),
    localization: CommercialTestLocalizationAdapter(),
    assets: CommercialTestAssetAdapter(),
    externalActions: CommercialTestExternalActionAdapter(),
    errors: CommercialTestErrorAdapter(),
    speech: CommercialTestSpeechAdapter(),
    providerProfiles: CommercialTestProviderProfileAdapter(),
  );
}
