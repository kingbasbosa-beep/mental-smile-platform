import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart';

void main() {
  test('capsule descriptor exposes the test port contract', () {
    const descriptor = ResidentialCapsuleDescriptorProvider.descriptor;

    expect(descriptor.capsuleId, 'MS-CAPSULE-RES-R-1.07.2026');
    expect(descriptor.sectionId, 'MS-SECTION-RESIDENTIAL');
    expect(descriptor.supportedPortIds, contains('MS-PORT-RES-TEST-01'));
    expect(descriptor.supportedCanonicalLines, hasLength(7));
    expect(descriptor.requiredHostImports, hasLength(15));
    expect(descriptor.providedExports, hasLength(17));
    expect(descriptor.routeCount, 14);
    expect(descriptor.coreSignalCount, 3);
    expect(descriptor.localSignalCount, 58);
    expect(descriptor.assetCount, 60);
    expect(descriptor.localizationKeyCount, 238);
    expect(descriptor.speechControlCount, 48);
    expect(descriptor.capsuleMode, ResidentialCapsuleMode.unmounted);
  });

  test('canonical lines match the Residential port registry', () {
    expect(ResidentialCapsuleCanonicalLine.used, <String>[
      'MS-LINE-LIFECYCLE-01',
      'MS-LINE-ROUTE-01',
      'MS-LINE-SIGNAL-01',
      'MS-LINE-LOCALIZATION-01',
      'MS-LINE-ASSET-01',
      'MS-LINE-EXTERNAL-ACTION-01',
      'MS-LINE-ERROR-01',
    ]);
    expect(ResidentialCapsuleReservedExtensionLine.reserved, <String>[
      'MS-LINE-EXT-01',
      'MS-LINE-EXT-02',
      'MS-LINE-EXT-03',
    ]);
  });
}
