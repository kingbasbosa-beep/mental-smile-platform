import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/commercial_v2_web/domain/commercial_v2_web_registry.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation/widgets/commercial_v2_web_background.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation/widgets/commercial_v2_web_showcase_card.dart';
import 'package:mental_smile_os/features/commercial_v2_web/signals/commercial_v2_signal_codes.dart';
import 'package:mental_smile_os/features/commercial_v2_web/signals/commercial_v2_signal_emitter.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class CommercialV2WebShowcasePage extends StatelessWidget {
  const CommercialV2WebShowcasePage({super.key});

  String _getSectionTitle(String id, AppLocalizations l10n) {
    switch (id) {
      case 'library':
        return l10n.commercialV2WebSectionLibrary;
      case 'specialists':
        return l10n.commercialV2WebSectionSpecialists;
      case 'centers':
        return l10n.commercialV2WebSectionCenters;
      default:
        return id;
    }
  }

  String _getSignalCode(String id) {
    switch (id) {
      case 'library':
        return CommercialV2SignalCode.openLibrary;
      case 'specialists':
        return CommercialV2SignalCode.openSpecialists;
      case 'centers':
        return CommercialV2SignalCode.openCenters;
      default:
        return CommercialV2SignalCode.openLibrary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CommercialV2WebBackground(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.commercialV2WebTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.commercialV2WebSubtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFE0C174),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 34),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 18,
                  runSpacing: 18,
                  children: [
                    for (final section in CommercialV2WebRegistry.sections
                        .where((section) => section.id == 'library'))
                      CommercialV2WebShowcaseCard(
                        title: _getSectionTitle(section.id, l10n),
                        icon: section.icon,
                        onTap: () async {
                          await CommercialV2SignalEmitter.emit(
                            signalCode: _getSignalCode(section.id),
                            sourceScreen: 'Commercial V2 Web Showcase',
                            sourceWidget: '${section.id} showcase card',
                            action: 'open_section',
                          );
                          if (context.mounted) {
                            Navigator.of(context).pushNamed(section.route);
                          }
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
