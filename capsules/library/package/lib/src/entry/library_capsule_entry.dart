import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../capsule/library_capsule_identity.dart';
import '../capsule/library_capsule_routes.dart';
import '../localization/library_capsule_localizations.dart';

class LibraryCapsuleEntry extends StatelessWidget {
  const LibraryCapsuleEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        LibraryCapsuleLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      onGenerateRoute: (settings) {
        final descriptor = LibraryCapsuleRoutes.descriptors.firstWhere(
          (route) => route.routePath == settings.name,
          orElse: () => LibraryCapsuleRoutes.descriptors.first,
        );
        return MaterialPageRoute(
          builder: descriptor.builder,
          settings: settings,
        );
      },
      home: const LibraryCapsuleDiagnosticsPage(),
    );
  }
}

class LibraryCapsuleDiagnosticsPage extends StatelessWidget {
  const LibraryCapsuleDiagnosticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = LibraryCapsuleLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.title)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          _DiagnosticRow(label: 'Runtime files', value: '28'),
          _DiagnosticRow(label: 'Routes', value: '5'),
          _DiagnosticRow(label: 'Core signals', value: '1'),
          _DiagnosticRow(label: 'Local signals', value: '22'),
          _DiagnosticRow(label: 'Assets mapped', value: '32'),
          _DiagnosticRow(label: 'Localization keys', value: '14'),
          _DiagnosticRow(label: 'Speech controls', value: '25'),
          _DiagnosticRow(label: 'Speech connected', value: '2'),
          _DiagnosticRow(label: 'Speech pending', value: '23'),
          _DiagnosticRow(label: 'Runtime content', value: '1'),
          _DiagnosticRow(label: 'Editorial sources', value: '3'),
          _DiagnosticRow(label: 'Organization references', value: '0'),
          _DiagnosticRow(label: 'Content items', value: '4'),
          _DiagnosticRow(
            label: 'Speech capability',
            value: LibraryCapsuleCapabilities.speechCapability,
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
