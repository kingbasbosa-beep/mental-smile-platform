// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter_test/flutter_test.dart';

import '../lib/mental_smile_commercial_capsule.dart';

void main() {
  test('Commercial descriptor exposes the test-port blueprint counts', () {
    const descriptor = CommercialCapsuleDescriptorProvider.descriptor;

    expect(descriptor.capsuleId, 'MS-CAPSULE-COM-BLUEPRINT');
    expect(
      descriptor.finalIdState,
      'FINAL_CAPSULE_ID_PENDING_CREATION_DATE_APPROVAL',
    );
    expect(descriptor.sectionId, 'COMMERCIAL');
    expect(descriptor.supportedPortIds, contains('MS-PORT-COM-TEST-01'));
    expect(descriptor.canonicalLines, hasLength(11));
    expect(descriptor.requiredHostImports, hasLength(17));
    expect(descriptor.providedExports, hasLength(20));
    expect(descriptor.routeCount, 18);
    expect(descriptor.coreSignalCount, 4);
    expect(descriptor.localSignalCount, 7);
    expect(descriptor.assetCount, 39);
    expect(descriptor.localizationKeyCount, 47);
    expect(descriptor.speechControlCount, 17);
    expect(descriptor.connectedSpeechCount, 2);
    expect(descriptor.pendingSpeechCount, 15);
    expect(descriptor.firebaseUsageCount, 5);
    expect(descriptor.storageUsageCount, 2);
  });

  test('Commercial route descriptors expose eighteen routes', () {
    expect(CommercialCapsuleRoutes.descriptors, hasLength(18));
    expect(
      CommercialCapsuleRoutes.descriptors
          .map((route) => route.routeCode)
          .toSet(),
      hasLength(18),
    );
  });

  test('speech partial state is accepted for test diagnostics only', () {
    expect(CommercialCapsuleSpeechState.controls, 17);
    expect(CommercialCapsuleSpeechState.connected, 2);
    expect(CommercialCapsuleSpeechState.pending, 15);
    expect(
      CommercialCapsuleSpeechState.activePromotionBlocker,
      'ACTIVE_PROMOTION_BLOCKED_UNTIL_17_CONNECTED',
    );
  });
}
