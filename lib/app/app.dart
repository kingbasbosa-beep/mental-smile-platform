import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_smile_os/app/locale_provider.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart';

class MentalSmilePlatformApp extends ConsumerWidget {
  const MentalSmilePlatformApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = ref.watch(localeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Smile Platform',
      locale: selectedLocale ?? const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
          case Routes.landingPreview:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const CommercialV2WebShowcasePage(),
            );
          default:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const CommercialV2WebShowcasePage(),
            );
        }
      },
    );
  }
}
