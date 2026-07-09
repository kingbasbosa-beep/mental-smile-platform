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
          case Routes.desktopEntry:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const _EntryPlaceholderPage(
                title: 'Desktop Entry',
                arabicTitle: 'دخول نسخة الديسكتوب',
              ),
            );
          case Routes.mobileEntry:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const _EntryPlaceholderPage(
                title: 'Mobile Entry',
                arabicTitle: 'دخول نسخة الموبايل',
              ),
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

class _EntryPlaceholderPage extends StatelessWidget {
  const _EntryPlaceholderPage({
    required this.title,
    required this.arabicTitle,
  });

  final String title;
  final String arabicTitle;

  static const String _message =
      'This entry will be connected during the next platform materialization step.';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D0904),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0xFFD7A936).withValues(alpha: 0.54),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC8952D).withValues(alpha: 0.14),
                        blurRadius: 26,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            tooltip: 'Back',
                            onPressed: () => Navigator.of(context).maybePop(),
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Color(0xFFFFE3A1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          arabicTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFFFFD98A),
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFFE8C778),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          _message,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Color(0xFFFFEFD0),
                            fontSize: 16,
                            height: 1.55,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
