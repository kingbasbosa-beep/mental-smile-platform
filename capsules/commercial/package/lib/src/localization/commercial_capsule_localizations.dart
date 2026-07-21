import 'package:flutter/widgets.dart';

class CommercialCapsuleLocalizations {
  const CommercialCapsuleLocalizations(this.locale);

  final Locale locale;

  static const delegate = _CommercialCapsuleLocalizationsDelegate();

  static CommercialCapsuleLocalizations of(BuildContext context) {
    return Localizations.of<CommercialCapsuleLocalizations>(
          context,
          CommercialCapsuleLocalizations,
        ) ??
        const CommercialCapsuleLocalizations(Locale('en'));
  }

  String get title {
    return locale.languageCode.toLowerCase() == 'ar'
        ? 'كبسولة التجاري'
        : 'Commercial Capsule';
  }

  String resolve(String key) {
    return '${locale.languageCode}:$key';
  }
}

class _CommercialCapsuleLocalizationsDelegate
    extends LocalizationsDelegate<CommercialCapsuleLocalizations> {
  const _CommercialCapsuleLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ar' || locale.languageCode == 'en';
  }

  @override
  Future<CommercialCapsuleLocalizations> load(Locale locale) async {
    return CommercialCapsuleLocalizations(locale);
  }

  @override
  bool shouldReload(_CommercialCapsuleLocalizationsDelegate old) => false;
}
