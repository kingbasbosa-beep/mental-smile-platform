import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../localization/accessibility/accessibility_localizations.dart';
import '../localization/residential/residential_localizations.dart';
import 'residential_capsule_routes.dart';

class ResidentialCapsuleEntry extends StatelessWidget {
  const ResidentialCapsuleEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          ResidentialLocalizations.delegate,
          AccessibilityLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('ar'), Locale('en')],
        home: _ResidentialCapsuleHome(),
      ),
    );
  }
}

class _ResidentialCapsuleHome extends StatelessWidget {
  const _ResidentialCapsuleHome();

  @override
  Widget build(BuildContext context) {
    return ResidentialCapsuleRoutes.descriptors.first.builder(context);
  }
}
