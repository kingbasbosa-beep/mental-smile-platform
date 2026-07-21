import '../lib/mental_smile_platform_capsule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Platform capsule package', () {
    test('Platform capsule identity is valid', () {
      expect(
        PlatformCapsuleDefaults.platformIdentity.capsuleId,
        'MS-CAPSULE-PLATFORM-INFRASTRUCTURE',
      );
      expect(
        PlatformCapsuleDefaults.platformDescriptor.schemaFingerprint,
        PlatformCapsuleDefaults.platformSchemaFingerprint,
      );
    });

    test('Platform section identity is valid', () {
      expect(PlatformCapsuleDefaults.platformIdentity.sectionId, 'PLATFORM');
      expect(
        PlatformCapsuleDefaults.platformIdentity.type,
        CapsuleType.platform,
      );
    });

    test('Platform test port identity is valid', () {
      expect(
        PlatformCapsuleDefaults.testPort.portId,
        'MS-PORT-PLATFORM-TEST-01',
      );
      expect(PlatformCapsuleDefaults.testPort.mode, CapsuleMode.test);
      expect(PlatformCapsuleDefaults.testPort.activatesCapsules, isFalse);
    });

    test('Known capsule registry accepts Platform', () {
      expect(
        PlatformCapsuleDefaults.registrySnapshot.capsuleIds,
        contains('MS-CAPSULE-PLATFORM-INFRASTRUCTURE'),
      );
    });

    test('Known capsule registry accepts Residential', () {
      expect(
        PlatformCapsuleDefaults.registrySnapshot.capsuleIds,
        contains('MS-CAPSULE-RES-R-1.07.2026'),
      );
    });

    test('Known capsule registry accepts Commercial', () {
      expect(
        PlatformCapsuleDefaults.registrySnapshot.capsuleIds,
        contains('MS-CAPSULE-COM-BLUEPRINT'),
      );
    });

    test('Known capsule registry accepts Library', () {
      expect(
        PlatformCapsuleDefaults.registrySnapshot.capsuleIds,
        contains('MS-CAPSULE-LIB-BLUEPRINT'),
      );
    });

    test('Duplicate capsule ID is rejected', () {
      final result = const PlatformValidationEngine().validate(
        ValidationRequest(
          registry: CapsuleRegistrySnapshot(
            repository: PlatformCapsuleDefaults.repository,
            entries: <CapsuleRegistryEntry>[
              PlatformCapsuleDefaults.registrySnapshot.entries.first,
              PlatformCapsuleDefaults.registrySnapshot.entries.first,
            ],
          ),
          lines: PlatformCapsuleDefaults.canonicalLines,
          ports: const <PortRegistryEntry>[
            PortRegistryEntry(
              descriptor: PlatformCapsuleDefaults.testPort,
              state: CapsuleLifecycleState.manualVerificationPending,
            ),
          ],
        ),
      );

      expect(
        result.failureCodes,
        contains(PlatformCapsuleFailureCode.duplicateCapsuleId),
      );
    });

    test('Unknown capsule ID is rejected', () {
      final descriptor = _descriptorFor(
        const CapsuleIdentity(
          capsuleId: 'MS-CAPSULE-UNKNOWN',
          sectionId: 'PLATFORM',
          type: CapsuleType.platform,
        ),
      );

      final result = _engine().validate(
        CompatibilityRequest(
          descriptor: descriptor,
          registry: PlatformCapsuleDefaults.registrySnapshot,
          port: PlatformCapsuleDefaults.testPort,
          expectedSchemaFingerprint:
              PlatformCapsuleDefaults.platformSchemaFingerprint,
          manifestCapsuleId: descriptor.identity.capsuleId,
        ),
      );

      expect(
        result.failureCodes,
        contains(PlatformCapsuleFailureCode.unknownCapsule),
      );
    });

    test('Port collision is rejected', () {
      final result = const PlatformValidationEngine().validate(
        ValidationRequest(
          registry: PlatformCapsuleDefaults.registrySnapshot,
          lines: PlatformCapsuleDefaults.canonicalLines,
          ports: const <PortRegistryEntry>[
            PortRegistryEntry(
              descriptor: PlatformCapsuleDefaults.testPort,
              state: CapsuleLifecycleState.manualVerificationPending,
            ),
            PortRegistryEntry(
              descriptor: PlatformCapsuleDefaults.testPort,
              state: CapsuleLifecycleState.manualVerificationPending,
            ),
          ],
        ),
      );

      expect(
        result.failureCodes,
        contains(PlatformCapsuleFailureCode.portCollision),
      );
    });

    test('Forbidden dependency is rejected', () {
      final descriptor = _descriptorFor(
        PlatformCapsuleDefaults.platformIdentity,
        dependencies: const <DependencyContract>[
          DependencyContract(dependencyId: 'firebase', allowed: false),
        ],
      );

      final result = _engine().validate(
        CompatibilityRequest(
          descriptor: descriptor,
          registry: PlatformCapsuleDefaults.registrySnapshot,
          port: PlatformCapsuleDefaults.testPort,
          expectedSchemaFingerprint:
              PlatformCapsuleDefaults.platformSchemaFingerprint,
          manifestCapsuleId: PlatformCapsuleDefaults.platformIdentity.capsuleId,
        ),
      );

      expect(
        result.failureCodes,
        contains(PlatformCapsuleFailureCode.forbiddenDependency),
      );
    });

    test('Invalid lifecycle transition is rejected', () {
      expect(
        const PlatformLifecycleManager().canTransition(
          CapsuleLifecycleState.packageReady,
          CapsuleLifecycleState.active,
        ),
        isFalse,
      );
    });

    test('Diagnostic snapshot is read-only and deterministic', () {
      final first = PlatformCapsuleTestPort().diagnosticSnapshot();
      final second = PlatformCapsuleTestPort().diagnosticSnapshot();

      expect(first.readonly, isTrue);
      expect(first.capsuleCount, 4);
      expect(first.portCount, 1);
      expect(first.canonicalLineCount, 11);
      expect(first.activeCapsules, 0);
      expect(second.capsuleCount, first.capsuleCount);
      expect(second.portCount, first.portCount);
      expect(second.canonicalLineCount, first.canonicalLineCount);
      expect(second.activeCapsules, first.activeCapsules);
    });
  });
}

PlatformCompatibilityEngine _engine() {
  return PlatformCompatibilityEngine(
    allowedLines: PlatformCapsuleDefaults.canonicalLines.lineCodes.toSet(),
    forbiddenDependencies: PlatformCapsuleDefaults.forbiddenDependencies,
  );
}

CapsuleDescriptor _descriptorFor(
  CapsuleIdentity identity, {
  List<DependencyContract> dependencies = const <DependencyContract>[],
}) {
  return CapsuleDescriptor(
    identity: identity,
    state: CapsuleState.packageReady,
    mode: CapsuleMode.test,
    schemaFingerprint: PlatformCapsuleDefaults.platformSchemaFingerprint,
    imports: const <ImportContract>[],
    exports: const <ExportContract>[],
    dependencies: dependencies,
    canonicalLines: PlatformCapsuleDefaults.canonicalLines.lineCodes,
    runtimeFileCount: 0,
    portCount: 1,
  );
}

extension on CompatibilityResult {
  List<String> get failureCodes {
    return failures.map((failure) => failure.code).toList(growable: false);
  }
}

extension on ValidationResult {
  List<String> get failureCodes {
    return failures.map((failure) => failure.code).toList(growable: false);
  }
}
