import 'package:flutter/widgets.dart';

class AppSectionLocalizations {
  const AppSectionLocalizations();

  static AppSectionLocalizations of(BuildContext context) {
    return const AppSectionLocalizations();
  }

  String get applicationSplashAccessibilityFriend => 'Accessibility friend';
  String get applicationSplashClientFriend => 'Client friend';
  String get applicationSplashCommercialAccess => 'Commercial access';
  String get applicationSplashDaleelTitle => 'Guide';
  String get applicationSplashLanguageSwitch => 'Language';
  String get applicationSplashMobileShortcut => 'Mobile';
  String get applicationSplashOfficialWebsite => 'Official website';
  String get routeNotFound => 'Route not found';
}

class SharedLocalizations {
  const SharedLocalizations();

  static SharedLocalizations of(BuildContext context) {
    return const SharedLocalizations();
  }

  String get applicationAccessibilityListenSupport => 'Listen';
  String get applicationSpeechSemanticLabel => 'Listen';
  String get applicationSpeechTooltip => 'Listen';
  String get applicationSpeechUnavailable => 'Speech unavailable';
}

abstract class ResidentialCapsuleHostLocalizationContract {
  String get contractId;
  String get lineCode;
  int get version;
  String resolve(String key);
}
