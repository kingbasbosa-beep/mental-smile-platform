class Routes {
  // Active Generation 2 start surface. Root `/` is handled directly by AppRouter.
  static const splash = '/splash';
  static const legacySplash = '/legacy/splash';
  static const generation2MobileLiteClient = '/g2/mobile/client';
  static const generation2MobileLoginSelection = '/g2/mobile/login-selection';
  static const generation2MobileClientRoom = '/g2/mobile/client-room';
  static const generation2MobileSpecialistRoom = '/g2/mobile/specialist-room';
  static const generation2MobileCenterRoom = '/g2/mobile/center-room';

  // Commercial clean room foundation.
  static const commercialAccess = '/commercial/access';
  static const commercialSpecialistLogin = '/commercial/specialist/login';
  static const commercialSpecialistRegister = '/commercial/specialist/register';
  static const commercialCenterLogin = '/commercial/center/login';
  static const commercialCenterRegister = '/commercial/center/register';
  static const commercialRoom = '/commercial/room';
  static const commercialSpecialistProfessionalProfile =
      '/commercial/specialist/professional-profile';
  static const commercialSpecialistProfessionalLibrary =
      '/commercial/specialist/professional-library';
  static const commercialCenterRoom = '/commercial/center/room';
  static const commercialCenterProfessionalProfile =
      '/commercial/center/professional-profile';
  static const commercialCenterProfessionalLibrary =
      '/commercial/center/professional-library';
  static const commercialAssistiveTools = '/commercial/tools/assistive';
  static const commercialPublicAccounts = '/commercial/public-accounts';

  // Commercial V2 Web clean showcase foundation.
  static const commercialV2Web = '/commercial-v2/web';
  static const landingPreview = '/landing-preview';

  static const webLibrary = '/web/library';
  static const knowledgeCards = '/web/library/know-your-right/cards';
  static const knowledgeArticleViewer = '/web/library/know-your-right/article';
  static const libraryProviderSpecialists = '/library/providers/specialists';
  static const libraryProviderCenters = '/library/providers/centers';
  static const exitSocialLinks = '/app/exit-social-links';
  static const residentialExitSocialLinks = '/residential/exit-social-links';
  static const blockedAccount = '/account-blocked';
  static const clientRoom = '/client/room';
  static const accessibilityRoom = '/accessibility/room';
  static const accessibilityLinks = '/accessibility/links';
  static const accessibilityTools = '/accessibility/tools';
  static const accessibilitySuggestions = '/accessibility/suggestions';
  static const accessibilityCommunityTools = '/accessibility/community-tools';
  static const accessibilityCheckin = '/accessibility/checkin';
  static const accessibilityMessageOfDay = '/accessibility/message-of-the-day';

  // Hidden manual-only Residential capsule test port route.
  static const residentialCapsuleTest = '/__capsule_test/residential';

  // Hidden manual-only Commercial capsule test port route.
  static const commercialCapsuleTest = '/__capsule_test/commercial';

  // Hidden manual-only Library capsule test port route.
  static const libraryCapsuleTest = '/__capsule_test/library';
}
