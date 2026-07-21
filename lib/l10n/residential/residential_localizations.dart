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
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
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
        context, ResidentialLocalizations)!;
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
    Locale('en')
  ];

  /// No description provided for @applicationClientCheckInSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'اطمئنان ودعم'**
  String get applicationClientCheckInSubtitle;

  /// No description provided for @applicationClientCheckInTitle.
  ///
  /// In ar, this message translates to:
  /// **'طمنّا عليك'**
  String get applicationClientCheckInTitle;

  /// No description provided for @applicationClientCommunityToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تطبيقات وأدوات'**
  String get applicationClientCommunityToolsTitle;

  /// No description provided for @applicationClientDialogLinksBack.
  ///
  /// In ar, this message translates to:
  /// **'العودة للتصنيفات'**
  String get applicationClientDialogLinksBack;

  /// No description provided for @applicationClientDialogLinksOpen.
  ///
  /// In ar, this message translates to:
  /// **'فتح الرابط'**
  String get applicationClientDialogLinksOpen;

  /// No description provided for @applicationClientDialogLinksSectionHint.
  ///
  /// In ar, this message translates to:
  /// **'اختر القسم المناسب بدلًا من البحث وسط قائمة طويلة.'**
  String get applicationClientDialogLinksSectionHint;

  /// No description provided for @applicationClientDialogOk.
  ///
  /// In ar, this message translates to:
  /// **'حسنًا'**
  String get applicationClientDialogOk;

  /// No description provided for @applicationClientDialogSelectMessage.
  ///
  /// In ar, this message translates to:
  /// **'رسالة للنوتة'**
  String get applicationClientDialogSelectMessage;

  /// No description provided for @applicationClientDialogSelectMessageHint.
  ///
  /// In ar, this message translates to:
  /// **'اختر جملة تحب تظهر على النوتة اليوم.'**
  String get applicationClientDialogSelectMessageHint;

  /// No description provided for @applicationClientExitRoom.
  ///
  /// In ar, this message translates to:
  /// **'الخروج من الغرفة'**
  String get applicationClientExitRoom;

  /// No description provided for @applicationClientFeatherNotebook.
  ///
  /// In ar, this message translates to:
  /// **'نوتة الملاحظات'**
  String get applicationClientFeatherNotebook;

  /// No description provided for @applicationClientLinkCategoryAccessibility.
  ///
  /// In ar, this message translates to:
  /// **'إمكانية الوصول'**
  String get applicationClientLinkCategoryAccessibility;

  /// No description provided for @applicationClientLinkCategoryFamily.
  ///
  /// In ar, this message translates to:
  /// **'الأسرة والعلاقات'**
  String get applicationClientLinkCategoryFamily;

  /// No description provided for @applicationClientLinkCategoryLearning.
  ///
  /// In ar, this message translates to:
  /// **'التعلم والتطوير'**
  String get applicationClientLinkCategoryLearning;

  /// No description provided for @applicationClientLinkCategoryRecovery.
  ///
  /// In ar, this message translates to:
  /// **'التعافي والإدمان'**
  String get applicationClientLinkCategoryRecovery;

  /// No description provided for @applicationClientLinkCategorySafety.
  ///
  /// In ar, this message translates to:
  /// **'إرشادات الأمان والشكاوى'**
  String get applicationClientLinkCategorySafety;

  /// No description provided for @applicationClientLinkCategorySupport.
  ///
  /// In ar, this message translates to:
  /// **'الدعم والعلاج'**
  String get applicationClientLinkCategorySupport;

  /// No description provided for @applicationClientQuickLinkHealthMinistry.
  ///
  /// In ar, this message translates to:
  /// **'وزارة الصحة والسكان'**
  String get applicationClientQuickLinkHealthMinistry;

  /// No description provided for @applicationClientQuickLinkMentalHealthSecretariat.
  ///
  /// In ar, this message translates to:
  /// **'الأمانة العامة للصحة النفسية'**
  String get applicationClientQuickLinkMentalHealthSecretariat;

  /// No description provided for @applicationClientQuickLinkTherapyRoute.
  ///
  /// In ar, this message translates to:
  /// **'دليل العلاج الحر'**
  String get applicationClientQuickLinkTherapyRoute;

  /// No description provided for @applicationClientQuickLinkGovernmentComplaints.
  ///
  /// In ar, this message translates to:
  /// **'الشكاوى الحكومية'**
  String get applicationClientQuickLinkGovernmentComplaints;

  /// No description provided for @applicationClientQuickLinkHealthInsurance.
  ///
  /// In ar, this message translates to:
  /// **'التأمين الصحي'**
  String get applicationClientQuickLinkHealthInsurance;

  /// No description provided for @applicationClientQuickLinkFamilyGuidance.
  ///
  /// In ar, this message translates to:
  /// **'الإرشاد الأسري'**
  String get applicationClientQuickLinkFamilyGuidance;

  /// No description provided for @applicationClientQuickLinkParentSupport.
  ///
  /// In ar, this message translates to:
  /// **'دعم الوالدين'**
  String get applicationClientQuickLinkParentSupport;

  /// No description provided for @applicationClientQuickLinkChildProtection.
  ///
  /// In ar, this message translates to:
  /// **'حماية الطفل'**
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
  /// **'مواد التعافي'**
  String get applicationClientQuickLinkRecoveryMaterials;

  /// No description provided for @applicationClientQuickLinkLifeSkills.
  ///
  /// In ar, this message translates to:
  /// **'مهارات الحياة'**
  String get applicationClientQuickLinkLifeSkills;

  /// No description provided for @applicationClientQuickLinkTimeManagement.
  ///
  /// In ar, this message translates to:
  /// **'إدارة الوقت'**
  String get applicationClientQuickLinkTimeManagement;

  /// No description provided for @applicationClientQuickLinkHabits.
  ///
  /// In ar, this message translates to:
  /// **'العادات'**
  String get applicationClientQuickLinkHabits;

  /// No description provided for @applicationClientQuickLinkLearning.
  ///
  /// In ar, this message translates to:
  /// **'التعلم'**
  String get applicationClientQuickLinkLearning;

  /// No description provided for @applicationClientQuickLinkDisabilitySupport.
  ///
  /// In ar, this message translates to:
  /// **'دعم الأشخاص ذوي الإعاقة'**
  String get applicationClientQuickLinkDisabilitySupport;

  /// No description provided for @applicationClientQuickLinkDeafBlindAssociations.
  ///
  /// In ar, this message translates to:
  /// **'جمعيات الصم والمكفوفين'**
  String get applicationClientQuickLinkDeafBlindAssociations;

  /// No description provided for @applicationClientQuickLinkNvda.
  ///
  /// In ar, this message translates to:
  /// **'قارئ الشاشة NVDA'**
  String get applicationClientQuickLinkNvda;

  /// No description provided for @applicationClientQuickLinkTextToSpeech.
  ///
  /// In ar, this message translates to:
  /// **'تحويل النص إلى صوت'**
  String get applicationClientQuickLinkTextToSpeech;

  /// No description provided for @applicationClientLinksSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'روابط مفيدة في مكان واحد'**
  String get applicationClientLinksSubtitle;

  /// No description provided for @applicationClientLinksTitle.
  ///
  /// In ar, this message translates to:
  /// **'لينكاتك'**
  String get applicationClientLinksTitle;

  /// No description provided for @applicationClientLinkSubSectionNotice.
  ///
  /// In ar, this message translates to:
  /// **'تنبيه مهم'**
  String get applicationClientLinkSubSectionNotice;

  /// No description provided for @applicationClientLinkSubSectionOfficialAuthorities.
  ///
  /// In ar, this message translates to:
  /// **'متى تتوجه للجهات الرسمية'**
  String get applicationClientLinkSubSectionOfficialAuthorities;

  /// No description provided for @applicationClientLinkSubSectionPlatformContact.
  ///
  /// In ar, this message translates to:
  /// **'متى تتواصل مع المنصة'**
  String get applicationClientLinkSubSectionPlatformContact;

  /// No description provided for @applicationClientLinkSubSectionSafety.
  ///
  /// In ar, this message translates to:
  /// **'قبل التواصل مع مقدم الخدمة'**
  String get applicationClientLinkSubSectionSafety;

  /// No description provided for @applicationClientLinkSubSectionSafetyRules.
  ///
  /// In ar, this message translates to:
  /// **'قواعد الأمان'**
  String get applicationClientLinkSubSectionSafetyRules;

  /// No description provided for @applicationClientNotebookMessage1.
  ///
  /// In ar, this message translates to:
  /// **'خطوة صغيرة اليوم أفضل من انتظار يوم مثالي.'**
  String get applicationClientNotebookMessage1;

  /// No description provided for @applicationClientNotebookMessage2.
  ///
  /// In ar, this message translates to:
  /// **'ما زلت تكمل الطريق، وهذا يكفي اليوم.'**
  String get applicationClientNotebookMessage2;

  /// No description provided for @applicationClientNotebookMessage3.
  ///
  /// In ar, this message translates to:
  /// **'لا يلزم أن تكون قويًا طوال الوقت.'**
  String get applicationClientNotebookMessage3;

  /// No description provided for @applicationClientNotebookMessage4.
  ///
  /// In ar, this message translates to:
  /// **'كل محاولة جديدة هي تقدم.'**
  String get applicationClientNotebookMessage4;

  /// No description provided for @applicationClientNotebookMessage5.
  ///
  /// In ar, this message translates to:
  /// **'أنت لست متأخرًا، أنت تتحرك بالسرعة المناسبة لك.'**
  String get applicationClientNotebookMessage5;

  /// No description provided for @applicationClientSuggestionSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'رأيك يطور التجربة'**
  String get applicationClientSuggestionSubtitle;

  /// No description provided for @applicationClientSuggestionTitle.
  ///
  /// In ar, this message translates to:
  /// **'شاركنا باقتراح'**
  String get applicationClientSuggestionTitle;

  /// No description provided for @applicationClientTemporaryPhoto.
  ///
  /// In ar, this message translates to:
  /// **'اختار صورة تحبها'**
  String get applicationClientTemporaryPhoto;

  /// No description provided for @applicationClientToolsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مساحتك للأدوات الشخصية'**
  String get applicationClientToolsSubtitle;

  /// No description provided for @applicationClientToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'أدواتك'**
  String get applicationClientToolsTitle;

  /// No description provided for @applicationClientYoutube.
  ///
  /// In ar, this message translates to:
  /// **'يوتيوب'**
  String get applicationClientYoutube;

  /// No description provided for @generation2MobileRoomLogo.
  ///
  /// In ar, this message translates to:
  /// **'غرفة صديقي'**
  String get generation2MobileRoomLogo;

  /// No description provided for @generation2MobileRoomCards.
  ///
  /// In ar, this message translates to:
  /// **'خيارات الغرفة'**
  String get generation2MobileRoomCards;

  /// No description provided for @applicationExitButton.
  ///
  /// In ar, this message translates to:
  /// **'خروج'**
  String get applicationExitButton;

  /// No description provided for @applicationExitJourneyMessage.
  ///
  /// In ar, this message translates to:
  /// **'خد ما تحتاجه الآن...\nوالعودة دائمًا مفتوحة لك.'**
  String get applicationExitJourneyMessage;

  /// No description provided for @applicationExitJourneyTitle.
  ///
  /// In ar, this message translates to:
  /// **'رحلتك تهمنا'**
  String get applicationExitJourneyTitle;
}

class _ResidentialLocalizationsDelegate
    extends LocalizationsDelegate<ResidentialLocalizations> {
  const _ResidentialLocalizationsDelegate();

  @override
  Future<ResidentialLocalizations> load(Locale locale) {
    return SynchronousFuture<ResidentialLocalizations>(
        lookupResidentialLocalizations(locale));
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
      'that was used.');
}
