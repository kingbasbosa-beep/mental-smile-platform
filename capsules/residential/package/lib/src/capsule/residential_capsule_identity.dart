enum ResidentialCapsuleMode { unmounted, test, active, disabled, incompatible }

class ResidentialCapsuleIdentity {
  const ResidentialCapsuleIdentity._();

  static const capsuleId = 'MS-CAPSULE-RES-R-1.07.2026';
  static const repositoryId = 'MS-PLATFORM-DNA-V1-PRO';
  static const packageName = 'mental_smile_residential_capsule';
  static const mode = 'MATERIALIZED_UNMOUNTED';
  static const defaultLifecycle = ResidentialCapsuleMode.unmounted;
}

class ResidentialCapsuleCapabilities {
  const ResidentialCapsuleCapabilities._();

  static const routes = 14;
  static const coreSignals = 3;
  static const localSignals = 58;
  static const assets = 60;
  static const localizationKeys = 238;
  static const speakerControls = 48;
  static const platformMounted = false;
  static const active = false;
  static const testMounted = false;
}

class ResidentialCapsuleHealth {
  const ResidentialCapsuleHealth({
    this.mode = ResidentialCapsuleMode.unmounted,
    this.buildable = false,
    this.runnableOnPlatform = false,
    this.portConnected = false,
    this.compatibilityGatePassed = false,
  });

  final ResidentialCapsuleMode mode;
  final bool buildable;
  final bool runnableOnPlatform;
  final bool portConnected;
  final bool compatibilityGatePassed;

  static const pendingVerification = ResidentialCapsuleHealth();
}
