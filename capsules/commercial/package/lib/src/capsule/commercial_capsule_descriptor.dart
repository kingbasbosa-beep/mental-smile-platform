import '../contracts/commercial_capsule_contracts.dart';
import 'commercial_capsule_identity.dart';

class CommercialCapsuleDescriptor {
  const CommercialCapsuleDescriptor({
    required this.capsuleId,
    required this.finalIdState,
    required this.sectionId,
    required this.packageVersion,
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
  final String finalIdState;
  final String sectionId;
  final String packageVersion;
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
  final CommercialCapsuleMode mode;
  final List<String> usedReservedLines;
  final List<String> forbiddenImports;
  final int forbiddenFeatureCount;
  final int legacyResidueCount;

  CommercialCapsuleDescriptor copyWith({
    String? capsuleId,
    String? finalIdState,
    String? sectionId,
    String? packageVersion,
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
    CommercialCapsuleMode? mode,
    List<String>? usedReservedLines,
    List<String>? forbiddenImports,
    int? forbiddenFeatureCount,
    int? legacyResidueCount,
  }) {
    return CommercialCapsuleDescriptor(
      capsuleId: capsuleId ?? this.capsuleId,
      finalIdState: finalIdState ?? this.finalIdState,
      sectionId: sectionId ?? this.sectionId,
      packageVersion: packageVersion ?? this.packageVersion,
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

class CommercialCapsuleDescriptorProvider {
  const CommercialCapsuleDescriptorProvider._();

  static const testPortId = 'MS-PORT-COM-TEST-01';
  static const activePortId = 'MS-PORT-COM-ACTIVE-01';
  static const packageVersion = '0.1.0';
  static const contractVersion = 1;
  static const schemaFingerprint =
      'MS-CAPSULE-COM-BLUEPRINT|contract:1|routes:18|core:4|local:7|assets:39|l10n:47|speech:17:2:15|firebase:5|storage:2|lines:11';

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

  static const descriptor = CommercialCapsuleDescriptor(
    capsuleId: CommercialCapsuleIdentity.capsuleId,
    finalIdState: CommercialCapsuleIdentity.finalIdState,
    sectionId: CommercialCapsuleIdentity.sectionId,
    packageVersion: packageVersion,
    contractVersion: contractVersion,
    supportedPortIds: <String>[testPortId, activePortId],
    canonicalLines: CommercialCapsuleCanonicalLine.used,
    requiredHostImports: requiredHostImports,
    providedExports: providedExports,
    routeCount: CommercialCapsuleCapabilities.routes,
    coreSignalCount: CommercialCapsuleCapabilities.coreSignals,
    localSignalCount: CommercialCapsuleCapabilities.localSignals,
    assetCount: CommercialCapsuleCapabilities.assets,
    localizationKeyCount: CommercialCapsuleCapabilities.localizationKeys,
    speechControlCount: CommercialCapsuleCapabilities.speechControls,
    connectedSpeechCount: CommercialCapsuleCapabilities.connectedSpeechControls,
    pendingSpeechCount: CommercialCapsuleCapabilities.pendingSpeechControls,
    firebaseUsageCount: CommercialCapsuleCapabilities.firebaseUsages,
    storageUsageCount: CommercialCapsuleCapabilities.storageUsages,
    schemaFingerprint: schemaFingerprint,
    mode: CommercialCapsuleMode.unmounted,
  );
}
