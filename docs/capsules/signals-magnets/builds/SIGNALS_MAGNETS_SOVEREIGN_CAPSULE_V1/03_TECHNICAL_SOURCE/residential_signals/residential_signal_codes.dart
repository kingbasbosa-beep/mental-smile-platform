class ResidentialSignalCode {
  const ResidentialSignalCode._();

  static const splashView = 'R.S.001.VIEW';
  static const clientRoomView = 'R.S.002.VIEW';
  static const accessibilityRoomView = 'R.S.003.VIEW';
  static const accessibilityLinksView = 'R.S.004.VIEW';
  static const accessibilityToolsView = 'R.S.005.VIEW';
  static const accessibilitySuggestionsView = 'R.S.006.VIEW';
  static const accessibilityCheckinView = 'R.S.007.VIEW';
  static const accessibilityMessageView = 'R.S.008.VIEW';
  static const accessibilityCommunityToolsView = 'R.S.009.VIEW';
  static const residentialExitPortalView = 'R.S.010.VIEW';

  static const quickAccessTap = 'R.B.001.TAP';
  static const accessibilityAccessTap = 'R.B.002.TAP';
  static const commercialAccessTap = 'R.B.003.TAP';
  static const officialWebsiteTap = 'R.B.004.TAP';
  static const checkinTap = 'R.B.005.TAP';
  static const communityToolsTap = 'R.B.006.TAP';
  static const suggestionsTap = 'R.B.007.TAP';
  static const toolsTap = 'R.B.008.TAP';
  static const linksTap = 'R.B.009.TAP';
  static const notebookTap = 'R.B.010.TAP';
  static const youtubeTap = 'R.B.011.TAP';
  static const temporaryPhotoTap = 'R.B.012.TAP';
  static const exitTap = 'R.B.013.TAP';
  static const languageToggleTap = 'R.B.014.TAP';

  static const linksCardOpen = 'R.C.001.OPEN';
  static const toolsCardOpen = 'R.C.002.OPEN';
  static const suggestionsCardOpen = 'R.C.003.OPEN';
  static const communityToolsCardOpen = 'R.C.004.OPEN';
  static const checkinCardOpen = 'R.C.005.OPEN';
  static const safetyGuidanceOpen = 'R.C.006.OPEN';
  static const supportResourcesOpen = 'R.C.007.OPEN';
  static const familyResourcesOpen = 'R.C.008.OPEN';
  static const recoveryResourcesOpen = 'R.C.009.OPEN';
  static const learningResourcesOpen = 'R.C.010.OPEN';
  static const accessibilityResourcesOpen = 'R.C.011.OPEN';
  static const messageCardOpen = 'R.C.012.OPEN';
  static const exitPortalOpen = 'R.C.013.OPEN';
  static const localDialogOpen = 'R.C.014.OPEN';

  static const listenSupportPlay = 'R.A.001.PLAY';

  static const localToolsOpen = 'R.T.001.OPEN';
  static const linksDirectoryOpen = 'R.T.002.OPEN';
  static const notebookOpen = 'R.T.003.OPEN';
  static const messageOfDayOpen = 'R.T.004.OPEN';
  static const accessibilityToolOpen = 'R.T.005.OPEN';
  static const checkinToolOpen = 'R.T.006.OPEN';
  static const communityToolOpen = 'R.T.007.OPEN';

  static const youtubeOpen = 'R.Q.001.OPEN';
  static const officialWebsiteOpen = 'R.Q.002.OPEN';
  static const externalSupportOpen = 'R.Q.003.OPEN';
  static const externalAccessibilityOpen = 'R.Q.004.OPEN';
  static const externalCommunityOpen = 'R.Q.005.OPEN';

  static const linkOpen = 'R.L.001.OPEN';

  static const notebookSave = 'R.N.001.SAVE';
  static const notebookClear = 'R.N.004.CLEAR';

  static const imageUpload = 'R.I.001.UPLOAD';
  static const imageRemove = 'R.I.004.REMOVE';

  static const motivationSelect = 'R.M.001.SELECT';

  static const suggestionSubmit = 'R.G.001.SUBMIT';

  static const supportOpen = 'R.P.001.OPEN';

  static const exit = 'R.X.001.EXIT';

  static const blockedState = 'R.E.001.BLOCK';
}

enum ResidentialSignalFamily {
  screenPresence,
  buttonIntent,
  cardEngagement,
  audioAccessibility,
  toolUsage,
  externalAppOpening,
  linkOpening,
  notebookReflection,
  imageAnchor,
  motivation,
  suggestion,
  complaintSupport,
  exitReturn,
  errorBlockedState,
}

extension ResidentialSignalFamilyLabel on ResidentialSignalFamily {
  String get label {
    switch (this) {
      case ResidentialSignalFamily.screenPresence:
        return 'Screen Presence';
      case ResidentialSignalFamily.buttonIntent:
        return 'Button Intent';
      case ResidentialSignalFamily.cardEngagement:
        return 'Card Engagement';
      case ResidentialSignalFamily.audioAccessibility:
        return 'Audio / Accessibility';
      case ResidentialSignalFamily.toolUsage:
        return 'Tool Usage';
      case ResidentialSignalFamily.externalAppOpening:
        return 'External App Opening';
      case ResidentialSignalFamily.linkOpening:
        return 'Link Opening';
      case ResidentialSignalFamily.notebookReflection:
        return 'Notebook / Reflection';
      case ResidentialSignalFamily.imageAnchor:
        return 'Image Anchor';
      case ResidentialSignalFamily.motivation:
        return 'Motivation';
      case ResidentialSignalFamily.suggestion:
        return 'Suggestion';
      case ResidentialSignalFamily.complaintSupport:
        return 'Complaint / Support';
      case ResidentialSignalFamily.exitReturn:
        return 'Exit / Return';
      case ResidentialSignalFamily.errorBlockedState:
        return 'Error / Blocked State';
    }
  }
}
