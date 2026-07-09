import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'مينتال كي'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get homeTitle;

  /// No description provided for @changeLanguage.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get changeLanguage;

  /// No description provided for @splashTitle.
  ///
  /// In ar, this message translates to:
  /// **'شاشة البداية'**
  String get splashTitle;

  /// No description provided for @routeNotFound.
  ///
  /// In ar, this message translates to:
  /// **'المسار غير موجود'**
  String get routeNotFound;

  /// No description provided for @moduleSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'المختصون'**
  String get moduleSpecialists;

  /// No description provided for @moduleLearningLibrary.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة المعرفة'**
  String get moduleLearningLibrary;

  /// No description provided for @moduleAddictionSupport.
  ///
  /// In ar, this message translates to:
  /// **'دعم الإدمان'**
  String get moduleAddictionSupport;

  /// No description provided for @moduleCenters.
  ///
  /// In ar, this message translates to:
  /// **'المراكز'**
  String get moduleCenters;

  /// No description provided for @moduleSpecialNeedsFamilies.
  ///
  /// In ar, this message translates to:
  /// **'أسر ذوي الاحتياجات الخاصة'**
  String get moduleSpecialNeedsFamilies;

  /// No description provided for @commonBack.
  ///
  /// In ar, this message translates to:
  /// **'رجوع'**
  String get commonBack;

  /// No description provided for @commonClose.
  ///
  /// In ar, this message translates to:
  /// **'إغلاق'**
  String get commonClose;

  /// No description provided for @commonRetry.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get commonRetry;

  /// No description provided for @commonLoading.
  ///
  /// In ar, this message translates to:
  /// **'جارٍ التحميل'**
  String get commonLoading;

  /// No description provided for @commonLogout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get commonLogout;

  /// No description provided for @menuSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'الأخصائيون'**
  String get menuSpecialists;

  /// No description provided for @menuCenters.
  ///
  /// In ar, this message translates to:
  /// **'المراكز'**
  String get menuCenters;

  /// No description provided for @menuLibrary.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة'**
  String get menuLibrary;

  /// No description provided for @menuAddictionSupport.
  ///
  /// In ar, this message translates to:
  /// **'دعم المتعافي'**
  String get menuAddictionSupport;

  /// No description provided for @menuSpecialNeedsFamilies.
  ///
  /// In ar, this message translates to:
  /// **'رعاية أسر ذوي الاحتياجات الخاصة'**
  String get menuSpecialNeedsFamilies;

  /// No description provided for @menuChatSupport.
  ///
  /// In ar, this message translates to:
  /// **'دعم المحادثة'**
  String get menuChatSupport;

  /// No description provided for @homeStartJourney.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ رحلتك نحو التعافي'**
  String get homeStartJourney;

  /// No description provided for @homeLogin.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get homeLogin;

  /// No description provided for @homeBack.
  ///
  /// In ar, this message translates to:
  /// **'رجوع'**
  String get homeBack;

  /// No description provided for @authLoginTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get authLoginTitle;

  /// No description provided for @authEmail.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get authPassword;

  /// No description provided for @authLoginButton.
  ///
  /// In ar, this message translates to:
  /// **'دخول'**
  String get authLoginButton;

  /// No description provided for @authLoggingIn.
  ///
  /// In ar, this message translates to:
  /// **'جارٍ تسجيل الدخول'**
  String get authLoggingIn;

  /// No description provided for @authInvalidCredentials.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الدخول غير صحيحة'**
  String get authInvalidCredentials;

  /// No description provided for @authRequiredField.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get authRequiredField;

  /// No description provided for @authForgotPassword.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get authForgotPassword;

  /// No description provided for @authCreateAccount.
  ///
  /// In ar, this message translates to:
  /// **'للتسجيل اضغط هنا'**
  String get authCreateAccount;

  /// No description provided for @authBackToHome.
  ///
  /// In ar, this message translates to:
  /// **'العودة للرئيسية'**
  String get authBackToHome;

  /// No description provided for @authLogoutConfirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد تسجيل الخروج'**
  String get authLogoutConfirm;

  /// No description provided for @authLogoutQuestion.
  ///
  /// In ar, this message translates to:
  /// **'هل تريد تسجيل الخروج؟'**
  String get authLogoutQuestion;

  /// No description provided for @authCancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get authCancel;

  /// No description provided for @authName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم'**
  String get authName;

  /// No description provided for @authConfirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get authConfirmPassword;

  /// No description provided for @authCreatingAccount.
  ///
  /// In ar, this message translates to:
  /// **'جارٍ إنشاء الحساب...'**
  String get authCreatingAccount;

  /// No description provided for @authEmailRequired.
  ///
  /// In ar, this message translates to:
  /// **'اكتب البريد الإلكتروني'**
  String get authEmailRequired;

  /// No description provided for @authPasswordRequired.
  ///
  /// In ar, this message translates to:
  /// **'اكتب كلمة المرور'**
  String get authPasswordRequired;

  /// No description provided for @authNameRequired.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الاسم'**
  String get authNameRequired;

  /// No description provided for @authPasswordsDoNotMatch.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور غير مطابق'**
  String get authPasswordsDoNotMatch;

  /// No description provided for @authInvalidEmail.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني غير صالح'**
  String get authInvalidEmail;

  /// No description provided for @authWeakPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تكون 6 أحرف على الأقل'**
  String get authWeakPassword;

  /// No description provided for @authLoginFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل تسجيل الدخول'**
  String get authLoginFailed;

  /// No description provided for @authRegistrationFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل إنشاء الحساب'**
  String get authRegistrationFailed;

  /// No description provided for @authUnexpectedError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ غير متوقع'**
  String get authUnexpectedError;

  /// No description provided for @authPleaseWait.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك انتظر'**
  String get authPleaseWait;

  /// No description provided for @authInvalidCredentialsMessage.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الدخول غير صحيحة'**
  String get authInvalidCredentialsMessage;

  /// No description provided for @authAccountCreated.
  ///
  /// In ar, this message translates to:
  /// **'تم إنشاء الحساب'**
  String get authAccountCreated;

  /// No description provided for @authTryAgain.
  ///
  /// In ar, this message translates to:
  /// **'تعذر إكمال العملية، حاول مرة أخرى'**
  String get authTryAgain;

  /// No description provided for @commonNext.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get commonNext;

  /// No description provided for @centersLoadError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء تحميل المراكز'**
  String get centersLoadError;

  /// No description provided for @centersEmpty.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مراكز متاحة في هذه الفئة حاليًا'**
  String get centersEmpty;

  /// No description provided for @centersReadMore.
  ///
  /// In ar, this message translates to:
  /// **'اضغط للمزيد'**
  String get centersReadMore;

  /// No description provided for @centerDefaultName.
  ///
  /// In ar, this message translates to:
  /// **'مركز'**
  String get centerDefaultName;

  /// No description provided for @centerDetoxUnitAvailable.
  ///
  /// In ar, this message translates to:
  /// **'يوجد قسم أعراض انسحاب'**
  String get centerDetoxUnitAvailable;

  /// No description provided for @centerDetailsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل المركز'**
  String get centerDetailsTitle;

  /// No description provided for @centerDataNotFound.
  ///
  /// In ar, this message translates to:
  /// **'تعذّر العثور على بيانات المركز'**
  String get centerDataNotFound;

  /// No description provided for @centerDataLoadError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء تحميل بيانات المركز'**
  String get centerDataLoadError;

  /// No description provided for @centerAvailable.
  ///
  /// In ar, this message translates to:
  /// **'متاح'**
  String get centerAvailable;

  /// No description provided for @centerUnavailable.
  ///
  /// In ar, this message translates to:
  /// **'غير متاح'**
  String get centerUnavailable;

  /// No description provided for @centerGallery.
  ///
  /// In ar, this message translates to:
  /// **'صور المركز'**
  String get centerGallery;

  /// No description provided for @centerPricing.
  ///
  /// In ar, this message translates to:
  /// **'تكلفة الإقامة'**
  String get centerPricing;

  /// No description provided for @centerTypeAndService.
  ///
  /// In ar, this message translates to:
  /// **'نوع المركز وخدمته'**
  String get centerTypeAndService;

  /// No description provided for @centerCapabilities.
  ///
  /// In ar, this message translates to:
  /// **'قدرات المركز'**
  String get centerCapabilities;

  /// No description provided for @centerContactLocation.
  ///
  /// In ar, this message translates to:
  /// **'التواصل والموقع'**
  String get centerContactLocation;

  /// No description provided for @centerAddress.
  ///
  /// In ar, this message translates to:
  /// **'العنوان'**
  String get centerAddress;

  /// No description provided for @centerCity.
  ///
  /// In ar, this message translates to:
  /// **'المدينة'**
  String get centerCity;

  /// No description provided for @centerPhone.
  ///
  /// In ar, this message translates to:
  /// **'الهاتف'**
  String get centerPhone;

  /// No description provided for @centerWhatsapp.
  ///
  /// In ar, this message translates to:
  /// **'واتساب'**
  String get centerWhatsapp;

  /// No description provided for @centerServices.
  ///
  /// In ar, this message translates to:
  /// **'الخدمات'**
  String get centerServices;

  /// No description provided for @centerAbout.
  ///
  /// In ar, this message translates to:
  /// **'نبذة عن المركز'**
  String get centerAbout;

  /// No description provided for @centerRequestViaAdmin.
  ///
  /// In ar, this message translates to:
  /// **'تواصل مع المركز'**
  String get centerRequestViaAdmin;

  /// No description provided for @centerInboxTitle.
  ///
  /// In ar, this message translates to:
  /// **'رسائل المركز'**
  String get centerInboxTitle;

  /// No description provided for @commonAll.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get commonAll;

  /// No description provided for @statusPending.
  ///
  /// In ar, this message translates to:
  /// **'غير مكتمل'**
  String get statusPending;

  /// No description provided for @centerSaveResponse.
  ///
  /// In ar, this message translates to:
  /// **'حفظ الرد'**
  String get centerSaveResponse;

  /// No description provided for @webCenterRegistrationPortalTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة تسجيل المراكز'**
  String get webCenterRegistrationPortalTitle;

  /// No description provided for @webCenterRegistrationPortalSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'أنشئ حساب المركز لإكمال جاهزية الإقرار.'**
  String get webCenterRegistrationPortalSubtitle;

  /// No description provided for @webCenterRegistrationBasicInfoTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل المركز - البيانات الأساسية'**
  String get webCenterRegistrationBasicInfoTitle;

  /// No description provided for @webCenterGuidanceLibrary.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة الإرشاد'**
  String get webCenterGuidanceLibrary;

  /// No description provided for @webCenterCenterName.
  ///
  /// In ar, this message translates to:
  /// **'اسم المركز'**
  String get webCenterCenterName;

  /// No description provided for @webCenterCategory.
  ///
  /// In ar, this message translates to:
  /// **'الفئة'**
  String get webCenterCategory;

  /// No description provided for @webCenterType.
  ///
  /// In ar, this message translates to:
  /// **'نوع المركز'**
  String get webCenterType;

  /// No description provided for @webCenterConfirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get webCenterConfirmPassword;

  /// No description provided for @webCenterNextBasicInfo.
  ///
  /// In ar, this message translates to:
  /// **'التالي: البيانات الأساسية'**
  String get webCenterNextBasicInfo;

  /// No description provided for @webCenterManagerName.
  ///
  /// In ar, this message translates to:
  /// **'اسم المسؤول'**
  String get webCenterManagerName;

  /// No description provided for @webCenterArea.
  ///
  /// In ar, this message translates to:
  /// **'المنطقة'**
  String get webCenterArea;

  /// No description provided for @webCenterDescription.
  ///
  /// In ar, this message translates to:
  /// **'الوصف'**
  String get webCenterDescription;

  /// No description provided for @webCenterHasDetoxUnit.
  ///
  /// In ar, this message translates to:
  /// **'يوجد قسم سحب سموم'**
  String get webCenterHasDetoxUnit;

  /// No description provided for @webCenterNextMediaGallery.
  ///
  /// In ar, this message translates to:
  /// **'التالي: الصور والمعرض'**
  String get webCenterNextMediaGallery;

  /// No description provided for @webCenterMediaGalleryTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل المركز - الصور والمعرض'**
  String get webCenterMediaGalleryTitle;

  /// No description provided for @webCenterFrontImageUrl.
  ///
  /// In ar, this message translates to:
  /// **'رابط صورة الواجهة'**
  String get webCenterFrontImageUrl;

  /// No description provided for @webCenterReceptionImageUrl.
  ///
  /// In ar, this message translates to:
  /// **'رابط صورة الاستقبال'**
  String get webCenterReceptionImageUrl;

  /// No description provided for @webCenterInsideImage1Url.
  ///
  /// In ar, this message translates to:
  /// **'رابط صورة داخلية 1'**
  String get webCenterInsideImage1Url;

  /// No description provided for @webCenterInsideImage2Url.
  ///
  /// In ar, this message translates to:
  /// **'رابط صورة داخلية 2'**
  String get webCenterInsideImage2Url;

  /// No description provided for @webCenterNextPricingCapabilities.
  ///
  /// In ar, this message translates to:
  /// **'التالي: تكلفة الخدمة والقدرات'**
  String get webCenterNextPricingCapabilities;

  /// No description provided for @webCenterPricingCapabilitiesTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل المركز - تكلفة الخدمة والقدرات'**
  String get webCenterPricingCapabilitiesTitle;

  /// No description provided for @webCenterEnabled.
  ///
  /// In ar, this message translates to:
  /// **'مفعل'**
  String get webCenterEnabled;

  /// No description provided for @webCenterPrice.
  ///
  /// In ar, this message translates to:
  /// **'تكلفة الخدمة'**
  String get webCenterPrice;

  /// No description provided for @webCenterPricingUnit.
  ///
  /// In ar, this message translates to:
  /// **'وحدة التكلفة'**
  String get webCenterPricingUnit;

  /// No description provided for @webCenterAcMode.
  ///
  /// In ar, this message translates to:
  /// **'نظام التكييف'**
  String get webCenterAcMode;

  /// No description provided for @webCenterTaxIncluded.
  ///
  /// In ar, this message translates to:
  /// **'يشمل الضريبة'**
  String get webCenterTaxIncluded;

  /// No description provided for @webCenterNextDocuments.
  ///
  /// In ar, this message translates to:
  /// **'التالي: المستندات'**
  String get webCenterNextDocuments;

  /// No description provided for @webCenterDocumentsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل المركز - المستندات'**
  String get webCenterDocumentsTitle;

  /// No description provided for @webCenterFileName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الملف'**
  String get webCenterFileName;

  /// No description provided for @webCenterFileUrlOptional.
  ///
  /// In ar, this message translates to:
  /// **'رابط الملف (اختياري)'**
  String get webCenterFileUrlOptional;

  /// No description provided for @webCenterReviewNoteOptional.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظة الإقرار (اختياري)'**
  String get webCenterReviewNoteOptional;

  /// No description provided for @webCenterSubmitForReview.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الإقرار'**
  String get webCenterSubmitForReview;

  /// No description provided for @webRegistrationBrowseLibraryDuringReview.
  ///
  /// In ar, this message translates to:
  /// **'تصفح مكتبة الإرشاد أثناء فحص الجاهزية'**
  String get webRegistrationBrowseLibraryDuringReview;

  /// No description provided for @webCenterCenterNameRequired.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم المركز'**
  String get webCenterCenterNameRequired;

  /// No description provided for @webCenterRegistrationFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر إكمال التسجيل، حاول مرة أخرى.'**
  String get webCenterRegistrationFailed;

  /// No description provided for @webCenterPleaseRegisterBeforeSaving.
  ///
  /// In ar, this message translates to:
  /// **'يرجى التسجيل أو تسجيل الدخول قبل الحفظ.'**
  String get webCenterPleaseRegisterBeforeSaving;

  /// No description provided for @webCenterMissingSession.
  ///
  /// In ar, this message translates to:
  /// **'خطوة التسجيل غير متاحة'**
  String get webCenterMissingSession;

  /// No description provided for @webCenterSaveProfileFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر حفظ بيانات المركز'**
  String get webCenterSaveProfileFailed;

  /// No description provided for @webCenterSaveMediaFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر حفظ الصور'**
  String get webCenterSaveMediaFailed;

  /// No description provided for @webCenterSavePricingFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر حفظ معلومات تكلفة الخدمة'**
  String get webCenterSavePricingFailed;

  /// No description provided for @webCenterSubmitDocumentsFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر إرسال المستندات'**
  String get webCenterSubmitDocumentsFailed;

  /// No description provided for @webClinicianRegistrationAccountTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الأخصائي - الحساب'**
  String get webClinicianRegistrationAccountTitle;

  /// No description provided for @webClinicianRegistrationProfileTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الأخصائي - الملف الشخصي'**
  String get webClinicianRegistrationProfileTitle;

  /// No description provided for @webClinicianName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم'**
  String get webClinicianName;

  /// No description provided for @webClinicianProfessionalTitle.
  ///
  /// In ar, this message translates to:
  /// **'اللقب المهني'**
  String get webClinicianProfessionalTitle;

  /// No description provided for @webClinicianSpecialty.
  ///
  /// In ar, this message translates to:
  /// **'التخصص'**
  String get webClinicianSpecialty;

  /// No description provided for @webClinicianNextProfile.
  ///
  /// In ar, this message translates to:
  /// **'التالي: الملف الشخصي'**
  String get webClinicianNextProfile;

  /// No description provided for @webClinicianPhotoUrl.
  ///
  /// In ar, this message translates to:
  /// **'رابط الصورة'**
  String get webClinicianPhotoUrl;

  /// No description provided for @webClinicianBio.
  ///
  /// In ar, this message translates to:
  /// **'النبذة'**
  String get webClinicianBio;

  /// No description provided for @webClinicianSessionPrice.
  ///
  /// In ar, this message translates to:
  /// **'معلومات تكلفة الخدمة'**
  String get webClinicianSessionPrice;

  /// No description provided for @webClinicianSessionDuration.
  ///
  /// In ar, this message translates to:
  /// **'معلومات وقت الخدمة'**
  String get webClinicianSessionDuration;

  /// No description provided for @webClinicianDocumentsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الأخصائي - المستندات'**
  String get webClinicianDocumentsTitle;

  /// No description provided for @webClinicianIdentityFileName.
  ///
  /// In ar, this message translates to:
  /// **'اسم ملف الهوية'**
  String get webClinicianIdentityFileName;

  /// No description provided for @webClinicianCertificateFileName.
  ///
  /// In ar, this message translates to:
  /// **'اسم ملف الشهادة'**
  String get webClinicianCertificateFileName;

  /// No description provided for @webClinicianExtraFileNameOptional.
  ///
  /// In ar, this message translates to:
  /// **'اسم ملف إضافي (اختياري)'**
  String get webClinicianExtraFileNameOptional;

  /// No description provided for @webClinicianRegistrationFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر إنشاء حساب الأخصائي'**
  String get webClinicianRegistrationFailed;

  /// No description provided for @webClinicianStartFromAccountStep.
  ///
  /// In ar, this message translates to:
  /// **'يرجى بدء التسجيل من خطوة الحساب'**
  String get webClinicianStartFromAccountStep;

  /// No description provided for @webClinicianAuthenticationSessionMissing.
  ///
  /// In ar, this message translates to:
  /// **'خطوة التسجيل غير متاحة'**
  String get webClinicianAuthenticationSessionMissing;

  /// No description provided for @webClinicianSaveProfileFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر حفظ الملف الشخصي'**
  String get webClinicianSaveProfileFailed;

  /// No description provided for @webClinicianSubmitDocumentsFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر إرسال المستندات'**
  String get webClinicianSubmitDocumentsFailed;

  /// No description provided for @clientSupport.
  ///
  /// In ar, this message translates to:
  /// **'الدعم'**
  String get clientSupport;

  /// No description provided for @clientSupportRequests.
  ///
  /// In ar, this message translates to:
  /// **'إشارات الدعم'**
  String get clientSupportRequests;

  /// No description provided for @clientLinksAndCodes.
  ///
  /// In ar, this message translates to:
  /// **'الروابط والأكواد'**
  String get clientLinksAndCodes;

  /// No description provided for @clientRatingsCount.
  ///
  /// In ar, this message translates to:
  /// **'عدد التقييمات'**
  String get clientRatingsCount;

  /// No description provided for @clientAverageStars.
  ///
  /// In ar, this message translates to:
  /// **'متوسط النجوم'**
  String get clientAverageStars;

  /// No description provided for @clientOverallAverage.
  ///
  /// In ar, this message translates to:
  /// **'المتوسط العام'**
  String get clientOverallAverage;

  /// No description provided for @clinicianDashboard.
  ///
  /// In ar, this message translates to:
  /// **'لوحة الأخصائي'**
  String get clinicianDashboard;

  /// No description provided for @clinicianOpenCases.
  ///
  /// In ar, this message translates to:
  /// **'محادثات مفتوحة'**
  String get clinicianOpenCases;

  /// No description provided for @clinicianSendSupportRequest.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة إشارة دعم'**
  String get clinicianSendSupportRequest;

  /// No description provided for @clinicianEditProfile.
  ///
  /// In ar, this message translates to:
  /// **'تعديل بياناتي'**
  String get clinicianEditProfile;

  /// No description provided for @clinicianSupportRequest.
  ///
  /// In ar, this message translates to:
  /// **'إشارة دعم'**
  String get clinicianSupportRequest;

  /// No description provided for @clinicianCurrentSupportRequests.
  ///
  /// In ar, this message translates to:
  /// **'إشارات الدعم الحالية'**
  String get clinicianCurrentSupportRequests;

  /// No description provided for @clinicianReferredChatCases.
  ///
  /// In ar, this message translates to:
  /// **'محادثات مشتركة'**
  String get clinicianReferredChatCases;

  /// No description provided for @clinicianReferredChatCasesCount.
  ///
  /// In ar, this message translates to:
  /// **'محادثات مشتركة'**
  String get clinicianReferredChatCasesCount;

  /// No description provided for @clinicianNewRequests.
  ///
  /// In ar, this message translates to:
  /// **'إشارات جديدة'**
  String get clinicianNewRequests;

  /// No description provided for @clinicianActiveRequests.
  ///
  /// In ar, this message translates to:
  /// **'قيد المعالجة'**
  String get clinicianActiveRequests;

  /// No description provided for @clinicianCompleted.
  ///
  /// In ar, this message translates to:
  /// **'مكتملة'**
  String get clinicianCompleted;

  /// No description provided for @clinicianClosed.
  ///
  /// In ar, this message translates to:
  /// **'مغلقة'**
  String get clinicianClosed;

  /// No description provided for @clinicianAcceptRequest.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الجاهزية'**
  String get clinicianAcceptRequest;

  /// No description provided for @clinicianRejectRequest.
  ///
  /// In ar, this message translates to:
  /// **'تحديد كغير مكتمل'**
  String get clinicianRejectRequest;

  /// No description provided for @clinicianProfileChangeTitle.
  ///
  /// In ar, this message translates to:
  /// **'إقرار تحديث الصورة أو النبذة'**
  String get clinicianProfileChangeTitle;

  /// No description provided for @clinicianNewPhotoUrl.
  ///
  /// In ar, this message translates to:
  /// **'رابط الصورة الجديدة'**
  String get clinicianNewPhotoUrl;

  /// No description provided for @clinicianNewBio.
  ///
  /// In ar, this message translates to:
  /// **'النبذة الجديدة'**
  String get clinicianNewBio;

  /// No description provided for @clinicianSendingRequest.
  ///
  /// In ar, this message translates to:
  /// **'جارٍ مشاركة الإشارة...'**
  String get clinicianSendingRequest;

  /// No description provided for @clinicianSendChangeRequest.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة إقرار التحديث'**
  String get clinicianSendChangeRequest;

  /// No description provided for @clinicianLogout.
  ///
  /// In ar, this message translates to:
  /// **'خروج'**
  String get clinicianLogout;

  /// No description provided for @clinicianPleaseSignIn.
  ///
  /// In ar, this message translates to:
  /// **'يجب تسجيل الدخول أولًا'**
  String get clinicianPleaseSignIn;

  /// No description provided for @clinicianInboxTitle.
  ///
  /// In ar, this message translates to:
  /// **'رسائل الأخصائي'**
  String get clinicianInboxTitle;

  /// No description provided for @clinicianReject.
  ///
  /// In ar, this message translates to:
  /// **'تحديد كغير مكتمل'**
  String get clinicianReject;

  /// No description provided for @clinicianAccept.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الجاهزية'**
  String get clinicianAccept;

  /// No description provided for @clinicianRejectRequestTitle.
  ///
  /// In ar, this message translates to:
  /// **'تحديد كغير مكتمل'**
  String get clinicianRejectRequestTitle;

  /// No description provided for @clinicianRejectReason.
  ///
  /// In ar, this message translates to:
  /// **'سبب عدم الاكتمال'**
  String get clinicianRejectReason;

  /// No description provided for @clinicianRejectReasonHint.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سبب عدم الاكتمال هنا...'**
  String get clinicianRejectReasonHint;

  /// No description provided for @clinicianConfirmReject.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد حالة عدم الاكتمال'**
  String get clinicianConfirmReject;

  /// No description provided for @clinicianRejectFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر تحديد عدم الاكتمال'**
  String get clinicianRejectFailed;

  /// No description provided for @clinicianAcceptFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذر تأكيد الجاهزية'**
  String get clinicianAcceptFailed;

  /// No description provided for @statusCenterFollowUp.
  ///
  /// In ar, this message translates to:
  /// **'إشارة توفر المركز غير مكتملة'**
  String get statusCenterFollowUp;

  /// No description provided for @statusClientUpdateRequired.
  ///
  /// In ar, this message translates to:
  /// **'مطلوب تحديث معلومات المركز'**
  String get statusClientUpdateRequired;

  /// No description provided for @statusCenterIntakePending.
  ///
  /// In ar, this message translates to:
  /// **'المعلومات الأولية غير مكتملة'**
  String get statusCenterIntakePending;

  /// No description provided for @statusCenterRecommendationPending.
  ///
  /// In ar, this message translates to:
  /// **'إرشاد المركز غير متاح بعد'**
  String get statusCenterRecommendationPending;

  /// No description provided for @statusResidencySetupPending.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الدعم السكني غير مكتملة'**
  String get statusResidencySetupPending;

  /// No description provided for @statusResidencyScheduled.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ توقيت الدعم السكني'**
  String get statusResidencyScheduled;

  /// No description provided for @statusResidencyInProgress.
  ///
  /// In ar, this message translates to:
  /// **'الدعم السكني قيد التقدم'**
  String get statusResidencyInProgress;

  /// No description provided for @statusPendingDischargeReviews.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات الاستمرارية غير مكتملة'**
  String get statusPendingDischargeReviews;

  /// No description provided for @statusCompleted.
  ///
  /// In ar, this message translates to:
  /// **'مكتمل'**
  String get statusCompleted;

  /// No description provided for @statusCompletedSuccessfully.
  ///
  /// In ar, this message translates to:
  /// **'مكتمل بنجاح'**
  String get statusCompletedSuccessfully;

  /// No description provided for @statusRequestCompleted.
  ///
  /// In ar, this message translates to:
  /// **'تمت معالجة إشارة الدعم'**
  String get statusRequestCompleted;

  /// No description provided for @statusReschedulePending.
  ///
  /// In ar, this message translates to:
  /// **'تحديث التوقيت غير مكتمل'**
  String get statusReschedulePending;

  /// No description provided for @statusAwaitingStartConfirmations.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار تأكيد البداية'**
  String get statusAwaitingStartConfirmations;

  /// No description provided for @statusRejected.
  ///
  /// In ar, this message translates to:
  /// **'غير متاح'**
  String get statusRejected;

  /// No description provided for @statusClinicianRejected.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الأخصائي غير متاح'**
  String get statusClinicianRejected;

  /// No description provided for @statusCancelled.
  ///
  /// In ar, this message translates to:
  /// **'ملغي'**
  String get statusCancelled;

  /// No description provided for @statusDisputeReceived.
  ///
  /// In ar, this message translates to:
  /// **'تم استلام الشكوى'**
  String get statusDisputeReceived;

  /// No description provided for @statusRequestCoordination.
  ///
  /// In ar, this message translates to:
  /// **'يجري إعداد إشارة الدعم'**
  String get statusRequestCoordination;

  /// No description provided for @statusRequestUpdateInProgress.
  ///
  /// In ar, this message translates to:
  /// **'يتم تحديث حالة الإشارة'**
  String get statusRequestUpdateInProgress;

  /// No description provided for @statusNewRequest.
  ///
  /// In ar, this message translates to:
  /// **'إشارة دعم جديدة'**
  String get statusNewRequest;

  /// No description provided for @statusCenterAvailableResponse.
  ///
  /// In ar, this message translates to:
  /// **'رد المركز: متاح'**
  String get statusCenterAvailableResponse;

  /// No description provided for @statusCenterUnavailableResponse.
  ///
  /// In ar, this message translates to:
  /// **'رد المركز: غير متاح'**
  String get statusCenterUnavailableResponse;

  /// No description provided for @statusCenterNoResponse.
  ///
  /// In ar, this message translates to:
  /// **'رد المركز: لم يرد بعد'**
  String get statusCenterNoResponse;

  /// No description provided for @localeLabel.
  ///
  /// In ar, this message translates to:
  /// **'اللغة: {code} (اضغط أو 🌐)'**
  String localeLabel(String code);

  /// No description provided for @comingSoon.
  ///
  /// In ar, this message translates to:
  /// **'{title} — قريبًا'**
  String comingSoon(String title);

  /// No description provided for @applicationSplashQuickAccess.
  ///
  /// In ar, this message translates to:
  /// **'الوصول السريع'**
  String get applicationSplashQuickAccess;

  /// No description provided for @applicationSplashAccessibilityAccess.
  ///
  /// In ar, this message translates to:
  /// **'غرفة الإتاحة'**
  String get applicationSplashAccessibilityAccess;

  /// No description provided for @applicationSplashCommercialAccess.
  ///
  /// In ar, this message translates to:
  /// **'دخول الأخصائيين والمراكز والإدارة'**
  String get applicationSplashCommercialAccess;

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

  /// No description provided for @applicationSplashLanguageEnglish.
  ///
  /// In ar, this message translates to:
  /// **'English'**
  String get applicationSplashLanguageEnglish;

  /// No description provided for @applicationSplashLanguageArabic.
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get applicationSplashLanguageArabic;

  /// No description provided for @applicationClientCheckInTitle.
  ///
  /// In ar, this message translates to:
  /// **'طمنّا عليك'**
  String get applicationClientCheckInTitle;

  /// No description provided for @applicationClientCheckInSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'اطمئنان ودعم'**
  String get applicationClientCheckInSubtitle;

  /// No description provided for @applicationClientCommunityToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تطبيقات وأدوات'**
  String get applicationClientCommunityToolsTitle;

  /// No description provided for @applicationClientCommunityToolsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'أدوات بسيطة تساعدك'**
  String get applicationClientCommunityToolsSubtitle;

  /// No description provided for @applicationClientSuggestionTitle.
  ///
  /// In ar, this message translates to:
  /// **'شاركنا باقتراح'**
  String get applicationClientSuggestionTitle;

  /// No description provided for @applicationClientSuggestionSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'رأيك يطور التجربة'**
  String get applicationClientSuggestionSubtitle;

  /// No description provided for @applicationClientToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'أدواتك'**
  String get applicationClientToolsTitle;

  /// No description provided for @applicationClientToolsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مساحتك للأدوات الشخصية'**
  String get applicationClientToolsSubtitle;

  /// No description provided for @applicationClientLinksTitle.
  ///
  /// In ar, this message translates to:
  /// **'لينكاتك'**
  String get applicationClientLinksTitle;

  /// No description provided for @applicationClientLinksSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'روابط مفيدة في مكان واحد'**
  String get applicationClientLinksSubtitle;

  /// No description provided for @applicationClientExitRoom.
  ///
  /// In ar, this message translates to:
  /// **'الخروج من الغرفة'**
  String get applicationClientExitRoom;

  /// No description provided for @applicationClientTemporaryPhoto.
  ///
  /// In ar, this message translates to:
  /// **'اختار صورة تحبها'**
  String get applicationClientTemporaryPhoto;

  /// No description provided for @applicationClientYoutube.
  ///
  /// In ar, this message translates to:
  /// **'يوتيوب'**
  String get applicationClientYoutube;

  /// No description provided for @applicationClientFeatherNotebook.
  ///
  /// In ar, this message translates to:
  /// **'نوتة الملاحظات'**
  String get applicationClientFeatherNotebook;

  /// No description provided for @applicationAudioSoon.
  ///
  /// In ar, this message translates to:
  /// **'قريبًا: دعم صوتي لهذا العنصر.'**
  String get applicationAudioSoon;

  /// No description provided for @applicationAccessibilityListenSupport.
  ///
  /// In ar, this message translates to:
  /// **'استماع أو دعم صوتي'**
  String get applicationAccessibilityListenSupport;

  /// No description provided for @applicationAccessibilityLinksTitle.
  ///
  /// In ar, this message translates to:
  /// **'لينكات مهمة'**
  String get applicationAccessibilityLinksTitle;

  /// No description provided for @applicationAccessibilityToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'أدوات مساعدة'**
  String get applicationAccessibilityToolsTitle;

  /// No description provided for @applicationAccessibilitySuggestionsTitle.
  ///
  /// In ar, this message translates to:
  /// **'شاركنا رأيك'**
  String get applicationAccessibilitySuggestionsTitle;

  /// No description provided for @applicationAccessibilitySuggestionsSubmit.
  ///
  /// In ar, this message translates to:
  /// **'إرسال'**
  String get applicationAccessibilitySuggestionsSubmit;

  /// No description provided for @applicationAccessibilitySuggestionsValidation.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اكتب الرسالة أولًا.'**
  String get applicationAccessibilitySuggestionsValidation;

  /// No description provided for @applicationAccessibilitySuggestionsSuccessTitle.
  ///
  /// In ar, this message translates to:
  /// **'✅ تم إرسال اقتراحك بنجاح'**
  String get applicationAccessibilitySuggestionsSuccessTitle;

  /// No description provided for @applicationExitJourneyTitle.
  ///
  /// In ar, this message translates to:
  /// **'رحلتك تهمنا'**
  String get applicationExitJourneyTitle;

  /// No description provided for @applicationExitJourneyMessage.
  ///
  /// In ar, this message translates to:
  /// **'خد ما تحتاجه الآن...\nوالعودة دائمًا مفتوحة لك.'**
  String get applicationExitJourneyMessage;

  /// No description provided for @applicationExitButton.
  ///
  /// In ar, this message translates to:
  /// **'خروج'**
  String get applicationExitButton;

  /// No description provided for @applicationReturnButton.
  ///
  /// In ar, this message translates to:
  /// **'عودة'**
  String get applicationReturnButton;

  /// No description provided for @applicationAccessibilityCommunityToolsComingSoon.
  ///
  /// In ar, this message translates to:
  /// **'مقترحاتكم ستظهر قريبًا هنا'**
  String get applicationAccessibilityCommunityToolsComingSoon;

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

  /// No description provided for @applicationClientLinkCategoryFamily.
  ///
  /// In ar, this message translates to:
  /// **'الأسرة والعلاقات'**
  String get applicationClientLinkCategoryFamily;

  /// No description provided for @applicationClientLinkCategoryRecovery.
  ///
  /// In ar, this message translates to:
  /// **'التعافي والإدمان'**
  String get applicationClientLinkCategoryRecovery;

  /// No description provided for @applicationClientLinkCategoryLearning.
  ///
  /// In ar, this message translates to:
  /// **'التعلم والتطوير'**
  String get applicationClientLinkCategoryLearning;

  /// No description provided for @applicationClientLinkCategoryAccessibility.
  ///
  /// In ar, this message translates to:
  /// **'إمكانية الوصول'**
  String get applicationClientLinkCategoryAccessibility;

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

  /// No description provided for @applicationClientLinkSubSectionPlatformContact.
  ///
  /// In ar, this message translates to:
  /// **'متى تتواصل مع المنصة'**
  String get applicationClientLinkSubSectionPlatformContact;

  /// No description provided for @applicationClientLinkSubSectionOfficialAuthorities.
  ///
  /// In ar, this message translates to:
  /// **'متى تتوجه للجهات الرسمية'**
  String get applicationClientLinkSubSectionOfficialAuthorities;

  /// No description provided for @applicationClientLinkSubSectionNotice.
  ///
  /// In ar, this message translates to:
  /// **'تنبيه مهم'**
  String get applicationClientLinkSubSectionNotice;

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

  /// No description provided for @applicationClientDialogLinksSectionHint.
  ///
  /// In ar, this message translates to:
  /// **'اختر القسم المناسب بدلًا من البحث وسط قائمة طويلة.'**
  String get applicationClientDialogLinksSectionHint;

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

  /// No description provided for @applicationClientDialogOk.
  ///
  /// In ar, this message translates to:
  /// **'حسنًا'**
  String get applicationClientDialogOk;

  /// No description provided for @applicationAccessibilityLinksCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة الروابط المهمة'**
  String get applicationAccessibilityLinksCardTitle;

  /// No description provided for @applicationAccessibilityLinksCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مواقع وجهات مساعدة مصرية وعربية وعالمية'**
  String get applicationAccessibilityLinksCardSubtitle;

  /// No description provided for @applicationAccessibilityToolsCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة الأدوات المساعدة'**
  String get applicationAccessibilityToolsCardTitle;

  /// No description provided for @applicationAccessibilityToolsCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'أدوات تساعد في التواصل والقراءة والفهم'**
  String get applicationAccessibilityToolsCardSubtitle;

  /// No description provided for @applicationAccessibilitySuggestionsCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'شارك باقتراح'**
  String get applicationAccessibilitySuggestionsCardTitle;

  /// No description provided for @applicationAccessibilitySuggestionsCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'ساعدنا في تطوير الأدوات والخدمات'**
  String get applicationAccessibilitySuggestionsCardSubtitle;

  /// No description provided for @applicationAccessibilityDialogRandomMessage.
  ///
  /// In ar, this message translates to:
  /// **'🎲 اختر لي رسالة'**
  String get applicationAccessibilityDialogRandomMessage;

  /// No description provided for @applicationAccessibilityDialogSelectMessage.
  ///
  /// In ar, this message translates to:
  /// **'اختر رسالة تحب رؤيتها على النوته'**
  String get applicationAccessibilityDialogSelectMessage;

  /// No description provided for @applicationAccessibilityLegendTitle.
  ///
  /// In ar, this message translates to:
  /// **'دليل العلامات'**
  String get applicationAccessibilityLegendTitle;

  /// No description provided for @applicationAccessibilityLegendGov.
  ///
  /// In ar, this message translates to:
  /// **'جهة حكومية'**
  String get applicationAccessibilityLegendGov;

  /// No description provided for @applicationAccessibilityLegendAssoc.
  ///
  /// In ar, this message translates to:
  /// **'جمعية'**
  String get applicationAccessibilityLegendAssoc;

  /// No description provided for @applicationAccessibilityLegendIntl.
  ///
  /// In ar, this message translates to:
  /// **'منظمة دولية'**
  String get applicationAccessibilityLegendIntl;

  /// No description provided for @applicationAccessibilityLegendLib.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة'**
  String get applicationAccessibilityLegendLib;

  /// No description provided for @applicationAccessibilityLegendEdu.
  ///
  /// In ar, this message translates to:
  /// **'تعليم'**
  String get applicationAccessibilityLegendEdu;

  /// No description provided for @applicationAccessibilityLegendSign.
  ///
  /// In ar, this message translates to:
  /// **'لغة إشارة'**
  String get applicationAccessibilityLegendSign;

  /// No description provided for @applicationAccessibilityLegendVisual.
  ///
  /// In ar, this message translates to:
  /// **'دعم بصري'**
  String get applicationAccessibilityLegendVisual;

  /// No description provided for @applicationAccessibilityLegendAccess.
  ///
  /// In ar, this message translates to:
  /// **'إمكانية وصول'**
  String get applicationAccessibilityLegendAccess;

  /// No description provided for @applicationAccessibilityLinksSectionEgypt.
  ///
  /// In ar, this message translates to:
  /// **'مصر'**
  String get applicationAccessibilityLinksSectionEgypt;

  /// No description provided for @applicationAccessibilityLinksSectionArab.
  ///
  /// In ar, this message translates to:
  /// **'الوطن العربي'**
  String get applicationAccessibilityLinksSectionArab;

  /// No description provided for @applicationAccessibilityLinksSectionGlobal.
  ///
  /// In ar, this message translates to:
  /// **'عالمي'**
  String get applicationAccessibilityLinksSectionGlobal;

  /// No description provided for @applicationAccessibilityLinksSectionKnowledge.
  ///
  /// In ar, this message translates to:
  /// **'مكتبات ومصادر معرفة'**
  String get applicationAccessibilityLinksSectionKnowledge;

  /// No description provided for @applicationAccessibilityLinksEgyptCouncilTitle.
  ///
  /// In ar, this message translates to:
  /// **'المجلس القومي للأشخاص ذوي الإعاقة'**
  String get applicationAccessibilityLinksEgyptCouncilTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptCouncilDesc.
  ///
  /// In ar, this message translates to:
  /// **'حقوق وخدمات رسمية'**
  String get applicationAccessibilityLinksEgyptCouncilDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptMossTitle.
  ///
  /// In ar, this message translates to:
  /// **'وزارة التضامن الاجتماعي'**
  String get applicationAccessibilityLinksEgyptMossTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptMossDesc.
  ///
  /// In ar, this message translates to:
  /// **'دعم اجتماعي رسمي'**
  String get applicationAccessibilityLinksEgyptMossDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptEducationTitle.
  ///
  /// In ar, this message translates to:
  /// **'وزارة التربية والتعليم'**
  String get applicationAccessibilityLinksEgyptEducationTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptEducationDesc.
  ///
  /// In ar, this message translates to:
  /// **'تعليم وخدمات مدرسية'**
  String get applicationAccessibilityLinksEgyptEducationDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptEkbTitle.
  ///
  /// In ar, this message translates to:
  /// **'بنك المعرفة المصري'**
  String get applicationAccessibilityLinksEgyptEkbTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptEkbDesc.
  ///
  /// In ar, this message translates to:
  /// **'مصادر تعلم رقمية'**
  String get applicationAccessibilityLinksEgyptEkbDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptGovTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة الحكومة المصرية'**
  String get applicationAccessibilityLinksEgyptGovTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptGovDesc.
  ///
  /// In ar, this message translates to:
  /// **'خدمات حكومية عامة'**
  String get applicationAccessibilityLinksEgyptGovDesc;

  /// No description provided for @applicationAccessibilityLinksArabEscwaTitle.
  ///
  /// In ar, this message translates to:
  /// **'الإسكوا - الإعاقة والإدماج'**
  String get applicationAccessibilityLinksArabEscwaTitle;

  /// No description provided for @applicationAccessibilityLinksArabEscwaDesc.
  ///
  /// In ar, this message translates to:
  /// **'سياسات عربية دامجة'**
  String get applicationAccessibilityLinksArabEscwaDesc;

  /// No description provided for @applicationAccessibilityLinksArabAlecsoTitle.
  ///
  /// In ar, this message translates to:
  /// **'الألكسو'**
  String get applicationAccessibilityLinksArabAlecsoTitle;

  /// No description provided for @applicationAccessibilityLinksArabAlecsoDesc.
  ///
  /// In ar, this message translates to:
  /// **'تعليم وثقافة عربية'**
  String get applicationAccessibilityLinksArabAlecsoDesc;

  /// No description provided for @applicationAccessibilityLinksArabKingSalmanTitle.
  ///
  /// In ar, this message translates to:
  /// **'مركز الملك سلمان لأبحاث الإعاقة'**
  String get applicationAccessibilityLinksArabKingSalmanTitle;

  /// No description provided for @applicationAccessibilityLinksArabKingSalmanDesc.
  ///
  /// In ar, this message translates to:
  /// **'أبحاث إعاقة عربية'**
  String get applicationAccessibilityLinksArabKingSalmanDesc;

  /// No description provided for @applicationAccessibilityLinksArabAradoTitle.
  ///
  /// In ar, this message translates to:
  /// **'المنظمة العربية للتنمية الإدارية'**
  String get applicationAccessibilityLinksArabAradoTitle;

  /// No description provided for @applicationAccessibilityLinksArabAradoDesc.
  ///
  /// In ar, this message translates to:
  /// **'معرفة وبناء قدرات'**
  String get applicationAccessibilityLinksArabAradoDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalWhoTitle.
  ///
  /// In ar, this message translates to:
  /// **'منظمة الصحة العالمية - الإعاقة'**
  String get applicationAccessibilityLinksGlobalWhoTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalWhoDesc.
  ///
  /// In ar, this message translates to:
  /// **'معلومات صحية عالمية'**
  String get applicationAccessibilityLinksGlobalWhoDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalUnicefTitle.
  ///
  /// In ar, this message translates to:
  /// **'اليونيسف - الأطفال ذوو الإعاقة'**
  String get applicationAccessibilityLinksGlobalUnicefTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalUnicefDesc.
  ///
  /// In ar, this message translates to:
  /// **'حقوق الأطفال والدعم'**
  String get applicationAccessibilityLinksGlobalUnicefDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalUndesaTitle.
  ///
  /// In ar, this message translates to:
  /// **'الأمم المتحدة - الإعاقة'**
  String get applicationAccessibilityLinksGlobalUndesaTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalUndesaDesc.
  ///
  /// In ar, this message translates to:
  /// **'حقوق وسياسات دولية'**
  String get applicationAccessibilityLinksGlobalUndesaDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalW3cTitle.
  ///
  /// In ar, this message translates to:
  /// **'مبادرة الوصول للويب'**
  String get applicationAccessibilityLinksGlobalW3cTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalW3cDesc.
  ///
  /// In ar, this message translates to:
  /// **'إرشادات وصول رقمية'**
  String get applicationAccessibilityLinksGlobalW3cDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeLocTitle.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة الكونغرس لخدمة المكفوفين'**
  String get applicationAccessibilityLinksKnowledgeLocTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeLocDesc.
  ///
  /// In ar, this message translates to:
  /// **'كتب ميسرة صوتية'**
  String get applicationAccessibilityLinksKnowledgeLocDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeBookshareTitle.
  ///
  /// In ar, this message translates to:
  /// **'بووكشير'**
  String get applicationAccessibilityLinksKnowledgeBookshareTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeBookshareDesc.
  ///
  /// In ar, this message translates to:
  /// **'كتب قابلة للوصول'**
  String get applicationAccessibilityLinksKnowledgeBookshareDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeDaisyTitle.
  ///
  /// In ar, this message translates to:
  /// **'اتحاد ديزي'**
  String get applicationAccessibilityLinksKnowledgeDaisyTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeDaisyDesc.
  ///
  /// In ar, this message translates to:
  /// **'معايير قراءة ميسرة'**
  String get applicationAccessibilityLinksKnowledgeDaisyDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeWbuTitle.
  ///
  /// In ar, this message translates to:
  /// **'الاتحاد العالمي للمكفوفين'**
  String get applicationAccessibilityLinksKnowledgeWbuTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeWbuDesc.
  ///
  /// In ar, this message translates to:
  /// **'دعم بصري عالمي'**
  String get applicationAccessibilityLinksKnowledgeWbuDesc;

  /// No description provided for @applicationAccessibilityToolsSectionWriting.
  ///
  /// In ar, this message translates to:
  /// **'أدوات كتابة'**
  String get applicationAccessibilityToolsSectionWriting;

  /// No description provided for @applicationAccessibilityToolsSectionCommunication.
  ///
  /// In ar, this message translates to:
  /// **'أدوات تواصل'**
  String get applicationAccessibilityToolsSectionCommunication;

  /// No description provided for @applicationAccessibilityToolsSectionVisual.
  ///
  /// In ar, this message translates to:
  /// **'أدوات دعم بصري'**
  String get applicationAccessibilityToolsSectionVisual;

  /// No description provided for @applicationAccessibilityToolsSectionAudio.
  ///
  /// In ar, this message translates to:
  /// **'أدوات دعم صوتي'**
  String get applicationAccessibilityToolsSectionAudio;

  /// No description provided for @applicationAccessibilityToolsSectionReading.
  ///
  /// In ar, this message translates to:
  /// **'أدوات قراءة'**
  String get applicationAccessibilityToolsSectionReading;

  /// No description provided for @applicationAccessibilityToolsSectionDaily.
  ///
  /// In ar, this message translates to:
  /// **'أدوات مساعدة يومية'**
  String get applicationAccessibilityToolsSectionDaily;

  /// No description provided for @applicationAccessibilityToolsOpen.
  ///
  /// In ar, this message translates to:
  /// **'فتح الأداة'**
  String get applicationAccessibilityToolsOpen;

  /// No description provided for @applicationAccessibilityToolsChatGptDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة في الكتابة والفهم'**
  String get applicationAccessibilityToolsChatGptDesc;

  /// No description provided for @applicationAccessibilityToolsGeminiDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعد ذكي من جوجل'**
  String get applicationAccessibilityToolsGeminiDesc;

  /// No description provided for @applicationAccessibilityToolsCopilotDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعد ذكي من مايكروسوفت'**
  String get applicationAccessibilityToolsCopilotDesc;

  /// No description provided for @applicationAccessibilityToolsVoiceTypingDesc.
  ///
  /// In ar, this message translates to:
  /// **'إملاء صوتي للنص'**
  String get applicationAccessibilityToolsVoiceTypingDesc;

  /// No description provided for @applicationAccessibilityToolsGoogleTranslateDesc.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة نصوص ومحادثات'**
  String get applicationAccessibilityToolsGoogleTranslateDesc;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorDesc.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة ومحادثات متعددة'**
  String get applicationAccessibilityToolsMicrosoftTranslatorDesc;

  /// No description provided for @applicationAccessibilityToolsDeepLDesc.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة نصية دقيقة'**
  String get applicationAccessibilityToolsDeepLDesc;

  /// No description provided for @applicationAccessibilityToolsSeeingAIDesc.
  ///
  /// In ar, this message translates to:
  /// **'وصف وقراءة مرئية'**
  String get applicationAccessibilityToolsSeeingAIDesc;

  /// No description provided for @applicationAccessibilityToolsLookoutDesc.
  ///
  /// In ar, this message translates to:
  /// **'دعم بصري للهاتف'**
  String get applicationAccessibilityToolsLookoutDesc;

  /// No description provided for @applicationAccessibilityToolsLiveTranscribeDesc.
  ///
  /// In ar, this message translates to:
  /// **'تحويل الكلام إلى نص'**
  String get applicationAccessibilityToolsLiveTranscribeDesc;

  /// No description provided for @applicationAccessibilityToolsYoutubeCaptionsDesc.
  ///
  /// In ar, this message translates to:
  /// **'نصوص للفيديوهات'**
  String get applicationAccessibilityToolsYoutubeCaptionsDesc;

  /// No description provided for @applicationAccessibilityToolsReadAloudDesc.
  ///
  /// In ar, this message translates to:
  /// **'قراءة النصوص صوتيًا'**
  String get applicationAccessibilityToolsReadAloudDesc;

  /// No description provided for @applicationAccessibilityToolsImmersiveReaderDesc.
  ///
  /// In ar, this message translates to:
  /// **'قراءة وفهم أسهل'**
  String get applicationAccessibilityToolsImmersiveReaderDesc;

  /// No description provided for @applicationAccessibilityToolsBeMyEyesDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة بصرية مباشرة'**
  String get applicationAccessibilityToolsBeMyEyesDesc;

  /// No description provided for @applicationAccessibilityCheckinMessage.
  ///
  /// In ar, this message translates to:
  /// **'وحشتونا ❤️\nأنا زرت صفحة طمنّا عليك النهارده.'**
  String get applicationAccessibilityCheckinMessage;

  /// No description provided for @applicationAccessibilityCheckinWhatsappOpened.
  ///
  /// In ar, this message translates to:
  /// **'✅ تم فتح واتساب'**
  String get applicationAccessibilityCheckinWhatsappOpened;

  /// No description provided for @applicationAccessibilityCheckinWhatsappNote.
  ///
  /// In ar, this message translates to:
  /// **'شكراً إنك طمّنتنا عليك.\nإجاباتك لم يتم إرسالها أو حفظها.'**
  String get applicationAccessibilityCheckinWhatsappNote;

  /// No description provided for @applicationAccessibilityCheckinQuestion1.
  ///
  /// In ar, this message translates to:
  /// **'عامل إيه النهارده؟'**
  String get applicationAccessibilityCheckinQuestion1;

  /// No description provided for @applicationAccessibilityCheckinQuestion2.
  ///
  /// In ar, this message translates to:
  /// **'في حاجة صعبة قابلتك؟'**
  String get applicationAccessibilityCheckinQuestion2;

  /// No description provided for @applicationAccessibilityCheckinQuestion3.
  ///
  /// In ar, this message translates to:
  /// **'إيه أكثر حاجة محتاجها مننا؟'**
  String get applicationAccessibilityCheckinQuestion3;

  /// No description provided for @applicationAccessibilityCheckinQuestion4.
  ///
  /// In ar, this message translates to:
  /// **'هل في أداة أو خدمة تساعدك؟'**
  String get applicationAccessibilityCheckinQuestion4;

  /// No description provided for @applicationAccessibilityCheckinQuestion5.
  ///
  /// In ar, this message translates to:
  /// **'تحب تقول لنا حاجة؟'**
  String get applicationAccessibilityCheckinQuestion5;

  /// No description provided for @applicationAccessibilityCheckinSectionGeneral.
  ///
  /// In ar, this message translates to:
  /// **'شكاوى ومقترحات عامة'**
  String get applicationAccessibilityCheckinSectionGeneral;

  /// No description provided for @applicationAccessibilityCheckinWhatsappContact.
  ///
  /// In ar, this message translates to:
  /// **'تواصل معنا عبر واتساب'**
  String get applicationAccessibilityCheckinWhatsappContact;

  /// No description provided for @applicationAccessibilityCheckinSectionSpecialist.
  ///
  /// In ar, this message translates to:
  /// **'لو حابب تعرف أكثر أو تتكلم مع متخصص'**
  String get applicationAccessibilityCheckinSectionSpecialist;

  /// No description provided for @applicationAccessibilityCheckinSectionSpecialistTitle.
  ///
  /// In ar, this message translates to:
  /// **'المتخصصون والمكتبة'**
  String get applicationAccessibilityCheckinSectionSpecialistTitle;

  /// No description provided for @applicationAccessibilitySuggestionsLabelName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الأداة أو الفكرة المقترحة'**
  String get applicationAccessibilitySuggestionsLabelName;

  /// No description provided for @applicationAccessibilitySuggestionsHintName.
  ///
  /// In ar, this message translates to:
  /// **'مثال: قارئ شاشة عربي'**
  String get applicationAccessibilitySuggestionsHintName;

  /// No description provided for @applicationAccessibilitySuggestionsLabelReason.
  ///
  /// In ar, this message translates to:
  /// **'سبب الاقتراح'**
  String get applicationAccessibilitySuggestionsLabelReason;

  /// No description provided for @applicationAccessibilitySuggestionsHintReason.
  ///
  /// In ar, this message translates to:
  /// **'كيف ستساعد هذه الأداة المستخدمين؟'**
  String get applicationAccessibilitySuggestionsHintReason;

  /// No description provided for @applicationAccessibilitySuggestionsLabelLink.
  ///
  /// In ar, this message translates to:
  /// **'رابط أو صفحة قد تساعدنا في العثور عليها'**
  String get applicationAccessibilitySuggestionsLabelLink;

  /// No description provided for @applicationAccessibilitySuggestionsHintLink.
  ///
  /// In ar, this message translates to:
  /// **'Website / App / YouTube / Article'**
  String get applicationAccessibilitySuggestionsHintLink;

  /// No description provided for @applicationAccessibilitySuggestionsSubmitButton.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الاقتراح'**
  String get applicationAccessibilitySuggestionsSubmitButton;

  /// No description provided for @applicationAccessibilitySuggestionsSuccessBody.
  ///
  /// In ar, this message translates to:
  /// **'شكراً لمساهمتك.\n\nاقتراحاتكم تساعدنا على تطوير المنصة وإضافة أدوات جديدة يستفيد منها الجميع.\n\nقد ترى اقتراحك ضمن الأدوات المتاحة مستقبلاً.'**
  String get applicationAccessibilitySuggestionsSuccessBody;

  /// No description provided for @applicationAccessibilitySuggestionsNotAttached.
  ///
  /// In ar, this message translates to:
  /// **'غير مرفق'**
  String get applicationAccessibilitySuggestionsNotAttached;

  /// No description provided for @applicationAccessibilitySuggestionsWhatsappMessage.
  ///
  /// In ar, this message translates to:
  /// **'اقتراح جديد من بوابة الاحتياجات\n\nاسم الأداة:\n{name}\n\nسبب الاقتراح:\n{reason}\n\nالرابط المقترح:\n{link}'**
  String applicationAccessibilitySuggestionsWhatsappMessage(
      String name, String reason, String link);

  /// No description provided for @applicationAccessibilityMessage1.
  ///
  /// In ar, this message translates to:
  /// **'أنا أقوى مما أعتقد'**
  String get applicationAccessibilityMessage1;

  /// No description provided for @applicationAccessibilityMessage2.
  ///
  /// In ar, this message translates to:
  /// **'غدًا فرصة جديدة'**
  String get applicationAccessibilityMessage2;

  /// No description provided for @applicationAccessibilityMessage3.
  ///
  /// In ar, this message translates to:
  /// **'لست وحدي'**
  String get applicationAccessibilityMessage3;

  /// No description provided for @applicationAccessibilityMessage4.
  ///
  /// In ar, this message translates to:
  /// **'أستحق الراحة'**
  String get applicationAccessibilityMessage4;

  /// No description provided for @applicationAccessibilityMessage5.
  ///
  /// In ar, this message translates to:
  /// **'خطوة صغيرة تكفي اليوم'**
  String get applicationAccessibilityMessage5;

  /// No description provided for @applicationAccessibilityMessage6.
  ///
  /// In ar, this message translates to:
  /// **'الحمد لله على ما أنا فيه'**
  String get applicationAccessibilityMessage6;

  /// No description provided for @applicationAccessibilityMessage7.
  ///
  /// In ar, this message translates to:
  /// **'سأعطي نفسي وقتًا للراحة'**
  String get applicationAccessibilityMessage7;

  /// No description provided for @applicationAccessibilityMessage8.
  ///
  /// In ar, this message translates to:
  /// **'وجودي مهم'**
  String get applicationAccessibilityMessage8;

  /// No description provided for @applicationAccessibilityMessage9.
  ///
  /// In ar, this message translates to:
  /// **'ما زالت هناك أشياء جميلة تنتظرني'**
  String get applicationAccessibilityMessage9;

  /// No description provided for @applicationAccessibilityMessage10.
  ///
  /// In ar, this message translates to:
  /// **'اليوم يكفي كما هو'**
  String get applicationAccessibilityMessage10;

  /// No description provided for @applicationAccessibilityMessage11.
  ///
  /// In ar, this message translates to:
  /// **'أستطيع البدء من جديد'**
  String get applicationAccessibilityMessage11;

  /// No description provided for @applicationAccessibilityMessage12.
  ///
  /// In ar, this message translates to:
  /// **'لكل مشكلة أكثر من حل'**
  String get applicationAccessibilityMessage12;

  /// No description provided for @applicationAccessibilityMessage13.
  ///
  /// In ar, this message translates to:
  /// **'خطوة صغيرة أفضل من الوقوف'**
  String get applicationAccessibilityMessage13;

  /// No description provided for @applicationAccessibilityMessage14.
  ///
  /// In ar, this message translates to:
  /// **'أستحق اللطف مع نفسي'**
  String get applicationAccessibilityMessage14;

  /// No description provided for @applicationAccessibilityMessage15.
  ///
  /// In ar, this message translates to:
  /// **'الأمور تتحسن بالتدريج'**
  String get applicationAccessibilityMessage15;

  /// No description provided for @applicationAccessibilityMessage16.
  ///
  /// In ar, this message translates to:
  /// **'كل يوم صفحة جديدة'**
  String get applicationAccessibilityMessage16;

  /// No description provided for @applicationAccessibilityMessage17.
  ///
  /// In ar, this message translates to:
  /// **'لدي أشياء جميلة لم أكتشفها بعد'**
  String get applicationAccessibilityMessage17;

  /// No description provided for @applicationAccessibilityMessage18.
  ///
  /// In ar, this message translates to:
  /// **'الهدوء قوة أيضًا'**
  String get applicationAccessibilityMessage18;

  /// No description provided for @applicationAccessibilityMessage19.
  ///
  /// In ar, this message translates to:
  /// **'أنا أحاول وهذا يكفي'**
  String get applicationAccessibilityMessage19;

  /// No description provided for @applicationAccessibilityMessage20.
  ///
  /// In ar, this message translates to:
  /// **'لا بأس أن أرتاح قليلاً'**
  String get applicationAccessibilityMessage20;

  /// No description provided for @applicationAccessibilityCommunityToolsNote.
  ///
  /// In ar, this message translates to:
  /// **'سنضيف الأدوات الأكثر طلبًا بناءً على اقتراحاتكم.'**
  String get applicationAccessibilityCommunityToolsNote;

  /// No description provided for @applicationAccessibilityCommunityToolsBackToRoom.
  ///
  /// In ar, this message translates to:
  /// **'العودة للغرفة'**
  String get applicationAccessibilityCommunityToolsBackToRoom;

  /// No description provided for @libraryTitle.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة'**
  String get libraryTitle;

  /// No description provided for @libraryNoteArticles.
  ///
  /// In ar, this message translates to:
  /// **'مقالات تثقيفية وداعمة ستتوفر تدريجيًا.'**
  String get libraryNoteArticles;

  /// No description provided for @libraryNoteExercises.
  ///
  /// In ar, this message translates to:
  /// **'تمارين دعم خفيفة فقط، وليست بروتوكولًا علاجيًا.'**
  String get libraryNoteExercises;

  /// No description provided for @libraryNoteAudio.
  ///
  /// In ar, this message translates to:
  /// **'صوتيات للتهدئة والدعم العام، وليست تدخلًا علاجيًا.'**
  String get libraryNoteAudio;

  /// No description provided for @libraryNoteVideos.
  ///
  /// In ar, this message translates to:
  /// **'موارد تعليمية مرئية، وأي روابط خارجية مستقبلًا ستحتاج رصد سلامة.'**
  String get libraryNoteVideos;

  /// No description provided for @libraryNoteTools.
  ///
  /// In ar, this message translates to:
  /// **'أدوات الدعم قيد التجهيز. الأدوات المهنية أو الحساسة تحتاج إشراف مختص.'**
  String get libraryNoteTools;

  /// No description provided for @libraryNoteSaved.
  ///
  /// In ar, this message translates to:
  /// **'ميزة الحفظ غير مفعلة الآن، ولا يتم تخزين أي عناصر في هذه المرحلة.'**
  String get libraryNoteSaved;

  /// No description provided for @libraryFeaturedSafeEmbrace.
  ///
  /// In ar, this message translates to:
  /// **'حضن آمن'**
  String get libraryFeaturedSafeEmbrace;

  /// No description provided for @libraryFeaturedSafeStart.
  ///
  /// In ar, this message translates to:
  /// **'بداية آمنة'**
  String get libraryFeaturedSafeStart;

  /// No description provided for @libraryProviderContentTitle.
  ///
  /// In ar, this message translates to:
  /// **'محتوى مقدمي الخدمات'**
  String get libraryProviderContentTitle;

  /// No description provided for @libraryProviderSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'الأخصائيون'**
  String get libraryProviderSpecialists;

  /// No description provided for @libraryProviderCenters.
  ///
  /// In ar, this message translates to:
  /// **'المراكز والجهات'**
  String get libraryProviderCenters;

  /// No description provided for @libraryComingSoon.
  ///
  /// In ar, this message translates to:
  /// **'قريبًا'**
  String get libraryComingSoon;

  /// No description provided for @libraryEducationalDisclaimer.
  ///
  /// In ar, this message translates to:
  /// **'هذا المحتوى للتوعية ولا يغني عن استشارة مختص عند الحاجة.'**
  String get libraryEducationalDisclaimer;

  /// No description provided for @libraryUsagePolicy.
  ///
  /// In ar, this message translates to:
  /// **'سياسة استخدام المكتبة'**
  String get libraryUsagePolicy;

  /// No description provided for @libraryPolicyTitle.
  ///
  /// In ar, this message translates to:
  /// **'سياسة استخدام مكتبة Mental Smile'**
  String get libraryPolicyTitle;

  /// No description provided for @libraryPolicyPurposeTitle.
  ///
  /// In ar, this message translates to:
  /// **'غرض المكتبة'**
  String get libraryPolicyPurposeTitle;

  /// No description provided for @libraryPolicyPurposeBody.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة Mental Smile مخصصة للتوعية والتعليم والدعم النفسي العام. المحتوى لا يقدم تشخيصًا طبيًا، ولا يقدم علاجًا مباشرًا، ولا يغني عن استشارة مختص عند الحاجة.'**
  String get libraryPolicyPurposeBody;

  /// No description provided for @libraryPolicyBoundariesTitle.
  ///
  /// In ar, this message translates to:
  /// **'حدود المحتوى'**
  String get libraryPolicyBoundariesTitle;

  /// No description provided for @libraryPolicyBoundariesBody.
  ///
  /// In ar, this message translates to:
  /// **'المحتوى تعليمي وداعم فقط. لا يجب استخدامه كبديل لطبيب أو أخصائي. في الحالات الطارئة أو عند وجود خطر إيذاء النفس، يجب طلب مساعدة فورية من مختص أو جهة طوارئ محلية.'**
  String get libraryPolicyBoundariesBody;

  /// No description provided for @libraryPolicyExternalLinksTitle.
  ///
  /// In ar, this message translates to:
  /// **'الروابط الخارجية'**
  String get libraryPolicyExternalLinksTitle;

  /// No description provided for @libraryPolicyExternalLinksBody.
  ///
  /// In ar, this message translates to:
  /// **'بعض الموارد قد تكون روابط خارجية. Mental Smile لا ينسخ محتوى الجهات الخارجية، ويتم عرض المصدر والحقوق عند توفرها. المستخدم مسؤول عن فتح المواقع الخارجية بحذر.'**
  String get libraryPolicyExternalLinksBody;

  /// No description provided for @libraryPolicyRightsTitle.
  ///
  /// In ar, this message translates to:
  /// **'حقوق الملكية'**
  String get libraryPolicyRightsTitle;

  /// No description provided for @libraryPolicyRightsBody.
  ///
  /// In ar, this message translates to:
  /// **'المحتوى الأصلي مملوك أو مرخص لـ Mental Smile. المحتوى الخارجي يستخدم كرابط أو بإذن/ترخيص عند الحاجة. أي استخدام غير مصرح به للمحتوى ممنوع.'**
  String get libraryPolicyRightsBody;

  /// No description provided for @libraryPolicyProfessionalTitle.
  ///
  /// In ar, this message translates to:
  /// **'المحتوى المهني'**
  String get libraryPolicyProfessionalTitle;

  /// No description provided for @libraryPolicyProfessionalBody.
  ///
  /// In ar, this message translates to:
  /// **'بعض الموارد المهنية أو أدوات VR مستقبلًا ستكون للأخصائيين فقط، ولن يتم إتاحتها مباشرة للعملاء بدون إشراف مناسب. أي أدوات عالية الحساسية تحتاج رصد سلامة بشري.'**
  String get libraryPolicyProfessionalBody;

  /// No description provided for @libraryPolicyAiTitle.
  ///
  /// In ar, this message translates to:
  /// **'الذكاء الاصطناعي'**
  String get libraryPolicyAiTitle;

  /// No description provided for @libraryPolicyAiBody.
  ///
  /// In ar, this message translates to:
  /// **'قد يساعد الذكاء الاصطناعي مستقبلًا في إعداد أو تصنيف المحتوى، لكن لا يتم نشر أي محتوى حساس بدون رصد بشري. الذكاء الاصطناعي ليس بديلًا عن المختصين.'**
  String get libraryPolicyAiBody;

  /// No description provided for @libraryPolicyConfirmationTitle.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد القراءة وتتبع السياسات'**
  String get libraryPolicyConfirmationTitle;

  /// No description provided for @libraryPolicyConfirmationBody.
  ///
  /// In ar, this message translates to:
  /// **'هذه الصفحة تعريفية فقط في المرحلة الحالية. نظام تتبع تأكيدات القراءة وإصدارات السياسة سيتم تفعيله لاحقًا، ولا يتم الآن تخزين أي تأكيد داخل Firebase أو الجهاز.'**
  String get libraryPolicyConfirmationBody;

  /// No description provided for @libraryPolicyVisualConfirmationOnly.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد القراءة هنا بصري فقط في هذه المرحلة، ولا يتم حفظ أي موافقة.'**
  String get libraryPolicyVisualConfirmationOnly;

  /// No description provided for @commercialV2WebTitle.
  ///
  /// In ar, this message translates to:
  /// **'Commercial V2 Web'**
  String get commercialV2WebTitle;

  /// No description provided for @commercialV2WebSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'قسم العرض التجاري الجديد'**
  String get commercialV2WebSubtitle;

  /// No description provided for @commercialV2WebSectionLibrary.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة'**
  String get commercialV2WebSectionLibrary;

  /// No description provided for @commercialV2WebSectionSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'الأخصائيين'**
  String get commercialV2WebSectionSpecialists;

  /// No description provided for @commercialV2WebSectionCenters.
  ///
  /// In ar, this message translates to:
  /// **'المراكز'**
  String get commercialV2WebSectionCenters;

  /// No description provided for @commercialV2WebUnderConstruction.
  ///
  /// In ar, this message translates to:
  /// **'قيد التجهيز'**
  String get commercialV2WebUnderConstruction;

  /// No description provided for @commercialPublicAccountsTitle.
  ///
  /// In ar, this message translates to:
  /// **'حسابات Mental Smile'**
  String get commercialPublicAccountsTitle;

  /// No description provided for @commercialPublicAccountsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'من هنا تقدر تشوف منشوراتك وملفك المهني بعد التجهيز، وتتفرج على نماذج وأفكار من زملائك.'**
  String get commercialPublicAccountsSubtitle;

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

  /// No description provided for @commercialPublicAccountsSectionIdentity.
  ///
  /// In ar, this message translates to:
  /// **'مواد التعريف'**
  String get commercialPublicAccountsSectionIdentity;

  /// No description provided for @commercialPublicAccountsWebsite.
  ///
  /// In ar, this message translates to:
  /// **'الموقع الإلكتروني'**
  String get commercialPublicAccountsWebsite;

  /// No description provided for @commercialPublicAccountsSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'دليل الأخصائيين'**
  String get commercialPublicAccountsSpecialists;

  /// No description provided for @commercialPublicAccountsCenters.
  ///
  /// In ar, this message translates to:
  /// **'دليل المراكز'**
  String get commercialPublicAccountsCenters;

  /// No description provided for @commercialPublicAccountsLibrary.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة العامة'**
  String get commercialPublicAccountsLibrary;

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

  /// No description provided for @commercialPublicAccountsLinkedin.
  ///
  /// In ar, this message translates to:
  /// **'لينكدإن'**
  String get commercialPublicAccountsLinkedin;

  /// No description provided for @commercialPublicAccountsX.
  ///
  /// In ar, this message translates to:
  /// **'منصة X'**
  String get commercialPublicAccountsX;

  /// No description provided for @commercialPublicAccountsTiktok.
  ///
  /// In ar, this message translates to:
  /// **'تيك توك'**
  String get commercialPublicAccountsTiktok;

  /// No description provided for @commercialPublicAccountsYoutube.
  ///
  /// In ar, this message translates to:
  /// **'يوتيوب'**
  String get commercialPublicAccountsYoutube;

  /// No description provided for @commercialPublicAccountsTelegram.
  ///
  /// In ar, this message translates to:
  /// **'تيليجرام'**
  String get commercialPublicAccountsTelegram;

  /// No description provided for @commercialPublicAccountsWhatsapp.
  ///
  /// In ar, this message translates to:
  /// **'قناة واتساب'**
  String get commercialPublicAccountsWhatsapp;

  /// No description provided for @commercialPublicAccountsBusinessCards.
  ///
  /// In ar, this message translates to:
  /// **'نماذج بطاقات العمل'**
  String get commercialPublicAccountsBusinessCards;

  /// No description provided for @commercialPublicAccountsResume.
  ///
  /// In ar, this message translates to:
  /// **'نماذج السير الذاتية'**
  String get commercialPublicAccountsResume;

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

  /// No description provided for @commercialAccessSpecialist.
  ///
  /// In ar, this message translates to:
  /// **'أخصائي'**
  String get commercialAccessSpecialist;

  /// No description provided for @commercialAccessCenter.
  ///
  /// In ar, this message translates to:
  /// **'مركز'**
  String get commercialAccessCenter;

  /// No description provided for @commercialAccessAdmin.
  ///
  /// In ar, this message translates to:
  /// **'الإدارة'**
  String get commercialAccessAdmin;

  /// No description provided for @commercialRoomNoteTitle.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظاتي ومواعيدي'**
  String get commercialRoomNoteTitle;

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

  /// No description provided for @commercialRoomNotebookDelete.
  ///
  /// In ar, this message translates to:
  /// **'مسح'**
  String get commercialRoomNotebookDelete;

  /// No description provided for @commercialRoomNotebookSave.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get commercialRoomNotebookSave;

  /// No description provided for @commercialRoomExitRoomTooltip.
  ///
  /// In ar, this message translates to:
  /// **'الخروج من الغرفة'**
  String get commercialRoomExitRoomTooltip;

  /// No description provided for @commercialRoomNotebookTooltip.
  ///
  /// In ar, this message translates to:
  /// **'فتح النوتة'**
  String get commercialRoomNotebookTooltip;

  /// No description provided for @workshopTitle.
  ///
  /// In ar, this message translates to:
  /// **'ورشة العمل - Mental Smile'**
  String get workshopTitle;

  /// No description provided for @workshopSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'ورشة عمل الجيل 1.5 للمالك والمتعاونين بالذكاء الاصطناعي.'**
  String get workshopSubtitle;

  /// No description provided for @workshopSearchHint.
  ///
  /// In ar, this message translates to:
  /// **'البحث في أقسام ورشة العمل'**
  String get workshopSearchHint;

  /// No description provided for @workshopIntelligenceEngine.
  ///
  /// In ar, this message translates to:
  /// **'محرك الذكاء'**
  String get workshopIntelligenceEngine;

  /// No description provided for @workshopOrchestration.
  ///
  /// In ar, this message translates to:
  /// **'التنسيق'**
  String get workshopOrchestration;

  /// No description provided for @workshopDecisionIntelligence.
  ///
  /// In ar, this message translates to:
  /// **'ذكاء القرار'**
  String get workshopDecisionIntelligence;

  /// No description provided for @workshopGovernanceOps.
  ///
  /// In ar, this message translates to:
  /// **'عمليات الحوكمة'**
  String get workshopGovernanceOps;

  /// No description provided for @workshopAiTeamTitle.
  ///
  /// In ar, this message translates to:
  /// **'فريق الذكاء الاصطناعي'**
  String get workshopAiTeamTitle;

  /// No description provided for @workshopAiTeamSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل القوة العاملة للذكاء الاصطناعي وخريطة الأعضاء التشغيلية.'**
  String get workshopAiTeamSubtitle;

  /// No description provided for @workshopToolsTitle.
  ///
  /// In ar, this message translates to:
  /// **'أدوات الذكاء الاصطناعي'**
  String get workshopToolsTitle;

  /// No description provided for @workshopToolsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'جرد أدوات الهندسة بدون أتمتة التثبيت.'**
  String get workshopToolsSubtitle;

  /// No description provided for @workshopPresenceTitle.
  ///
  /// In ar, this message translates to:
  /// **'التواجد الرقمي'**
  String get workshopPresenceTitle;

  /// No description provided for @workshopPresenceSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'التواجد العام، صحة العلامة التجارية، القنوات، ورؤية العناصر المفقودة.'**
  String get workshopPresenceSubtitle;

  /// No description provided for @workshopAccountsTitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل الحسابات'**
  String get workshopAccountsTitle;

  /// No description provided for @workshopAccountsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'جرد الحسابات المحكومة بدون تخزين بيانات الاعتماد.'**
  String get workshopAccountsSubtitle;

  /// No description provided for @workshopPromptsTitle.
  ///
  /// In ar, this message translates to:
  /// **'ورشة المطالبات'**
  String get workshopPromptsTitle;

  /// No description provided for @workshopPromptsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مركز هندسة المطالبات بدون تنفيذ المطالبات.'**
  String get workshopPromptsSubtitle;

  /// No description provided for @workshopKnowledgeTitle.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة المعرفة'**
  String get workshopKnowledgeTitle;

  /// No description provided for @workshopKnowledgeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مراجع للهندسة، الحوكمة، إمكانية الوصول، والصحة النفسية.'**
  String get workshopKnowledgeSubtitle;

  /// No description provided for @workshopWorkstationTitle.
  ///
  /// In ar, this message translates to:
  /// **'جاهزية محطة العمل'**
  String get workshopWorkstationTitle;

  /// No description provided for @workshopWorkstationSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'تخطيط سطح المكتب السيادي المستقبلي بدون أتمتة التثبيت.'**
  String get workshopWorkstationSubtitle;

  /// No description provided for @workshopAssetsTitle.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة الأصول'**
  String get workshopAssetsTitle;

  /// No description provided for @workshopAssetsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'الأيقونات، الخلفيات، الشعارات، الوسائط، الخطوط، القوالب، وفئات صحة الأصول.'**
  String get workshopAssetsSubtitle;

  /// No description provided for @workshopOwnerDeskTitle.
  ///
  /// In ar, this message translates to:
  /// **'مكتب المالك'**
  String get workshopOwnerDeskTitle;

  /// No description provided for @workshopOwnerDeskSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مساحة العمل اليومية، العمليات المفتوحة، الذاكرة المثبتة، والأهداف المستقبلية.'**
  String get workshopOwnerDeskSubtitle;

  /// No description provided for @workshopGenTwoTitle.
  ///
  /// In ar, this message translates to:
  /// **'تحضير الجيل الثاني'**
  String get workshopGenTwoTitle;

  /// No description provided for @workshopGenTwoSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'قائمة مراجعة الجاهزية قبل بدء جيل الذكاء.'**
  String get workshopGenTwoSubtitle;

  /// No description provided for @intelligenceTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك الذكاء'**
  String get intelligenceTitle;

  /// No description provided for @intelligenceSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'الجيل الثاني 2.1 - الأساس التشغيلي بدون تكامل مقدمي الخدمة.'**
  String get intelligenceSubtitle;

  /// No description provided for @intelligenceRuntimeTitle.
  ///
  /// In ar, this message translates to:
  /// **'تشغيل الذكاء'**
  String get intelligenceRuntimeTitle;

  /// No description provided for @intelligenceRuntimeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'حالة التشغيل، دورة الحياة، التعافي، الصحة، المقاييس، واللقطات.'**
  String get intelligenceRuntimeSubtitle;

  /// No description provided for @intelligenceSessionsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تشغيل جلسات الذكاء'**
  String get intelligenceSessionsTitle;

  /// No description provided for @intelligenceSessionsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'الجلسات، الجلسة النشطة، التاريخ، الميتا، التعافي، والتحقق.'**
  String get intelligenceSessionsSubtitle;

  /// No description provided for @intelligenceContextTitle.
  ///
  /// In ar, this message translates to:
  /// **'سياق التشغيل'**
  String get intelligenceContextTitle;

  /// No description provided for @intelligenceContextSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'تحميل السياق، الدقة، الطبقات، الأولويات، المصادر، الحزم، والتحقق.'**
  String get intelligenceContextSubtitle;

  /// No description provided for @intelligenceMemoryTitle.
  ///
  /// In ar, this message translates to:
  /// **'ذاكرة التشغيل'**
  String get intelligenceMemoryTitle;

  /// No description provided for @intelligenceMemorySubtitle.
  ///
  /// In ar, this message translates to:
  /// **'حزم الذاكرة المحكومة، السجل، المحلل، المحمل، الصحة، والتحقق.'**
  String get intelligenceMemorySubtitle;

  /// No description provided for @intelligenceKnowledgeTitle.
  ///
  /// In ar, this message translates to:
  /// **'معرفة التشغيل'**
  String get intelligenceKnowledgeTitle;

  /// No description provided for @intelligenceKnowledgeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'حزم المعرفة، السجلات، المحملات، المحللات، التبعيات، والتحقق.'**
  String get intelligenceKnowledgeSubtitle;

  /// No description provided for @intelligencePromptsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تشغيل المطالبات'**
  String get intelligencePromptsTitle;

  /// No description provided for @intelligencePromptsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل المطالبات، الحزم، المتغيرات، القوالب، التحقق، التاريخ، الإصدارات، والتراجع.'**
  String get intelligencePromptsSubtitle;

  /// No description provided for @intelligenceCapabilitiesTitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل قدرات الذكاء'**
  String get intelligenceCapabilitiesTitle;

  /// No description provided for @intelligenceCapabilitiesSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'أعضاء الذكاء، القيود، المهام المفضلة، العمليات، الصحة، التوفر، والحالة.'**
  String get intelligenceCapabilitiesSubtitle;

  /// No description provided for @intelligenceLogsTitle.
  ///
  /// In ar, this message translates to:
  /// **'سجلات التشغيل'**
  String get intelligenceLogsTitle;

  /// No description provided for @intelligenceLogsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'أسس سجلات الأحداث، الأخطاء، التدقيق، الجدول الزمني للتشغيل، والتعافي.'**
  String get intelligenceLogsSubtitle;

  /// No description provided for @orchestrationTitle.
  ///
  /// In ar, this message translates to:
  /// **'تنسيق الذكاء'**
  String get orchestrationTitle;

  /// No description provided for @orchestrationSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'الجيل الثاني 2.2 - طبقة التنسيق. لا تنفيذ، لا مزودين، لا أتمتة.'**
  String get orchestrationSubtitle;

  /// No description provided for @orchestrationTaskEngineTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك المهام'**
  String get orchestrationTaskEngineTitle;

  /// No description provided for @orchestrationTaskEngineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل المهام، الميتا، الأولوية، المالك، المستهلك، التبعيات، دورة الحياة، النتيجة، التحقق، والاكتمال.'**
  String get orchestrationTaskEngineSubtitle;

  /// No description provided for @orchestrationWorkflowEngineTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك سير العمل'**
  String get orchestrationWorkflowEngineTitle;

  /// No description provided for @orchestrationWorkflowEngineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مراحل سير العمل القابلة للتكوين من المسودة إلى اللقطة.'**
  String get orchestrationWorkflowEngineSubtitle;

  /// No description provided for @orchestrationCapabilityMatchingTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك مطابقة القدرات'**
  String get orchestrationCapabilityMatchingTitle;

  /// No description provided for @orchestrationCapabilityMatchingSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'طبقة القرار لمدى ملاءمة الذكاء الاصطناعي، حزم المطالبات، حزم المعرفة، الأدوات، وموافقة المالك.'**
  String get orchestrationCapabilityMatchingSubtitle;

  /// No description provided for @orchestrationDependencyEngineTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك التبعيات'**
  String get orchestrationDependencyEngineTitle;

  /// No description provided for @orchestrationDependencyEngineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'رسوم التبعيات لوقت التشغيل للمهام، الحزم، الأصول، المشاريع، السجلات، التقارير، الكروت، والأدلة.'**
  String get orchestrationDependencyEngineSubtitle;

  /// No description provided for @orchestrationQueueManagerTitle.
  ///
  /// In ar, this message translates to:
  /// **'مدير زمام العمل'**
  String get orchestrationQueueManagerTitle;

  /// No description provided for @orchestrationQueueManagerSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'زمام العمل للمهام: المعلقة، الجاهزة، الجارية، المنتظرة، المراجعة، المكتملة، الفاشلة، الملغاة، المعاد محاولتها، والمحظورة.'**
  String get orchestrationQueueManagerSubtitle;

  /// No description provided for @orchestrationReviewEngineTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك المراجعة'**
  String get orchestrationReviewEngineTitle;

  /// No description provided for @orchestrationReviewEngineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابات المراجعة الفنية، الحوكمة، المحتوى، التصميم، المالك، الموافقة اليدوية، التدقيق، والامتثال.'**
  String get orchestrationReviewEngineSubtitle;

  /// No description provided for @orchestrationTimelineTitle.
  ///
  /// In ar, this message translates to:
  /// **'الجدول الزمني للذكاء'**
  String get orchestrationTimelineTitle;

  /// No description provided for @orchestrationTimelineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'العمليات، التقارير، المهام، استخدام المطالبات، استخدام المعرفة، الأحداث، اللقطات، وأحداث التعافي.'**
  String get orchestrationTimelineSubtitle;

  /// No description provided for @orchestrationWorkspaceTitle.
  ///
  /// In ar, this message translates to:
  /// **'مساحة عمل الذكاء'**
  String get orchestrationWorkspaceTitle;

  /// No description provided for @orchestrationWorkspaceSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مهام اليوم، زمام العمل، التقارير، أعضاء الذكاء، المعرفة، المطالبات، الأصول، المشاريع، الصحة، والعمل القادم.'**
  String get orchestrationWorkspaceSubtitle;

  /// No description provided for @orchestrationObservabilityTitle.
  ///
  /// In ar, this message translates to:
  /// **'قابلية رصد التشغيل'**
  String get orchestrationObservabilityTitle;

  /// No description provided for @orchestrationObservabilitySubtitle.
  ///
  /// In ar, this message translates to:
  /// **'الصحة، مقاييس الزمام، مقاييس سير العمل، إحصائيات المهام، إحصائيات المراجعة، إحصائيات الاكتمال، صحة التبعيات، وصحة التنسيق.'**
  String get orchestrationObservabilitySubtitle;

  /// No description provided for @decisionTitle.
  ///
  /// In ar, this message translates to:
  /// **'ذكاء القرار'**
  String get decisionTitle;

  /// No description provided for @decisionSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'الجيل الثاني 2.3 - طبقة الحكم المحكومة. تقييم فقط، لا تنفيذ.'**
  String get decisionSubtitle;

  /// No description provided for @decisionEngineTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك القرار'**
  String get decisionEngineTitle;

  /// No description provided for @decisionEngineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل القرارات، النوع، النطاق، السياق، الثقة، التفسير، الحالة، التاريخ، والنتيجة.'**
  String get decisionEngineSubtitle;

  /// No description provided for @decisionConstitutionalRuleEngineTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك القواعد الدستورية'**
  String get decisionConstitutionalRuleEngineTitle;

  /// No description provided for @decisionConstitutionalRuleEngineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'القواعد الدستورية، الورشة، المالك، وقت التشغيل، السلامة، الامتثال، النشر، والأرشفة.'**
  String get decisionConstitutionalRuleEngineSubtitle;

  /// No description provided for @decisionPolicyEngineTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك السياسات'**
  String get decisionPolicyEngineTitle;

  /// No description provided for @decisionPolicyEngineSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'سياسات الذكاء الاصطناعي، المطالبات، المعرفة، الأصول، وقت التشغيل، النشر، والموافقة البشرية.'**
  String get decisionPolicyEngineSubtitle;

  /// No description provided for @decisionApprovalTitle.
  ///
  /// In ar, this message translates to:
  /// **'ذكاء الموافقة'**
  String get decisionApprovalTitle;

  /// No description provided for @decisionApprovalSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'سلم الموافقة من عدم الحاجة للموافقة إلى القرار النهائي.'**
  String get decisionApprovalSubtitle;

  /// No description provided for @decisionRiskTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك تقييم المخاطر'**
  String get decisionRiskTitle;

  /// No description provided for @decisionRiskSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مخاطر التشغيل، الحوكمة، الامتثال، الخصوصية، السلامة، المحتوى، الهندسة المعمارية، والنشر.'**
  String get decisionRiskSubtitle;

  /// No description provided for @decisionRecommendationTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك التوصيات'**
  String get decisionRecommendationTitle;

  /// No description provided for @decisionRecommendationSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'توصيات أفضل ذكاء اصطناعي، حزم المطالبات، حزم المعرفة، سير العمل، المراجعة، النشر، والتعافي فقط.'**
  String get decisionRecommendationSubtitle;

  /// No description provided for @decisionEscalationTitle.
  ///
  /// In ar, this message translates to:
  /// **'محرك التصعيد'**
  String get decisionEscalationTitle;

  /// No description provided for @decisionEscalationSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'تصعيد قابل للتكوين إلى الفني، الحوكمة، الامتثال، المالك، الأرشيف، والرصد.'**
  String get decisionEscalationSubtitle;

  /// No description provided for @decisionAnalyticsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تحليلات القرار'**
  String get decisionAnalyticsTitle;

  /// No description provided for @decisionAnalyticsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'إحصائيات القرار، إحصائيات الموافقة، توزيع المخاطر، دقة التوصية، استخدام القواعد، استخدام السياسات، تكرار التصعيد، والتاريخ.'**
  String get decisionAnalyticsSubtitle;

  /// No description provided for @governanceTitle.
  ///
  /// In ar, this message translates to:
  /// **'عمليات الحوكمة'**
  String get governanceTitle;

  /// No description provided for @governanceSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'نظام الحوكمة التشغيلي G2.5-A. مذهب فقط، لا تنفيذ.'**
  String get governanceSubtitle;

  /// No description provided for @governancePlaybooksTitle.
  ///
  /// In ar, this message translates to:
  /// **'كتيبات الحوكمة'**
  String get governancePlaybooksTitle;

  /// No description provided for @governancePlaybooksSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'كتيبات تشغيلية للمشكلات الفنية، النزاعات، الإساءة، السلامة، والتصعيد.'**
  String get governancePlaybooksSubtitle;

  /// No description provided for @governanceDocumentTitle.
  ///
  /// In ar, this message translates to:
  /// **'حوكمة الوثائق'**
  String get governanceDocumentTitle;

  /// No description provided for @governanceDocumentSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'قواعد الوثائق النشطة، مصدر الحقيقة، دورة الحياة، الإصدار، التجميد، التعديل، الأرشفة، الاستعادة، التسمية، والملكية.'**
  String get governanceDocumentSubtitle;

  /// No description provided for @governanceVaultTitle.
  ///
  /// In ar, this message translates to:
  /// **'خزنة الاتصالات المؤسسية'**
  String get governanceVaultTitle;

  /// No description provided for @governanceVaultSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'القوالب الرسمية، السجلات، الرسائل، الشهادات، مجموعات الوسائط، الملفات الشخصية، وسجلات الاتصالات.'**
  String get governanceVaultSubtitle;

  /// No description provided for @monitoringTitle.
  ///
  /// In ar, this message translates to:
  /// **'غرفة الرصد والذكاء'**
  String get monitoringTitle;

  /// No description provided for @monitoringSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مركز رصد نظيف لسجلات الإشارات والتحليلات واكتشاف الاتجاهات والفجوات والتقارير.'**
  String get monitoringSubtitle;

  /// No description provided for @monitoringSignalRegistryTitle.
  ///
  /// In ar, this message translates to:
  /// **'قاعة سجل الإشارات'**
  String get monitoringSignalRegistryTitle;

  /// No description provided for @monitoringAiIntelligenceTitle.
  ///
  /// In ar, this message translates to:
  /// **'مسار ذكاء الآلة'**
  String get monitoringAiIntelligenceTitle;

  /// No description provided for @monitoringHumanIntelligenceTitle.
  ///
  /// In ar, this message translates to:
  /// **'مسار الذكاء البشري'**
  String get monitoringHumanIntelligenceTitle;

  /// No description provided for @monitoringReportStreamTitle.
  ///
  /// In ar, this message translates to:
  /// **'تدفق التقارير'**
  String get monitoringReportStreamTitle;

  /// No description provided for @monitoringGapDetectionTitle.
  ///
  /// In ar, this message translates to:
  /// **'اكتشاف الاتجاهات والفجوات'**
  String get monitoringGapDetectionTitle;

  /// No description provided for @monitoringDepartmentBoardTitle.
  ///
  /// In ar, this message translates to:
  /// **'لوحة توزيع الأقسام'**
  String get monitoringDepartmentBoardTitle;

  /// No description provided for @capitalTitle.
  ///
  /// In ar, this message translates to:
  /// **'عاصمة الاتحاد'**
  String get capitalTitle;

  /// No description provided for @capitalSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'المقر الرئيسي للعمليات للتنسيق، والوعي بالحوادث، والرصد اليدوي، وتسليم الأقسام.'**
  String get capitalSubtitle;

  /// No description provided for @capitalOperationsOfficeTitle.
  ///
  /// In ar, this message translates to:
  /// **'مكتب العمليات'**
  String get capitalOperationsOfficeTitle;

  /// No description provided for @capitalOperationsOfficeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'ينسق العمليات اليومية بدون سلطة سيادية.'**
  String get capitalOperationsOfficeSubtitle;

  /// No description provided for @ownerArchiveTitle.
  ///
  /// In ar, this message translates to:
  /// **'الأرشيف'**
  String get ownerArchiveTitle;

  /// No description provided for @ownerMarketingTitle.
  ///
  /// In ar, this message translates to:
  /// **'التسويق والوسائط'**
  String get ownerMarketingTitle;

  /// No description provided for @ownerTechnicalTitle.
  ///
  /// In ar, this message translates to:
  /// **'الفني والصيانة'**
  String get ownerTechnicalTitle;

  /// No description provided for @ownerAccountingTitle.
  ///
  /// In ar, this message translates to:
  /// **'المحاسبة'**
  String get ownerAccountingTitle;

  /// No description provided for @ownerLegalTitle.
  ///
  /// In ar, this message translates to:
  /// **'القانوني'**
  String get ownerLegalTitle;

  /// No description provided for @ownerBranchPurpose.
  ///
  /// In ar, this message translates to:
  /// **'الغرض'**
  String get ownerBranchPurpose;

  /// No description provided for @ownerBranchBoundary.
  ///
  /// In ar, this message translates to:
  /// **'الحدود'**
  String get ownerBranchBoundary;

  /// No description provided for @archiveTitle.
  ///
  /// In ar, this message translates to:
  /// **'الأرشيف التشغيلي'**
  String get archiveTitle;

  /// No description provided for @archiveSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مركز ذاكرة المشروع'**
  String get archiveSubtitle;

  /// No description provided for @archiveSearchHint.
  ///
  /// In ar, this message translates to:
  /// **'البحث بالاسم، القسم، العملية، البطاقة، الدليل، المطالبة، الأصول، التقرير'**
  String get archiveSearchHint;

  /// No description provided for @archiveEmptyState.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد قسم أرشيف يطابق البحث/التصفية الحالي.'**
  String get archiveEmptyState;

  /// No description provided for @archiveDashboardTitle.
  ///
  /// In ar, this message translates to:
  /// **'{name} لوحة المعلومات'**
  String archiveDashboardTitle(String name);

  /// No description provided for @archiveInventory.
  ///
  /// In ar, this message translates to:
  /// **'الجرد'**
  String get archiveInventory;

  /// No description provided for @archiveDependencies.
  ///
  /// In ar, this message translates to:
  /// **'التبعيات'**
  String get archiveDependencies;

  /// No description provided for @archiveMissingItems.
  ///
  /// In ar, this message translates to:
  /// **'العناصر المفقودة'**
  String get archiveMissingItems;

  /// No description provided for @archiveNotConnected.
  ///
  /// In ar, this message translates to:
  /// **'{action}: غير متصل بعد'**
  String archiveNotConnected(String action);

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

  /// No description provided for @supportEntryAddictionTitle.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ مسار دعم التعافي'**
  String get supportEntryAddictionTitle;

  /// No description provided for @supportEntryAddictionSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'نقطة بداية هادئة لاختيار الدعم المناسب: مختص، مركز، مواد مفيدة، أو طلب دعم منظم عند الحاجة.'**
  String get supportEntryAddictionSubtitle;

  /// No description provided for @supportEntryAddictionSpecialistTitle.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن مختص'**
  String get supportEntryAddictionSpecialistTitle;

  /// No description provided for @supportEntryAddictionSpecialistBody.
  ///
  /// In ar, this message translates to:
  /// **'استعرض مختصين مناسبين واختر ما يلائم احتياجك الحالي.'**
  String get supportEntryAddictionSpecialistBody;

  /// No description provided for @supportEntryAddictionCenterTitle.
  ///
  /// In ar, this message translates to:
  /// **'استكشف المراكز'**
  String get supportEntryAddictionCenterTitle;

  /// No description provided for @supportEntryAddictionCenterBody.
  ///
  /// In ar, this message translates to:
  /// **'استعرض المراكز المتاحة وخيارات الدعم أو الإقامة عند الحاجة.'**
  String get supportEntryAddictionCenterBody;

  /// No description provided for @supportEntryAddictionLibraryTitle.
  ///
  /// In ar, this message translates to:
  /// **'مواد مفيدة'**
  String get supportEntryAddictionLibraryTitle;

  /// No description provided for @supportEntryAddictionLibraryBody.
  ///
  /// In ar, this message translates to:
  /// **'مواد توعوية وتمارين بسيطة تساعدك على الفهم والاتزان.'**
  String get supportEntryAddictionLibraryBody;

  /// No description provided for @supportEntryAddictionSupportTitle.
  ///
  /// In ar, this message translates to:
  /// **'تحدث مع الدعم عند الحاجة'**
  String get supportEntryAddictionSupportTitle;

  /// No description provided for @supportEntryAddictionSupportBody.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ طلب دعم منظم إذا احتجت إلى توجيه أو مساندة.'**
  String get supportEntryAddictionSupportBody;

  /// No description provided for @supportEntryFamilyTitle.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ مسار دعم الأسرة'**
  String get supportEntryFamilyTitle;

  /// No description provided for @supportEntryFamilySubtitle.
  ///
  /// In ar, this message translates to:
  /// **'نقطة بداية للأسرة لاختيار الدعم المناسب: مختص، مركز، مواد مفيدة، أو طلب دعم منظم عند الحاجة.'**
  String get supportEntryFamilySubtitle;

  /// No description provided for @supportEntryFamilySpecialistTitle.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن مختص'**
  String get supportEntryFamilySpecialistTitle;

  /// No description provided for @supportEntryFamilySpecialistBody.
  ///
  /// In ar, this message translates to:
  /// **'استعرض مختصين مناسبين واختر ما يلائم احتياج الأسرة الآن.'**
  String get supportEntryFamilySpecialistBody;

  /// No description provided for @supportEntryFamilyCenterTitle.
  ///
  /// In ar, this message translates to:
  /// **'استكشف المراكز'**
  String get supportEntryFamilyCenterTitle;

  /// No description provided for @supportEntryFamilyCenterBody.
  ///
  /// In ar, this message translates to:
  /// **'استعرض المراكز والخدمات المتاحة إذا كانت الأسرة تحتاج خيارات أوسع.'**
  String get supportEntryFamilyCenterBody;

  /// No description provided for @supportEntryFamilyLibraryTitle.
  ///
  /// In ar, this message translates to:
  /// **'مواد مفيدة'**
  String get supportEntryFamilyLibraryTitle;

  /// No description provided for @supportEntryFamilyLibraryBody.
  ///
  /// In ar, this message translates to:
  /// **'محتوى داعم يساعد الأسرة على الفهم والاتزان.'**
  String get supportEntryFamilyLibraryBody;

  /// No description provided for @supportEntryFamilySupportTitle.
  ///
  /// In ar, this message translates to:
  /// **'تحدث مع الدعم عند الحاجة'**
  String get supportEntryFamilySupportTitle;

  /// No description provided for @supportEntryFamilySupportBody.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع طلب الدعم لفهم الخطوة التالية أو طلب مساندة بسيطة.'**
  String get supportEntryFamilySupportBody;

  /// No description provided for @supportEntryChoosePoint.
  ///
  /// In ar, this message translates to:
  /// **'اختر نقطة البداية'**
  String get supportEntryChoosePoint;

  /// No description provided for @supportEntryChoosePointDesc.
  ///
  /// In ar, this message translates to:
  /// **'اختر المسار الأنسب الآن: طلب دعم، مختص، مركز، أو مواد مفيدة.'**
  String get supportEntryChoosePointDesc;

  /// No description provided for @supportEntryChooseHelpType.
  ///
  /// In ar, this message translates to:
  /// **'اختيار نوع المساعدة'**
  String get supportEntryChooseHelpType;

  /// No description provided for @supportEntryBrowseSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'استعرض الأخصائيين'**
  String get supportEntryBrowseSpecialists;

  /// No description provided for @supportEntryOpenPath.
  ///
  /// In ar, this message translates to:
  /// **'افتح المسار'**
  String get supportEntryOpenPath;

  /// No description provided for @supportEntryAddictionHeaderTitle.
  ///
  /// In ar, this message translates to:
  /// **'دعم المتعافي'**
  String get supportEntryAddictionHeaderTitle;

  /// No description provided for @supportEntryAddictionHeaderSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'كل خطوة نحو التعافي لها سند'**
  String get supportEntryAddictionHeaderSubtitle;

  /// No description provided for @supportEntryFamilyHeaderTitle.
  ///
  /// In ar, this message translates to:
  /// **'دعم الأسر'**
  String get supportEntryFamilyHeaderTitle;

  /// No description provided for @supportEntryFamilyHeaderSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'إرشاد هادئ يساندك في كل خطوة'**
  String get supportEntryFamilyHeaderSubtitle;

  /// No description provided for @supportIssueSelectorTitle.
  ///
  /// In ar, this message translates to:
  /// **'الدعم'**
  String get supportIssueSelectorTitle;

  /// No description provided for @supportIssueSelectorHelpType.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع المساعدة'**
  String get supportIssueSelectorHelpType;

  /// No description provided for @supportIssueSelectorHelpDesc.
  ///
  /// In ar, this message translates to:
  /// **'اختر المشكلة الأقرب لاحتياجك الحالي ليتم استلامها كإشارة دعم منظمة.'**
  String get supportIssueSelectorHelpDesc;

  /// No description provided for @supportIssueSelectorSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم استلام إشارة الدعم في غرفة الدعم'**
  String get supportIssueSelectorSuccess;

  /// No description provided for @supportIssueSelectorError.
  ///
  /// In ar, this message translates to:
  /// **'تعذر إرسال إشارة الدعم الآن'**
  String get supportIssueSelectorError;

  /// No description provided for @supportIssueClientAccess.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة في الوصول للخدمة'**
  String get supportIssueClientAccess;

  /// No description provided for @supportIssueClientContact.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة في التواصل مع مختص'**
  String get supportIssueClientContact;

  /// No description provided for @supportIssueClientAccount.
  ///
  /// In ar, this message translates to:
  /// **'مشكلة في الحساب أو الملف الشخصي'**
  String get supportIssueClientAccount;

  /// No description provided for @supportIssueClientComplaint.
  ///
  /// In ar, this message translates to:
  /// **'شكوى أو تجربة غير جيدة'**
  String get supportIssueClientComplaint;

  /// No description provided for @supportIssueClientGuidance.
  ///
  /// In ar, this message translates to:
  /// **'أحتاج إرشادًا بشريًا'**
  String get supportIssueClientGuidance;

  /// No description provided for @supportIssueClientGeneral.
  ///
  /// In ar, this message translates to:
  /// **'استفسار دعم عام'**
  String get supportIssueClientGeneral;

  /// No description provided for @supportIssueCenterProfile.
  ///
  /// In ar, this message translates to:
  /// **'مشكلة في ظهور الملف'**
  String get supportIssueCenterProfile;

  /// No description provided for @supportIssueCenterContact.
  ///
  /// In ar, this message translates to:
  /// **'استفسار عن إشارة تواصل'**
  String get supportIssueCenterContact;

  /// No description provided for @supportIssueCenterAccess.
  ///
  /// In ar, this message translates to:
  /// **'مشكلة في معلومات الإتاحة'**
  String get supportIssueCenterAccess;

  /// No description provided for @supportIssueCenterSystem.
  ///
  /// In ar, this message translates to:
  /// **'مشكلة في النظام'**
  String get supportIssueCenterSystem;

  /// No description provided for @supportIssueCenterGeneral.
  ///
  /// In ar, this message translates to:
  /// **'إشارة دعم عامة'**
  String get supportIssueCenterGeneral;

  /// No description provided for @supportIssueClinicianCommunication.
  ///
  /// In ar, this message translates to:
  /// **'استفسار عن التواصل'**
  String get supportIssueClinicianCommunication;

  /// No description provided for @supportIssueClinicianRecommendation.
  ///
  /// In ar, this message translates to:
  /// **'استفسار عن ظهور التوصيات'**
  String get supportIssueClinicianRecommendation;

  /// No description provided for @supportIssueClinicianSupport.
  ///
  /// In ar, this message translates to:
  /// **'أحتاج دعمًا'**
  String get supportIssueClinicianSupport;

  /// No description provided for @supportIssueRecoverySpecialist.
  ///
  /// In ar, this message translates to:
  /// **'محتاج أخصائي مناسب'**
  String get supportIssueRecoverySpecialist;

  /// No description provided for @supportIssueRecoveryCenter.
  ///
  /// In ar, this message translates to:
  /// **'محتاج مركز مناسب'**
  String get supportIssueRecoveryCenter;

  /// No description provided for @supportIssueRecoverySupport.
  ///
  /// In ar, this message translates to:
  /// **'دعم في التعافي'**
  String get supportIssueRecoverySupport;

  /// No description provided for @supportIssueRecoveryRelapse.
  ///
  /// In ar, this message translates to:
  /// **'قلق من الانتكاسة'**
  String get supportIssueRecoveryRelapse;

  /// No description provided for @supportIssueRecoveryRisk.
  ///
  /// In ar, this message translates to:
  /// **'بلاغ خطر'**
  String get supportIssueRecoveryRisk;

  /// No description provided for @supportIssueRecoveryGeneral.
  ///
  /// In ar, this message translates to:
  /// **'إشارة مساعدة عامة'**
  String get supportIssueRecoveryGeneral;

  /// No description provided for @supportIssueFamilyGuidance.
  ///
  /// In ar, this message translates to:
  /// **'إرشاد أسري'**
  String get supportIssueFamilyGuidance;

  /// No description provided for @supportIssueFamilySpecialCase.
  ///
  /// In ar, this message translates to:
  /// **'دعم لطفل / حالة خاصة'**
  String get supportIssueFamilySpecialCase;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
