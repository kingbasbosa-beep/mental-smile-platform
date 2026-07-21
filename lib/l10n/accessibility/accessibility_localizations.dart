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
/// be consistent with the languages listed in the AccessibilityLocalizations.supportedLocales
/// property.
abstract class AccessibilityLocalizations {
  AccessibilityLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AccessibilityLocalizations of(BuildContext context) {
    return Localizations.of<AccessibilityLocalizations>(
        context, AccessibilityLocalizations)!;
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
    Locale('en')
  ];

  /// No description provided for @applicationAccessibilityCheckinMessage.
  ///
  /// In ar, this message translates to:
  /// **'وحشتونا ❤️\nأنا زرت صفحة طمنّا عليك النهارده.'**
  String get applicationAccessibilityCheckinMessage;

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

  /// No description provided for @applicationAccessibilityCheckinSectionSpecialist.
  ///
  /// In ar, this message translates to:
  /// **'لو حابب تعرف أكثر أو تتكلم مع متخصص'**
  String get applicationAccessibilityCheckinSectionSpecialist;

  /// No description provided for @applicationAccessibilityCheckinSpecialists.
  ///
  /// In ar, this message translates to:
  /// **'الأخصائيون'**
  String get applicationAccessibilityCheckinSpecialists;

  /// No description provided for @applicationAccessibilityCheckinCenters.
  ///
  /// In ar, this message translates to:
  /// **'المراكز'**
  String get applicationAccessibilityCheckinCenters;

  /// No description provided for @applicationAccessibilityCheckinLibrary.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة'**
  String get applicationAccessibilityCheckinLibrary;

  /// No description provided for @applicationAccessibilityCheckinSharingTitle.
  ///
  /// In ar, this message translates to:
  /// **'ولو حابب تشارك...'**
  String get applicationAccessibilityCheckinSharingTitle;

  /// No description provided for @applicationAccessibilityCheckinSharingBody.
  ///
  /// In ar, this message translates to:
  /// **'لو حابب تسيب رسالة بسيطة، فكرة، إحساس، أو كلمة دعم لأصدقاء Mental Smile أثناء مرحلة الاختبار، تقدر تشارك من هنا.'**
  String get applicationAccessibilityCheckinSharingBody;

  /// No description provided for @applicationAccessibilityCheckinSharingShare.
  ///
  /// In ar, this message translates to:
  /// **'شارك برسالة'**
  String get applicationAccessibilityCheckinSharingShare;

  /// No description provided for @applicationAccessibilityCheckinSharingView.
  ///
  /// In ar, this message translates to:
  /// **'شاهد المشاركات'**
  String get applicationAccessibilityCheckinSharingView;

  /// No description provided for @applicationAccessibilityCheckinWhatsappContact.
  ///
  /// In ar, this message translates to:
  /// **'تواصل معنا عبر واتساب'**
  String get applicationAccessibilityCheckinWhatsappContact;

  /// No description provided for @applicationAccessibilityCheckinWhatsappNote.
  ///
  /// In ar, this message translates to:
  /// **'شكراً إنك طمّنتنا عليك.\nإجاباتك لم يتم إرسالها أو حفظها.'**
  String get applicationAccessibilityCheckinWhatsappNote;

  /// No description provided for @applicationAccessibilityCheckinWhatsappOpened.
  ///
  /// In ar, this message translates to:
  /// **'✅ تم فتح واتساب'**
  String get applicationAccessibilityCheckinWhatsappOpened;

  /// No description provided for @applicationAccessibilityCommunityToolsBackToRoom.
  ///
  /// In ar, this message translates to:
  /// **'العودة للغرفة'**
  String get applicationAccessibilityCommunityToolsBackToRoom;

  /// No description provided for @applicationAccessibilityCommunityToolsComingSoon.
  ///
  /// In ar, this message translates to:
  /// **'مقترحاتكم ستظهر قريبًا هنا'**
  String get applicationAccessibilityCommunityToolsComingSoon;

  /// No description provided for @applicationAccessibilityCommunityToolsNote.
  ///
  /// In ar, this message translates to:
  /// **'سنضيف الأدوات الأكثر طلبًا بناءً على اقتراحاتكم.'**
  String get applicationAccessibilityCommunityToolsNote;

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

  /// No description provided for @applicationAccessibilityLegendAccess.
  ///
  /// In ar, this message translates to:
  /// **'إمكانية وصول'**
  String get applicationAccessibilityLegendAccess;

  /// No description provided for @applicationAccessibilityLegendAssoc.
  ///
  /// In ar, this message translates to:
  /// **'جمعية'**
  String get applicationAccessibilityLegendAssoc;

  /// No description provided for @applicationAccessibilityLegendEdu.
  ///
  /// In ar, this message translates to:
  /// **'تعليم'**
  String get applicationAccessibilityLegendEdu;

  /// No description provided for @applicationAccessibilityLegendGov.
  ///
  /// In ar, this message translates to:
  /// **'جهة حكومية'**
  String get applicationAccessibilityLegendGov;

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

  /// No description provided for @applicationAccessibilityLegendSign.
  ///
  /// In ar, this message translates to:
  /// **'لغة إشارة'**
  String get applicationAccessibilityLegendSign;

  /// No description provided for @applicationAccessibilityLegendTitle.
  ///
  /// In ar, this message translates to:
  /// **'دليل العلامات'**
  String get applicationAccessibilityLegendTitle;

  /// No description provided for @applicationAccessibilityLegendVisual.
  ///
  /// In ar, this message translates to:
  /// **'دعم بصري'**
  String get applicationAccessibilityLegendVisual;

  /// No description provided for @applicationAccessibilityLinksArabAlecsoDesc.
  ///
  /// In ar, this message translates to:
  /// **'تعليم وثقافة عربية'**
  String get applicationAccessibilityLinksArabAlecsoDesc;

  /// No description provided for @applicationAccessibilityLinksArabAlecsoTitle.
  ///
  /// In ar, this message translates to:
  /// **'الألكسو'**
  String get applicationAccessibilityLinksArabAlecsoTitle;

  /// No description provided for @applicationAccessibilityLinksArabAradoDesc.
  ///
  /// In ar, this message translates to:
  /// **'معرفة وبناء قدرات'**
  String get applicationAccessibilityLinksArabAradoDesc;

  /// No description provided for @applicationAccessibilityLinksArabAradoTitle.
  ///
  /// In ar, this message translates to:
  /// **'المنظمة العربية للتنمية الإدارية'**
  String get applicationAccessibilityLinksArabAradoTitle;

  /// No description provided for @applicationAccessibilityLinksArabEscwaDesc.
  ///
  /// In ar, this message translates to:
  /// **'سياسات عربية دامجة'**
  String get applicationAccessibilityLinksArabEscwaDesc;

  /// No description provided for @applicationAccessibilityLinksArabEscwaTitle.
  ///
  /// In ar, this message translates to:
  /// **'الإسكوا - الإعاقة والإدماج'**
  String get applicationAccessibilityLinksArabEscwaTitle;

  /// No description provided for @applicationAccessibilityLinksArabKingSalmanDesc.
  ///
  /// In ar, this message translates to:
  /// **'أبحاث إعاقة عربية'**
  String get applicationAccessibilityLinksArabKingSalmanDesc;

  /// No description provided for @applicationAccessibilityLinksArabKingSalmanTitle.
  ///
  /// In ar, this message translates to:
  /// **'مركز الملك سلمان لأبحاث الإعاقة'**
  String get applicationAccessibilityLinksArabKingSalmanTitle;

  /// No description provided for @applicationAccessibilityLinksCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'مواقع وجهات مساعدة مصرية وعربية وعالمية'**
  String get applicationAccessibilityLinksCardSubtitle;

  /// No description provided for @applicationAccessibilityLinksCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة الروابط المهمة'**
  String get applicationAccessibilityLinksCardTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptCouncilDesc.
  ///
  /// In ar, this message translates to:
  /// **'حقوق وخدمات رسمية'**
  String get applicationAccessibilityLinksEgyptCouncilDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptCouncilTitle.
  ///
  /// In ar, this message translates to:
  /// **'المجلس القومي للأشخاص ذوي الإعاقة'**
  String get applicationAccessibilityLinksEgyptCouncilTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptEducationDesc.
  ///
  /// In ar, this message translates to:
  /// **'تعليم وخدمات مدرسية'**
  String get applicationAccessibilityLinksEgyptEducationDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptEducationTitle.
  ///
  /// In ar, this message translates to:
  /// **'وزارة التربية والتعليم'**
  String get applicationAccessibilityLinksEgyptEducationTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptEkbDesc.
  ///
  /// In ar, this message translates to:
  /// **'مصادر تعلم رقمية'**
  String get applicationAccessibilityLinksEgyptEkbDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptEkbTitle.
  ///
  /// In ar, this message translates to:
  /// **'بنك المعرفة المصري'**
  String get applicationAccessibilityLinksEgyptEkbTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptGovDesc.
  ///
  /// In ar, this message translates to:
  /// **'خدمات حكومية عامة'**
  String get applicationAccessibilityLinksEgyptGovDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptGovTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة الحكومة المصرية'**
  String get applicationAccessibilityLinksEgyptGovTitle;

  /// No description provided for @applicationAccessibilityLinksEgyptMossDesc.
  ///
  /// In ar, this message translates to:
  /// **'دعم اجتماعي رسمي'**
  String get applicationAccessibilityLinksEgyptMossDesc;

  /// No description provided for @applicationAccessibilityLinksEgyptMossTitle.
  ///
  /// In ar, this message translates to:
  /// **'وزارة التضامن الاجتماعي'**
  String get applicationAccessibilityLinksEgyptMossTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalUndesaDesc.
  ///
  /// In ar, this message translates to:
  /// **'حقوق وسياسات دولية'**
  String get applicationAccessibilityLinksGlobalUndesaDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalUndesaTitle.
  ///
  /// In ar, this message translates to:
  /// **'الأمم المتحدة - الإعاقة'**
  String get applicationAccessibilityLinksGlobalUndesaTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalUnicefDesc.
  ///
  /// In ar, this message translates to:
  /// **'حقوق الأطفال والدعم'**
  String get applicationAccessibilityLinksGlobalUnicefDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalUnicefTitle.
  ///
  /// In ar, this message translates to:
  /// **'اليونيسف - الأطفال ذوو الإعاقة'**
  String get applicationAccessibilityLinksGlobalUnicefTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalW3cDesc.
  ///
  /// In ar, this message translates to:
  /// **'إرشادات وصول رقمية'**
  String get applicationAccessibilityLinksGlobalW3cDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalW3cTitle.
  ///
  /// In ar, this message translates to:
  /// **'مبادرة الوصول للويب'**
  String get applicationAccessibilityLinksGlobalW3cTitle;

  /// No description provided for @applicationAccessibilityLinksGlobalWhoDesc.
  ///
  /// In ar, this message translates to:
  /// **'معلومات صحية عالمية'**
  String get applicationAccessibilityLinksGlobalWhoDesc;

  /// No description provided for @applicationAccessibilityLinksGlobalWhoTitle.
  ///
  /// In ar, this message translates to:
  /// **'منظمة الصحة العالمية - الإعاقة'**
  String get applicationAccessibilityLinksGlobalWhoTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeBookshareDesc.
  ///
  /// In ar, this message translates to:
  /// **'كتب قابلة للوصول'**
  String get applicationAccessibilityLinksKnowledgeBookshareDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeBookshareTitle.
  ///
  /// In ar, this message translates to:
  /// **'بووكشير'**
  String get applicationAccessibilityLinksKnowledgeBookshareTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeDaisyDesc.
  ///
  /// In ar, this message translates to:
  /// **'معايير قراءة ميسرة'**
  String get applicationAccessibilityLinksKnowledgeDaisyDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeDaisyTitle.
  ///
  /// In ar, this message translates to:
  /// **'اتحاد ديزي'**
  String get applicationAccessibilityLinksKnowledgeDaisyTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeLocDesc.
  ///
  /// In ar, this message translates to:
  /// **'كتب ميسرة صوتية'**
  String get applicationAccessibilityLinksKnowledgeLocDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeLocTitle.
  ///
  /// In ar, this message translates to:
  /// **'مكتبة الكونغرس لخدمة المكفوفين'**
  String get applicationAccessibilityLinksKnowledgeLocTitle;

  /// No description provided for @applicationAccessibilityLinksKnowledgeWbuDesc.
  ///
  /// In ar, this message translates to:
  /// **'دعم بصري عالمي'**
  String get applicationAccessibilityLinksKnowledgeWbuDesc;

  /// No description provided for @applicationAccessibilityLinksKnowledgeWbuTitle.
  ///
  /// In ar, this message translates to:
  /// **'الاتحاد العالمي للمكفوفين'**
  String get applicationAccessibilityLinksKnowledgeWbuTitle;

  /// No description provided for @applicationAccessibilityLinksSectionArab.
  ///
  /// In ar, this message translates to:
  /// **'الوطن العربي'**
  String get applicationAccessibilityLinksSectionArab;

  /// No description provided for @applicationAccessibilityLinksSectionEgypt.
  ///
  /// In ar, this message translates to:
  /// **'مصر'**
  String get applicationAccessibilityLinksSectionEgypt;

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

  /// No description provided for @applicationAccessibilityMessage1.
  ///
  /// In ar, this message translates to:
  /// **'أنا أقوى مما أعتقد'**
  String get applicationAccessibilityMessage1;

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

  /// No description provided for @applicationAccessibilityMessage2.
  ///
  /// In ar, this message translates to:
  /// **'غدًا فرصة جديدة'**
  String get applicationAccessibilityMessage2;

  /// No description provided for @applicationAccessibilityMessage20.
  ///
  /// In ar, this message translates to:
  /// **'لا بأس أن أرتاح قليلاً'**
  String get applicationAccessibilityMessage20;

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

  /// No description provided for @applicationAccessibilitySuggestionsCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'ساعدنا في تطوير الأدوات والخدمات'**
  String get applicationAccessibilitySuggestionsCardSubtitle;

  /// No description provided for @applicationAccessibilitySuggestionsCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'شارك باقتراح'**
  String get applicationAccessibilitySuggestionsCardTitle;

  /// No description provided for @applicationAccessibilitySuggestionsHintLink.
  ///
  /// In ar, this message translates to:
  /// **'Website / App / YouTube / Article'**
  String get applicationAccessibilitySuggestionsHintLink;

  /// No description provided for @applicationAccessibilitySuggestionsHintName.
  ///
  /// In ar, this message translates to:
  /// **'مثال: قارئ شاشة عربي'**
  String get applicationAccessibilitySuggestionsHintName;

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

  /// No description provided for @applicationAccessibilitySuggestionsLabelName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الأداة أو الفكرة المقترحة'**
  String get applicationAccessibilitySuggestionsLabelName;

  /// No description provided for @applicationAccessibilitySuggestionsLabelReason.
  ///
  /// In ar, this message translates to:
  /// **'سبب الاقتراح'**
  String get applicationAccessibilitySuggestionsLabelReason;

  /// No description provided for @applicationAccessibilitySuggestionsNotAttached.
  ///
  /// In ar, this message translates to:
  /// **'غير مرفق'**
  String get applicationAccessibilitySuggestionsNotAttached;

  /// No description provided for @applicationAccessibilitySuggestionsSubmit.
  ///
  /// In ar, this message translates to:
  /// **'إرسال'**
  String get applicationAccessibilitySuggestionsSubmit;

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

  /// No description provided for @applicationAccessibilitySuggestionsSuccessTitle.
  ///
  /// In ar, this message translates to:
  /// **'✅ تم إرسال اقتراحك بنجاح'**
  String get applicationAccessibilitySuggestionsSuccessTitle;

  /// No description provided for @applicationAccessibilitySuggestionsValidation.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اكتب الرسالة أولًا.'**
  String get applicationAccessibilitySuggestionsValidation;

  /// No description provided for @applicationAccessibilitySuggestionsWhatsappMessage.
  ///
  /// In ar, this message translates to:
  /// **'اقتراح جديد من بوابة الاحتياجات\n\nاسم الأداة:\n{name}\n\nسبب الاقتراح:\n{reason}\n\nالرابط المقترح:\n{link}'**
  String applicationAccessibilitySuggestionsWhatsappMessage(
      String name, String reason, String link);

  /// No description provided for @applicationAccessibilityToolsBeMyEyesDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة بصرية مباشرة'**
  String get applicationAccessibilityToolsBeMyEyesDesc;

  /// No description provided for @applicationAccessibilityToolsCardSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'أدوات تساعد في التواصل والقراءة والفهم'**
  String get applicationAccessibilityToolsCardSubtitle;

  /// No description provided for @applicationAccessibilityToolsCardTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة الأدوات المساعدة'**
  String get applicationAccessibilityToolsCardTitle;

  /// No description provided for @applicationAccessibilityToolsChatGptDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة في الكتابة والفهم'**
  String get applicationAccessibilityToolsChatGptDesc;

  /// No description provided for @applicationAccessibilityToolsCopilotDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعد ذكي من مايكروسوفت'**
  String get applicationAccessibilityToolsCopilotDesc;

  /// No description provided for @applicationAccessibilityToolsDeepLDesc.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة نصية دقيقة'**
  String get applicationAccessibilityToolsDeepLDesc;

  /// No description provided for @applicationAccessibilityToolsGeminiDesc.
  ///
  /// In ar, this message translates to:
  /// **'مساعد ذكي من جوجل'**
  String get applicationAccessibilityToolsGeminiDesc;

  /// No description provided for @applicationAccessibilityToolsGoogleTranslateDesc.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة نصوص ومحادثات'**
  String get applicationAccessibilityToolsGoogleTranslateDesc;

  /// No description provided for @applicationAccessibilityToolsImmersiveReaderDesc.
  ///
  /// In ar, this message translates to:
  /// **'قراءة وفهم أسهل'**
  String get applicationAccessibilityToolsImmersiveReaderDesc;

  /// No description provided for @applicationAccessibilityToolsLiveTranscribeDesc.
  ///
  /// In ar, this message translates to:
  /// **'تحويل الكلام إلى نص'**
  String get applicationAccessibilityToolsLiveTranscribeDesc;

  /// No description provided for @applicationAccessibilityToolsLookoutDesc.
  ///
  /// In ar, this message translates to:
  /// **'دعم بصري للهاتف'**
  String get applicationAccessibilityToolsLookoutDesc;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorDesc.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة ومحادثات متعددة'**
  String get applicationAccessibilityToolsMicrosoftTranslatorDesc;

  /// No description provided for @applicationAccessibilityToolsOpen.
  ///
  /// In ar, this message translates to:
  /// **'فتح الأداة'**
  String get applicationAccessibilityToolsOpen;

  /// No description provided for @applicationAccessibilityToolsReadAloudDesc.
  ///
  /// In ar, this message translates to:
  /// **'قراءة النصوص صوتيًا'**
  String get applicationAccessibilityToolsReadAloudDesc;

  /// No description provided for @applicationAccessibilityToolsSectionAudio.
  ///
  /// In ar, this message translates to:
  /// **'أدوات دعم صوتي'**
  String get applicationAccessibilityToolsSectionAudio;

  /// No description provided for @applicationAccessibilityToolsSectionCommunication.
  ///
  /// In ar, this message translates to:
  /// **'أدوات تواصل'**
  String get applicationAccessibilityToolsSectionCommunication;

  /// No description provided for @applicationAccessibilityToolsSectionDaily.
  ///
  /// In ar, this message translates to:
  /// **'أدوات مساعدة يومية'**
  String get applicationAccessibilityToolsSectionDaily;

  /// No description provided for @applicationAccessibilityToolsSectionReading.
  ///
  /// In ar, this message translates to:
  /// **'أدوات قراءة'**
  String get applicationAccessibilityToolsSectionReading;

  /// No description provided for @applicationAccessibilityToolsSectionVisual.
  ///
  /// In ar, this message translates to:
  /// **'أدوات دعم بصري'**
  String get applicationAccessibilityToolsSectionVisual;

  /// No description provided for @applicationAccessibilityToolsSectionWriting.
  ///
  /// In ar, this message translates to:
  /// **'أدوات كتابة'**
  String get applicationAccessibilityToolsSectionWriting;

  /// No description provided for @applicationAccessibilityToolsSeeingAIDesc.
  ///
  /// In ar, this message translates to:
  /// **'وصف وقراءة مرئية'**
  String get applicationAccessibilityToolsSeeingAIDesc;

  /// No description provided for @applicationAccessibilityToolsVoiceTypingDesc.
  ///
  /// In ar, this message translates to:
  /// **'إملاء صوتي للنص'**
  String get applicationAccessibilityToolsVoiceTypingDesc;

  /// No description provided for @applicationAccessibilityToolsYoutubeCaptionsDesc.
  ///
  /// In ar, this message translates to:
  /// **'نصوص للفيديوهات'**
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
  /// **'الكتابة بالصوت'**
  String get applicationAccessibilityToolsVoiceTypingTitle;

  /// No description provided for @applicationAccessibilityToolsGoogleTranslateTitle.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة جوجل'**
  String get applicationAccessibilityToolsGoogleTranslateTitle;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorTitle.
  ///
  /// In ar, this message translates to:
  /// **'مترجم مايكروسوفت'**
  String get applicationAccessibilityToolsMicrosoftTranslatorTitle;

  /// No description provided for @applicationAccessibilityToolsDeepLTitle.
  ///
  /// In ar, this message translates to:
  /// **'DeepL'**
  String get applicationAccessibilityToolsDeepLTitle;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorConversationTitle.
  ///
  /// In ar, this message translates to:
  /// **'محادثة مترجم مايكروسوفت'**
  String get applicationAccessibilityToolsMicrosoftTranslatorConversationTitle;

  /// No description provided for @applicationAccessibilityToolsMicrosoftTranslatorConversationDesc.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة محادثات مباشرة'**
  String get applicationAccessibilityToolsMicrosoftTranslatorConversationDesc;

  /// No description provided for @applicationAccessibilityToolsSeeingAITitle.
  ///
  /// In ar, this message translates to:
  /// **'Seeing AI'**
  String get applicationAccessibilityToolsSeeingAITitle;

  /// No description provided for @applicationAccessibilityToolsLookoutTitle.
  ///
  /// In ar, this message translates to:
  /// **'Lookout من جوجل'**
  String get applicationAccessibilityToolsLookoutTitle;

  /// No description provided for @applicationAccessibilityToolsLiveTranscribeTitle.
  ///
  /// In ar, this message translates to:
  /// **'النسخ النصي المباشر'**
  String get applicationAccessibilityToolsLiveTranscribeTitle;

  /// No description provided for @applicationAccessibilityToolsYoutubeCaptionsTitle.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة يوتيوب النصية'**
  String get applicationAccessibilityToolsYoutubeCaptionsTitle;

  /// No description provided for @applicationAccessibilityToolsReadAloudTitle.
  ///
  /// In ar, this message translates to:
  /// **'القراءة بصوت عال'**
  String get applicationAccessibilityToolsReadAloudTitle;

  /// No description provided for @applicationAccessibilityToolsImmersiveReaderTitle.
  ///
  /// In ar, this message translates to:
  /// **'القارئ الشامل'**
  String get applicationAccessibilityToolsImmersiveReaderTitle;

  /// No description provided for @applicationAccessibilityToolsBeMyEyesTitle.
  ///
  /// In ar, this message translates to:
  /// **'كن عيني'**
  String get applicationAccessibilityToolsBeMyEyesTitle;
}

class _AccessibilityLocalizationsDelegate
    extends LocalizationsDelegate<AccessibilityLocalizations> {
  const _AccessibilityLocalizationsDelegate();

  @override
  Future<AccessibilityLocalizations> load(Locale locale) {
    return SynchronousFuture<AccessibilityLocalizations>(
        lookupAccessibilityLocalizations(locale));
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
      'that was used.');
}
