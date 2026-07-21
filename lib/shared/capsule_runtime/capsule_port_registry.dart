import 'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart'
    as res;

import 'capsule_identity.dart';
import 'capsule_mode.dart';
import 'capsule_port.dart';

class CapsulePortRegistry {
  const CapsulePortRegistry._();

  static const residentialTestPortId = 'MS-PORT-RES-TEST-01';
  static const residentialActivePortId = 'MS-PORT-RES-ACTIVE-01';
  static const residentialSectionId = 'MS-SECTION-RESIDENTIAL';
  static const residentialTestRoute = '/__capsule_test/residential';
  static const residentialTestLocalStatePrefix = 'ms_capsule_res_test_01_';
  static const residentialTestInstanceId = 'MS-PORT-RES-TEST-01-LOCAL';

  static const _allowedLines = <String>{
    res.ResidentialCapsuleCanonicalLine.lifecycle,
    res.ResidentialCapsuleCanonicalLine.route,
    res.ResidentialCapsuleCanonicalLine.signal,
    res.ResidentialCapsuleCanonicalLine.localization,
    res.ResidentialCapsuleCanonicalLine.asset,
    res.ResidentialCapsuleCanonicalLine.externalAction,
    res.ResidentialCapsuleCanonicalLine.error,
  };

  static const _reservedLines = <String>{
    res.ResidentialCapsuleReservedExtensionLine.extension01,
    res.ResidentialCapsuleReservedExtensionLine.extension02,
    res.ResidentialCapsuleReservedExtensionLine.extension03,
  };

  static const residentialTestPort = CapsulePort(
    portId: residentialTestPortId,
    sectionId: residentialSectionId,
    mode: CapsuleMode.test,
    isPublic: false,
    isDefault: false,
    productionWrites: false,
    productionSignals: false,
    isolatedLocalState: true,
    isolatedRouteNamespace: true,
    compatibilityRequired: true,
    mountState: CapsuleMountState.unmounted,
    activationState: CapsulePortActivationState.unmounted,
    allowedCanonicalLines: _allowedLines,
    reservedCanonicalLines: _reservedLines,
    supportedContractVersions: <int>{
      res.ResidentialCapsuleDescriptorProvider.contractVersion,
    },
    availableHostImports: <String>{
      ...res.ResidentialCapsuleDescriptorProvider.requiredHostImports,
    },
    requiredCapsuleExports: <String>{
      ...res.ResidentialCapsuleDescriptorProvider.providedExports,
    },
    expectedRouteCount: 14,
    expectedCoreSignalCount: 3,
    expectedLocalSignalCount: 58,
    expectedAssetCount: 60,
    expectedLocalizationKeyCount: 238,
    expectedSpeechControlCount: 48,
    expectedSchemaFingerprint:
        res.ResidentialCapsuleDescriptorProvider.schemaFingerprint,
    testIdentity: CapsuleIdentity(
      capsuleId: res.ResidentialCapsuleIdentity.capsuleId,
      portId: residentialTestPortId,
      instanceId: residentialTestInstanceId,
      writeIdentity: 'residential-test',
      localStateIdentity: 'mental_smile_local_signals_residential_test',
    ),
    activeIdentity: CapsuleIdentity(
      capsuleId: res.ResidentialCapsuleIdentity.capsuleId,
      portId: residentialActivePortId,
      instanceId: 'MS-PORT-RES-ACTIVE-01-ACTIVE',
      writeIdentity: 'residential-active',
      localStateIdentity: 'mental_smile_local_signals_residential',
    ),
  );

  static const residentialActivePortState =
      CapsulePortActivationState.designedNotImplemented;
}
