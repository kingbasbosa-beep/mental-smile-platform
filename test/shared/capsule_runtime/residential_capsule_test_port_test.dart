import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_compatibility_gate.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_compatibility_report.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_mode.dart';
import 'package:mental_smile_os/shared/capsule_runtime/capsule_port_registry.dart';
import 'package:mental_smile_os/shared/capsule_runtime/residential_test_host_adapters.dart';
import 'package:mental_smile_os/shared/capsule_runtime/residential_test_port.dart';
import 'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart'
    as res;

void main() {
  const gate = CapsuleCompatibilityGate();
  const port = CapsulePortRegistry.residentialTestPort;
  const descriptor = res.ResidentialCapsuleDescriptorProvider.descriptor;

  group('Residential capsule compatibility gate', () {
    test('valid capsule passes Compatibility Gate', () {
      final report = gate.validate(port: port, descriptor: descriptor);

      expect(report.compatible, isTrue);
      expect(report.failureCodes, isEmpty);
    });

    test('wrong capsule ID is rejected', () {
      final report = gate.validate(
        port: port,
        descriptor: descriptor.copyWith(capsuleId: 'WRONG'),
      );

      expect(
          report.failureCodes,
          contains(
            CapsuleCompatibilityFailureCode.capsuleIdMismatch,
          ));
    });

    test('wrong port is rejected', () {
      final report = gate.validate(
        port: port.copyWith(portId: 'MS-PORT-RES-WRONG'),
        descriptor: descriptor,
      );

      expect(
          report.failureCodes,
          contains(
            CapsuleCompatibilityFailureCode.portIdMismatch,
          ));
    });

    test('wrong contract version is rejected', () {
      final report = gate.validate(
        port: port,
        descriptor: descriptor.copyWith(contractVersion: 999),
      );

      expect(
          report.failureCodes,
          contains(
            CapsuleCompatibilityFailureCode.contractVersionMismatch,
          ));
    });

    test('unknown line is rejected', () {
      final report = gate.validate(
        port: port,
        descriptor: descriptor.copyWith(
          supportedCanonicalLines: <String>[
            ...descriptor.supportedCanonicalLines,
            'MS-LINE-UNKNOWN-01',
          ],
        ),
      );

      expect(
          report.failureCodes,
          contains(
            CapsuleCompatibilityFailureCode.lineNotAllowed,
          ));
    });

    test('reserved line usage is rejected', () {
      final report = gate.validate(
        port: port,
        descriptor: descriptor.copyWith(
          supportedCanonicalLines: <String>[
            ...descriptor.supportedCanonicalLines,
            res.ResidentialCapsuleReservedExtensionLine.extension01,
          ],
        ),
      );

      expect(
          report.failureCodes,
          contains(
            CapsuleCompatibilityFailureCode.reservedLineUsed,
          ));
    });

    test('count mismatch is rejected', () {
      final report = gate.validate(
        port: port,
        descriptor: descriptor.copyWith(
          routeCount: 13,
          coreSignalCount: 2,
          assetCount: 59,
          localizationKeyCount: 237,
          speechControlCount: 47,
        ),
      );

      expect(
          report.failureCodes,
          containsAll(<String>[
            CapsuleCompatibilityFailureCode.routeCountMismatch,
            CapsuleCompatibilityFailureCode.signalCountMismatch,
            CapsuleCompatibilityFailureCode.assetCountMismatch,
            CapsuleCompatibilityFailureCode.localizationCountMismatch,
            CapsuleCompatibilityFailureCode.speechCountMismatch,
          ]));
    });

    test('schema fingerprint mismatch is rejected', () {
      final report = gate.validate(
        port: port,
        descriptor: descriptor.copyWith(schemaFingerprint: 'wrong'),
      );

      expect(
          report.failureCodes,
          contains(
            CapsuleCompatibilityFailureCode.schemaFingerprintMismatch,
          ));
    });

    test('forbidden dependencies are rejected', () {
      final report = gate.validate(
        port: port,
        descriptor: descriptor.copyWith(
          forbiddenDependencyImports: <String>[
            'package:cloud_firestore/cloud_firestore.dart'
          ],
        ),
      );

      expect(
          report.failureCodes,
          contains(
            CapsuleCompatibilityFailureCode.forbiddenDependency,
          ));
    });
  });

  group('Residential capsule test mount controller', () {
    test('test mount succeeds', () async {
      final controller = ResidentialCapsuleTestMountController();

      final result = await controller.mount();

      expect(result.mounted, isTrue);
      expect(result.mountState, CapsuleMountState.mountedTest);
      expect(controller.adapters.routeRegistry.enabled, isTrue);
      expect(controller.adapters.routeRegistry.registeredRoutes, hasLength(14));
    });

    test('failed compatibility prevents route registration', () async {
      final adapters = _adapters();
      final controller = ResidentialCapsuleTestMountController(
        descriptor: descriptor.copyWith(capsuleId: 'WRONG'),
        adapters: adapters,
      );

      final result = await controller.mount();

      expect(result.mounted, isFalse);
      expect(result.mountState, CapsuleMountState.incompatible);
      expect(adapters.routeRegistry.enabled, isFalse);
      expect(adapters.routeRegistry.registeredRoutes, isEmpty);
    });

    test('unmount disposes adapters and stops speech', () async {
      final adapters = _adapters();
      final controller = ResidentialCapsuleTestMountController(
        adapters: adapters,
      );

      await controller.mount();
      await controller.unmount();

      expect(controller.state, CapsuleMountState.unmounted);
      expect(adapters.disposed, isTrue);
      expect(adapters.speech.stopped, isTrue);
      expect(adapters.routeRegistry.enabled, isFalse);
    });

    test('active identity differs from test identity', () {
      expect(port.testIdentity.collidesWith(port.activeIdentity), isFalse);
    });

    test('test local state namespace is isolated', () {
      final adapters = _adapters();

      expect(
        adapters.localState.key('signals'),
        startsWith(CapsulePortRegistry.residentialTestLocalStatePrefix),
      );
      expect(
        adapters.localState.key('signals'),
        isNot(contains('mental_smile_local_signals_residential.')),
      );
      expect(adapters.localState.localSignalTtl, const Duration(hours: 24));
    });

    test('test signals do not reach Production sink', () {
      final adapters = _adapters();

      adapters.signalSink.append(
        capsuleId: res.ResidentialCapsuleIdentity.capsuleId,
        portId: CapsulePortRegistry.residentialTestPortId,
        instanceId: CapsulePortRegistry.residentialTestInstanceId,
        signalCode: 'R.T.006.OPEN',
      );

      expect(adapters.signalSink.records, hasLength(1));
      expect(adapters.signalSink.records.single.testOnly, isTrue);
      expect(adapters.signalSink.productionWrites, 0);
    });

    test('package assets resolve without root asset duplication', () {
      final adapters = _adapters();

      expect(
        adapters.assets
            .packageAsset('assets/branding/splash/splash_web_v1.jpg'),
        'packages/mental_smile_residential_capsule/assets/branding/splash/splash_web_v1.jpg',
      );
    });

    test('host localization resolves Arabic and English', () {
      final adapters = _adapters();

      expect(
        adapters.localization
            .resolve('applicationSpeechTooltip', const Locale('ar')),
        'ar:applicationSpeechTooltip',
      );
      expect(
        adapters.localization
            .resolve('applicationSpeechTooltip', const Locale('en')),
        'en:applicationSpeechTooltip',
      );
    });

    test('speech goes to Host fake adapter', () async {
      final adapters = _adapters();

      await adapters.speech.speak('hello');

      expect(adapters.speech.spoken, <String>['hello']);
      expect(adapters.speech.stopped, isFalse);
    });

    test('speech stops on unmount', () async {
      final adapters = _adapters();
      final controller = ResidentialCapsuleTestMountController(
        adapters: adapters,
      );

      await adapters.speech.speak('hello');
      await controller.unmount();

      expect(adapters.speech.stopped, isTrue);
    });
  });

  group('Residential capsule active protection', () {
    test('only public package entry is imported by Central runtime', () {
      final source = Directory('lib/shared/capsule_runtime')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(
          source,
          contains(
            'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart',
          ));
      expect(
          source,
          isNot(contains(
            'package:mental_smile_residential_capsule/src/',
          )));
    });

    test('active Residential routes remain unchanged', () {
      expect(Routes.splash, '/splash');
      expect(Routes.clientRoom, '/client/room');
      expect(Routes.accessibilityRoom, '/accessibility/room');
      expect(
          Routes.residentialExitSocialLinks, '/residential/exit-social-links');
      expect(Routes.residentialCapsuleTest, '/__capsule_test/residential');
    });

    test('test route is hidden from public navigation and is not initial route',
        () {
      final publicFiles = <String>[
        'lib/features/splash/presentation/pages/splash_page.dart',
        'lib/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart',
        'lib/app/app.dart',
      ];

      for (final path in publicFiles) {
        final source = File(path).readAsStringSync();
        expect(source, isNot(contains(Routes.residentialCapsuleTest)));
      }
    });

    test(
        'no Commercial, Library, Firebase, or root implementation dependency is introduced',
        () {
      final source = Directory('lib/shared/capsule_runtime')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(source, isNot(contains('features/commercial')));
      expect(source, isNot(contains('features/library')));
      expect(source, isNot(contains('package:cloud_firestore')));
      expect(source, isNot(contains('package:firebase_')));
    });

    test('Platform Core stays untouched by capsule runtime imports', () {
      final platformCore = Directory('lib/core/platform_core')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.readAsStringSync())
          .join('\n');

      expect(platformCore, isNot(contains('capsule_runtime')));
      expect(platformCore, isNot(contains('mental_smile_residential_capsule')));
    });
  });
}

ResidentialTestHostAdapters _adapters() {
  return ResidentialTestHostAdapters(
    lifecycle: ResidentialTestLifecycleAdapter(),
    routeRegistry: ResidentialTestRouteNamespaceRegistry(
      namespace: CapsulePortRegistry.residentialTestRoute,
    ),
    error: ResidentialTestErrorAdapter(),
    externalAction: ResidentialTestExternalActionAdapter(),
    localState: const ResidentialTestLocalStateNamespace(
      prefix: CapsulePortRegistry.residentialTestLocalStatePrefix,
      capsuleId: res.ResidentialCapsuleIdentity.capsuleId,
      portId: CapsulePortRegistry.residentialTestPortId,
      instanceId: CapsulePortRegistry.residentialTestInstanceId,
    ),
    signalSink: ResidentialTestSignalSink(),
    speech: ResidentialTestSpeechAdapter(),
    localization: ResidentialTestHostLocalizationAdapter(),
    assets: ResidentialTestHostAssetAdapter(),
    themeConfig: const ResidentialTestThemeConfigAdapter(),
  );
}
