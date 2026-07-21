import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_section_localizations_ar.dart';
import 'app_section_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppSectionLocalizations
/// returned by `AppSectionLocalizations.of(context)`.
///
/// Applications need to include `AppSectionLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'app/app_section_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppSectionLocalizations.localizationsDelegates,
///   supportedLocales: AppSectionLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppSectionLocalizations.supportedLocales
/// property.
abstract class AppSectionLocalizations {
  AppSectionLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppSectionLocalizations of(BuildContext context) {
    return Localizations.of<AppSectionLocalizations>(
        context, AppSectionLocalizations)!;
  }

  static const LocalizationsDelegate<AppSectionLocalizations> delegate =
      _AppSectionLocalizationsDelegate();

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

  /// No description provided for @routeNotFound.
  ///
  /// In ar, this message translates to:
  /// **'المسار غير موجود'**
  String get routeNotFound;

  /// No description provided for @applicationSplashOfficialWebsite.
  ///
  /// In ar, this message translates to:
  /// **'الموقع الرسمي'**
  String get applicationSplashOfficialWebsite;

  /// No description provided for @applicationSplashOfficialWebsiteOpenFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر فتح الموقع الرسمي الآن.'**
  String get applicationSplashOfficialWebsiteOpenFailed;

  /// No description provided for @applicationSplashLanguageSwitch.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get applicationSplashLanguageSwitch;

  /// No description provided for @applicationSplashMobileShortcut.
  ///
  /// In ar, this message translates to:
  /// **'موبايل'**
  String get applicationSplashMobileShortcut;

  /// No description provided for @applicationSplashClientFriend.
  ///
  /// In ar, this message translates to:
  /// **'صديقي العميل'**
  String get applicationSplashClientFriend;

  /// No description provided for @applicationSplashAccessibilityFriend.
  ///
  /// In ar, this message translates to:
  /// **'صديقي المميز'**
  String get applicationSplashAccessibilityFriend;

  /// No description provided for @applicationSplashCommercialAccess.
  ///
  /// In ar, this message translates to:
  /// **'دخول الأخصائيين والمراكز'**
  String get applicationSplashCommercialAccess;

  /// No description provided for @applicationSplashDaleelTitle.
  ///
  /// In ar, this message translates to:
  /// **'دليلك'**
  String get applicationSplashDaleelTitle;

  /// No description provided for @applicationSplashDaleelPageGuide.
  ///
  /// In ar, this message translates to:
  /// **'دليل الصفحة'**
  String get applicationSplashDaleelPageGuide;

  /// No description provided for @applicationSplashDaleelOpenPageGuide.
  ///
  /// In ar, this message translates to:
  /// **'فتح دليل الصفحة'**
  String get applicationSplashDaleelOpenPageGuide;

  /// No description provided for @applicationSplashDaleelSurveyTitle.
  ///
  /// In ar, this message translates to:
  /// **'رأيك يهمنا'**
  String get applicationSplashDaleelSurveyTitle;

  /// No description provided for @applicationSplashDaleelOpenSurvey.
  ///
  /// In ar, this message translates to:
  /// **'فتح الاستبيان'**
  String get applicationSplashDaleelOpenSurvey;

  /// No description provided for @applicationSplashDaleelGuideDialogTitle.
  ///
  /// In ar, this message translates to:
  /// **'دليل الصفحة الترحيبية'**
  String get applicationSplashDaleelGuideDialogTitle;

  /// No description provided for @applicationSplashSurveySheetTitle.
  ///
  /// In ar, this message translates to:
  /// **'رأيك في الشاشة الترحيبية'**
  String get applicationSplashSurveySheetTitle;

  /// No description provided for @applicationSplashSurveySuggestionsLabel.
  ///
  /// In ar, this message translates to:
  /// **'اقتراحاتك تهمنا'**
  String get applicationSplashSurveySuggestionsLabel;

  /// No description provided for @applicationSplashSurveySuggestionsHint.
  ///
  /// In ar, this message translates to:
  /// **'اكتب أي ملاحظة أو اقتراح يساعدنا نطور الشاشة...'**
  String get applicationSplashSurveySuggestionsHint;

  /// No description provided for @applicationSplashSurveySubmit.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الرأي'**
  String get applicationSplashSurveySubmit;

  /// No description provided for @applicationSplashSurveyReceived.
  ///
  /// In ar, this message translates to:
  /// **'تم استقبال رأيك داخل هذه الجلسة فقط.'**
  String get applicationSplashSurveyReceived;

  /// No description provided for @applicationSplashSurveyAnswerExcellent.
  ///
  /// In ar, this message translates to:
  /// **'ممتاز'**
  String get applicationSplashSurveyAnswerExcellent;

  /// No description provided for @applicationSplashSurveyAnswerGood.
  ///
  /// In ar, this message translates to:
  /// **'جيد'**
  String get applicationSplashSurveyAnswerGood;

  /// No description provided for @applicationSplashSurveyAnswerNeedsWork.
  ///
  /// In ar, this message translates to:
  /// **'يحتاج تطوير'**
  String get applicationSplashSurveyAnswerNeedsWork;

  /// No description provided for @applicationAccountBlockedTitle.
  ///
  /// In ar, this message translates to:
  /// **'تم تقييد هذا الحساب'**
  String get applicationAccountBlockedTitle;

  /// No description provided for @applicationAccountBlockedSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'تم تسجيل الدخول بنجاح، لكن لا يمكن متابعة استخدام الحساب حاليًا. يرجى التواصل مع الإدارة.'**
  String get applicationAccountBlockedSubtitle;

  /// No description provided for @applicationAccountBlockedReasonLabel.
  ///
  /// In ar, this message translates to:
  /// **'سبب التقييد'**
  String get applicationAccountBlockedReasonLabel;

  /// No description provided for @applicationAccountBlockedSignOut.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get applicationAccountBlockedSignOut;
}

class _AppSectionLocalizationsDelegate
    extends LocalizationsDelegate<AppSectionLocalizations> {
  const _AppSectionLocalizationsDelegate();

  @override
  Future<AppSectionLocalizations> load(Locale locale) {
    return SynchronousFuture<AppSectionLocalizations>(
        lookupAppSectionLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppSectionLocalizationsDelegate old) => false;
}

AppSectionLocalizations lookupAppSectionLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppSectionLocalizationsAr();
    case 'en':
      return AppSectionLocalizationsEn();
  }

  throw FlutterError(
      'AppSectionLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
