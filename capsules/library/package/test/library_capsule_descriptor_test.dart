// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter_test/flutter_test.dart';

import '../lib/mental_smile_library_capsule.dart';

void main() {
  test('Library descriptor exposes blueprint counts', () {
    const descriptor = LibraryCapsuleDescriptorProvider.descriptor;

    expect(descriptor.capsuleId, 'MS-CAPSULE-LIB-BLUEPRINT');
    expect(descriptor.sectionId, 'LIBRARY');
    expect(descriptor.supportedPortIds, contains('MS-PORT-LIB-TEST-01'));
    expect(descriptor.runtimeFileCount, 28);
    expect(descriptor.routeCount, 5);
    expect(descriptor.coreSignalCount, 1);
    expect(descriptor.localSignalCount, 22);
    expect(descriptor.assetCount, 32);
    expect(descriptor.localizationKeyCount, 14);
    expect(descriptor.speechControlCount, 25);
    expect(descriptor.connectedSpeechCount, 2);
    expect(descriptor.pendingSpeechCount, 23);
    expect(descriptor.runtimeContentCount, 1);
    expect(descriptor.editorialSourceCount, 3);
    expect(descriptor.organizationReferenceCount, 0);
    expect(descriptor.firebaseContractCount, 2);
    expect(descriptor.storageContractCount, 0);
  });

  test('routes, localization, signals, and content are mapped', () {
    expect(LibraryCapsuleRoutes.descriptors, hasLength(5));
    expect(LibraryCapsuleLocalizations.keys, hasLength(14));
    expect(LibraryCapsuleCoreSignalCode.values, hasLength(1));
    expect(LibraryCapsuleLocalSignalCode.values, hasLength(22));
    expect(LibraryCapsuleContentRegistry.items, hasLength(4));
  });
}
