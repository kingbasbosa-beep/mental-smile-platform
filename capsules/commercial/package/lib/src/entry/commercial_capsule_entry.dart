import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../capsule/commercial_capsule_identity.dart';
import '../capsule/commercial_capsule_routes.dart';
import '../localization/commercial_capsule_localizations.dart';

class CommercialCapsuleEntry extends StatelessWidget {
  const CommercialCapsuleEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        CommercialCapsuleLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      onGenerateRoute: (settings) {
        final descriptor = CommercialCapsuleRoutes.descriptors.firstWhere(
          (route) => route.routePath == settings.name,
          orElse: () => CommercialCapsuleRoutes.descriptors.first,
        );
        return MaterialPageRoute(
          builder: descriptor.builder,
          settings: settings,
        );
      },
      home: const CommercialCapsuleDiagnosticsPage(),
    );
  }
}

class CommercialCapsuleDiagnosticsPage extends StatelessWidget {
  const CommercialCapsuleDiagnosticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = CommercialCapsuleLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.title)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          _DiagnosticRow(label: 'Routes', value: '18'),
          _DiagnosticRow(label: 'Core signals', value: '4'),
          _DiagnosticRow(label: 'Local signals', value: '7'),
          _DiagnosticRow(label: 'Assets mapped', value: '39'),
          _DiagnosticRow(label: 'Localization keys', value: '47'),
          _DiagnosticRow(label: 'Speech controls', value: '17'),
          _DiagnosticRow(label: 'Speech connected', value: '2'),
          _DiagnosticRow(label: 'Speech pending', value: '15'),
          _DiagnosticRow(
            label: 'Speech capability',
            value: CommercialCapsuleCapabilities.speechCapability,
          ),
        ],
      ),
    );
  }
}

class _DiagnosticRow extends StatelessWidget {
  const _DiagnosticRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
