import 'package:flutter/material.dart';

import 'capsule_compatibility_report.dart';
import 'capsule_mode.dart';
import 'capsule_mount_result.dart';
import 'commercial_test_host_adapters.dart';

class CommercialCapsuleTestPortConstants {
  const CommercialCapsuleTestPortConstants._();

  static const testPortId = 'MS-PORT-COM-TEST-01';
  static const activePortId = 'MS-PORT-COM-ACTIVE-01';
  static const testRoute = '/__capsule_test/commercial';
  static const sectionId = 'COMMERCIAL';
  static const instanceId = 'MS-PORT-COM-TEST-01-LOCAL';
  static const localStatePrefix = 'ms_capsule_com_test_01_';
  static const activeState = 'DESIGNED_NOT_IMPLEMENTED';
}

enum CommercialTestCapsuleMode { unmounted, test, active, disabled }

class CommercialTestCapsuleDescriptor {
  const CommercialTestCapsuleDescriptor({
    required this.capsuleId,
    required this.sectionId,
    required this.contractVersion,
    required this.supportedPortIds,
    required this.canonicalLines,
    required this.requiredHostImports,
    required this.providedExports,
    required this.routeCount,
    required this.coreSignalCount,
    required this.localSignalCount,
    required this.assetCount,
    required this.localizationKeyCount,
    required this.speechControlCount,
    required this.connectedSpeechCount,
    required this.pendingSpeechCount,
    required this.firebaseUsageCount,
    required this.storageUsageCount,
    required this.schemaFingerprint,
    required this.mode,
    this.usedReservedLines = const <String>[],
    this.forbiddenImports = const <String>[],
    this.forbiddenFeatureCount = 0,
    this.legacyResidueCount = 0,
  });

  final String capsuleId;
  final String sectionId;
  final int contractVersion;
  final List<String> supportedPortIds;
  final List<String> canonicalLines;
  final List<String> requiredHostImports;
  final List<String> providedExports;
  final int routeCount;
  final int coreSignalCount;
  final int localSignalCount;
  final int assetCount;
  final int localizationKeyCount;
  final int speechControlCount;
  final int connectedSpeechCount;
  final int pendingSpeechCount;
  final int firebaseUsageCount;
  final int storageUsageCount;
  final String schemaFingerprint;
  final CommercialTestCapsuleMode mode;
  final List<String> usedReservedLines;
  final List<String> forbiddenImports;
  final int forbiddenFeatureCount;
  final int legacyResidueCount;

  CommercialTestCapsuleDescriptor copyWith({
    String? capsuleId,
    String? sectionId,
    int? contractVersion,
    List<String>? supportedPortIds,
    List<String>? canonicalLines,
    List<String>? requiredHostImports,
    List<String>? providedExports,
    int? routeCount,
    int? coreSignalCount,
    int? localSignalCount,
    int? assetCount,
    int? localizationKeyCount,
    int? speechControlCount,
    int? connectedSpeechCount,
    int? pendingSpeechCount,
    int? firebaseUsageCount,
    int? storageUsageCount,
    String? schemaFingerprint,
    CommercialTestCapsuleMode? mode,
    List<String>? usedReservedLines,
    List<String>? forbiddenImports,
    int? forbiddenFeatureCount,
    int? legacyResidueCount,
  }) {
    return CommercialTestCapsuleDescriptor(
      capsuleId: capsuleId ?? this.capsuleId,
      sectionId: sectionId ?? this.sectionId,
      contractVersion: contractVersion ?? this.contractVersion,
      supportedPortIds: supportedPortIds ?? this.supportedPortIds,
      canonicalLines: canonicalLines ?? this.canonicalLines,
      requiredHostImports: requiredHostImports ?? this.requiredHostImports,
      providedExports: providedExports ?? this.providedExports,
      routeCount: routeCount ?? this.routeCount,
      coreSignalCount: coreSignalCount ?? this.coreSignalCount,
      localSignalCount: localSignalCount ?? this.localSignalCount,
      assetCount: assetCount ?? this.assetCount,
      localizationKeyCount: localizationKeyCount ?? this.localizationKeyCount,
      speechControlCount: speechControlCount ?? this.speechControlCount,
      connectedSpeechCount: connectedSpeechCount ?? this.connectedSpeechCount,
      pendingSpeechCount: pendingSpeechCount ?? this.pendingSpeechCount,
      firebaseUsageCount: firebaseUsageCount ?? this.firebaseUsageCount,
      storageUsageCount: storageUsageCount ?? this.storageUsageCount,
      schemaFingerprint: schemaFingerprint ?? this.schemaFingerprint,
      mode: mode ?? this.mode,
      usedReservedLines: usedReservedLines ?? this.usedReservedLines,
      forbiddenImports: forbiddenImports ?? this.forbiddenImports,
      forbiddenFeatureCount:
          forbiddenFeatureCount ?? this.forbiddenFeatureCount,
      legacyResidueCount: legacyResidueCount ?? this.legacyResidueCount,
    );
  }
}

class CommercialTestCapsuleDescriptorProvider {
  const CommercialTestCapsuleDescriptorProvider._();

  static const schemaFingerprint =
      'MS-CAPSULE-COM-BLUEPRINT|contract:1|routes:18|core:4|local:7|assets:39|l10n:47|speech:17:2:15|firebase:5|storage:2|lines:11';

  static const canonicalLines = <String>[
    'MS-LINE-LIFECYCLE-01',
    'MS-LINE-ROUTE-01',
    'MS-LINE-AUTH-01',
    'MS-LINE-DATA-READ-01',
    'MS-LINE-DATA-WRITE-01',
    'MS-LINE-STORAGE-01',
    'MS-LINE-SIGNAL-01',
    'MS-LINE-LOCALIZATION-01',
    'MS-LINE-ASSET-01',
    'MS-LINE-EXTERNAL-ACTION-01',
    'MS-LINE-ERROR-01',
  ];

  static const reservedLines = <String>[
    'MS-LINE-EXT-01',
    'MS-LINE-EXT-02',
    'MS-LINE-EXT-03',
  ];

  static const requiredHostImports = <String>[
    'MS-COM-IMPORT-001',
    'MS-COM-IMPORT-002',
    'MS-COM-IMPORT-003',
    'MS-COM-IMPORT-004',
    'MS-COM-IMPORT-005',
    'MS-COM-IMPORT-006',
    'MS-COM-IMPORT-007',
    'MS-COM-IMPORT-008',
    'MS-COM-IMPORT-009',
    'MS-COM-IMPORT-010',
    'MS-COM-IMPORT-011',
    'MS-COM-IMPORT-012',
    'MS-COM-IMPORT-013',
    'MS-COM-IMPORT-014',
    'MS-COM-IMPORT-015',
    'MS-COM-IMPORT-016',
    'MS-COM-IMPORT-017',
  ];

  static const providedExports = <String>[
    'MS-COM-EXPORT-001',
    'MS-COM-EXPORT-002',
    'MS-COM-EXPORT-003',
    'MS-COM-EXPORT-004',
    'MS-COM-EXPORT-005',
    'MS-COM-EXPORT-006',
    'MS-COM-EXPORT-007',
    'MS-COM-EXPORT-008',
    'MS-COM-EXPORT-009',
    'MS-COM-EXPORT-010',
    'MS-COM-EXPORT-011',
    'MS-COM-EXPORT-012',
    'MS-COM-EXPORT-013',
    'MS-COM-EXPORT-014',
    'MS-COM-EXPORT-015',
    'MS-COM-EXPORT-016',
    'MS-COM-EXPORT-017',
    'MS-COM-EXPORT-018',
    'MS-COM-EXPORT-SIGNAL-001',
    'MS-COM-EXPORT-PROFILE-001',
  ];

  static const routePaths = <String>[
    '/',
    '/commercial/access',
    '/commercial/specialist/login',
    '/commercial/specialist/register',
    '/commercial/center/login',
    '/commercial/center/register',
    '/commercial/room',
    '/commercial/specialist/professional-profile',
    '/commercial/specialist/professional-library',
    '/commercial/center/room',
    '/commercial/center/professional-profile',
    '/commercial/center/professional-library',
    '/commercial/tools/assistive',
    '/commercial/public-accounts',
    '/commercial-v2/web',
    '/landing-preview',
    '/g2/mobile/specialist-room',
    '/g2/mobile/center-room',
  ];

  static const descriptor = CommercialTestCapsuleDescriptor(
    capsuleId: 'MS-CAPSULE-COM-BLUEPRINT',
    sectionId: CommercialCapsuleTestPortConstants.sectionId,
    contractVersion: 1,
    supportedPortIds: <String>[
      CommercialCapsuleTestPortConstants.testPortId,
      CommercialCapsuleTestPortConstants.activePortId,
    ],
    canonicalLines: canonicalLines,
    requiredHostImports: requiredHostImports,
    providedExports: providedExports,
    routeCount: 18,
    coreSignalCount: 4,
    localSignalCount: 7,
    assetCount: 39,
    localizationKeyCount: 47,
    speechControlCount: 17,
    connectedSpeechCount: 2,
    pendingSpeechCount: 15,
    firebaseUsageCount: 5,
    storageUsageCount: 2,
    schemaFingerprint: schemaFingerprint,
    mode: CommercialTestCapsuleMode.unmounted,
  );
}

class CommercialCompatibilityPolicy {
  const CommercialCompatibilityPolicy();

  CapsuleCompatibilityReport validate({
    required CommercialTestCapsuleDescriptor descriptor,
    required String portId,
    bool activePromotion = false,
  }) {
    final issues = <CapsuleCompatibilityIssue>[];

    void add(String code, String message, [String? detail]) {
      issues.add(CapsuleCompatibilityIssue(
        code: code,
        message: message,
        detail: detail,
      ));
    }

    if (descriptor.capsuleId != 'MS-CAPSULE-COM-BLUEPRINT') {
      add(CapsuleCompatibilityFailureCode.capsuleIdMismatch,
          'Commercial capsule ID is not the approved temporary ID.');
    }
    if (descriptor.sectionId != CommercialCapsuleTestPortConstants.sectionId) {
      add(CapsuleCompatibilityFailureCode.sectionIdMismatch,
          'Commercial section ID mismatch.');
    }
    if (!descriptor.supportedPortIds.contains(portId) ||
        portId != CommercialCapsuleTestPortConstants.testPortId) {
      add(CapsuleCompatibilityFailureCode.portIdMismatch,
          'Commercial descriptor does not support the test port.');
    }
    final modeAllowed =
        descriptor.mode == CommercialTestCapsuleMode.unmounted ||
            descriptor.mode == CommercialTestCapsuleMode.test;
    if (!modeAllowed) {
      add(CapsuleCompatibilityFailureCode.modeNotAllowed,
          'Commercial capsule mode is not mountable on the test port.');
    }
    if (descriptor.contractVersion != 1) {
      add(CapsuleCompatibilityFailureCode.contractVersionMismatch,
          'Commercial contract version mismatch.');
    }
    for (final line in descriptor.canonicalLines) {
      if (CommercialTestCapsuleDescriptorProvider.reservedLines
          .contains(line)) {
        add(CapsuleCompatibilityFailureCode.reservedLineUsed,
            'Reserved line used.', line);
      } else if (!CommercialTestCapsuleDescriptorProvider.canonicalLines
          .contains(line)) {
        add(CapsuleCompatibilityFailureCode.lineNotAllowed,
            'Commercial line is not allowed.', line);
      }
    }
    if (descriptor.canonicalLines.length != 11) {
      add(CapsuleCompatibilityFailureCode.lineNotAllowed,
          'Commercial canonical line count must be 11.');
    }
    if (descriptor.usedReservedLines.isNotEmpty) {
      add(CapsuleCompatibilityFailureCode.reservedLineUsed,
          'Reserved extension lines must remain unused.');
    }
    if (descriptor.requiredHostImports.length != 17) {
      add(CapsuleCompatibilityFailureCode.requiredImportMissing,
          'Commercial host import count must be 17.');
    }
    if (descriptor.providedExports.length != 20) {
      add(CapsuleCompatibilityFailureCode.requiredExportMissing,
          'Commercial export count must be 20.');
    }
    if (descriptor.routeCount != 18) {
      add(CapsuleCompatibilityFailureCode.routeCountMismatch,
          'Commercial route count must be 18.');
    }
    if (descriptor.coreSignalCount != 4 || descriptor.localSignalCount != 7) {
      add(CapsuleCompatibilityFailureCode.signalCountMismatch,
          'Commercial signal counts must be 4 core and 7 local.');
    }
    if (descriptor.assetCount != 39) {
      add(CapsuleCompatibilityFailureCode.assetCountMismatch,
          'Commercial asset count must be 39.');
    }
    if (descriptor.localizationKeyCount != 47) {
      add(CapsuleCompatibilityFailureCode.localizationCountMismatch,
          'Commercial localization key count must be 47.');
    }
    if (descriptor.speechControlCount != 17 ||
        descriptor.connectedSpeechCount != 2 ||
        descriptor.pendingSpeechCount != 15) {
      add(CapsuleCompatibilityFailureCode.speechStateMismatch,
          'Commercial speech state must be 17 total, 2 connected, 15 pending.');
    }
    if (activePromotion &&
        (descriptor.connectedSpeechCount != 17 ||
            descriptor.pendingSpeechCount != 0)) {
      add(CapsuleCompatibilityFailureCode.speechStateMismatch,
          'ACTIVE_PROMOTION_BLOCKED_UNTIL_17_CONNECTED');
    }
    if (descriptor.firebaseUsageCount != 5) {
      add(CapsuleCompatibilityFailureCode.firebaseContractMismatch,
          'Commercial Firebase usage count must be 5 via host contracts.');
    }
    if (descriptor.storageUsageCount != 2) {
      add(CapsuleCompatibilityFailureCode.storageContractMismatch,
          'Commercial Storage usage count must be 2 via host contracts.');
    }
    if (descriptor.forbiddenImports.isNotEmpty) {
      add(CapsuleCompatibilityFailureCode.forbiddenDependency,
          'Forbidden direct dependency import present.');
    }
    if (descriptor.schemaFingerprint !=
        CommercialTestCapsuleDescriptorProvider.schemaFingerprint) {
      add(CapsuleCompatibilityFailureCode.schemaFingerprintMismatch,
          'Commercial schema fingerprint mismatch.');
    }
    if (descriptor.forbiddenFeatureCount != 0) {
      add(CapsuleCompatibilityFailureCode.forbiddenFeaturePresent,
          'Forbidden Commercial feature is present.');
    }
    if (descriptor.legacyResidueCount != 0) {
      add(CapsuleCompatibilityFailureCode.legacyResiduePresent,
          'Legacy Commercial residue is present.');
    }

    if (issues.isEmpty) {
      return CapsuleCompatibilityReport.pass(portId);
    }
    return CapsuleCompatibilityReport(
      portId: portId,
      compatible: false,
      issues: List<CapsuleCompatibilityIssue>.unmodifiable(issues),
    );
  }
}

class CommercialCapsuleTestMountController {
  CommercialCapsuleTestMountController({
    CommercialTestCapsuleDescriptor? descriptor,
    CommercialCompatibilityPolicy? policy,
    CommercialTestHostAdapters? adapters,
  })  : descriptor =
            descriptor ?? CommercialTestCapsuleDescriptorProvider.descriptor,
        policy = policy ?? const CommercialCompatibilityPolicy(),
        adapters = adapters ?? createDefaultAdapters();

  final CommercialTestCapsuleDescriptor descriptor;
  final CommercialCompatibilityPolicy policy;
  final CommercialTestHostAdapters adapters;

  CapsuleMountState state = CapsuleMountState.unmounted;
  CapsuleCompatibilityReport? lastReport;

  Future<CapsuleMountResult> mount() async {
    state = CapsuleMountState.validating;
    final report = policy.validate(
      descriptor: descriptor,
      portId: CommercialCapsuleTestPortConstants.testPortId,
    );
    lastReport = report;
    if (!report.compatible) {
      state = CapsuleMountState.incompatible;
      return CapsuleMountResult(
        mounted: false,
        mountState: state,
        report: report,
      );
    }

    state = CapsuleMountState.ready;
    state = CapsuleMountState.mounting;
    adapters.lifecycle.initialize();
    adapters.routes.register(
      CommercialTestCapsuleDescriptorProvider.routePaths,
    );
    state = CapsuleMountState.mountedTest;
    return CapsuleMountResult(
      mounted: true,
      mountState: state,
      report: report,
    );
  }

  Future<void> unmount({bool discardTestUploads = true}) async {
    state = CapsuleMountState.unmounting;
    await adapters.speech.stop();
    if (discardTestUploads) {
      adapters.storage.discardTestUploads();
    }
    adapters.signals.flushLocalOnly();
    adapters.disposeListenersAndControllers();
    state = CapsuleMountState.unmounted;
  }

  static CommercialTestHostAdapters createDefaultAdapters() {
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
}

class CommercialCapsuleTestRoute extends StatefulWidget {
  const CommercialCapsuleTestRoute({
    super.key,
    this.controller,
  });

  final CommercialCapsuleTestMountController? controller;

  @override
  State<CommercialCapsuleTestRoute> createState() =>
      _CommercialCapsuleTestRouteState();
}

class _CommercialCapsuleTestRouteState
    extends State<CommercialCapsuleTestRoute> {
  late final CommercialCapsuleTestMountController _controller =
      widget.controller ?? CommercialCapsuleTestMountController();
  late final Future<CapsuleMountResult> _mount = _controller.mount();

  @override
  void dispose() {
    _controller.unmount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CapsuleMountResult>(
      future: _mount,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final result = snapshot.data!;
        if (!result.mounted) {
          return _CommercialCapsuleBlocked(report: result.report);
        }
        return const Column(
          children: [
            _CommercialCapsuleTestMarker(),
            Expanded(child: _CommercialCapsuleMountedView()),
          ],
        );
      },
    );
  }
}

class _CommercialCapsuleMountedView extends StatelessWidget {
  const _CommercialCapsuleMountedView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Commercial capsule test entry mounted'),
      ),
    );
  }
}

class _CommercialCapsuleBlocked extends StatelessWidget {
  const _CommercialCapsuleBlocked({required this.report});

  final CapsuleCompatibilityReport report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Commercial capsule test port blocked: '
          '${report.failureCodes.join(', ')}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CommercialCapsuleTestMarker extends StatelessWidget {
  const _CommercialCapsuleTestMarker();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF161616),
      child: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text(
            'COMMERCIAL CAPSULE - TEST',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFD47A),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}
