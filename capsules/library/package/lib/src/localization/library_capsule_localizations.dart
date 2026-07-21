import 'package:flutter/widgets.dart';

class LibraryCapsuleLocalizations {
  const LibraryCapsuleLocalizations(this.locale);

  final Locale locale;

  static const delegate = _LibraryCapsuleLocalizationsDelegate();

  static LibraryCapsuleLocalizations of(BuildContext context) {
    return Localizations.of<LibraryCapsuleLocalizations>(
          context,
          LibraryCapsuleLocalizations,
        ) ??
        const LibraryCapsuleLocalizations(Locale('en'));
  }

  static const keys = <String>[
    'libraryComingSoon',
    'libraryEducationalDisclaimer',
    'libraryNoteArticles',
    'libraryNoteAudio',
    'libraryNoteExercises',
    'libraryNoteSaved',
    'libraryNoteTools',
    'libraryNoteVideos',
    'libraryProviderCenters',
    'libraryProviderContentTitle',
    'libraryProviderSpecialists',
    'libraryTitle',
    'menuSpecialists',
    'menuCenters',
  ];

  String get title {
    return locale.languageCode.toLowerCase() == 'ar'
        ? 'مكتبة الابتسامة النفسية'
        : 'Mental Smile Library';
  }

  String resolve(String key) => '${locale.languageCode}:$key';
}

class _LibraryCapsuleLocalizationsDelegate
    extends LocalizationsDelegate<LibraryCapsuleLocalizations> {
  const _LibraryCapsuleLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ar' || locale.languageCode == 'en';
  }

  @override
  Future<LibraryCapsuleLocalizations> load(Locale locale) async {
    return LibraryCapsuleLocalizations(locale);
  }

  @override
  bool shouldReload(_LibraryCapsuleLocalizationsDelegate old) => false;
}
