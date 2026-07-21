import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'library_localizations_ar.dart';
import 'library_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of LibraryLocalizations
/// returned by `LibraryLocalizations.of(context)`.
///
/// Applications need to include `LibraryLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'library/library_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: LibraryLocalizations.localizationsDelegates,
///   supportedLocales: LibraryLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the LibraryLocalizations.supportedLocales
/// property.
abstract class LibraryLocalizations {
  LibraryLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static LibraryLocalizations of(BuildContext context) {
    return Localizations.of<LibraryLocalizations>(
        context, LibraryLocalizations)!;
  }

  static const LocalizationsDelegate<LibraryLocalizations> delegate =
      _LibraryLocalizationsDelegate();

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

  /// No description provided for @libraryNoteArticles.
  ///
  /// In ar, this message translates to:
  /// **'مقالات تثقيفية وداعمة ستتوفر تدريجيًا.'**
  String get libraryNoteArticles;

  /// No description provided for @libraryNoteAudio.
  ///
  /// In ar, this message translates to:
  /// **'صوتيات للتهدئة والدعم العام، وليست تدخلًا علاجيًا.'**
  String get libraryNoteAudio;

  /// No description provided for @libraryNoteExercises.
  ///
  /// In ar, this message translates to:
  /// **'تمارين دعم خفيفة فقط، وليست بروتوكولًا علاجيًا.'**
  String get libraryNoteExercises;

  /// No description provided for @libraryNoteSaved.
  ///
  /// In ar, this message translates to:
  /// **'ميزة الحفظ غير مفعلة الآن، ولا يتم تخزين أي عناصر في هذه المرحلة.'**
  String get libraryNoteSaved;

  /// No description provided for @libraryNoteTools.
  ///
  /// In ar, this message translates to:
  /// **'أدوات الدعم قيد التجهيز. الأدوات المهنية أو الحساسة تحتاج إشراف مختص.'**
  String get libraryNoteTools;

  /// No description provided for @libraryNoteVideos.
  ///
  /// In ar, this message translates to:
  /// **'موارد تعليمية مرئية، وأي روابط خارجية مستقبلًا ستحتاج رصد سلامة.'**
  String get libraryNoteVideos;

  /// No description provided for @libraryProviderCenters.
  ///
  /// In ar, this message translates to:
  /// **'المراكز والجهات'**
  String get libraryProviderCenters;

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

  /// No description provided for @libraryTitle.
  ///
  /// In ar, this message translates to:
  /// **'المكتبة'**
  String get libraryTitle;

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
}

class _LibraryLocalizationsDelegate
    extends LocalizationsDelegate<LibraryLocalizations> {
  const _LibraryLocalizationsDelegate();

  @override
  Future<LibraryLocalizations> load(Locale locale) {
    return SynchronousFuture<LibraryLocalizations>(
        lookupLibraryLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_LibraryLocalizationsDelegate old) => false;
}

LibraryLocalizations lookupLibraryLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return LibraryLocalizationsAr();
    case 'en':
      return LibraryLocalizationsEn();
  }

  throw FlutterError(
      'LibraryLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
