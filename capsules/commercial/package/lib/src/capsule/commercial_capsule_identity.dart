enum CommercialCapsuleMode { unmounted, test, active, disabled, incompatible }

class CommercialCapsuleIdentity {
  const CommercialCapsuleIdentity._();

  static const capsuleId = 'MS-CAPSULE-COM-BLUEPRINT';
  static const finalIdState = 'FINAL_CAPSULE_ID_PENDING_CREATION_DATE_APPROVAL';
  static const sectionId = 'COMMERCIAL';
  static const packageName = 'mental_smile_commercial_capsule';
  static const mode = 'MATERIALIZED_UNMOUNTED';
  static const defaultLifecycle = CommercialCapsuleMode.unmounted;
}

class CommercialCapsuleCapabilities {
  const CommercialCapsuleCapabilities._();

  static const routes = 18;
  static const coreSignals = 4;
  static const localSignals = 7;
  static const firebaseUsages = 5;
  static const storageUsages = 2;
  static const assets = 39;
  static const capsuleOwnedAssets = 24;
  static const centralAssets = 15;
  static const localizationKeys = 47;
  static const speechControls = 17;
  static const connectedSpeechControls = 2;
  static const pendingSpeechControls = 15;
  static const canonicalLines = 11;
  static const centralImports = 17;
  static const capsuleExports = 20;
  static const speechCapability = 'SPEECH_PARTIAL_TEST_ONLY';
  static const activePromotionBlocker =
      'ACTIVE_PROMOTION_BLOCKED_UNTIL_17_CONNECTED';
}

class CommercialCapsuleHealth {
  const CommercialCapsuleHealth({
    this.mode = CommercialCapsuleMode.unmounted,
    this.buildable = false,
    this.runnableOnPlatform = false,
    this.portConnected = false,
    this.compatibilityGatePassed = false,
    this.speechComplete = false,
  });

  final CommercialCapsuleMode mode;
  final bool buildable;
  final bool runnableOnPlatform;
  final bool portConnected;
  final bool compatibilityGatePassed;
  final bool speechComplete;

  static const pendingVerification = CommercialCapsuleHealth();
}
