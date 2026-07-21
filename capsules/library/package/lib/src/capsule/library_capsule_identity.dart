enum LibraryCapsuleMode { unmounted, test, active, disabled, incompatible }

class LibraryCapsuleIdentity {
  const LibraryCapsuleIdentity._();

  static const capsuleId = 'MS-CAPSULE-LIB-BLUEPRINT';
  static const sectionId = 'LIBRARY';
  static const packageName = 'mental_smile_library_capsule';
  static const mode = 'MATERIALIZED_TEST_MOUNTED';
  static const defaultLifecycle = LibraryCapsuleMode.unmounted;
}

class LibraryCapsuleCapabilities {
  const LibraryCapsuleCapabilities._();

  static const runtimeFiles = 28;
  static const routes = 5;
  static const coreSignals = 1;
  static const localSignals = 22;
  static const persistedLocalSignals = 6;
  static const dictionaryOnlySignals = 16;
  static const assets = 32;
  static const capsuleOwnedAssets = 13;
  static const centralAssets = 19;
  static const localizationKeys = 14;
  static const speechControls = 25;
  static const connectedSpeechControls = 2;
  static const pendingSpeechControls = 23;
  static const firebaseContracts = 2;
  static const storageContracts = 0;
  static const runtimeContentItems = 1;
  static const editorialSources = 3;
  static const organizationReferences = 0;
  static const contentItems = 4;
  static const canonicalLines = 8;
  static const centralImports = 17;
  static const capsuleExports = 12;
  static const speechCapability = 'LIBRARY_GENERATOR_PENDING';
}

class LibraryCapsuleHealth {
  const LibraryCapsuleHealth({
    this.mode = LibraryCapsuleMode.unmounted,
    this.buildable = false,
    this.runnableOnPlatform = false,
    this.portConnected = false,
    this.compatibilityGatePassed = false,
  });

  final LibraryCapsuleMode mode;
  final bool buildable;
  final bool runnableOnPlatform;
  final bool portConnected;
  final bool compatibilityGatePassed;

  static const pendingVerification = LibraryCapsuleHealth();
}
