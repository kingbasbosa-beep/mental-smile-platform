import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'residential_localizations_ar.dart';
import 'residential_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ResidentialLocalizations
/// returned by `ResidentialLocalizations.of(context)`.
///
/// Applications need to include `ResidentialLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'residential/residential_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ResidentialLocalizations.localizationsDelegates,
///   supportedLocales: ResidentialLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, youâ€™ll need to edit this
/// file.
///
/// First, open your projectâ€™s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// projectâ€™s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ResidentialLocalizations.supportedLocales
/// property.
abstract class ResidentialLocalizations {
  ResidentialLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ResidentialLocalizations of(BuildContext context) {
    return Localizations.of<ResidentialLocalizations>(
      context,
      ResidentialLocalizations,
    )!;
  }

  static const LocalizationsDelegate<ResidentialLocalizations> delegate =
      _ResidentialLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @applicationClientCheckInSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ø·Ù…Ø¦Ù†Ø§Ù† ÙˆØ¯Ø¹Ù…'**
  String get applicationClientCheckInSubtitle;

  /// No description provided for @applicationClientCheckInTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø·Ù…Ù†Ù‘Ø§ Ø¹Ù„ÙŠÙƒ'**
  String get applicationClientCheckInTitle;

  /// No description provided for @applicationClientCommunityToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ·Ø¨ÙŠÙ‚Ø§Øª ÙˆØ£Ø¯ÙˆØ§Øª'**
  String get applicationClientCommunityToolsTitle;

  /// No description provided for @applicationClientDialogLinksBack.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø¹ÙˆØ¯Ø© Ù„Ù„ØªØµÙ†ÙŠÙØ§Øª'**
  String get applicationClientDialogLinksBack;

  /// No description provided for @applicationClientDialogLinksOpen.
  ///
  /// In ar, this message translates to:
  /// **'ÙØªØ­ Ø§Ù„Ø±Ø§Ø¨Ø·'**
  String get applicationClientDialogLinksOpen;

  /// No description provided for @applicationClientDialogLinksSectionHint.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ø®ØªØ± Ø§Ù„Ù‚Ø³Ù… Ø§Ù„Ù…Ù†Ø§Ø³Ø¨ Ø¨Ø¯Ù„Ù‹Ø§ Ù…Ù† Ø§Ù„Ø¨Ø­Ø« ÙˆØ³Ø· Ù‚Ø§Ø¦Ù…Ø© Ø·ÙˆÙŠÙ„Ø©.'**
  String get applicationClientDialogLinksSectionHint;

  /// No description provided for @applicationClientDialogOk.
  ///
  /// In ar, this message translates to:
  /// **'Ø­Ø³Ù†Ù‹Ø§'**
  String get applicationClientDialogOk;

  /// No description provided for @applicationClientDialogSelectMessage.
  ///
  /// In ar, this message translates to:
  /// **'Ø±Ø³Ø§Ù„Ø© Ù„Ù„Ù†ÙˆØªØ©'**
  String get applicationClientDialogSelectMessage;

  /// No description provided for @applicationClientDialogSelectMessageHint.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ø®ØªØ± Ø¬Ù…Ù„Ø© ØªØ­Ø¨ ØªØ¸Ù‡Ø± Ø¹Ù„Ù‰ Ø§Ù„Ù†ÙˆØªØ© Ø§Ù„ÙŠÙˆÙ….'**
  String get applicationClientDialogSelectMessageHint;

  /// No description provided for @applicationClientExitRoom.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø®Ø±ÙˆØ¬ Ù…Ù† Ø§Ù„ØºØ±ÙØ©'**
  String get applicationClientExitRoom;

  /// No description provided for @applicationClientFeatherNotebook.
  ///
  /// In ar, this message translates to:
  /// **'Ù†ÙˆØªØ© Ø§Ù„Ù…Ù„Ø§Ø­Ø¸Ø§Øª'**
  String get applicationClientFeatherNotebook;

  /// No description provided for @applicationClientLinkCategoryAccessibility.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ù…ÙƒØ§Ù†ÙŠØ© Ø§Ù„ÙˆØµÙˆÙ„'**
  String get applicationClientLinkCategoryAccessibility;

  /// No description provided for @applicationClientLinkCategoryFamily.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø£Ø³Ø±Ø© ÙˆØ§Ù„Ø¹Ù„Ø§Ù‚Ø§Øª'**
  String get applicationClientLinkCategoryFamily;

  /// No description provided for @applicationClientLinkCategoryLearning.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ØªØ¹Ù„Ù… ÙˆØ§Ù„ØªØ·ÙˆÙŠØ±'**
  String get applicationClientLinkCategoryLearning;

  /// No description provided for @applicationClientLinkCategoryRecovery.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ØªØ¹Ø§ÙÙŠ ÙˆØ§Ù„Ø¥Ø¯Ù…Ø§Ù†'**
  String get applicationClientLinkCategoryRecovery;

  /// No description provided for @applicationClientLinkCategorySafety.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ø±Ø´Ø§Ø¯Ø§Øª Ø§Ù„Ø£Ù…Ø§Ù† ÙˆØ§Ù„Ø´ÙƒØ§ÙˆÙ‰'**
  String get applicationClientLinkCategorySafety;

  /// No description provided for @applicationClientLinkCategorySupport.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø¯Ø¹Ù… ÙˆØ§Ù„Ø¹Ù„Ø§Ø¬'**
  String get applicationClientLinkCategorySupport;

  /// No description provided for @applicationClientQuickLinkHealthMinistry.
  ///
  /// In ar, this message translates to:
  /// **'ÙˆØ²Ø§Ø±Ø© Ø§Ù„ØµØ­Ø© ÙˆØ§Ù„Ø³ÙƒØ§Ù†'**
  String get applicationClientQuickLinkHealthMinistry;

  /// No description provided for @applicationClientQuickLinkMentalHealthSecretariat.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø£Ù…Ø§Ù†Ø© Ø§Ù„Ø¹Ø§Ù…Ø© Ù„Ù„ØµØ­Ø© Ø§Ù„Ù†ÙØ³ÙŠØ©'**
  String get applicationClientQuickLinkMentalHealthSecretariat;

  /// No description provided for @applicationClientQuickLinkTherapyRoute.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ù„ÙŠÙ„ Ø§Ù„Ø¹Ù„Ø§Ø¬ Ø§Ù„Ø­Ø±'**
  String get applicationClientQuickLinkTherapyRoute;

  /// No description provided for @applicationClientQuickLinkGovernmentComplaints.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø´ÙƒØ§ÙˆÙ‰ Ø§Ù„Ø­ÙƒÙˆÙ…ÙŠØ©'**
  String get applicationClientQuickLinkGovernmentComplaints;

  /// No description provided for @applicationClientQuickLinkHealthInsurance.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ØªØ£Ù…ÙŠÙ† Ø§Ù„ØµØ­ÙŠ'**
  String get applicationClientQuickLinkHealthInsurance;

  /// No description provided for @applicationClientQuickLinkFamilyGuidance.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø¥Ø±Ø´Ø§Ø¯ Ø§Ù„Ø£Ø³Ø±ÙŠ'**
  String get applicationClientQuickLinkFamilyGuidance;

  /// No description provided for @applicationClientQuickLinkParentSupport.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ø¹Ù… Ø§Ù„ÙˆØ§Ù„Ø¯ÙŠÙ†'**
  String get applicationClientQuickLinkParentSupport;

  /// No description provided for @applicationClientQuickLinkChildProtection.
  ///
  /// In ar, this message translates to:
  /// **'Ø­Ù…Ø§ÙŠØ© Ø§Ù„Ø·ÙÙ„'**
  String get applicationClientQuickLinkChildProtection;

  /// No description provided for @applicationClientQuickLinkNa.
  ///
  /// In ar, this message translates to:
  /// **'NA'**
  String get applicationClientQuickLinkNa;

  /// No description provided for @applicationClientQuickLinkAa.
  ///
  /// In ar, this message translates to:
  /// **'AA'**
  String get applicationClientQuickLinkAa;

  /// No description provided for @applicationClientQuickLinkAlAnon.
  ///
  /// In ar, this message translates to:
  /// **'Al-Anon'**
  String get applicationClientQuickLinkAlAnon;

  /// No description provided for @applicationClientQuickLinkNarAnon.
  ///
  /// In ar, this message translates to:
  /// **'Nar-Anon'**
  String get applicationClientQuickLinkNarAnon;

  /// No description provided for @applicationClientQuickLinkRecoveryMaterials.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ÙˆØ§Ø¯ Ø§Ù„ØªØ¹Ø§ÙÙŠ'**
  String get applicationClientQuickLinkRecoveryMaterials;

  /// No description provided for @applicationClientQuickLinkLifeSkills.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ù‡Ø§Ø±Ø§Øª Ø§Ù„Ø­ÙŠØ§Ø©'**
  String get applicationClientQuickLinkLifeSkills;

  /// No description provided for @applicationClientQuickLinkTimeManagement.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„ÙˆÙ‚Øª'**
  String get applicationClientQuickLinkTimeManagement;

  /// No description provided for @applicationClientQuickLinkHabits.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø¹Ø§Ø¯Ø§Øª'**
  String get applicationClientQuickLinkHabits;

  /// No description provided for @applicationClientQuickLinkLearning.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ØªØ¹Ù„Ù…'**
  String get applicationClientQuickLinkLearning;

  /// No description provided for @applicationClientQuickLinkDisabilitySupport.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ø¹Ù… Ø§Ù„Ø£Ø´Ø®Ø§Øµ Ø°ÙˆÙŠ Ø§Ù„Ø¥Ø¹Ø§Ù‚Ø©'**
  String get applicationClientQuickLinkDisabilitySupport;

  /// No description provided for @applicationClientQuickLinkDeafBlindAssociations.
  ///
  /// In ar, this message translates to:
  /// **'Ø¬Ù…Ø¹ÙŠØ§Øª Ø§Ù„ØµÙ… ÙˆØ§Ù„Ù…ÙƒÙÙˆÙÙŠÙ†'**
  String get applicationClientQuickLinkDeafBlindAssociations;

  /// No description provided for @applicationClientQuickLinkNvda.
  ///
  /// In ar, this message translates to:
  /// **'Ù‚Ø§Ø±Ø¦ Ø§Ù„Ø´Ø§Ø´Ø© NVDA'**
  String get applicationClientQuickLinkNvda;

  /// No description provided for @applicationClientQuickLinkTextToSpeech.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ­ÙˆÙŠÙ„ Ø§Ù„Ù†Øµ Ø¥Ù„Ù‰ ØµÙˆØª'**
  String get applicationClientQuickLinkTextToSpeech;

  /// No description provided for @applicationClientLinksSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø±ÙˆØ§Ø¨Ø· Ù…ÙÙŠØ¯Ø© ÙÙŠ Ù…ÙƒØ§Ù† ÙˆØ§Ø­Ø¯'**
  String get applicationClientLinksSubtitle;

  /// No description provided for @applicationClientLinksTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù„ÙŠÙ†ÙƒØ§ØªÙƒ'**
  String get applicationClientLinksTitle;

  /// No description provided for @applicationClientLinkSubSectionNotice.
  ///
  /// In ar, this message translates to:
  /// **'ØªÙ†Ø¨ÙŠÙ‡ Ù…Ù‡Ù…'**
  String get applicationClientLinkSubSectionNotice;

  /// No description provided for @applicationClientLinkSubSectionOfficialAuthorities.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ØªÙ‰ ØªØªÙˆØ¬Ù‡ Ù„Ù„Ø¬Ù‡Ø§Øª Ø§Ù„Ø±Ø³Ù…ÙŠØ©'**
  String get applicationClientLinkSubSectionOfficialAuthorities;

  /// No description provided for @applicationClientLinkSubSectionPlatformContact.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ØªÙ‰ ØªØªÙˆØ§ØµÙ„ Ù…Ø¹ Ø§Ù„Ù…Ù†ØµØ©'**
  String get applicationClientLinkSubSectionPlatformContact;

  /// No description provided for @applicationClientLinkSubSectionSafety.
  ///
  /// In ar, this message translates to:
  /// **'Ù‚Ø¨Ù„ Ø§Ù„ØªÙˆØ§ØµÙ„ Ù…Ø¹ Ù…Ù‚Ø¯Ù… Ø§Ù„Ø®Ø¯Ù…Ø©'**
  String get applicationClientLinkSubSectionSafety;

  /// No description provided for @applicationClientLinkSubSectionSafetyRules.
  ///
  /// In ar, this message translates to:
  /// **'Ù‚ÙˆØ§Ø¹Ø¯ Ø§Ù„Ø£Ù…Ø§Ù†'**
  String get applicationClientLinkSubSectionSafetyRules;

  /// No description provided for @applicationClientNotebookMessage1.
  ///
  /// In ar, this message translates to:
  /// **'Ø®Ø·ÙˆØ© ØµØºÙŠØ±Ø© Ø§Ù„ÙŠÙˆÙ… Ø£ÙØ¶Ù„ Ù…Ù† Ø§Ù†ØªØ¸Ø§Ø± ÙŠÙˆÙ… Ù…Ø«Ø§Ù„ÙŠ.'**
  String get applicationClientNotebookMessage1;

  /// No description provided for @applicationClientNotebookMessage2.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø§ Ø²Ù„Øª ØªÙƒÙ…Ù„ Ø§Ù„Ø·Ø±ÙŠÙ‚ØŒ ÙˆÙ‡Ø°Ø§ ÙŠÙƒÙÙŠ Ø§Ù„ÙŠÙˆÙ….'**
  String get applicationClientNotebookMessage2;

  /// No description provided for @applicationClientNotebookMessage3.
  ///
  /// In ar, this message translates to:
  /// **'Ù„Ø§ ÙŠÙ„Ø²Ù… Ø£Ù† ØªÙƒÙˆÙ† Ù‚ÙˆÙŠÙ‹Ø§ Ø·ÙˆØ§Ù„ Ø§Ù„ÙˆÙ‚Øª.'**
  String get applicationClientNotebookMessage3;

  /// No description provided for @applicationClientNotebookMessage4.
  ///
  /// In ar, this message translates to:
  /// **'ÙƒÙ„ Ù…Ø­Ø§ÙˆÙ„Ø© Ø¬Ø¯ÙŠØ¯Ø© Ù‡ÙŠ ØªÙ‚Ø¯Ù….'**
  String get applicationClientNotebookMessage4;

  /// No description provided for @applicationClientNotebookMessage5.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ù†Øª Ù„Ø³Øª Ù…ØªØ£Ø®Ø±Ù‹Ø§ØŒ Ø£Ù†Øª ØªØªØ­Ø±Ùƒ Ø¨Ø§Ù„Ø³Ø±Ø¹Ø© Ø§Ù„Ù…Ù†Ø§Ø³Ø¨Ø© Ù„Ùƒ.'**
  String get applicationClientNotebookMessage5;

  /// No description provided for @applicationClientSuggestionSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø±Ø£ÙŠÙƒ ÙŠØ·ÙˆØ± Ø§Ù„ØªØ¬Ø±Ø¨Ø©'**
  String get applicationClientSuggestionSubtitle;

  /// No description provided for @applicationClientSuggestionTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø´Ø§Ø±ÙƒÙ†Ø§ Ø¨Ø§Ù‚ØªØ±Ø§Ø­'**
  String get applicationClientSuggestionTitle;

  /// No description provided for @applicationClientTemporaryPhoto.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ø®ØªØ§Ø± ØµÙˆØ±Ø© ØªØ­Ø¨Ù‡Ø§'**
  String get applicationClientTemporaryPhoto;

  /// No description provided for @applicationClientToolsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø³Ø§Ø­ØªÙƒ Ù„Ù„Ø£Ø¯ÙˆØ§Øª Ø§Ù„Ø´Ø®ØµÙŠØ©'**
  String get applicationClientToolsSubtitle;

  /// No description provided for @applicationClientToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§ØªÙƒ'**
  String get applicationClientToolsTitle;

  /// No description provided for @applicationClientYoutube.
  ///
  /// In ar, this message translates to:
  /// **'ÙŠÙˆØªÙŠÙˆØ¨'**
  String get applicationClientYoutube;

  /// No description provided for @generation2MobileRoomLogo.
  ///
  /// In ar, this message translates to:
  /// **'ØºØ±ÙØ© ØµØ¯ÙŠÙ‚ÙŠ'**
  String get generation2MobileRoomLogo;

  /// No description provided for @generation2MobileRoomCards.
  ///
  /// In ar, this message translates to:
  /// **'Ø®ÙŠØ§Ø±Ø§Øª Ø§Ù„ØºØ±ÙØ©'**
  String get generation2MobileRoomCards;

  /// No description provided for @applicationExitButton.
  ///
  /// In ar, this message translates to:
  /// **'Ø®Ø±ÙˆØ¬'**
  String get applicationExitButton;

  /// No description provided for @applicationExitJourneyMessage.
  ///
  /// In ar, this message translates to:
  /// **'Ø®Ø¯ Ù…Ø§ ØªØ­ØªØ§Ø¬Ù‡ Ø§Ù„Ø¢Ù†...\nÙˆØ§Ù„Ø¹ÙˆØ¯Ø© Ø¯Ø§Ø¦Ù…Ù‹Ø§ Ù…ÙØªÙˆØ­Ø© Ù„Ùƒ.'**
  String get applicationExitJourneyMessage;

  /// No description provided for @applicationExitJourneyTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø±Ø­Ù„ØªÙƒ ØªÙ‡Ù…Ù†Ø§'**
  String get applicationExitJourneyTitle;
}

class _ResidentialLocalizationsDelegate
    extends LocalizationsDelegate<ResidentialLocalizations> {
  const _ResidentialLocalizationsDelegate();

  @override
  Future<ResidentialLocalizations> load(Locale locale) {
    return SynchronousFuture<ResidentialLocalizations>(
      lookupResidentialLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ResidentialLocalizationsDelegate old) => false;
}

ResidentialLocalizations lookupResidentialLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return ResidentialLocalizationsAr();
    case 'en':
      return ResidentialLocalizationsEn();
  }

  throw FlutterError(
    'ResidentialLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
