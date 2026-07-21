import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'accessibility_localizations_ar.dart';
import 'accessibility_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AccessibilityLocalizations
/// returned by `AccessibilityLocalizations.of(context)`.
///
/// Applications need to include `AccessibilityLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'accessibility/accessibility_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AccessibilityLocalizations.localizationsDelegates,
///   supportedLocales: AccessibilityLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AccessibilityLocalizations.supportedLocales
/// property.
abstract class AccessibilityLocalizations {
  AccessibilityLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AccessibilityLocalizations of(BuildContext context) {
    return Localizations.of<AccessibilityLocalizations>(
      context,
      AccessibilityLocalizations,
    )!;
  }

  static const LocalizationsDelegate<AccessibilityLocalizations> delegate =
      _AccessibilityLocalizationsDelegate();

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

  /// No description provided for @applicationAccessibilityCheckinMessage.
  ///
  /// In ar, this message translates to:
  /// **'ÙˆØ­Ø´ØªÙˆÙ†Ø§ â¤ï¸\nØ£Ù†Ø§ Ø²Ø±Øª ØµÙØ­Ø© Ø·Ù…Ù†Ù‘Ø§ Ø¹Ù„ÙŠÙƒ Ø§Ù„Ù†Ù‡Ø§Ø±Ø¯Ù‡.'**
  String get applicationAccessibilityCheckinMessage;

  /// No description provided for @applicationAccessibilityCheckinQuestion1.
  ///
  /// In ar, this message translates to:
  /// **'Ø¹Ø§Ù…Ù„ Ø¥ÙŠÙ‡ Ø§Ù„Ù†Ù‡Ø§Ø±Ø¯Ù‡ØŸ'**
  String get applicationAccessibilityCheckinQuestion1;

  /// No description provided for @applicationAccessibilityCheckinQuestion2.
  ///
  /// In ar, this message translates to:
  /// **'ÙÙŠ Ø­Ø§Ø¬Ø© ØµØ¹Ø¨Ø© Ù‚Ø§Ø¨Ù„ØªÙƒØŸ'**
  String get applicationAccessibilityCheckinQuestion2;

  /// No description provided for @applicationAccessibilityCheckinQuestion3.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥ÙŠÙ‡ Ø£ÙƒØ«Ø± Ø­Ø§Ø¬Ø© Ù…Ø­ØªØ§Ø¬Ù‡Ø§ Ù…Ù†Ù†Ø§ØŸ'**
  String get applicationAccessibilityCheckinQuestion3;

  /// No description provided for @applicationAccessibilityCheckinQuestion4.
  ///
  /// In ar, this message translates to:
  /// **'Ù‡Ù„ ÙÙŠ Ø£Ø¯Ø§Ø© Ø£Ùˆ Ø®Ø¯Ù…Ø© ØªØ³Ø§Ø¹Ø¯ÙƒØŸ'**
  String get applicationAccessibilityCheckinQuestion4;

  /// No description provided for @applicationAccessibilityCheckinQuestion5.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ­Ø¨ ØªÙ‚ÙˆÙ„ Ù„Ù†Ø§ Ø­Ø§Ø¬Ø©ØŸ'**
  String get applicationAccessibilityCheckinQuestion5;

  /// No description provided for @applicationAccessibilityCheckinSectionGeneral.
  ///
  /// In ar, this message translates to:
  /// **'Ø´ÙƒØ§ÙˆÙ‰ ÙˆÙ…Ù‚ØªØ±Ø­Ø§Øª Ø¹Ø§Ù…Ø©'**
  String get applicationAccessibilityCheckinSectionGeneral;

  /// No description provided for @applicationAccessibilityCheckinSectionSpecialist.
  ///
  /// In ar, this message translates to:
  /// **'Ù„Ùˆ Ø­Ø§Ø¨Ø¨ ØªØ¹Ø±Ù Ø£ÙƒØ«Ø± Ø£Ùˆ ØªØªÙƒÙ„Ù… Ù…Ø¹ Ù…ØªØ®ØµØµ'**
  String get applicationAccessibilityCheckinSectionSpecialist;

  /// No description provided for @applicationAccessibilityCheckinSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø£Ø®ØµØ§Ø¦ÙŠÙˆÙ†'**
  String get applicationAccessibilityCheckinSpecialists;

  /// No description provided for @applicationAccessibilityCheckinCenters.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù…Ø±Ø§ÙƒØ²'**
  String get applicationAccessibilityCheckinCenters;

  /// No description provided for @applicationAccessibilityCheckinLibrary.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù…ÙƒØªØ¨Ø©'**
  String get applicationAccessibilityCheckinLibrary;

  /// No description provided for @applicationAccessibilityCheckinSharingTitle.
  ///
  /// In ar, this message translates to:
  /// **'ÙˆÙ„Ùˆ Ø­Ø§Ø¨Ø¨ ØªØ´Ø§Ø±Ùƒ...'**
  String get applicationAccessibilityCheckinSharingTitle;

  /// No description provided for @applicationAccessibilityCheckinSharingBody.
  ///
  /// In ar, this message translates to:
  /// **'Ù„Ùˆ Ø­Ø§Ø¨Ø¨ ØªØ³ÙŠØ¨ Ø±Ø³Ø§Ù„Ø© Ø¨Ø³ÙŠØ·Ø©ØŒ ÙÙƒØ±Ø©ØŒ Ø¥Ø­Ø³Ø§Ø³ØŒ Ø£Ùˆ ÙƒÙ„Ù…Ø© Ø¯Ø¹Ù… Ù„Ø£ØµØ¯Ù‚Ø§Ø¡ Mental Smile Ø£Ø«Ù†Ø§Ø¡ Ù…Ø±Ø­Ù„Ø© Ø§Ù„Ø§Ø®ØªØ¨Ø§Ø±ØŒ ØªÙ‚Ø¯Ø± ØªØ´Ø§Ø±Ùƒ Ù…Ù† Ù‡Ù†Ø§.'**
  String get applicationAccessibilityCheckinSharingBody;

  /// No description provided for @applicationAccessibilityCheckinSharingShare.
  ///
  /// In ar, this message translates to:
  /// **'Ø´Ø§Ø±Ùƒ Ø¨Ø±Ø³Ø§Ù„Ø©'**
  String get applicationAccessibilityCheckinSharingShare;

  /// No description provided for @applicationAccessibilityCheckinSharingView.
  ///
  /// In ar, this message translates to:
  /// **'Ø´Ø§Ù‡Ø¯ Ø§Ù„Ù…Ø´Ø§Ø±ÙƒØ§Øª'**
  String get applicationAccessibilityCheckinSharingView;

  /// No description provided for @applicationAccessibilityCheckinWhatsappContact.
  ///
  /// In ar, this message translates to:
  /// **'ØªÙˆØ§ØµÙ„ Ù…Ø¹Ù†Ø§ Ø¹Ø¨Ø± ÙˆØ§ØªØ³Ø§Ø¨'**
  String get applicationAccessibilityCheckinWhatsappContact;

  /// No description provided for @applicationAccessibilityCheckinWhatsappNote.
  ///
  /// In ar, this message translates to:
  /// **'Ø´ÙƒØ±Ø§Ù‹ Ø¥Ù†Ùƒ Ø·Ù…Ù‘Ù†ØªÙ†Ø§ Ø¹Ù„ÙŠÙƒ.\nØ¥Ø¬Ø§Ø¨Ø§ØªÙƒ Ù„Ù… ÙŠØªÙ… Ø¥Ø±Ø³Ø§Ù„Ù‡Ø§ Ø£Ùˆ Ø­ÙØ¸Ù‡Ø§.'**
  String get applicationAccessibilityCheckinWhatsappNote;

  /// No description provided for @applicationAccessibilityCheckinWhatsappOpened.
  ///
  /// In ar, this message translates to:
  /// **'âœ… ØªÙ… ÙØªØ­ ÙˆØ§ØªØ³Ø§Ø¨'**
  String get applicationAccessibilityCheckinWhatsappOpened;

  /// No description provided for @applicationAccessibilityCommunityToolsBackToRoom.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø¹ÙˆØ¯Ø© Ù„Ù„ØºØ±ÙØ©'**
  String get applicationAccessibilityCommunityToolsBackToRoom;

  /// No description provided for @applicationAccessibilityCommunityToolsComingSoon.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ù‚ØªØ±Ø­Ø§ØªÙƒÙ… Ø³ØªØ¸Ù‡Ø± Ù‚Ø±ÙŠØ¨Ù‹Ø§ Ù‡Ù†Ø§'**
  String get applicationAccessibilityCommunityToolsComingSoon;

  /// No description provided for @applicationAccessibilityCommunityToolsNote.
  ///
  /// In ar, this message translates to:
  /// **'Ø³Ù†Ø¶ÙŠÙ Ø§Ù„Ø£Ø¯ÙˆØ§Øª Ø§Ù„Ø£ÙƒØ«Ø± Ø·Ù„Ø¨Ù‹Ø§ Ø¨Ù†Ø§Ø¡Ù‹ Ø¹Ù„Ù‰ Ø§Ù‚ØªØ±Ø§Ø­Ø§ØªÙƒÙ….'**
  String get applicationAccessibilityCommunityToolsNote;

  /// No description provided for @applicationAccessibilityDialogRandomMessage.
  ///
  /// In ar, this message translates to:
  /// **'ðŸŽ² Ø§Ø®ØªØ± Ù„ÙŠ Ø±Ø³Ø§Ù„Ø©'**
  String get applicationAccessibilityDialogRandomMessage;

  /// No description provided for @applicationAccessibilityDialogSelectMessage.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ø®ØªØ± Ø±Ø³Ø§Ù„Ø© ØªØ­Ø¨ Ø±Ø¤ÙŠØªÙ‡Ø§ Ø¹Ù„Ù‰ Ø§Ù„Ù†ÙˆØªÙ‡'**
  String get applicationAccessibilityDialogSelectMessage;

  /// No description provided for @applicationAccessibilityLegendAccess.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ù…ÙƒØ§Ù†ÙŠØ© ÙˆØµÙˆÙ„'**
  String get applicationAccessibilityLegendAccess;

  /// No description provided for @applicationAccessibilityLegendAssoc.
  ///
  /// In ar, this message translates to:
  /// **'Ø¬Ù…Ø¹ÙŠØ©'**
  String get applicationAccessibilityLegendAssoc;

  /// No description provided for @applicationAccessibilityLegendEdu.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ¹Ù„ÙŠÙ…'**
  String get applicationAccessibilityLegendEdu;

  /// No description provided for @applicationAccessibilityLegendGov.
  ///
  /// In ar, this message translates to:
  /// **'Ø¬Ù‡Ø© Ø­ÙƒÙˆÙ…ÙŠØ©'**
  String get applicationAccessibilityLegendGov;

  /// No description provided for @applicationAccessibilityLegendIntl.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ù†Ø¸Ù…Ø© Ø¯ÙˆÙ„ÙŠØ©'**
  String get applicationAccessibilityLegendIntl;

  /// No description provided for @applicationAccessibilityLegendLib.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ÙƒØªØ¨Ø©'**
  String get applicationAccessibilityLegendLib;

  /// No description provided for @applicationAccessibilityLegendSign.
  ///
  /// In ar, this message translates to:
  /// **'Ù„ØºØ© Ø¥Ø´Ø§Ø±Ø©'**
  String get applicationAccessibilityLegendSign;

  /// No description provided for @applicationAccessibilityLegendTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ù„ÙŠÙ„ Ø§Ù„Ø¹Ù„Ø§Ù…Ø§Øª'**
  String get applicationAccessibilityLegendTitle;

  /// No description provided for @applicationAccessibilityLegendVisual.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ø¹Ù… Ø¨ØµØ±ÙŠ'**
  String get applicationAccessibilityLegendVisual;

  /// No description provided for @applicationAccessibilityLinksArabAlecsoDesc.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ¹Ù„ÙŠÙ… ÙˆØ«Ù‚Ø§ÙØ© Ø¹Ø±Ø¨ÙŠØ©'**
  String get applicationAccessibilityLinksArabAlecsoDesc;

  /// No description provided for @applicationAccessibilityLinksArabAlecsoTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø£Ù„ÙƒØ³Ùˆ'**
  String get applicationAccessibilityLinksArabAlecsoTitle;

  /// No description provided for @applicationAccessibilityLinksArabAradoDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø¹Ø±ÙØ© ÙˆØ¨Ù†Ø§Ø¡ Ù‚Ø¯Ø±Ø§Øª'**
  String get applicationAccessibilityLinksArabAradoDesc;

  /// No description provided for @applicationAccessibilityLinksArabAradoTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù…Ù†Ø¸Ù…Ø© Ø§Ù„Ø¹Ø±Ø¨ÙŠØ© Ù„Ù„ØªÙ†Ù…ÙŠØ© Ø§Ù„Ø¥Ø¯Ø§Ø±ÙŠØ©'**
  String get applicationAccessibilityLinksArabAradoTitle;

  /// No description provided for @applicationAccessibilityLinksArabEscwaDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø³ÙŠØ§Ø³Ø§Øª Ø¹Ø±Ø¨ÙŠØ© Ø¯Ø§Ù…Ø¬Ø©'**
  String get applicationAccessibilityLinksArabEscwaDesc;

  /// No description provided for @applicationAccessibilityLinksArabEscwaTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø¥Ø³ÙƒÙˆØ§ - Ø§Ù„Ø¥Ø¹Ø§Ù‚Ø© ÙˆØ§Ù„Ø¥Ø¯Ù…Ø§Ø¬'**
  String get applicationAccessibilityLinksArabEscwaTitle;

  /// No description provided for @applicationAccessibilityLinksArabKingSalmanDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¨Ø­Ø§Ø« Ø¥Ø¹Ø§Ù‚Ø© Ø¹Ø±Ø¨ÙŠØ©'**
  String get applicationAccessibilityLinksArabKingSalmanDesc;

  /// No description provided for @applicationAccessibilityLinksArabKingSalmanTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø±ÙƒØ² Ø§Ù„Ù…Ù„Ùƒ Ø³Ù„Ù…Ø§Ù† Ù„Ø£Ø¨Ø­Ø§Ø« Ø§Ù„Ø¥Ø¹Ø§Ù‚Ø©'**
  String get applicationAccessibilityLinksArabKingSalmanTitle;

  /// No description provided for @applicationAccessibilityLinksCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ÙˆØ§Ù‚Ø¹ ÙˆØ¬Ù‡Ø§Øª Ù…Ø³Ø§Ø¹Ø¯Ø© Ù…ØµØ±ÙŠØ© ÙˆØ¹Ø±Ø¨ÙŠØ© ÙˆØ¹Ø§Ù„Ù…ÙŠØ©'**
  String get applicationAccessibilityLinksCardSubtitle;

  /// No description provided for @applicationAccessibilityLinksCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø¨ÙˆØ§Ø¨Ø© Ø§Ù„Ø±ÙˆØ§Ø¨Ø· Ø§Ù„Ù…Ù‡Ù…Ø©'**
  String get applicationAccessibilityLinksCardTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptCouncilDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø­Ù‚ÙˆÙ‚ ÙˆØ®Ø¯Ù…Ø§Øª Ø±Ø³Ù…ÙŠØ©'**
  String get applicationAccessibilityLinksEgyptCouncilDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptCouncilTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù…Ø¬Ù„Ø³ Ø§Ù„Ù‚ÙˆÙ…ÙŠ Ù„Ù„Ø£Ø´Ø®Ø§Øµ Ø°ÙˆÙŠ Ø§Ù„Ø¥Ø¹Ø§Ù‚Ø©'**
  String get applicationAccessibilityLinksEgyptCouncilTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptEducationDesc.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ¹Ù„ÙŠÙ… ÙˆØ®Ø¯Ù…Ø§Øª Ù…Ø¯Ø±Ø³ÙŠØ©'**
  String get applicationAccessibilityLinksEgyptEducationDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptEducationTitle.
  ///
  /// In ar, this message translates to:
  /// **'ÙˆØ²Ø§Ø±Ø© Ø§Ù„ØªØ±Ø¨ÙŠØ© ÙˆØ§Ù„ØªØ¹Ù„ÙŠÙ…'**
  String get applicationAccessibilityLinksEgyptEducationTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptEkbDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ØµØ§Ø¯Ø± ØªØ¹Ù„Ù… Ø±Ù‚Ù…ÙŠØ©'**
  String get applicationAccessibilityLinksEgyptEkbDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptEkbTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø¨Ù†Ùƒ Ø§Ù„Ù…Ø¹Ø±ÙØ© Ø§Ù„Ù…ØµØ±ÙŠ'**
  String get applicationAccessibilityLinksEgyptEkbTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptGovDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø®Ø¯Ù…Ø§Øª Ø­ÙƒÙˆÙ…ÙŠØ© Ø¹Ø§Ù…Ø©'**
  String get applicationAccessibilityLinksEgyptGovDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptGovTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø¨ÙˆØ§Ø¨Ø© Ø§Ù„Ø­ÙƒÙˆÙ…Ø© Ø§Ù„Ù…ØµØ±ÙŠØ©'**
  String get applicationAccessibilityLinksEgyptGovTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptMossDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ø¹Ù… Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠ Ø±Ø³Ù…ÙŠ'**
  String get applicationAccessibilityLinksEgyptMossDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptMossTitle.
  ///
  /// In ar, this message translates to:
  /// **'ÙˆØ²Ø§Ø±Ø© Ø§Ù„ØªØ¶Ø§Ù…Ù† Ø§Ù„Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠ'**
  String get applicationAccessibilityLinksEgyptMossTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalUndesaDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø­Ù‚ÙˆÙ‚ ÙˆØ³ÙŠØ§Ø³Ø§Øª Ø¯ÙˆÙ„ÙŠØ©'**
  String get applicationAccessibilityLinksGlobalUndesaDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalUndesaTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø£Ù…Ù… Ø§Ù„Ù…ØªØ­Ø¯Ø© - Ø§Ù„Ø¥Ø¹Ø§Ù‚Ø©'**
  String get applicationAccessibilityLinksGlobalUndesaTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalUnicefDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø­Ù‚ÙˆÙ‚ Ø§Ù„Ø£Ø·ÙØ§Ù„ ÙˆØ§Ù„Ø¯Ø¹Ù…'**
  String get applicationAccessibilityLinksGlobalUnicefDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalUnicefTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ÙŠÙˆÙ†ÙŠØ³Ù - Ø§Ù„Ø£Ø·ÙØ§Ù„ Ø°ÙˆÙˆ Ø§Ù„Ø¥Ø¹Ø§Ù‚Ø©'**
  String get applicationAccessibilityLinksGlobalUnicefTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalW3cDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ø±Ø´Ø§Ø¯Ø§Øª ÙˆØµÙˆÙ„ Ø±Ù‚Ù…ÙŠØ©'**
  String get applicationAccessibilityLinksGlobalW3cDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalW3cTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø¨Ø§Ø¯Ø±Ø© Ø§Ù„ÙˆØµÙˆÙ„ Ù„Ù„ÙˆÙŠØ¨'**
  String get applicationAccessibilityLinksGlobalW3cTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalWhoDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø¹Ù„ÙˆÙ…Ø§Øª ØµØ­ÙŠØ© Ø¹Ø§Ù„Ù…ÙŠØ©'**
  String get applicationAccessibilityLinksGlobalWhoDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalWhoTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ù†Ø¸Ù…Ø© Ø§Ù„ØµØ­Ø© Ø§Ù„Ø¹Ø§Ù„Ù…ÙŠØ© - Ø§Ù„Ø¥Ø¹Ø§Ù‚Ø©'**
  String get applicationAccessibilityLinksGlobalWhoTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeBookshareDesc.
  ///
  /// In ar, this message translates to:
  /// **'ÙƒØªØ¨ Ù‚Ø§Ø¨Ù„Ø© Ù„Ù„ÙˆØµÙˆÙ„'**
  String get applicationAccessibilityLinksKnowledgeBookshareDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeBookshareTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø¨ÙˆÙˆÙƒØ´ÙŠØ±'**
  String get applicationAccessibilityLinksKnowledgeBookshareTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeDaisyDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø¹Ø§ÙŠÙŠØ± Ù‚Ø±Ø§Ø¡Ø© Ù…ÙŠØ³Ø±Ø©'**
  String get applicationAccessibilityLinksKnowledgeDaisyDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeDaisyTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§ØªØ­Ø§Ø¯ Ø¯ÙŠØ²ÙŠ'**
  String get applicationAccessibilityLinksKnowledgeDaisyTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeLocDesc.
  ///
  /// In ar, this message translates to:
  /// **'ÙƒØªØ¨ Ù…ÙŠØ³Ø±Ø© ØµÙˆØªÙŠØ©'**
  String get applicationAccessibilityLinksKnowledgeLocDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeLocTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ÙƒØªØ¨Ø© Ø§Ù„ÙƒÙˆÙ†ØºØ±Ø³ Ù„Ø®Ø¯Ù…Ø© Ø§Ù„Ù…ÙƒÙÙˆÙÙŠÙ†'**
  String get applicationAccessibilityLinksKnowledgeLocTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeWbuDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ø¹Ù… Ø¨ØµØ±ÙŠ Ø¹Ø§Ù„Ù…ÙŠ'**
  String get applicationAccessibilityLinksKnowledgeWbuDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeWbuTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø§ØªØ­Ø§Ø¯ Ø§Ù„Ø¹Ø§Ù„Ù…ÙŠ Ù„Ù„Ù…ÙƒÙÙˆÙÙŠÙ†'**
  String get applicationAccessibilityLinksKnowledgeWbuTitle;

  /// No description provided for @applicationAccessibilityLinksSectionArab.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ÙˆØ·Ù† Ø§Ù„Ø¹Ø±Ø¨ÙŠ'**
  String get applicationAccessibilityLinksSectionArab;

  /// No description provided for @applicationAccessibilityLinksSectionEgypt.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ØµØ±'**
  String get applicationAccessibilityLinksSectionEgypt;

  /// No description provided for @applicationAccessibilityLinksSectionGlobal.
  ///
  /// In ar, this message translates to:
  /// **'Ø¹Ø§Ù„Ù…ÙŠ'**
  String get applicationAccessibilityLinksSectionGlobal;

  /// No description provided for @applicationAccessibilityLinksSectionKnowledge.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ÙƒØªØ¨Ø§Øª ÙˆÙ…ØµØ§Ø¯Ø± Ù…Ø¹Ø±ÙØ©'**
  String get applicationAccessibilityLinksSectionKnowledge;

  /// No description provided for @applicationAccessibilityMessage1.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ù†Ø§ Ø£Ù‚ÙˆÙ‰ Ù…Ù…Ø§ Ø£Ø¹ØªÙ‚Ø¯'**
  String get applicationAccessibilityMessage1;

  /// No description provided for @applicationAccessibilityMessage10.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ÙŠÙˆÙ… ÙŠÙƒÙÙŠ ÙƒÙ…Ø§ Ù‡Ùˆ'**
  String get applicationAccessibilityMessage10;

  /// No description provided for @applicationAccessibilityMessage11.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø³ØªØ·ÙŠØ¹ Ø§Ù„Ø¨Ø¯Ø¡ Ù…Ù† Ø¬Ø¯ÙŠØ¯'**
  String get applicationAccessibilityMessage11;

  /// No description provided for @applicationAccessibilityMessage12.
  ///
  /// In ar, this message translates to:
  /// **'Ù„ÙƒÙ„ Ù…Ø´ÙƒÙ„Ø© Ø£ÙƒØ«Ø± Ù…Ù† Ø­Ù„'**
  String get applicationAccessibilityMessage12;

  /// No description provided for @applicationAccessibilityMessage13.
  ///
  /// In ar, this message translates to:
  /// **'Ø®Ø·ÙˆØ© ØµØºÙŠØ±Ø© Ø£ÙØ¶Ù„ Ù…Ù† Ø§Ù„ÙˆÙ‚ÙˆÙ'**
  String get applicationAccessibilityMessage13;

  /// No description provided for @applicationAccessibilityMessage14.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø³ØªØ­Ù‚ Ø§Ù„Ù„Ø·Ù Ù…Ø¹ Ù†ÙØ³ÙŠ'**
  String get applicationAccessibilityMessage14;

  /// No description provided for @applicationAccessibilityMessage15.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø£Ù…ÙˆØ± ØªØªØ­Ø³Ù† Ø¨Ø§Ù„ØªØ¯Ø±ÙŠØ¬'**
  String get applicationAccessibilityMessage15;

  /// No description provided for @applicationAccessibilityMessage16.
  ///
  /// In ar, this message translates to:
  /// **'ÙƒÙ„ ÙŠÙˆÙ… ØµÙØ­Ø© Ø¬Ø¯ÙŠØ¯Ø©'**
  String get applicationAccessibilityMessage16;

  /// No description provided for @applicationAccessibilityMessage17.
  ///
  /// In ar, this message translates to:
  /// **'Ù„Ø¯ÙŠ Ø£Ø´ÙŠØ§Ø¡ Ø¬Ù…ÙŠÙ„Ø© Ù„Ù… Ø£ÙƒØªØ´ÙÙ‡Ø§ Ø¨Ø¹Ø¯'**
  String get applicationAccessibilityMessage17;

  /// No description provided for @applicationAccessibilityMessage18.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù‡Ø¯ÙˆØ¡ Ù‚ÙˆØ© Ø£ÙŠØ¶Ù‹Ø§'**
  String get applicationAccessibilityMessage18;

  /// No description provided for @applicationAccessibilityMessage19.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ù†Ø§ Ø£Ø­Ø§ÙˆÙ„ ÙˆÙ‡Ø°Ø§ ÙŠÙƒÙÙŠ'**
  String get applicationAccessibilityMessage19;

  /// No description provided for @applicationAccessibilityMessage2.
  ///
  /// In ar, this message translates to:
  /// **'ØºØ¯Ù‹Ø§ ÙØ±ØµØ© Ø¬Ø¯ÙŠØ¯Ø©'**
  String get applicationAccessibilityMessage2;

  /// No description provided for @applicationAccessibilityMessage20.
  ///
  /// In ar, this message translates to:
  /// **'Ù„Ø§ Ø¨Ø£Ø³ Ø£Ù† Ø£Ø±ØªØ§Ø­ Ù‚Ù„ÙŠÙ„Ø§Ù‹'**
  String get applicationAccessibilityMessage20;

  /// No description provided for @applicationAccessibilityMessage3.
  ///
  /// In ar, this message translates to:
  /// **'Ù„Ø³Øª ÙˆØ­Ø¯ÙŠ'**
  String get applicationAccessibilityMessage3;

  /// No description provided for @applicationAccessibilityMessage4.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø³ØªØ­Ù‚ Ø§Ù„Ø±Ø§Ø­Ø©'**
  String get applicationAccessibilityMessage4;

  /// No description provided for @applicationAccessibilityMessage5.
  ///
  /// In ar, this message translates to:
  /// **'Ø®Ø·ÙˆØ© ØµØºÙŠØ±Ø© ØªÙƒÙÙŠ Ø§Ù„ÙŠÙˆÙ…'**
  String get applicationAccessibilityMessage5;

  /// No description provided for @applicationAccessibilityMessage6.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ø­Ù…Ø¯ Ù„Ù„Ù‡ Ø¹Ù„Ù‰ Ù…Ø§ Ø£Ù†Ø§ ÙÙŠÙ‡'**
  String get applicationAccessibilityMessage6;

  /// No description provided for @applicationAccessibilityMessage7.
  ///
  /// In ar, this message translates to:
  /// **'Ø³Ø£Ø¹Ø·ÙŠ Ù†ÙØ³ÙŠ ÙˆÙ‚ØªÙ‹Ø§ Ù„Ù„Ø±Ø§Ø­Ø©'**
  String get applicationAccessibilityMessage7;

  /// No description provided for @applicationAccessibilityMessage8.
  ///
  /// In ar, this message translates to:
  /// **'ÙˆØ¬ÙˆØ¯ÙŠ Ù…Ù‡Ù…'**
  String get applicationAccessibilityMessage8;

  /// No description provided for @applicationAccessibilityMessage9.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø§ Ø²Ø§Ù„Øª Ù‡Ù†Ø§Ùƒ Ø£Ø´ÙŠØ§Ø¡ Ø¬Ù…ÙŠÙ„Ø© ØªÙ†ØªØ¸Ø±Ù†ÙŠ'**
  String get applicationAccessibilityMessage9;

  /// No description provided for @applicationAccessibilitySuggestionsCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ·ÙˆÙŠØ± Ø§Ù„Ø£Ø¯ÙˆØ§Øª ÙˆØ§Ù„Ø®Ø¯Ù…Ø§Øª'**
  String get applicationAccessibilitySuggestionsCardSubtitle;

  /// No description provided for @applicationAccessibilitySuggestionsCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø´Ø§Ø±Ùƒ Ø¨Ø§Ù‚ØªØ±Ø§Ø­'**
  String get applicationAccessibilitySuggestionsCardTitle;

  /// No description provided for @applicationAccessibilitySuggestionsHintLink.
  ///
  /// In ar, this message translates to:
  /// **'Website / App / YouTube / Article'**
  String get applicationAccessibilitySuggestionsHintLink;

  /// No description provided for @applicationAccessibilitySuggestionsHintName.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø«Ø§Ù„: Ù‚Ø§Ø±Ø¦ Ø´Ø§Ø´Ø© Ø¹Ø±Ø¨ÙŠ'**
  String get applicationAccessibilitySuggestionsHintName;

  /// No description provided for @applicationAccessibilitySuggestionsHintReason.
  ///
  /// In ar, this message translates to:
  /// **'ÙƒÙŠÙ Ø³ØªØ³Ø§Ø¹Ø¯ Ù‡Ø°Ù‡ Ø§Ù„Ø£Ø¯Ø§Ø© Ø§Ù„Ù…Ø³ØªØ®Ø¯Ù…ÙŠÙ†ØŸ'**
  String get applicationAccessibilitySuggestionsHintReason;

  /// No description provided for @applicationAccessibilitySuggestionsLabelLink.
  ///
  /// In ar, this message translates to:
  /// **'Ø±Ø§Ø¨Ø· Ø£Ùˆ ØµÙØ­Ø© Ù‚Ø¯ ØªØ³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ Ø§Ù„Ø¹Ø«ÙˆØ± Ø¹Ù„ÙŠÙ‡Ø§'**
  String get applicationAccessibilitySuggestionsLabelLink;

  /// No description provided for @applicationAccessibilitySuggestionsLabelName.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ø³Ù… Ø§Ù„Ø£Ø¯Ø§Ø© Ø£Ùˆ Ø§Ù„ÙÙƒØ±Ø© Ø§Ù„Ù…Ù‚ØªØ±Ø­Ø©'**
  String get applicationAccessibilitySuggestionsLabelName;

  /// No description provided for @applicationAccessibilitySuggestionsLabelReason.
  ///
  /// In ar, this message translates to:
  /// **'Ø³Ø¨Ø¨ Ø§Ù„Ø§Ù‚ØªØ±Ø§Ø­'**
  String get applicationAccessibilitySuggestionsLabelReason;

  /// No description provided for @applicationAccessibilitySuggestionsNotAttached.
  ///
  /// In ar, this message translates to:
  /// **'ØºÙŠØ± Ù…Ø±ÙÙ‚'**
  String get applicationAccessibilitySuggestionsNotAttached;

  /// No description provided for @applicationAccessibilitySuggestionsSubmit.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ø±Ø³Ø§Ù„'**
  String get applicationAccessibilitySuggestionsSubmit;

  /// No description provided for @applicationAccessibilitySuggestionsSubmitButton.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ø±Ø³Ø§Ù„ Ø§Ù„Ø§Ù‚ØªØ±Ø§Ø­'**
  String get applicationAccessibilitySuggestionsSubmitButton;

  /// No description provided for @applicationAccessibilitySuggestionsSuccessBody.
  ///
  /// In ar, this message translates to:
  /// **'Ø´ÙƒØ±Ø§Ù‹ Ù„Ù…Ø³Ø§Ù‡Ù…ØªÙƒ.\n\nØ§Ù‚ØªØ±Ø§Ø­Ø§ØªÙƒÙ… ØªØ³Ø§Ø¹Ø¯Ù†Ø§ Ø¹Ù„Ù‰ ØªØ·ÙˆÙŠØ± Ø§Ù„Ù…Ù†ØµØ© ÙˆØ¥Ø¶Ø§ÙØ© Ø£Ø¯ÙˆØ§Øª Ø¬Ø¯ÙŠØ¯Ø© ÙŠØ³ØªÙÙŠØ¯ Ù…Ù†Ù‡Ø§ Ø§Ù„Ø¬Ù…ÙŠØ¹.\n\nÙ‚Ø¯ ØªØ±Ù‰ Ø§Ù‚ØªØ±Ø§Ø­Ùƒ Ø¶Ù…Ù† Ø§Ù„Ø£Ø¯ÙˆØ§Øª Ø§Ù„Ù…ØªØ§Ø­Ø© Ù…Ø³ØªÙ‚Ø¨Ù„Ø§Ù‹.'**
  String get applicationAccessibilitySuggestionsSuccessBody;

  /// No description provided for @applicationAccessibilitySuggestionsSuccessTitle.
  ///
  /// In ar, this message translates to:
  /// **'âœ… ØªÙ… Ø¥Ø±Ø³Ø§Ù„ Ø§Ù‚ØªØ±Ø§Ø­Ùƒ Ø¨Ù†Ø¬Ø§Ø­'**
  String get applicationAccessibilitySuggestionsSuccessTitle;

  /// No description provided for @applicationAccessibilitySuggestionsValidation.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ù† ÙØ¶Ù„Ùƒ Ø§ÙƒØªØ¨ Ø§Ù„Ø±Ø³Ø§Ù„Ø© Ø£ÙˆÙ„Ù‹Ø§.'**
  String get applicationAccessibilitySuggestionsValidation;

  /// No description provided for @applicationAccessibilitySuggestionsWhatsappMessage.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù‚ØªØ±Ø§Ø­ Ø¬Ø¯ÙŠØ¯ Ù…Ù† Ø¨ÙˆØ§Ø¨Ø© Ø§Ù„Ø§Ø­ØªÙŠØ§Ø¬Ø§Øª\n\nØ§Ø³Ù… Ø§Ù„Ø£Ø¯Ø§Ø©:\n{name}\n\nØ³Ø¨Ø¨ Ø§Ù„Ø§Ù‚ØªØ±Ø§Ø­:\n{reason}\n\nØ§Ù„Ø±Ø§Ø¨Ø· Ø§Ù„Ù…Ù‚ØªØ±Ø­:\n{link}'**
  String applicationAccessibilitySuggestionsWhatsappMessage(
    String name,
    String reason,
    String link,
  );

  /// No description provided for @applicationAccessibilityToolsBeMyEyesDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø³Ø§Ø¹Ø¯Ø© Ø¨ØµØ±ÙŠØ© Ù…Ø¨Ø§Ø´Ø±Ø©'**
  String get applicationAccessibilityToolsBeMyEyesDesc;

  /// No description provided for @applicationAccessibilityToolsCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§Øª ØªØ³Ø§Ø¹Ø¯ ÙÙŠ Ø§Ù„ØªÙˆØ§ØµÙ„ ÙˆØ§Ù„Ù‚Ø±Ø§Ø¡Ø© ÙˆØ§Ù„ÙÙ‡Ù…'**
  String get applicationAccessibilityToolsCardSubtitle;

  /// No description provided for @applicationAccessibilityToolsCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø¨ÙˆØ§Ø¨Ø© Ø§Ù„Ø£Ø¯ÙˆØ§Øª Ø§Ù„Ù…Ø³Ø§Ø¹Ø¯Ø©'**
  String get applicationAccessibilityToolsCardTitle;

  /// No description provided for @applicationAccessibilityToolsChatGptDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø³Ø§Ø¹Ø¯Ø© ÙÙŠ Ø§Ù„ÙƒØªØ§Ø¨Ø© ÙˆØ§Ù„ÙÙ‡Ù…'**
  String get applicationAccessibilityToolsChatGptDesc;

  /// No description provided for @applicationAccessibilityToolsCopilotDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø³Ø§Ø¹Ø¯ Ø°ÙƒÙŠ Ù…Ù† Ù…Ø§ÙŠÙƒØ±ÙˆØ³ÙˆÙØª'**
  String get applicationAccessibilityToolsCopilotDesc;

  /// No description provided for @applicationAccessibilityToolsDeepLDesc.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ±Ø¬Ù…Ø© Ù†ØµÙŠØ© Ø¯Ù‚ÙŠÙ‚Ø©'**
  String get applicationAccessibilityToolsDeepLDesc;

  /// No description provided for @applicationAccessibilityToolsGeminiDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø³Ø§Ø¹Ø¯ Ø°ÙƒÙŠ Ù…Ù† Ø¬ÙˆØ¬Ù„'**
  String get applicationAccessibilityToolsGeminiDesc;

  /// No description provided for @applicationAccessibilityToolsGoogleTranslateDesc.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ±Ø¬Ù…Ø© Ù†ØµÙˆØµ ÙˆÙ…Ø­Ø§Ø¯Ø«Ø§Øª'**
  String get applicationAccessibilityToolsGoogleTranslateDesc;

  /// No description provided for @applicationAccessibilityToolsImmersiveReaderDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù‚Ø±Ø§Ø¡Ø© ÙˆÙÙ‡Ù… Ø£Ø³Ù‡Ù„'**
  String get applicationAccessibilityToolsImmersiveReaderDesc;

  /// No description provided for @applicationAccessibilityToolsLiveTranscribeDesc.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ­ÙˆÙŠÙ„ Ø§Ù„ÙƒÙ„Ø§Ù… Ø¥Ù„Ù‰ Ù†Øµ'**
  String get applicationAccessibilityToolsLiveTranscribeDesc;

  /// No description provided for @applicationAccessibilityToolsLookoutDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø¯Ø¹Ù… Ø¨ØµØ±ÙŠ Ù„Ù„Ù‡Ø§ØªÙ'**
  String get applicationAccessibilityToolsLookoutDesc;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorDesc.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ±Ø¬Ù…Ø© ÙˆÙ…Ø­Ø§Ø¯Ø«Ø§Øª Ù…ØªØ¹Ø¯Ø¯Ø©'**
  String get applicationAccessibilityToolsMicrosoftTranslatorDesc;

  /// No description provided for @applicationAccessibilityToolsOpen.
  ///
  /// In ar, this message translates to:
  /// **'ÙØªØ­ Ø§Ù„Ø£Ø¯Ø§Ø©'**
  String get applicationAccessibilityToolsOpen;

  /// No description provided for @applicationAccessibilityToolsReadAloudDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù‚Ø±Ø§Ø¡Ø© Ø§Ù„Ù†ØµÙˆØµ ØµÙˆØªÙŠÙ‹Ø§'**
  String get applicationAccessibilityToolsReadAloudDesc;

  /// No description provided for @applicationAccessibilityToolsSectionAudio.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§Øª Ø¯Ø¹Ù… ØµÙˆØªÙŠ'**
  String get applicationAccessibilityToolsSectionAudio;

  /// No description provided for @applicationAccessibilityToolsSectionCommunication.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§Øª ØªÙˆØ§ØµÙ„'**
  String get applicationAccessibilityToolsSectionCommunication;

  /// No description provided for @applicationAccessibilityToolsSectionDaily.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§Øª Ù…Ø³Ø§Ø¹Ø¯Ø© ÙŠÙˆÙ…ÙŠØ©'**
  String get applicationAccessibilityToolsSectionDaily;

  /// No description provided for @applicationAccessibilityToolsSectionReading.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§Øª Ù‚Ø±Ø§Ø¡Ø©'**
  String get applicationAccessibilityToolsSectionReading;

  /// No description provided for @applicationAccessibilityToolsSectionVisual.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§Øª Ø¯Ø¹Ù… Ø¨ØµØ±ÙŠ'**
  String get applicationAccessibilityToolsSectionVisual;

  /// No description provided for @applicationAccessibilityToolsSectionWriting.
  ///
  /// In ar, this message translates to:
  /// **'Ø£Ø¯ÙˆØ§Øª ÙƒØªØ§Ø¨Ø©'**
  String get applicationAccessibilityToolsSectionWriting;

  /// No description provided for @applicationAccessibilityToolsSeeingAIDesc.
  ///
  /// In ar, this message translates to:
  /// **'ÙˆØµÙ ÙˆÙ‚Ø±Ø§Ø¡Ø© Ù…Ø±Ø¦ÙŠØ©'**
  String get applicationAccessibilityToolsSeeingAIDesc;

  /// No description provided for @applicationAccessibilityToolsVoiceTypingDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ø¥Ù…Ù„Ø§Ø¡ ØµÙˆØªÙŠ Ù„Ù„Ù†Øµ'**
  String get applicationAccessibilityToolsVoiceTypingDesc;

  /// No description provided for @applicationAccessibilityToolsYoutubeCaptionsDesc.
  ///
  /// In ar, this message translates to:
  /// **'Ù†ØµÙˆØµ Ù„Ù„ÙÙŠØ¯ÙŠÙˆÙ‡Ø§Øª'**
  String get applicationAccessibilityToolsYoutubeCaptionsDesc;

  /// No description provided for @applicationAccessibilityToolsChatGptTitle.
  ///
  /// In ar, this message translates to:
  /// **'ChatGPT'**
  String get applicationAccessibilityToolsChatGptTitle;

  /// No description provided for @applicationAccessibilityToolsGeminiTitle.
  ///
  /// In ar, this message translates to:
  /// **'Gemini'**
  String get applicationAccessibilityToolsGeminiTitle;

  /// No description provided for @applicationAccessibilityToolsCopilotTitle.
  ///
  /// In ar, this message translates to:
  /// **'Copilot'**
  String get applicationAccessibilityToolsCopilotTitle;

  /// No description provided for @applicationAccessibilityToolsVoiceTypingTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„ÙƒØªØ§Ø¨Ø© Ø¨Ø§Ù„ØµÙˆØª'**
  String get applicationAccessibilityToolsVoiceTypingTitle;

  /// No description provided for @applicationAccessibilityToolsGoogleTranslateTitle.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ±Ø¬Ù…Ø© Ø¬ÙˆØ¬Ù„'**
  String get applicationAccessibilityToolsGoogleTranslateTitle;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…ØªØ±Ø¬Ù… Ù…Ø§ÙŠÙƒØ±ÙˆØ³ÙˆÙØª'**
  String get applicationAccessibilityToolsMicrosoftTranslatorTitle;

  /// No description provided for @applicationAccessibilityToolsDeepLTitle.
  ///
  /// In ar, this message translates to:
  /// **'DeepL'**
  String get applicationAccessibilityToolsDeepLTitle;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorConversationTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ù…Ø­Ø§Ø¯Ø«Ø© Ù…ØªØ±Ø¬Ù… Ù…Ø§ÙŠÙƒØ±ÙˆØ³ÙˆÙØª'**
  String get applicationAccessibilityToolsMicrosoftTranslatorConversationTitle;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorConversationDesc.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ±Ø¬Ù…Ø© Ù…Ø­Ø§Ø¯Ø«Ø§Øª Ù…Ø¨Ø§Ø´Ø±Ø©'**
  String get applicationAccessibilityToolsMicrosoftTranslatorConversationDesc;

  /// No description provided for @applicationAccessibilityToolsSeeingAITitle.
  ///
  /// In ar, this message translates to:
  /// **'Seeing AI'**
  String get applicationAccessibilityToolsSeeingAITitle;

  /// No description provided for @applicationAccessibilityToolsLookoutTitle.
  ///
  /// In ar, this message translates to:
  /// **'Lookout Ù…Ù† Ø¬ÙˆØ¬Ù„'**
  String get applicationAccessibilityToolsLookoutTitle;

  /// No description provided for @applicationAccessibilityToolsLiveTranscribeTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù†Ø³Ø® Ø§Ù„Ù†ØµÙŠ Ø§Ù„Ù…Ø¨Ø§Ø´Ø±'**
  String get applicationAccessibilityToolsLiveTranscribeTitle;

  /// No description provided for @applicationAccessibilityToolsYoutubeCaptionsTitle.
  ///
  /// In ar, this message translates to:
  /// **'ØªØ±Ø¬Ù…Ø© ÙŠÙˆØªÙŠÙˆØ¨ Ø§Ù„Ù†ØµÙŠØ©'**
  String get applicationAccessibilityToolsYoutubeCaptionsTitle;

  /// No description provided for @applicationAccessibilityToolsReadAloudTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù‚Ø±Ø§Ø¡Ø© Ø¨ØµÙˆØª Ø¹Ø§Ù„'**
  String get applicationAccessibilityToolsReadAloudTitle;

  /// No description provided for @applicationAccessibilityToolsImmersiveReaderTitle.
  ///
  /// In ar, this message translates to:
  /// **'Ø§Ù„Ù‚Ø§Ø±Ø¦ Ø§Ù„Ø´Ø§Ù…Ù„'**
  String get applicationAccessibilityToolsImmersiveReaderTitle;

  /// No description provided for @applicationAccessibilityToolsBeMyEyesTitle.
  ///
  /// In ar, this message translates to:
  /// **'ÙƒÙ† Ø¹ÙŠÙ†ÙŠ'**
  String get applicationAccessibilityToolsBeMyEyesTitle;
}

class _AccessibilityLocalizationsDelegate
    extends LocalizationsDelegate<AccessibilityLocalizations> {
  const _AccessibilityLocalizationsDelegate();

  @override
  Future<AccessibilityLocalizations> load(Locale locale) {
    return SynchronousFuture<AccessibilityLocalizations>(
      lookupAccessibilityLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AccessibilityLocalizationsDelegate old) => false;
}

AccessibilityLocalizations lookupAccessibilityLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AccessibilityLocalizationsAr();
    case 'en':
      return AccessibilityLocalizationsEn();
  }

  throw FlutterError(
    'AccessibilityLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
