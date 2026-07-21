import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart';

void main() {
  test('capsule identity defaults to unmounted materialized mode', () {
    expect(ResidentialCapsuleIdentity.capsuleId, 'MS-CAPSULE-RES-R-1.07.2026');
    expect(ResidentialCapsuleIdentity.repositoryId, 'MS-PLATFORM-DNA-V1-PRO');
    expect(ResidentialCapsuleIdentity.mode, 'MATERIALIZED_UNMOUNTED');
    expect(
      ResidentialCapsuleIdentity.defaultLifecycle,
      ResidentialCapsuleMode.unmounted,
    );
    expect(
      ResidentialCapsuleHealth.pendingVerification.runnableOnPlatform,
      isFalse,
    );
    expect(ResidentialCapsuleHealth.pendingVerification.portConnected, isFalse);
  });

  test('public route descriptors expose exactly fourteen routes', () {
    expect(ResidentialCapsuleRoutes.descriptors, hasLength(14));
    expect(
      ResidentialCapsuleRoutes.descriptors
          .map((route) => route.routeCode)
          .toSet(),
      hasLength(14),
    );
  });
}
