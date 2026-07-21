import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'commercial_localizations_ar.dart';
import 'commercial_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CommercialLocalizations
/// returned by `CommercialLocalizations.of(context)`.
///
/// Applications need to include `CommercialLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'commercial/commercial_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CommercialLocalizations.localizationsDelegates,
///   supportedLocales: CommercialLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CommercialLocalizations.supportedLocales
/// property.
abstract class CommercialLocalizations {
  CommercialLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CommercialLocalizations of(BuildContext context) {
    return Localizations.of<CommercialLocalizations>(
        context, CommercialLocalizations)!;
  }

  static const LocalizationsDelegate<CommercialLocalizations> delegate =
      _CommercialLocalizationsDelegate();

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

  /// No description provided for @authBackToHome.
  ///
  /// In ar, this message translates to:
  /// **'العودة للرئيسية'**
  String get authBackToHome;

  /// No description provided for @commercialAccessCenter.
  ///
  /// In ar, this message translates to:
  /// **'مركز'**
  String get commercialAccessCenter;

  /// No description provided for @commercialAccessSpecialist.
  ///
  /// In ar, this message translates to:
  /// **'أخصائي'**
  String get commercialAccessSpecialist;

  /// No description provided for @commercialPublicAccountsBusinessCards.
  ///
  /// In ar, this message translates to:
  /// **'نماذج بطاقات العمل'**
  String get commercialPublicAccountsBusinessCards;

  /// No description provided for @commercialPublicAccountsCenters.
  ///
  /// In ar, this message translates to:
  /// **'دليل المراكز'**
  String get commercialPublicAccountsCenters;

  /// No description provided for @commercialPublicAccountsFacebook.
  ///
  /// In ar, this message translates to:
  /// **'فيسبوك'**
  String get commercialPublicAccountsFacebook;

  /// No description provided for @commercialPublicAccountsInstagram.
  ///
  /// In ar, this message translates to:
  /// **'إنستجرام'**
  String get commercialPublicAccountsInstagram;

  /// No description provided for @commercialPublicAccountsLibrary.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة العامة'**
  String get commercialPublicAccountsLibrary;

  /// No description provided for @commercialPublicAccountsLinkedin.
  ///
  /// In ar, this message translates to:
  /// **'لينكدإن'**
  String get commercialPublicAccountsLinkedin;

  /// No description provided for @commercialPublicAccountsPosters.
  ///
  /// In ar, this message translates to:
  /// **'نماذج البوستات'**
  String get commercialPublicAccountsPosters;

  /// No description provided for @commercialPublicAccountsQrProfiles.
  ///
  /// In ar, this message translates to:
  /// **'QR Profiles'**
  String get commercialPublicAccountsQrProfiles;

  /// No description provided for @commercialPublicAccountsResume.
  ///
  /// In ar, this message translates to:
  /// **'نماذج السير الذاتية'**
  String get commercialPublicAccountsResume;

  /// No description provided for @commercialPublicAccountsSectionIdentity.
  ///
  /// In ar, this message translates to:
  /// **'مواد التعريف'**
  String get commercialPublicAccountsSectionIdentity;

  /// No description provided for @commercialPublicAccountsSectionPlatform.
  ///
  /// In ar, this message translates to:
  /// **'المنصة الرسمية'**
  String get commercialPublicAccountsSectionPlatform;

  /// No description provided for @commercialPublicAccountsSectionSocial.
  ///
  /// In ar, this message translates to:
  /// **'السوشيال ميديا'**
  String get commercialPublicAccountsSectionSocial;

  /// No description provided for @commercialPublicAccountsSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'دليل الأخصائيين'**
  String get commercialPublicAccountsSpecialists;

  /// No description provided for @commercialPublicAccountsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'من هنا تقدر تشوف منشوراتك وملفك المهني بعد التجهيز، وتتفرج على نماذج وأفكار من زملائك.'**
  String get commercialPublicAccountsSubtitle;

  /// No description provided for @commercialPublicAccountsTelegram.
  ///
  /// In ar, this message translates to:
  /// **'تيليجرام'**
  String get commercialPublicAccountsTelegram;

  /// No description provided for @commercialPublicAccountsTiktok.
  ///
  /// In ar, this message translates to:
  /// **'تيك توك'**
  String get commercialPublicAccountsTiktok;

  /// No description provided for @commercialPublicAccountsTitle.
  ///
  /// In ar, this message translates to:
  /// **'حسابات Mental Smile'**
  String get commercialPublicAccountsTitle;

  /// No description provided for @commercialPublicAccountsWebsite.
  ///
  /// In ar, this message translates to:
  /// **'الموقع الإلكتروني'**
  String get commercialPublicAccountsWebsite;

  /// No description provided for @commercialPublicAccountsWhatsapp.
  ///
  /// In ar, this message translates to:
  /// **'قناة واتساب'**
  String get commercialPublicAccountsWhatsapp;

  /// No description provided for @commercialPublicAccountsX.
  ///
  /// In ar, this message translates to:
  /// **'منصة X'**
  String get commercialPublicAccountsX;

  /// No description provided for @commercialPublicAccountsYoutube.
  ///
  /// In ar, this message translates to:
  /// **'يوتيوب'**
  String get commercialPublicAccountsYoutube;

  /// No description provided for @commercialRoomAssistiveTools.
  ///
  /// In ar, this message translates to:
  /// **'أدوات مساعدة'**
  String get commercialRoomAssistiveTools;

  /// No description provided for @commercialRoomAssistiveToolsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'للترجمة والتجهيز'**
  String get commercialRoomAssistiveToolsSubtitle;

  /// No description provided for @commercialRoomExitRoomTooltip.
  ///
  /// In ar, this message translates to:
  /// **'الخروج من الغرفة'**
  String get commercialRoomExitRoomTooltip;

  /// No description provided for @commercialRoomNoteTitle.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظاتي ومواعيدي'**
  String get commercialRoomNoteTitle;

  /// No description provided for @commercialRoomNotebookDelete.
  ///
  /// In ar, this message translates to:
  /// **'مسح'**
  String get commercialRoomNotebookDelete;

  /// No description provided for @commercialRoomNotebookNote.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظة خاصة'**
  String get commercialRoomNotebookNote;

  /// No description provided for @commercialRoomNotebookReminder.
  ///
  /// In ar, this message translates to:
  /// **'ميعاد أو تذكير اختياري'**
  String get commercialRoomNotebookReminder;

  /// No description provided for @commercialRoomNotebookSave.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get commercialRoomNotebookSave;

  /// No description provided for @commercialRoomNotebookTooltip.
  ///
  /// In ar, this message translates to:
  /// **'فتح النوتة'**
  String get commercialRoomNotebookTooltip;

  /// No description provided for @commercialRoomProfessionalLibrary.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة المهنية'**
  String get commercialRoomProfessionalLibrary;

  /// No description provided for @commercialRoomProfessionalLibrarySubtitle.
  ///
  /// In ar, this message translates to:
  /// **'روابط مهنية'**
  String get commercialRoomProfessionalLibrarySubtitle;

  /// No description provided for @commercialRoomProfessionalProfile.
  ///
  /// In ar, this message translates to:
  /// **'الملف المهني'**
  String get commercialRoomProfessionalProfile;

  /// No description provided for @commercialRoomProfessionalProfileSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'بيانات خام فقط'**
  String get commercialRoomProfessionalProfileSubtitle;

  /// No description provided for @commercialGeneration2MobileRoomLogo.
  ///
  /// In ar, this message translates to:
  /// **'غرفة صديقي المهنية'**
  String get commercialGeneration2MobileRoomLogo;

  /// No description provided for @commercialGeneration2MobileRoomImage.
  ///
  /// In ar, this message translates to:
  /// **'اختيار صورة مؤقتة'**
  String get commercialGeneration2MobileRoomImage;

  /// No description provided for @commercialGeneration2MobileRoomMessage.
  ///
  /// In ar, this message translates to:
  /// **'نوتة الملاحظات'**
  String get commercialGeneration2MobileRoomMessage;

  /// No description provided for @commercialGeneration2MobileRoomCards.
  ///
  /// In ar, this message translates to:
  /// **'خيارات الغرفة'**
  String get commercialGeneration2MobileRoomCards;

  /// No description provided for @commonBack.
  ///
  /// In ar, this message translates to:
  /// **'رجوع'**
  String get commonBack;
}

class _CommercialLocalizationsDelegate
    extends LocalizationsDelegate<CommercialLocalizations> {
  const _CommercialLocalizationsDelegate();

  @override
  Future<CommercialLocalizations> load(Locale locale) {
    return SynchronousFuture<CommercialLocalizations>(
        lookupCommercialLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_CommercialLocalizationsDelegate old) => false;
}

CommercialLocalizations lookupCommercialLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return CommercialLocalizationsAr();
    case 'en':
      return CommercialLocalizationsEn();
  }

  throw FlutterError(
      'CommercialLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
