class LibrarySignalCode {
  const LibrarySignalCode._();

  static const libraryHomeView = 'L.S.001.VIEW';
  static const libraryPolicyView = 'L.S.002.VIEW';
  static const specialistsBranchView = 'L.S.003.VIEW';
  static const centersBranchView = 'L.S.004.VIEW';
  static const providerCategoryBranchView = 'L.S.005.VIEW';

  static const categoryCardOpen = 'L.C.001.OPEN';
  static const providerSpecialistsOpen = 'L.C.003.OPEN';
  static const providerCentersOpen = 'L.C.004.OPEN';
  static const providerBranchCategoryOpen = 'L.C.005.OPEN';

  static const carouselNextTap = 'L.B.001.TAP';
  static const carouselPreviousTap = 'L.B.002.TAP';
  static const backTap = 'L.B.003.TAP';
  static const policyTap = 'L.B.004.TAP';

  static const searchFuture = 'L.SE.001.SEARCH';
  static const filterFuture = 'L.F.001.FILTER';
  static const sortFuture = 'L.SO.001.SORT';
  static const profileOpenFuture = 'L.P.001.OPEN';
  static const externalResourceOpenFuture = 'L.E.001.OPEN';
  static const registrationSubmitFuture = 'L.R.001.SUBMIT';
  static const accessibilityAction = 'L.A.001.PLAY';
  static const suggestionFuture = 'L.G.001.SUBMIT';
  static const complaintSupportFuture = 'L.X.001.OPEN';
}

enum LibrarySignalFamily {
  screenPresence,
  categorySelection,
  cardOpen,
  profileOpen,
  externalResource,
  registration,
  search,
  filter,
  sorting,
  accessibility,
  suggestion,
  complaintSupport,
  navigation,
}

extension LibrarySignalFamilyLabel on LibrarySignalFamily {
  String get label {
    switch (this) {
      case LibrarySignalFamily.screenPresence:
        return 'Library Screen Presence';
      case LibrarySignalFamily.categorySelection:
        return 'Library Category Selection';
      case LibrarySignalFamily.cardOpen:
        return 'Library Card Open';
      case LibrarySignalFamily.profileOpen:
        return 'Library Profile Open';
      case LibrarySignalFamily.externalResource:
        return 'Library External Resource';
      case LibrarySignalFamily.registration:
        return 'Library Registration';
      case LibrarySignalFamily.search:
        return 'Library Search';
      case LibrarySignalFamily.filter:
        return 'Library Filter';
      case LibrarySignalFamily.sorting:
        return 'Library Sorting';
      case LibrarySignalFamily.accessibility:
        return 'Library Accessibility';
      case LibrarySignalFamily.suggestion:
        return 'Library Suggestion';
      case LibrarySignalFamily.complaintSupport:
        return 'Library Complaint / Support';
      case LibrarySignalFamily.navigation:
        return 'Library Navigation';
    }
  }
}
