class CommercialV2SignalCode {
  const CommercialV2SignalCode._();

  static const openLibrary = 'CV2_SIG_OPEN_LIBRARY';
  static const openSpecialists = 'CV2_SIG_OPEN_SPECIALISTS';
  static const openCenters = 'CV2_SIG_OPEN_CENTERS';
  static const back = 'CV2_SIG_BACK';

  static const registrationPackageReady = 'CV2_SIG_REGISTRATION_PACKAGE_READY';
  static const profileGenerationReady = 'CV2_SIG_PROFILE_GENERATION_READY';
  static const publishingPackageReady = 'CV2_SIG_PUBLISHING_PACKAGE_READY';
}

enum CommercialV2SignalFamily {
  showcaseNavigation,
  navigationControl,
  registrationPackage,
  profileGeneration,
  publishingPackage,
}

extension CommercialV2SignalFamilyLabel on CommercialV2SignalFamily {
  String get label {
    switch (this) {
      case CommercialV2SignalFamily.showcaseNavigation:
        return 'Commercial V2 Showcase Navigation';
      case CommercialV2SignalFamily.navigationControl:
        return 'Commercial V2 Navigation Control';
      case CommercialV2SignalFamily.registrationPackage:
        return 'Commercial V2 Registration Package';
      case CommercialV2SignalFamily.profileGeneration:
        return 'Commercial V2 Profile Generation';
      case CommercialV2SignalFamily.publishingPackage:
        return 'Commercial V2 Publishing Package';
    }
  }
}
