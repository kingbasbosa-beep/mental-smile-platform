import '../contracts/canonical_lines.dart';
import 'residential_capsule_identity.dart';

class ResidentialCapsuleDescriptor {
  const ResidentialCapsuleDescriptor({
    required this.capsuleId,
    required this.sectionId,
    required this.packageVersion,
    required this.contractVersion,
    required this.supportedPortIds,
    required this.supportedCanonicalLines,
    required this.requiredHostImports,
    required this.providedExports,
    required this.routeCount,
    required this.coreSignalCount,
    required this.localSignalCount,
    required this.assetCount,
    required this.localizationKeyCount,
    required this.speechControlCount,
    required this.schemaFingerprint,
    required this.buildMode,
    required this.capsuleMode,
    this.usedReservedLines = const <String>[],
    this.forbiddenDependencyImports = const <String>[],
  });

  final String capsuleId;
  final String sectionId;
  final String packageVersion;
  final int contractVersion;
  final List<String> supportedPortIds;
  final List<String> supportedCanonicalLines;
  final List<String> requiredHostImports;
  final List<String> providedExports;
  final int routeCount;
  final int coreSignalCount;
  final int localSignalCount;
  final int assetCount;
  final int localizationKeyCount;
  final int speechControlCount;
  final String schemaFingerprint;
  final String buildMode;
  final ResidentialCapsuleMode capsuleMode;
  final List<String> usedReservedLines;
  final List<String> forbiddenDependencyImports;

  ResidentialCapsuleDescriptor copyWith({
    String? capsuleId,
    String? sectionId,
    String? packageVersion,
    int? contractVersion,
    List<String>? supportedPortIds,
    List<String>? supportedCanonicalLines,
    List<String>? requiredHostImports,
    List<String>? providedExports,
    int? routeCount,
    int? coreSignalCount,
    int? localSignalCount,
    int? assetCount,
    int? localizationKeyCount,
    int? speechControlCount,
    String? schemaFingerprint,
    String? buildMode,
    ResidentialCapsuleMode? capsuleMode,
    List<String>? usedReservedLines,
    List<String>? forbiddenDependencyImports,
  }) {
    return ResidentialCapsuleDescriptor(
      capsuleId: capsuleId ?? this.capsuleId,
      sectionId: sectionId ?? this.sectionId,
      packageVersion: packageVersion ?? this.packageVersion,
      contractVersion: contractVersion ?? this.contractVersion,
      supportedPortIds: supportedPortIds ?? this.supportedPortIds,
      supportedCanonicalLines:
          supportedCanonicalLines ?? this.supportedCanonicalLines,
      requiredHostImports: requiredHostImports ?? this.requiredHostImports,
      providedExports: providedExports ?? this.providedExports,
      routeCount: routeCount ?? this.routeCount,
      coreSignalCount: coreSignalCount ?? this.coreSignalCount,
      localSignalCount: localSignalCount ?? this.localSignalCount,
      assetCount: assetCount ?? this.assetCount,
      localizationKeyCount: localizationKeyCount ?? this.localizationKeyCount,
      speechControlCount: speechControlCount ?? this.speechControlCount,
      schemaFingerprint: schemaFingerprint ?? this.schemaFingerprint,
      buildMode: buildMode ?? this.buildMode,
      capsuleMode: capsuleMode ?? this.capsuleMode,
      usedReservedLines: usedReservedLines ?? this.usedReservedLines,
      forbiddenDependencyImports:
          forbiddenDependencyImports ?? this.forbiddenDependencyImports,
    );
  }
}

class ResidentialCapsuleDescriptorProvider {
  const ResidentialCapsuleDescriptorProvider._();

  static const sectionId = 'MS-SECTION-RESIDENTIAL';
  static const packageVersion = '0.1.0';
  static const contractVersion = 1;
  static const testPortId = 'MS-PORT-RES-TEST-01';
  static const activePortId = 'MS-PORT-RES-ACTIVE-01';
  static const buildMode = 'MATERIALIZED';
  static const schemaFingerprint =
      'MS-CAPSULE-RES-R-1.07.2026|contract:1|routes:14|core:3|local:58|assets:60|l10n:238|speech:48|lines:7';

  static const requiredHostImports = <String>[
    'MS-RES-IMPORT-001',
    'MS-RES-IMPORT-002',
    'MS-RES-IMPORT-003',
    'MS-RES-IMPORT-004',
    'MS-RES-IMPORT-005',
    'MS-RES-IMPORT-006',
    'MS-RES-IMPORT-007',
    'MS-RES-IMPORT-008',
    'MS-RES-IMPORT-009',
    'MS-RES-IMPORT-010',
    'MS-RES-IMPORT-011',
    'MS-RES-IMPORT-012',
    'MS-RES-IMPORT-013',
    'MS-RES-IMPORT-014',
    'MS-RES-IMPORT-015',
  ];

  static const providedExports = <String>[
    'MS-RES-EXPORT-ROUTE-001',
    'MS-RES-EXPORT-ROUTE-002',
    'MS-RES-EXPORT-ROUTE-003',
    'MS-RES-EXPORT-ROUTE-004',
    'MS-RES-EXPORT-ROUTE-005',
    'MS-RES-EXPORT-ROUTE-006',
    'MS-RES-EXPORT-ROUTE-007',
    'MS-RES-EXPORT-ROUTE-008',
    'MS-RES-EXPORT-ROUTE-009',
    'MS-RES-EXPORT-ROUTE-010',
    'MS-RES-EXPORT-ROUTE-011',
    'MS-RES-EXPORT-ROUTE-012',
    'MS-RES-EXPORT-ROUTE-013',
    'MS-RES-EXPORT-ROUTE-014',
    'MS-RES-EXPORT-SIGNAL-001',
    'MS-RES-EXPORT-IDENTITY-001',
    'MS-RES-EXPORT-SPEECH-001',
  ];

  static const descriptor = ResidentialCapsuleDescriptor(
    capsuleId: ResidentialCapsuleIdentity.capsuleId,
    sectionId: sectionId,
    packageVersion: packageVersion,
    contractVersion: contractVersion,
    supportedPortIds: <String>[testPortId, activePortId],
    supportedCanonicalLines: ResidentialCapsuleCanonicalLine.used,
    requiredHostImports: requiredHostImports,
    providedExports: providedExports,
    routeCount: ResidentialCapsuleCapabilities.routes,
    coreSignalCount: ResidentialCapsuleCapabilities.coreSignals,
    localSignalCount: ResidentialCapsuleCapabilities.localSignals,
    assetCount: ResidentialCapsuleCapabilities.assets,
    localizationKeyCount: ResidentialCapsuleCapabilities.localizationKeys,
    speechControlCount: ResidentialCapsuleCapabilities.speakerControls,
    schemaFingerprint: schemaFingerprint,
    buildMode: buildMode,
    capsuleMode: ResidentialCapsuleMode.unmounted,
  );
}

class ResidentialCapsuleTestAdapterBinding {
  const ResidentialCapsuleTestAdapterBinding({
    required this.portId,
    required this.routeNamespace,
    required this.localStatePrefix,
    required this.productionWrites,
    required this.productionSignals,
  });

  final String portId;
  final String routeNamespace;
  final String localStatePrefix;
  final bool productionWrites;
  final bool productionSignals;

  static const testPort = ResidentialCapsuleTestAdapterBinding(
    portId: ResidentialCapsuleDescriptorProvider.testPortId,
    routeNamespace: '/__capsule_test/residential',
    localStatePrefix: 'ms_capsule_res_test_01_',
    productionWrites: false,
    productionSignals: false,
  );
}
