import 'capsule_identity.dart';
import 'capsule_mode.dart';

class CapsulePort {
  const CapsulePort({
    required this.portId,
    required this.sectionId,
    required this.mode,
    required this.isPublic,
    required this.isDefault,
    required this.productionWrites,
    required this.productionSignals,
    required this.isolatedLocalState,
    required this.isolatedRouteNamespace,
    required this.compatibilityRequired,
    required this.mountState,
    required this.activationState,
    required this.allowedCanonicalLines,
    required this.reservedCanonicalLines,
    required this.supportedContractVersions,
    required this.availableHostImports,
    required this.requiredCapsuleExports,
    required this.expectedRouteCount,
    required this.expectedCoreSignalCount,
    required this.expectedLocalSignalCount,
    required this.expectedAssetCount,
    required this.expectedLocalizationKeyCount,
    required this.expectedSpeechControlCount,
    required this.expectedSchemaFingerprint,
    required this.testIdentity,
    required this.activeIdentity,
  });

  final String portId;
  final String sectionId;
  final CapsuleMode mode;
  final bool isPublic;
  final bool isDefault;
  final bool productionWrites;
  final bool productionSignals;
  final bool isolatedLocalState;
  final bool isolatedRouteNamespace;
  final bool compatibilityRequired;
  final CapsuleMountState mountState;
  final CapsulePortActivationState activationState;
  final Set<String> allowedCanonicalLines;
  final Set<String> reservedCanonicalLines;
  final Set<int> supportedContractVersions;
  final Set<String> availableHostImports;
  final Set<String> requiredCapsuleExports;
  final int expectedRouteCount;
  final int expectedCoreSignalCount;
  final int expectedLocalSignalCount;
  final int expectedAssetCount;
  final int expectedLocalizationKeyCount;
  final int expectedSpeechControlCount;
  final String expectedSchemaFingerprint;
  final CapsuleIdentity testIdentity;
  final CapsuleIdentity activeIdentity;

  CapsulePort copyWith({
    String? portId,
    CapsuleMode? mode,
    CapsuleMountState? mountState,
    CapsulePortActivationState? activationState,
    Set<String>? allowedCanonicalLines,
    Set<int>? supportedContractVersions,
    Set<String>? availableHostImports,
    Set<String>? requiredCapsuleExports,
    String? expectedSchemaFingerprint,
    CapsuleIdentity? testIdentity,
    CapsuleIdentity? activeIdentity,
  }) {
    return CapsulePort(
      portId: portId ?? this.portId,
      sectionId: sectionId,
      mode: mode ?? this.mode,
      isPublic: isPublic,
      isDefault: isDefault,
      productionWrites: productionWrites,
      productionSignals: productionSignals,
      isolatedLocalState: isolatedLocalState,
      isolatedRouteNamespace: isolatedRouteNamespace,
      compatibilityRequired: compatibilityRequired,
      mountState: mountState ?? this.mountState,
      activationState: activationState ?? this.activationState,
      allowedCanonicalLines:
          allowedCanonicalLines ?? this.allowedCanonicalLines,
      reservedCanonicalLines: reservedCanonicalLines,
      supportedContractVersions:
          supportedContractVersions ?? this.supportedContractVersions,
      availableHostImports: availableHostImports ?? this.availableHostImports,
      requiredCapsuleExports:
          requiredCapsuleExports ?? this.requiredCapsuleExports,
      expectedRouteCount: expectedRouteCount,
      expectedCoreSignalCount: expectedCoreSignalCount,
      expectedLocalSignalCount: expectedLocalSignalCount,
      expectedAssetCount: expectedAssetCount,
      expectedLocalizationKeyCount: expectedLocalizationKeyCount,
      expectedSpeechControlCount: expectedSpeechControlCount,
      expectedSchemaFingerprint:
          expectedSchemaFingerprint ?? this.expectedSchemaFingerprint,
      testIdentity: testIdentity ?? this.testIdentity,
      activeIdentity: activeIdentity ?? this.activeIdentity,
    );
  }
}
