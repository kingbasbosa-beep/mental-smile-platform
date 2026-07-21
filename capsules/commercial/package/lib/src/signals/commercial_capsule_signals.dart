class CommercialCapsuleCoreSignalCode {
  const CommercialCapsuleCoreSignalCode._();

  static const authSignIn = 'C.AUTH.001.SIGN_IN';
  static const specialistProfileWrite = 'C.PROFILE.001.WRITE_SPECIALIST';
  static const centerProfileWrite = 'C.PROFILE.002.WRITE_CENTER';
  static const publicProfilePublish = 'C.PUBLIC.001.PUBLISH';

  static const values = <String>[
    authSignIn,
    specialistProfileWrite,
    centerProfileWrite,
    publicProfilePublish,
  ];
}

class CommercialCapsuleLocalSignalCode {
  const CommercialCapsuleLocalSignalCode._();

  static const openLibrary = 'CV2.SIG.OPEN_LIBRARY';
  static const openAccess = 'C.LOCAL.001.ACCESS';
  static const openSpecialistLogin = 'C.LOCAL.002.SPECIALIST_LOGIN';
  static const openCenterLogin = 'C.LOCAL.003.CENTER_LOGIN';
  static const openSpecialistRoom = 'C.LOCAL.004.SPECIALIST_ROOM';
  static const openCenterRoom = 'C.LOCAL.005.CENTER_ROOM';
  static const openPublicProfiles = 'C.LOCAL.006.PUBLIC_PROFILES';

  static const values = <String>[
    openLibrary,
    openAccess,
    openSpecialistLogin,
    openCenterLogin,
    openSpecialistRoom,
    openCenterRoom,
    openPublicProfiles,
  ];
}

class CommercialCapsuleSpeechState {
  const CommercialCapsuleSpeechState._();

  static const controls = 17;
  static const connected = 2;
  static const pending = 15;
  static const capability = 'SPEECH_PARTIAL_TEST_ONLY';
  static const activePromotionBlocker =
      'ACTIVE_PROMOTION_BLOCKED_UNTIL_17_CONNECTED';
}
