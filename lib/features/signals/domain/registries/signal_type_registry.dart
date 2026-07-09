class SignalTypeRegistry {
  const SignalTypeRegistry._();

  static const String providerContactStarted = 'provider_contact_started';
  static const String centerContactStarted = 'center_contact_started';
  static const String accessibleContactRequested =
      'accessible_contact_requested';
  static const String accessibleContactCompleted =
      'accessible_contact_completed';
  static const String accessibleProviderSelected =
      'accessible_provider_selected';
  static const String accessibleCenterSelected = 'accessible_center_selected';
  static const String supportStarted = 'support_started';
  static const String libraryCategoryOpened = 'library_category_opened';
  static const String providerProfileOpened = 'provider_profile_opened';
  static const String centerProfileOpened = 'center_profile_opened';

  static const List<String> values = <String>[
    providerContactStarted,
    centerContactStarted,
    accessibleContactRequested,
    accessibleContactCompleted,
    accessibleProviderSelected,
    accessibleCenterSelected,
    supportStarted,
    libraryCategoryOpened,
    providerProfileOpened,
    centerProfileOpened,
  ];
}
