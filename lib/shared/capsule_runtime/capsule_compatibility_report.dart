class CapsuleCompatibilityFailureCode {
  const CapsuleCompatibilityFailureCode._();

  static const capsuleIdMismatch = 'CAPSULE_ID_MISMATCH';
  static const sectionIdMismatch = 'SECTION_ID_MISMATCH';
  static const portIdMismatch = 'PORT_ID_MISMATCH';
  static const modeNotAllowed = 'MODE_NOT_ALLOWED';
  static const contractVersionMismatch = 'CONTRACT_VERSION_MISMATCH';
  static const lineNotAllowed = 'LINE_NOT_ALLOWED';
  static const reservedLineUsed = 'RESERVED_LINE_USED';
  static const requiredImportMissing = 'REQUIRED_IMPORT_MISSING';
  static const requiredExportMissing = 'REQUIRED_EXPORT_MISSING';
  static const routeCountMismatch = 'ROUTE_COUNT_MISMATCH';
  static const signalCountMismatch = 'SIGNAL_COUNT_MISMATCH';
  static const assetCountMismatch = 'ASSET_COUNT_MISMATCH';
  static const localizationCountMismatch = 'LOCALIZATION_COUNT_MISMATCH';
  static const speechCountMismatch = 'SPEECH_COUNT_MISMATCH';
  static const schemaFingerprintMismatch = 'SCHEMA_FINGERPRINT_MISMATCH';
  static const forbiddenDependency = 'FORBIDDEN_DEPENDENCY';
  static const activeTestIdentityCollision = 'ACTIVE_TEST_IDENTITY_COLLISION';
  static const firebaseContractMismatch = 'FIREBASE_CONTRACT_MISMATCH';
  static const storageContractMismatch = 'STORAGE_CONTRACT_MISMATCH';
  static const speechStateMismatch = 'SPEECH_STATE_MISMATCH';
  static const forbiddenFeaturePresent = 'FORBIDDEN_FEATURE_PRESENT';
  static const legacyResiduePresent = 'LEGACY_RESIDUE_PRESENT';

  static const all = <String>[
    capsuleIdMismatch,
    sectionIdMismatch,
    portIdMismatch,
    modeNotAllowed,
    contractVersionMismatch,
    lineNotAllowed,
    reservedLineUsed,
    requiredImportMissing,
    requiredExportMissing,
    routeCountMismatch,
    signalCountMismatch,
    assetCountMismatch,
    localizationCountMismatch,
    speechCountMismatch,
    schemaFingerprintMismatch,
    forbiddenDependency,
    activeTestIdentityCollision,
    firebaseContractMismatch,
    storageContractMismatch,
    speechStateMismatch,
    forbiddenFeaturePresent,
    legacyResiduePresent,
  ];
}

class CapsuleCompatibilityIssue {
  const CapsuleCompatibilityIssue({
    required this.code,
    required this.message,
    this.detail,
  });

  final String code;
  final String message;
  final String? detail;
}

class CapsuleCompatibilityReport {
  const CapsuleCompatibilityReport({
    required this.portId,
    required this.compatible,
    required this.issues,
  });

  final String portId;
  final bool compatible;
  final List<CapsuleCompatibilityIssue> issues;

  List<String> get failureCodes {
    return issues.map((issue) => issue.code).toSet().toList(growable: false);
  }

  static CapsuleCompatibilityReport pass(String portId) {
    return CapsuleCompatibilityReport(
      portId: portId,
      compatible: true,
      issues: const <CapsuleCompatibilityIssue>[],
    );
  }
}
