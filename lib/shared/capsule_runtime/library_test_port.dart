import 'package:flutter/material.dart';

import 'capsule_compatibility_report.dart';
import 'capsule_mode.dart';
import 'capsule_mount_result.dart';
import 'library_test_host_adapters.dart';

class LibraryCapsuleTestPortConstants {
  const LibraryCapsuleTestPortConstants._();

  static const testPortId = 'MS-PORT-LIB-TEST-01';
  static const activePortId = 'MS-PORT-LIB-ACTIVE-01';
  static const testRoute = '/__capsule_test/library';
  static const sectionId = 'LIBRARY';
  static const instanceId = 'MS-PORT-LIB-TEST-01-LOCAL';
  static const localStatePrefix = 'ms_capsule_lib_test_01_';
  static const activeState = 'DESIGNED_NOT_IMPLEMENTED';
}

enum LibraryTestCapsuleMode { unmounted, test, active, disabled }

class LibraryTestCapsuleDescriptor {
  const LibraryTestCapsuleDescriptor({
    required this.capsuleId,
    required this.sectionId,
    required this.supportedPortIds,
    required this.canonicalLines,
    required this.requiredHostImports,
    required this.providedExports,
    required this.runtimeFileCount,
    required this.routeCount,
    required this.coreSignalCount,
    required this.localSignalCount,
    required this.assetCount,
    required this.localizationKeyCount,
    required this.speechControlCount,
    required this.connectedSpeechCount,
    required this.pendingSpeechCount,
    required this.runtimeContentCount,
    required this.editorialSourceCount,
    required this.organizationReferenceCount,
    required this.firebaseContractCount,
    required this.storageContractCount,
    required this.schemaFingerprint,
    required this.mode,
    this.usedReservedLines = const <String>[],
    this.forbiddenImports = const <String>[],
    this.unmappedItems = 0,
  });

  final String capsuleId;
  final String sectionId;
  final List<String> supportedPortIds;
  final List<String> canonicalLines;
  final List<String> requiredHostImports;
  final List<String> providedExports;
  final int runtimeFileCount;
  final int routeCount;
  final int coreSignalCount;
  final int localSignalCount;
  final int assetCount;
  final int localizationKeyCount;
  final int speechControlCount;
  final int connectedSpeechCount;
  final int pendingSpeechCount;
  final int runtimeContentCount;
  final int editorialSourceCount;
  final int organizationReferenceCount;
  final int firebaseContractCount;
  final int storageContractCount;
  final String schemaFingerprint;
  final LibraryTestCapsuleMode mode;
  final List<String> usedReservedLines;
  final List<String> forbiddenImports;
  final int unmappedItems;

  LibraryTestCapsuleDescriptor copyWith({
    String? capsuleId,
    String? sectionId,
    List<String>? supportedPortIds,
    List<String>? requiredHostImports,
    List<String>? providedExports,
    int? runtimeFileCount,
    int? routeCount,
    int? coreSignalCount,
    int? localSignalCount,
    int? assetCount,
    int? localizationKeyCount,
    int? speechControlCount,
    int? connectedSpeechCount,
    int? pendingSpeechCount,
    int? runtimeContentCount,
    int? editorialSourceCount,
    int? organizationReferenceCount,
    int? firebaseContractCount,
    int? storageContractCount,
    String? schemaFingerprint,
    LibraryTestCapsuleMode? mode,
    List<String>? canonicalLines,
    List<String>? usedReservedLines,
    List<String>? forbiddenImports,
    int? unmappedItems,
  }) {
    return LibraryTestCapsuleDescriptor(
      capsuleId: capsuleId ?? this.capsuleId,
      sectionId: sectionId ?? this.sectionId,
      supportedPortIds: supportedPortIds ?? this.supportedPortIds,
      canonicalLines: canonicalLines ?? this.canonicalLines,
      requiredHostImports: requiredHostImports ?? this.requiredHostImports,
      providedExports: providedExports ?? this.providedExports,
      runtimeFileCount: runtimeFileCount ?? this.runtimeFileCount,
      routeCount: routeCount ?? this.routeCount,
      coreSignalCount: coreSignalCount ?? this.coreSignalCount,
      localSignalCount: localSignalCount ?? this.localSignalCount,
      assetCount: assetCount ?? this.assetCount,
      localizationKeyCount: localizationKeyCount ?? this.localizationKeyCount,
      speechControlCount: speechControlCount ?? this.speechControlCount,
      connectedSpeechCount: connectedSpeechCount ?? this.connectedSpeechCount,
      pendingSpeechCount: pendingSpeechCount ?? this.pendingSpeechCount,
      runtimeContentCount: runtimeContentCount ?? this.runtimeContentCount,
      editorialSourceCount: editorialSourceCount ?? this.editorialSourceCount,
      organizationReferenceCount:
          organizationReferenceCount ?? this.organizationReferenceCount,
      firebaseContractCount:
          firebaseContractCount ?? this.firebaseContractCount,
      storageContractCount: storageContractCount ?? this.storageContractCount,
      schemaFingerprint: schemaFingerprint ?? this.schemaFingerprint,
      mode: mode ?? this.mode,
      usedReservedLines: usedReservedLines ?? this.usedReservedLines,
      forbiddenImports: forbiddenImports ?? this.forbiddenImports,
      unmappedItems: unmappedItems ?? this.unmappedItems,
    );
  }
}

class LibraryTestCapsuleDescriptorProvider {
  const LibraryTestCapsuleDescriptorProvider._();

  static const schemaFingerprint =
      'MS-CAPSULE-LIB-BLUEPRINT|contract:1|runtime:28|routes:5|core:1|local:22|assets:32|l10n:14|speech:25:2:23|content:1:3:0|firebase:2|storage:0|lines:8';

  static const canonicalLines = <String>[
    'MS-LINE-LIFECYCLE-01',
    'MS-LINE-ROUTE-01',
    'MS-LINE-DATA-READ-01',
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
    'MS-LIB-IMPORT-001',
    'MS-LIB-IMPORT-002',
    'MS-LIB-IMPORT-003',
    'MS-LIB-IMPORT-004',
    'MS-LIB-IMPORT-005',
    'MS-LIB-IMPORT-006',
    'MS-LIB-IMPORT-007',
    'MS-LIB-IMPORT-008',
    'MS-LIB-IMPORT-009',
    'MS-LIB-IMPORT-010',
    'MS-LIB-IMPORT-011',
    'MS-LIB-IMPORT-012',
    'MS-LIB-IMPORT-013',
    'MS-LIB-IMPORT-014',
    'MS-LIB-IMPORT-015',
    'MS-LIB-IMPORT-016',
    'MS-LIB-IMPORT-017',
  ];

  static const providedExports = <String>[
    'MS-LIB-EXPORT-001',
    'MS-LIB-EXPORT-002',
    'MS-LIB-EXPORT-003',
    'MS-LIB-EXPORT-004',
    'MS-LIB-EXPORT-005',
    'MS-LIB-EXPORT-006',
    'MS-LIB-EXPORT-007',
    'MS-LIB-EXPORT-008',
    'MS-LIB-EXPORT-009',
    'MS-LIB-EXPORT-010',
    'MS-LIB-EXPORT-011',
    'MS-LIB-EXPORT-012',
  ];

  static const routePaths = <String>[
    '/web/library',
    '/web/library/know-your-right/cards',
    '/web/library/know-your-right/article',
    '/library/providers/specialists',
    '/library/providers/centers',
  ];

  static const descriptor = LibraryTestCapsuleDescriptor(
    capsuleId: 'MS-CAPSULE-LIB-BLUEPRINT',
    sectionId: LibraryCapsuleTestPortConstants.sectionId,
    supportedPortIds: <String>[
      LibraryCapsuleTestPortConstants.testPortId,
      LibraryCapsuleTestPortConstants.activePortId,
    ],
    canonicalLines: canonicalLines,
    requiredHostImports: requiredHostImports,
    providedExports: providedExports,
    runtimeFileCount: 28,
    routeCount: 5,
    coreSignalCount: 1,
    localSignalCount: 22,
    assetCount: 32,
    localizationKeyCount: 14,
    speechControlCount: 25,
    connectedSpeechCount: 2,
    pendingSpeechCount: 23,
    runtimeContentCount: 1,
    editorialSourceCount: 3,
    organizationReferenceCount: 0,
    firebaseContractCount: 2,
    storageContractCount: 0,
    schemaFingerprint: schemaFingerprint,
    mode: LibraryTestCapsuleMode.unmounted,
  );
}

class LibraryCompatibilityPolicy {
  const LibraryCompatibilityPolicy();

  CapsuleCompatibilityReport validate({
    required LibraryTestCapsuleDescriptor descriptor,
    required String portId,
  }) {
    final issues = <CapsuleCompatibilityIssue>[];
    void add(String code, String message, [String? detail]) {
      issues.add(CapsuleCompatibilityIssue(
        code: code,
        message: message,
        detail: detail,
      ));
    }

    if (descriptor.sectionId != LibraryCapsuleTestPortConstants.sectionId) {
      add(CapsuleCompatibilityFailureCode.sectionIdMismatch,
          'Library section ID mismatch.');
    }
    if (descriptor.capsuleId != 'MS-CAPSULE-LIB-BLUEPRINT') {
      add(CapsuleCompatibilityFailureCode.capsuleIdMismatch,
          'Library capsule ID mismatch.');
    }
    if (!descriptor.supportedPortIds.contains(portId) ||
        portId != LibraryCapsuleTestPortConstants.testPortId) {
      add(CapsuleCompatibilityFailureCode.portIdMismatch,
          'Library descriptor does not support test port.');
    }
    final modeAllowed = descriptor.mode == LibraryTestCapsuleMode.unmounted ||
        descriptor.mode == LibraryTestCapsuleMode.test;
    if (!modeAllowed) {
      add(CapsuleCompatibilityFailureCode.modeNotAllowed,
          'Library capsule mode is not mountable on the test port.');
    }
    for (final line in descriptor.canonicalLines) {
      if (LibraryTestCapsuleDescriptorProvider.reservedLines.contains(line)) {
        add(CapsuleCompatibilityFailureCode.reservedLineUsed,
            'Reserved line used.', line);
      } else if (!LibraryTestCapsuleDescriptorProvider.canonicalLines
          .contains(line)) {
        add(CapsuleCompatibilityFailureCode.lineNotAllowed,
            'Library line is not allowed.', line);
      }
    }
    if (descriptor.runtimeFileCount != 28 || descriptor.routeCount != 5) {
      add(CapsuleCompatibilityFailureCode.routeCountMismatch,
          'Library runtime/routes count mismatch.');
    }
    if (descriptor.requiredHostImports.length != 17) {
      add(CapsuleCompatibilityFailureCode.requiredImportMissing,
          'Library host import count mismatch.');
    }
    if (descriptor.providedExports.length != 12) {
      add(CapsuleCompatibilityFailureCode.requiredExportMissing,
          'Library export count mismatch.');
    }
    if (descriptor.coreSignalCount != 1 || descriptor.localSignalCount != 22) {
      add(CapsuleCompatibilityFailureCode.signalCountMismatch,
          'Library signal count mismatch.');
    }
    if (descriptor.assetCount != 32) {
      add(CapsuleCompatibilityFailureCode.assetCountMismatch,
          'Library asset count mismatch.');
    }
    if (descriptor.localizationKeyCount != 14) {
      add(CapsuleCompatibilityFailureCode.localizationCountMismatch,
          'Library localization count mismatch.');
    }
    if (descriptor.speechControlCount != 25 ||
        descriptor.connectedSpeechCount != 2 ||
        descriptor.pendingSpeechCount != 23) {
      add(CapsuleCompatibilityFailureCode.speechStateMismatch,
          'Library speech state mismatch.');
    }
    if (descriptor.runtimeContentCount != 1 ||
        descriptor.editorialSourceCount != 3 ||
        descriptor.organizationReferenceCount != 0) {
      add(CapsuleCompatibilityFailureCode.requiredExportMissing,
          'Library content/editorial mapping mismatch.');
    }
    if (descriptor.firebaseContractCount != 2) {
      add(CapsuleCompatibilityFailureCode.firebaseContractMismatch,
          'Library Firebase contract mismatch.');
    }
    if (descriptor.storageContractCount != 0) {
      add(CapsuleCompatibilityFailureCode.storageContractMismatch,
          'Library Storage contract mismatch.');
    }
    if (descriptor.schemaFingerprint !=
        LibraryTestCapsuleDescriptorProvider.schemaFingerprint) {
      add(CapsuleCompatibilityFailureCode.schemaFingerprintMismatch,
          'Library schema fingerprint mismatch.');
    }
    if (descriptor.forbiddenImports.isNotEmpty ||
        descriptor.unmappedItems != 0) {
      add(CapsuleCompatibilityFailureCode.forbiddenDependency,
          'Library forbidden imports or unmapped items present.');
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

class LibraryCapsuleTestMountController {
  LibraryCapsuleTestMountController({
    LibraryTestCapsuleDescriptor? descriptor,
    LibraryCompatibilityPolicy? policy,
    LibraryTestHostAdapters? adapters,
  })  : descriptor =
            descriptor ?? LibraryTestCapsuleDescriptorProvider.descriptor,
        policy = policy ?? const LibraryCompatibilityPolicy(),
        adapters = adapters ?? createDefaultAdapters();

  final LibraryTestCapsuleDescriptor descriptor;
  final LibraryCompatibilityPolicy policy;
  final LibraryTestHostAdapters adapters;

  CapsuleMountState state = CapsuleMountState.unmounted;

  Future<CapsuleMountResult> mount() async {
    state = CapsuleMountState.validating;
    final report = policy.validate(
      descriptor: descriptor,
      portId: LibraryCapsuleTestPortConstants.testPortId,
    );
    if (!report.compatible) {
      state = CapsuleMountState.incompatible;
      return CapsuleMountResult(
        mounted: false,
        mountState: state,
        report: report,
      );
    }
    state = CapsuleMountState.mounting;
    adapters.lifecycle.initialize();
    adapters.routes.register(LibraryTestCapsuleDescriptorProvider.routePaths);
    state = CapsuleMountState.mountedTest;
    return CapsuleMountResult(
      mounted: true,
      mountState: state,
      report: report,
    );
  }

  Future<void> unmount() async {
    state = CapsuleMountState.unmounting;
    await adapters.speech.stop();
    adapters.signals.flushLocalOnly();
    adapters.disposeListenersAndControllers();
    state = CapsuleMountState.unmounted;
  }

  static LibraryTestHostAdapters createDefaultAdapters() {
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
}

class LibraryCapsuleTestRoute extends StatefulWidget {
  const LibraryCapsuleTestRoute({super.key, this.controller});

  final LibraryCapsuleTestMountController? controller;

  @override
  State<LibraryCapsuleTestRoute> createState() =>
      _LibraryCapsuleTestRouteState();
}

class _LibraryCapsuleTestRouteState extends State<LibraryCapsuleTestRoute> {
  late final LibraryCapsuleTestMountController _controller =
      widget.controller ?? LibraryCapsuleTestMountController();
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
          return Scaffold(
            body: Center(child: Text(result.report.failureCodes.join(', '))),
          );
        }
        return const Column(
          children: [
            _LibraryCapsuleTestMarker(),
            Expanded(child: _LibraryCapsuleMountedView()),
          ],
        );
      },
    );
  }
}

class _LibraryCapsuleMountedView extends StatelessWidget {
  const _LibraryCapsuleMountedView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Library capsule test entry mounted')),
    );
  }
}

class _LibraryCapsuleTestMarker extends StatelessWidget {
  const _LibraryCapsuleTestMarker();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF101820),
      child: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text(
            'LIBRARY CAPSULE - TEST',
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
