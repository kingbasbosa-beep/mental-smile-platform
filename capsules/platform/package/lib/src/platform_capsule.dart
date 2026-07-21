enum CapsuleType { platform, residential, commercial, library }

enum CapsuleState {
  designedNotImplemented,
  packageReady,
  mountedTest,
  manualVerificationPending,
  manualVerificationPassed,
  eligibleForActivation,
  active,
  suspended,
  rejected,
  incompatible,
}

enum CapsuleMode { designed, test, active, disabled }

enum CapsuleLifecycleState {
  designedNotImplemented,
  packageReady,
  mountedTest,
  manualVerificationPending,
  manualVerificationPassed,
  eligibleForActivation,
  active,
  suspended,
  rejected,
  incompatible,
}

enum CapsuleCompatibilityState { compatible, incompatible }

class PlatformCapsuleFailureCode {
  const PlatformCapsuleFailureCode._();

  static const identityMismatch = 'IDENTITY_MISMATCH';
  static const sectionMismatch = 'SECTION_MISMATCH';
  static const portMismatch = 'PORT_MISMATCH';
  static const modeNotAllowed = 'MODE_NOT_ALLOWED';
  static const importMismatch = 'IMPORT_MISMATCH';
  static const exportMismatch = 'EXPORT_MISMATCH';
  static const dependencyMismatch = 'DEPENDENCY_MISMATCH';
  static const forbiddenDependency = 'FORBIDDEN_DEPENDENCY';
  static const registryParityFailed = 'REGISTRY_PARITY_FAILED';
  static const manifestParityFailed = 'MANIFEST_PARITY_FAILED';
  static const schemaFingerprintMismatch = 'SCHEMA_FINGERPRINT_MISMATCH';
  static const countMismatch = 'COUNT_MISMATCH';
  static const canonicalLineMismatch = 'CANONICAL_LINE_MISMATCH';
  static const lifecycleMismatch = 'LIFECYCLE_MISMATCH';
  static const duplicateCapsuleId = 'DUPLICATE_CAPSULE_ID';
  static const unknownCapsule = 'UNKNOWN_CAPSULE';
  static const invalidMount = 'INVALID_MOUNT';
  static const invalidTransition = 'INVALID_TRANSITION';
  static const portCollision = 'PORT_COLLISION';
  static const canonicalLineCollision = 'CANONICAL_LINE_COLLISION';
}

class RepositoryIdentity {
  const RepositoryIdentity({
    required this.repositoryId,
    required this.generation,
  });

  final String repositoryId;
  final String generation;
}

class CapsuleIdentity {
  const CapsuleIdentity({
    required this.capsuleId,
    required this.sectionId,
    required this.type,
  });

  final String capsuleId;
  final String sectionId;
  final CapsuleType type;
}

class CapsuleDescriptor {
  const CapsuleDescriptor({
    required this.identity,
    required this.state,
    required this.mode,
    required this.schemaFingerprint,
    required this.imports,
    required this.exports,
    required this.dependencies,
    required this.canonicalLines,
    required this.runtimeFileCount,
    required this.portCount,
  });

  final CapsuleIdentity identity;
  final CapsuleState state;
  final CapsuleMode mode;
  final String schemaFingerprint;
  final List<ImportContract> imports;
  final List<ExportContract> exports;
  final List<DependencyContract> dependencies;
  final List<String> canonicalLines;
  final int runtimeFileCount;
  final int portCount;
}

class PlatformCapsuleDescriptor {
  const PlatformCapsuleDescriptor({
    required this.identity,
    required this.repository,
    required this.testPortId,
    required this.schemaFingerprint,
    required this.runtimeFiles,
    required this.registryCapsules,
    required this.canonicalLineCount,
  });

  final CapsuleIdentity identity;
  final RepositoryIdentity repository;
  final String testPortId;
  final String schemaFingerprint;
  final int runtimeFiles;
  final int registryCapsules;
  final int canonicalLineCount;
}

class CapsuleRegistryEntry {
  const CapsuleRegistryEntry({
    required this.descriptor,
    required this.packagePath,
  });

  final CapsuleDescriptor descriptor;
  final String packagePath;
}

class CapsuleRegistrySnapshot {
  const CapsuleRegistrySnapshot({
    required this.repository,
    required this.entries,
  });

  final RepositoryIdentity repository;
  final List<CapsuleRegistryEntry> entries;

  List<String> get capsuleIds {
    return entries
        .map((entry) => entry.descriptor.identity.capsuleId)
        .toList(growable: false);
  }
}

class RegistrySnapshot {
  const RegistrySnapshot({
    required this.capsules,
    required this.ports,
    required this.lines,
  });

  final CapsuleRegistrySnapshot capsules;
  final List<PortRegistryEntry> ports;
  final CanonicalLineRegistry lines;
}

class PortDescriptor {
  const PortDescriptor({
    required this.portId,
    required this.sectionId,
    required this.mode,
    required this.activatesCapsules,
  });

  final String portId;
  final String sectionId;
  final CapsuleMode mode;
  final bool activatesCapsules;
}

class PortRegistryEntry {
  const PortRegistryEntry({required this.descriptor, required this.state});

  final PortDescriptor descriptor;
  final CapsuleLifecycleState state;
}

class CanonicalLineDescriptor {
  const CanonicalLineDescriptor({
    required this.lineCode,
    required this.purpose,
  });

  final String lineCode;
  final String purpose;
}

class CanonicalLineRegistry {
  const CanonicalLineRegistry({required this.lines});

  final List<CanonicalLineDescriptor> lines;

  List<String> get lineCodes {
    return lines.map((line) => line.lineCode).toList(growable: false);
  }
}

class ImportContract {
  const ImportContract({
    required this.contractId,
    required this.lineCode,
    required this.required,
  });

  final String contractId;
  final String lineCode;
  final bool required;
}

class ExportContract {
  const ExportContract({
    required this.contractId,
    required this.lineCode,
    required this.provided,
  });

  final String contractId;
  final String lineCode;
  final bool provided;
}

class DependencyContract {
  const DependencyContract({required this.dependencyId, required this.allowed});

  final String dependencyId;
  final bool allowed;
}

class CompatibilityRequest {
  const CompatibilityRequest({
    required this.descriptor,
    required this.registry,
    required this.port,
    required this.expectedSchemaFingerprint,
    required this.manifestCapsuleId,
  });

  final CapsuleDescriptor descriptor;
  final CapsuleRegistrySnapshot registry;
  final PortDescriptor port;
  final String expectedSchemaFingerprint;
  final String manifestCapsuleId;
}

class CompatibilityFailure {
  const CompatibilityFailure({required this.code, required this.message});

  final String code;
  final String message;
}

class CompatibilityResult {
  const CompatibilityResult({required this.state, required this.failures});

  final CapsuleCompatibilityState state;
  final List<CompatibilityFailure> failures;

  bool get compatible => state == CapsuleCompatibilityState.compatible;
}

class MountRequest {
  const MountRequest({
    required this.capsuleId,
    required this.portId,
    required this.mode,
  });

  final String capsuleId;
  final String portId;
  final CapsuleMode mode;
}

class MountResult {
  const MountResult({
    required this.mounted,
    required this.state,
    required this.failures,
  });

  final bool mounted;
  final CapsuleLifecycleState state;
  final List<CompatibilityFailure> failures;
}

class ValidationRequest {
  const ValidationRequest({
    required this.registry,
    required this.lines,
    required this.ports,
  });

  final CapsuleRegistrySnapshot registry;
  final CanonicalLineRegistry lines;
  final List<PortRegistryEntry> ports;
}

class ValidationResult {
  const ValidationResult({required this.valid, required this.failures});

  final bool valid;
  final List<CompatibilityFailure> failures;
}

class DiagnosticSnapshot {
  const DiagnosticSnapshot({
    required this.capsuleCount,
    required this.portCount,
    required this.canonicalLineCount,
    required this.activeCapsules,
    required this.readonly,
  });

  final int capsuleCount;
  final int portCount;
  final int canonicalLineCount;
  final int activeCapsules;
  final bool readonly;
}

class HealthSnapshot {
  const HealthSnapshot({
    required this.state,
    required this.compatible,
    required this.manualVerificationRequired,
  });

  final CapsuleLifecycleState state;
  final bool compatible;
  final bool manualVerificationRequired;
}

class PlatformCapsuleRegistry {
  const PlatformCapsuleRegistry({required this.snapshot});

  final CapsuleRegistrySnapshot snapshot;

  CapsuleRegistryEntry? findById(String capsuleId) {
    for (final entry in snapshot.entries) {
      if (entry.descriptor.identity.capsuleId == capsuleId) {
        return entry;
      }
    }
    return null;
  }
}

class PlatformCompatibilityEngine {
  const PlatformCompatibilityEngine({
    required this.allowedLines,
    required this.forbiddenDependencies,
  });

  final Set<String> allowedLines;
  final Set<String> forbiddenDependencies;

  CompatibilityResult validate(CompatibilityRequest request) {
    final failures = <CompatibilityFailure>[];
    void add(String code, String message) {
      failures.add(CompatibilityFailure(code: code, message: message));
    }

    if (!request.registry.capsuleIds.contains(
      request.descriptor.identity.capsuleId,
    )) {
      add(PlatformCapsuleFailureCode.unknownCapsule, 'Unknown capsule.');
    }
    if (request.manifestCapsuleId != request.descriptor.identity.capsuleId) {
      add(
        PlatformCapsuleFailureCode.manifestParityFailed,
        'Manifest capsule ID mismatch.',
      );
    }
    if (request.descriptor.schemaFingerprint !=
        request.expectedSchemaFingerprint) {
      add(
        PlatformCapsuleFailureCode.schemaFingerprintMismatch,
        'Schema fingerprint mismatch.',
      );
    }
    if (request.port.mode != CapsuleMode.test ||
        request.port.activatesCapsules) {
      add(
        PlatformCapsuleFailureCode.modeNotAllowed,
        'Only non-activating test ports are allowed.',
      );
    }
    if (request.port.sectionId != request.descriptor.identity.sectionId) {
      add(PlatformCapsuleFailureCode.sectionMismatch, 'Port section mismatch.');
    }
    for (final line in request.descriptor.canonicalLines) {
      if (!allowedLines.contains(line)) {
        add(
          PlatformCapsuleFailureCode.canonicalLineMismatch,
          'Canonical line is not allowed.',
        );
      }
    }
    for (final dependency in request.descriptor.dependencies) {
      if (!dependency.allowed ||
          forbiddenDependencies.contains(dependency.dependencyId)) {
        add(
          PlatformCapsuleFailureCode.forbiddenDependency,
          'Forbidden dependency present.',
        );
      }
    }
    if (request.descriptor.imports.any((contract) => !contract.required)) {
      add(
        PlatformCapsuleFailureCode.importMismatch,
        'Import contract mismatch.',
      );
    }
    if (request.descriptor.exports.any((contract) => !contract.provided)) {
      add(
        PlatformCapsuleFailureCode.exportMismatch,
        'Export contract mismatch.',
      );
    }

    return CompatibilityResult(
      state: failures.isEmpty
          ? CapsuleCompatibilityState.compatible
          : CapsuleCompatibilityState.incompatible,
      failures: List<CompatibilityFailure>.unmodifiable(failures),
    );
  }
}

class PlatformValidationEngine {
  const PlatformValidationEngine();

  ValidationResult validate(ValidationRequest request) {
    final failures = <CompatibilityFailure>[];
    final seenCapsules = <String>{};
    for (final id in request.registry.capsuleIds) {
      if (!seenCapsules.add(id)) {
        failures.add(
          const CompatibilityFailure(
            code: PlatformCapsuleFailureCode.duplicateCapsuleId,
            message: 'Duplicate capsule ID.',
          ),
        );
      }
    }

    final seenPorts = <String>{};
    for (final port in request.ports) {
      if (!seenPorts.add(port.descriptor.portId)) {
        failures.add(
          const CompatibilityFailure(
            code: PlatformCapsuleFailureCode.portCollision,
            message: 'Duplicate port ID.',
          ),
        );
      }
    }

    final seenLines = <String>{};
    for (final line in request.lines.lineCodes) {
      if (!seenLines.add(line)) {
        failures.add(
          const CompatibilityFailure(
            code: PlatformCapsuleFailureCode.canonicalLineCollision,
            message: 'Duplicate canonical line.',
          ),
        );
      }
    }

    return ValidationResult(
      valid: failures.isEmpty,
      failures: List<CompatibilityFailure>.unmodifiable(failures),
    );
  }
}

class PlatformLifecycleManager {
  const PlatformLifecycleManager();

  bool canTransition(CapsuleLifecycleState from, CapsuleLifecycleState to) {
    return switch (from) {
      CapsuleLifecycleState.designedNotImplemented =>
        to == CapsuleLifecycleState.packageReady,
      CapsuleLifecycleState.packageReady =>
        to == CapsuleLifecycleState.mountedTest ||
            to == CapsuleLifecycleState.incompatible,
      CapsuleLifecycleState.mountedTest =>
        to == CapsuleLifecycleState.manualVerificationPending ||
            to == CapsuleLifecycleState.incompatible,
      CapsuleLifecycleState.manualVerificationPending =>
        to == CapsuleLifecycleState.manualVerificationPassed ||
            to == CapsuleLifecycleState.rejected,
      CapsuleLifecycleState.manualVerificationPassed =>
        to == CapsuleLifecycleState.eligibleForActivation,
      CapsuleLifecycleState.eligibleForActivation =>
        to == CapsuleLifecycleState.suspended,
      CapsuleLifecycleState.active => to == CapsuleLifecycleState.suspended,
      CapsuleLifecycleState.suspended =>
        to == CapsuleLifecycleState.eligibleForActivation ||
            to == CapsuleLifecycleState.rejected,
      CapsuleLifecycleState.rejected => false,
      CapsuleLifecycleState.incompatible => false,
    };
  }
}

class PlatformMountManager {
  const PlatformMountManager({required this.lifecycle});

  final PlatformLifecycleManager lifecycle;

  MountResult mountTest({
    required MountRequest request,
    required CompatibilityResult compatibility,
  }) {
    if (request.mode != CapsuleMode.test ||
        request.portId != PlatformCapsuleDefaults.testPort.portId) {
      return const MountResult(
        mounted: false,
        state: CapsuleLifecycleState.incompatible,
        failures: <CompatibilityFailure>[
          CompatibilityFailure(
            code: PlatformCapsuleFailureCode.invalidMount,
            message: 'Invalid platform test mount.',
          ),
        ],
      );
    }
    if (!compatibility.compatible) {
      return MountResult(
        mounted: false,
        state: CapsuleLifecycleState.incompatible,
        failures: compatibility.failures,
      );
    }
    if (!lifecycle.canTransition(
      CapsuleLifecycleState.packageReady,
      CapsuleLifecycleState.mountedTest,
    )) {
      return const MountResult(
        mounted: false,
        state: CapsuleLifecycleState.incompatible,
        failures: <CompatibilityFailure>[
          CompatibilityFailure(
            code: PlatformCapsuleFailureCode.invalidTransition,
            message: 'Invalid lifecycle transition.',
          ),
        ],
      );
    }
    return const MountResult(
      mounted: true,
      state: CapsuleLifecycleState.mountedTest,
      failures: <CompatibilityFailure>[],
    );
  }
}

class RegistryHostAdapter {
  const RegistryHostAdapter(this.registry);

  final PlatformCapsuleRegistry registry;

  CapsuleRegistrySnapshot readSnapshot() => registry.snapshot;
}

class ManifestHostAdapter {
  const ManifestHostAdapter(this.descriptor);

  final PlatformCapsuleDescriptor descriptor;

  PlatformCapsuleDescriptor readDescriptor() => descriptor;
}

class CompatibilityHostAdapter {
  const CompatibilityHostAdapter(this.engine);

  final PlatformCompatibilityEngine engine;

  CompatibilityResult validate(CompatibilityRequest request) {
    return engine.validate(request);
  }
}

class DiagnosticsHostAdapter {
  const DiagnosticsHostAdapter();

  DiagnosticSnapshot diagnosticSnapshot(RegistrySnapshot snapshot) {
    return DiagnosticSnapshot(
      capsuleCount: snapshot.capsules.entries.length,
      portCount: snapshot.ports.length,
      canonicalLineCount: snapshot.lines.lines.length,
      activeCapsules: snapshot.capsules.entries
          .where((entry) => entry.descriptor.state == CapsuleState.active)
          .length,
      readonly: true,
    );
  }

  HealthSnapshot healthSnapshot(bool compatible) {
    return HealthSnapshot(
      state: compatible
          ? CapsuleLifecycleState.manualVerificationPending
          : CapsuleLifecycleState.incompatible,
      compatible: compatible,
      manualVerificationRequired: true,
    );
  }
}

class PlatformCapsuleDefaults {
  const PlatformCapsuleDefaults._();

  static const repository = RepositoryIdentity(
    repositoryId: 'MS-PLATFORM-DNA-V1-PRO',
    generation: 'Mental Smile Platform DNA V1 Pro',
  );

  static const platformIdentity = CapsuleIdentity(
    capsuleId: 'MS-CAPSULE-PLATFORM-INFRASTRUCTURE',
    sectionId: 'PLATFORM',
    type: CapsuleType.platform,
  );

  static const platformSchemaFingerprint =
      'MS-CAPSULE-PLATFORM-INFRASTRUCTURE|capsules:4|ports:1|lines:11|contracts:3|lifecycle:10|host:readonly|runtime:0';

  static const testPort = PortDescriptor(
    portId: 'MS-PORT-PLATFORM-TEST-01',
    sectionId: 'PLATFORM',
    mode: CapsuleMode.test,
    activatesCapsules: false,
  );

  static const canonicalLines = CanonicalLineRegistry(
    lines: <CanonicalLineDescriptor>[
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-IDENTITY-01',
        purpose: 'Capsule identity',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-REGISTRY-01',
        purpose: 'Capsule registry',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-MANIFEST-01',
        purpose: 'Capsule manifest',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-CONTRACT-01',
        purpose: 'Import/export/dependency contracts',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-COMPATIBILITY-01',
        purpose: 'Compatibility engine',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-VALIDATION-01',
        purpose: 'Validation engine',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-MOUNT-01',
        purpose: 'Mount manager',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-LIFECYCLE-01',
        purpose: 'Lifecycle manager',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-PORT-01',
        purpose: 'Port registry',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-DIAGNOSTIC-01',
        purpose: 'Diagnostics snapshot',
      ),
      CanonicalLineDescriptor(
        lineCode: 'MS-LINE-HEALTH-01',
        purpose: 'Health snapshot',
      ),
    ],
  );

  static const platformDescriptor = PlatformCapsuleDescriptor(
    identity: platformIdentity,
    repository: repository,
    testPortId: 'MS-PORT-PLATFORM-TEST-01',
    schemaFingerprint: platformSchemaFingerprint,
    runtimeFiles: 0,
    registryCapsules: 4,
    canonicalLineCount: 11,
  );

  static const platformCapsuleDescriptor = CapsuleDescriptor(
    identity: platformIdentity,
    state: CapsuleState.packageReady,
    mode: CapsuleMode.test,
    schemaFingerprint: platformSchemaFingerprint,
    imports: <ImportContract>[
      ImportContract(
        contractId: 'MS-PLATFORM-CONTRACT-IDENTITY-01',
        lineCode: 'MS-LINE-IDENTITY-01',
        required: true,
      ),
    ],
    exports: <ExportContract>[
      ExportContract(
        contractId: 'MS-PLATFORM-CONTRACT-COMPATIBILITY-01',
        lineCode: 'MS-LINE-COMPATIBILITY-01',
        provided: true,
      ),
      ExportContract(
        contractId: 'MS-PLATFORM-CONTRACT-MOUNT-01',
        lineCode: 'MS-LINE-MOUNT-01',
        provided: true,
      ),
    ],
    dependencies: <DependencyContract>[],
    canonicalLines: <String>[
      'MS-LINE-IDENTITY-01',
      'MS-LINE-REGISTRY-01',
      'MS-LINE-MANIFEST-01',
      'MS-LINE-CONTRACT-01',
      'MS-LINE-COMPATIBILITY-01',
      'MS-LINE-VALIDATION-01',
      'MS-LINE-MOUNT-01',
      'MS-LINE-LIFECYCLE-01',
      'MS-LINE-PORT-01',
      'MS-LINE-DIAGNOSTIC-01',
      'MS-LINE-HEALTH-01',
    ],
    runtimeFileCount: 0,
    portCount: 1,
  );

  static const registrySnapshot = CapsuleRegistrySnapshot(
    repository: repository,
    entries: <CapsuleRegistryEntry>[
      CapsuleRegistryEntry(
        descriptor: platformCapsuleDescriptor,
        packagePath: 'capsules/platform/package',
      ),
      CapsuleRegistryEntry(
        descriptor: CapsuleDescriptor(
          identity: CapsuleIdentity(
            capsuleId: 'MS-CAPSULE-RES-R-1.07.2026',
            sectionId: 'MS-SECTION-RESIDENTIAL',
            type: CapsuleType.residential,
          ),
          state: CapsuleState.manualVerificationPassed,
          mode: CapsuleMode.test,
          schemaFingerprint:
              'MS-CAPSULE-RES-R-1.07.2026|contract:1|routes:14|core:3|local:58|assets:60|l10n:238|speech:48|lines:7',
          imports: <ImportContract>[],
          exports: <ExportContract>[],
          dependencies: <DependencyContract>[],
          canonicalLines: <String>[],
          runtimeFileCount: 0,
          portCount: 2,
        ),
        packagePath: 'capsules/residential/package',
      ),
      CapsuleRegistryEntry(
        descriptor: CapsuleDescriptor(
          identity: CapsuleIdentity(
            capsuleId: 'MS-CAPSULE-COM-BLUEPRINT',
            sectionId: 'COMMERCIAL',
            type: CapsuleType.commercial,
          ),
          state: CapsuleState.manualVerificationPassed,
          mode: CapsuleMode.test,
          schemaFingerprint:
              'MS-CAPSULE-COM-BLUEPRINT|contract:1|routes:18|core:4|local:7|assets:39|l10n:47|speech:17:2:15|firebase:5|storage:2|lines:11',
          imports: <ImportContract>[],
          exports: <ExportContract>[],
          dependencies: <DependencyContract>[],
          canonicalLines: <String>[],
          runtimeFileCount: 0,
          portCount: 2,
        ),
        packagePath: 'capsules/commercial/package',
      ),
      CapsuleRegistryEntry(
        descriptor: CapsuleDescriptor(
          identity: CapsuleIdentity(
            capsuleId: 'MS-CAPSULE-LIB-BLUEPRINT',
            sectionId: 'LIBRARY',
            type: CapsuleType.library,
          ),
          state: CapsuleState.manualVerificationPassed,
          mode: CapsuleMode.test,
          schemaFingerprint:
              'MS-CAPSULE-LIB-BLUEPRINT|contract:1|runtime:28|routes:5|core:1|local:22|assets:32|l10n:14|speech:25:2:23|content:1:3:0|firebase:2|storage:0|lines:8',
          imports: <ImportContract>[],
          exports: <ExportContract>[],
          dependencies: <DependencyContract>[],
          canonicalLines: <String>[],
          runtimeFileCount: 0,
          portCount: 2,
        ),
        packagePath: 'capsules/library/package',
      ),
    ],
  );

  static const forbiddenDependencies = <String>{
    'residential_runtime',
    'commercial_runtime',
    'library_runtime',
    'firebase',
    'dart:mirrors',
    'dynamic_code_loading',
    'filesystem_runtime_scan',
  };
}

class PlatformCapsuleTestPort {
  PlatformCapsuleTestPort({
    PlatformCompatibilityEngine? compatibility,
    PlatformValidationEngine? validation,
    PlatformMountManager? mountManager,
  }) : compatibility =
           compatibility ??
           PlatformCompatibilityEngine(
             allowedLines: PlatformCapsuleDefaults.canonicalLines.lineCodes
                 .toSet(),
             forbiddenDependencies:
                 PlatformCapsuleDefaults.forbiddenDependencies,
           ),
       validation = validation ?? const PlatformValidationEngine(),
       mountManager =
           mountManager ??
           const PlatformMountManager(lifecycle: PlatformLifecycleManager());

  final PlatformCompatibilityEngine compatibility;
  final PlatformValidationEngine validation;
  final PlatformMountManager mountManager;

  CompatibilityResult validatePlatformCapsule() {
    return compatibility.validate(
      const CompatibilityRequest(
        descriptor: PlatformCapsuleDefaults.platformCapsuleDescriptor,
        registry: PlatformCapsuleDefaults.registrySnapshot,
        port: PlatformCapsuleDefaults.testPort,
        expectedSchemaFingerprint:
            PlatformCapsuleDefaults.platformSchemaFingerprint,
        manifestCapsuleId: 'MS-CAPSULE-PLATFORM-INFRASTRUCTURE',
      ),
    );
  }

  MountResult mountTest() {
    final result = validatePlatformCapsule();
    return mountManager.mountTest(
      request: const MountRequest(
        capsuleId: 'MS-CAPSULE-PLATFORM-INFRASTRUCTURE',
        portId: 'MS-PORT-PLATFORM-TEST-01',
        mode: CapsuleMode.test,
      ),
      compatibility: result,
    );
  }

  DiagnosticSnapshot diagnosticSnapshot() {
    final snapshot = RegistrySnapshot(
      capsules: PlatformCapsuleDefaults.registrySnapshot,
      ports: const <PortRegistryEntry>[
        PortRegistryEntry(
          descriptor: PlatformCapsuleDefaults.testPort,
          state: CapsuleLifecycleState.manualVerificationPending,
        ),
      ],
      lines: PlatformCapsuleDefaults.canonicalLines,
    );
    return const DiagnosticsHostAdapter().diagnosticSnapshot(snapshot);
  }
}
