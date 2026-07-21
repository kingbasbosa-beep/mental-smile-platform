import '../contracts/library_capsule_contracts.dart';
import 'library_capsule_identity.dart';

class LibraryCapsuleDescriptor {
  const LibraryCapsuleDescriptor({
    required this.capsuleId,
    required this.sectionId,
    required this.packageVersion,
    required this.contractVersion,
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
  final String packageVersion;
  final int contractVersion;
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
  final LibraryCapsuleMode mode;
  final List<String> usedReservedLines;
  final List<String> forbiddenImports;
  final int unmappedItems;

  LibraryCapsuleDescriptor copyWith({
    String? capsuleId,
    String? sectionId,
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
    int? firebaseContractCount,
    String? schemaFingerprint,
    List<String>? canonicalLines,
    List<String>? usedReservedLines,
    List<String>? forbiddenImports,
    int? unmappedItems,
    LibraryCapsuleMode? mode,
  }) {
    return LibraryCapsuleDescriptor(
      capsuleId: capsuleId ?? this.capsuleId,
      sectionId: sectionId ?? this.sectionId,
      packageVersion: packageVersion,
      contractVersion: contractVersion,
      supportedPortIds: supportedPortIds,
      canonicalLines: canonicalLines ?? this.canonicalLines,
      requiredHostImports: requiredHostImports,
      providedExports: providedExports,
      runtimeFileCount: runtimeFileCount,
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
      organizationReferenceCount: organizationReferenceCount,
      firebaseContractCount:
          firebaseContractCount ?? this.firebaseContractCount,
      storageContractCount: storageContractCount,
      schemaFingerprint: schemaFingerprint ?? this.schemaFingerprint,
      mode: mode ?? this.mode,
      usedReservedLines: usedReservedLines ?? this.usedReservedLines,
      forbiddenImports: forbiddenImports ?? this.forbiddenImports,
      unmappedItems: unmappedItems ?? this.unmappedItems,
    );
  }
}

class LibraryCapsuleDescriptorProvider {
  const LibraryCapsuleDescriptorProvider._();

  static const testPortId = 'MS-PORT-LIB-TEST-01';
  static const activePortId = 'MS-PORT-LIB-ACTIVE-01';
  static const packageVersion = '0.1.0';
  static const contractVersion = 1;
  static const schemaFingerprint =
      'MS-CAPSULE-LIB-BLUEPRINT|contract:1|runtime:28|routes:5|core:1|local:22|assets:32|l10n:14|speech:25:2:23|content:1:3:0|firebase:2|storage:0|lines:8';

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

  static const descriptor = LibraryCapsuleDescriptor(
    capsuleId: LibraryCapsuleIdentity.capsuleId,
    sectionId: LibraryCapsuleIdentity.sectionId,
    packageVersion: packageVersion,
    contractVersion: contractVersion,
    supportedPortIds: <String>[testPortId, activePortId],
    canonicalLines: LibraryCapsuleCanonicalLine.used,
    requiredHostImports: requiredHostImports,
    providedExports: providedExports,
    runtimeFileCount: LibraryCapsuleCapabilities.runtimeFiles,
    routeCount: LibraryCapsuleCapabilities.routes,
    coreSignalCount: LibraryCapsuleCapabilities.coreSignals,
    localSignalCount: LibraryCapsuleCapabilities.localSignals,
    assetCount: LibraryCapsuleCapabilities.assets,
    localizationKeyCount: LibraryCapsuleCapabilities.localizationKeys,
    speechControlCount: LibraryCapsuleCapabilities.speechControls,
    connectedSpeechCount: LibraryCapsuleCapabilities.connectedSpeechControls,
    pendingSpeechCount: LibraryCapsuleCapabilities.pendingSpeechControls,
    runtimeContentCount: LibraryCapsuleCapabilities.runtimeContentItems,
    editorialSourceCount: LibraryCapsuleCapabilities.editorialSources,
    organizationReferenceCount:
        LibraryCapsuleCapabilities.organizationReferences,
    firebaseContractCount: LibraryCapsuleCapabilities.firebaseContracts,
    storageContractCount: LibraryCapsuleCapabilities.storageContracts,
    schemaFingerprint: schemaFingerprint,
    mode: LibraryCapsuleMode.unmounted,
  );
}
