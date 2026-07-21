// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'shared_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SharedLocalizationsEn extends SharedLocalizations {
  SharedLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get applicationAccessibilityListenSupport =>
      'Listening or audio support';

  @override
  String get applicationLinkOpenFailed =>
      'Could not open this link. Please try again.';

  @override
  String get applicationSpeechUnavailable =>
      'Voice playback is unavailable on this device.';

  @override
  String get applicationSpeechTooltip => 'Listen';

  @override
  String get applicationSpeechSemanticLabel => 'Play voice reading';
}
