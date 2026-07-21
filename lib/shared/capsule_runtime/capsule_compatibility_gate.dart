import 'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart'
    as res;

import 'capsule_compatibility_report.dart';
import 'capsule_mode.dart';
import 'capsule_port.dart';

class CapsuleCompatibilityGate {
  const CapsuleCompatibilityGate();

  CapsuleCompatibilityReport validate({
    required CapsulePort port,
    required res.ResidentialCapsuleDescriptor descriptor,
  }) {
    final issues = <CapsuleCompatibilityIssue>[];

    void add(String code, String message, [String? detail]) {
      issues.add(CapsuleCompatibilityIssue(
        code: code,
        message: message,
        detail: detail,
      ));
    }

    if (descriptor.capsuleId != 'MS-CAPSULE-RES-R-1.07.2026') {
      add(
        CapsuleCompatibilityFailureCode.capsuleIdMismatch,
        'Capsule ID does not match the Residential capsule.',
        descriptor.capsuleId,
      );
    }

    if (descriptor.sectionId != port.sectionId ||
        descriptor.sectionId != 'MS-SECTION-RESIDENTIAL') {
      add(
        CapsuleCompatibilityFailureCode.sectionIdMismatch,
        'Section ID must be MS-SECTION-RESIDENTIAL.',
        descriptor.sectionId,
      );
    }

    if (!descriptor.supportedPortIds.contains(port.portId) ||
        port.portId != 'MS-PORT-RES-TEST-01') {
      add(
        CapsuleCompatibilityFailureCode.portIdMismatch,
        'Descriptor does not support the Residential test port.',
        port.portId,
      );
    }

    final modeAllowed = port.mode == CapsuleMode.test &&
        (descriptor.capsuleMode == res.ResidentialCapsuleMode.test ||
            descriptor.capsuleMode == res.ResidentialCapsuleMode.unmounted);
    if (!modeAllowed) {
      add(
        CapsuleCompatibilityFailureCode.modeNotAllowed,
        'Capsule mode cannot be mounted on the test port.',
        descriptor.capsuleMode.name,
      );
    }

    if (!port.supportedContractVersions.contains(descriptor.contractVersion)) {
      add(
        CapsuleCompatibilityFailureCode.contractVersionMismatch,
        'Contract version is not supported by the test port.',
        descriptor.contractVersion.toString(),
      );
    }

    for (final line in descriptor.supportedCanonicalLines) {
      if (port.reservedCanonicalLines.contains(line)) {
        add(
          CapsuleCompatibilityFailureCode.reservedLineUsed,
          'Reserved extension line is used by the capsule.',
          line,
        );
      } else if (!port.allowedCanonicalLines.contains(line)) {
        add(
          CapsuleCompatibilityFailureCode.lineNotAllowed,
          'Canonical line is not allowed by the test port.',
          line,
        );
      }
    }

    for (final line in descriptor.usedReservedLines) {
      add(
        CapsuleCompatibilityFailureCode.reservedLineUsed,
        'Reserved extension line is marked as used.',
        line,
      );
    }

    for (final importCode in descriptor.requiredHostImports) {
      if (!port.availableHostImports.contains(importCode)) {
        add(
          CapsuleCompatibilityFailureCode.requiredImportMissing,
          'Required host import is not available.',
          importCode,
        );
      }
    }

    for (final exportCode in port.requiredCapsuleExports) {
      if (!descriptor.providedExports.contains(exportCode)) {
        add(
          CapsuleCompatibilityFailureCode.requiredExportMissing,
          'Required capsule export is missing.',
          exportCode,
        );
      }
    }

    if (descriptor.routeCount != port.expectedRouteCount) {
      add(
        CapsuleCompatibilityFailureCode.routeCountMismatch,
        'Route descriptor count does not match the blueprint.',
        '${descriptor.routeCount}',
      );
    }

    if (descriptor.coreSignalCount != port.expectedCoreSignalCount ||
        descriptor.localSignalCount != port.expectedLocalSignalCount) {
      add(
        CapsuleCompatibilityFailureCode.signalCountMismatch,
        'Signal counts do not match the blueprint.',
        'core=${descriptor.coreSignalCount}, local=${descriptor.localSignalCount}',
      );
    }

    if (descriptor.assetCount != port.expectedAssetCount) {
      add(
        CapsuleCompatibilityFailureCode.assetCountMismatch,
        'Asset count does not match the blueprint.',
        '${descriptor.assetCount}',
      );
    }

    if (descriptor.localizationKeyCount != port.expectedLocalizationKeyCount) {
      add(
        CapsuleCompatibilityFailureCode.localizationCountMismatch,
        'Localization key count does not match the blueprint.',
        '${descriptor.localizationKeyCount}',
      );
    }

    if (descriptor.speechControlCount != port.expectedSpeechControlCount) {
      add(
        CapsuleCompatibilityFailureCode.speechCountMismatch,
        'Speech control count does not match the blueprint.',
        '${descriptor.speechControlCount}',
      );
    }

    if (descriptor.schemaFingerprint != port.expectedSchemaFingerprint) {
      add(
        CapsuleCompatibilityFailureCode.schemaFingerprintMismatch,
        'Schema fingerprint does not match the test port.',
        descriptor.schemaFingerprint,
      );
    }

    if (descriptor.forbiddenDependencyImports.isNotEmpty) {
      add(
        CapsuleCompatibilityFailureCode.forbiddenDependency,
        'Forbidden dependency import is present.',
        descriptor.forbiddenDependencyImports.join(','),
      );
    }

    if (port.testIdentity.collidesWith(port.activeIdentity)) {
      add(
        CapsuleCompatibilityFailureCode.activeTestIdentityCollision,
        'Test identity collides with the active Residential identity.',
      );
    }

    if (issues.isEmpty) {
      return CapsuleCompatibilityReport.pass(port.portId);
    }

    return CapsuleCompatibilityReport(
      portId: port.portId,
      compatible: false,
      issues: List<CapsuleCompatibilityIssue>.unmodifiable(issues),
    );
  }
}
