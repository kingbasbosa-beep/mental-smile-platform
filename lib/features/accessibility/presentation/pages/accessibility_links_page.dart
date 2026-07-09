import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessibilityLinksPage extends StatelessWidget {
  const AccessibilityLinksPage({super.key});

  static const String _background =
      'assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png';

  List<_LegendItem> _legend(AppLocalizations l10n) => [
        _LegendItem('🏛️', l10n.applicationAccessibilityLegendGov),
        _LegendItem('🤝', l10n.applicationAccessibilityLegendAssoc),
        _LegendItem('🌍', l10n.applicationAccessibilityLegendIntl),
        _LegendItem('📚', l10n.applicationAccessibilityLegendLib),
        _LegendItem('🎓', l10n.applicationAccessibilityLegendEdu),
        _LegendItem('🤟', l10n.applicationAccessibilityLegendSign),
        _LegendItem('👁️', l10n.applicationAccessibilityLegendVisual),
        _LegendItem('♿', l10n.applicationAccessibilityLegendAccess),
      ];

  List<_LinkSection> _sections(AppLocalizations l10n) => [
        _LinkSection(
          title: l10n.applicationAccessibilityLinksSectionEgypt,
          visualMarker: '🇪🇬',
          items: <_ImportantLink>[
            _ImportantLink(
              icon: '🏛️',
              titleAr: l10n.applicationAccessibilityLinksEgyptCouncilTitle,
              descriptionAr: l10n.applicationAccessibilityLinksEgyptCouncilDesc,
              url: 'https://ncpd.org.eg/',
            ),
            _ImportantLink(
              icon: '🏛️',
              titleAr: l10n.applicationAccessibilityLinksEgyptMossTitle,
              descriptionAr: l10n.applicationAccessibilityLinksEgyptMossDesc,
              url: 'https://www.moss.gov.eg/',
            ),
            _ImportantLink(
              icon: '🎓',
              titleAr: l10n.applicationAccessibilityLinksEgyptEducationTitle,
              descriptionAr:
                  l10n.applicationAccessibilityLinksEgyptEducationDesc,
              url: 'https://moe.gov.eg/',
            ),
            _ImportantLink(
              icon: '📚',
              titleAr: l10n.applicationAccessibilityLinksEgyptEkbTitle,
              descriptionAr: l10n.applicationAccessibilityLinksEgyptEkbDesc,
              url: 'https://www.ekb.eg/',
            ),
            _ImportantLink(
              icon: '🏛️',
              titleAr: l10n.applicationAccessibilityLinksEgyptGovTitle,
              descriptionAr: l10n.applicationAccessibilityLinksEgyptGovDesc,
              url: 'https://www.egypt.gov.eg/',
            ),
          ],
        ),
        _LinkSection(
          title: l10n.applicationAccessibilityLinksSectionArab,
          visualMarker: '🌏',
          items: <_ImportantLink>[
            _ImportantLink(
              icon: '🌍',
              titleAr: l10n.applicationAccessibilityLinksArabEscwaTitle,
              descriptionAr: l10n.applicationAccessibilityLinksArabEscwaDesc,
              url: 'https://www.unescwa.org/',
            ),
            _ImportantLink(
              icon: '🎓',
              titleAr: l10n.applicationAccessibilityLinksArabAlecsoTitle,
              descriptionAr: l10n.applicationAccessibilityLinksArabAlecsoDesc,
              url: 'https://www.alecso.org/',
            ),
            _ImportantLink(
              icon: '♿',
              titleAr: l10n.applicationAccessibilityLinksArabKingSalmanTitle,
              descriptionAr:
                  l10n.applicationAccessibilityLinksArabKingSalmanDesc,
              url: 'https://www.kscdr.org.sa/',
            ),
            _ImportantLink(
              icon: '📚',
              titleAr: l10n.applicationAccessibilityLinksArabAradoTitle,
              descriptionAr: l10n.applicationAccessibilityLinksArabAradoDesc,
              url: 'https://www.arado.org/',
            ),
          ],
        ),
        _LinkSection(
          title: l10n.applicationAccessibilityLinksSectionGlobal,
          visualMarker: '🌎',
          items: <_ImportantLink>[
            _ImportantLink(
              icon: '🌍',
              titleAr: l10n.applicationAccessibilityLinksGlobalWhoTitle,
              descriptionAr: l10n.applicationAccessibilityLinksGlobalWhoDesc,
              url: 'https://www.who.int/health-topics/disability',
            ),
            _ImportantLink(
              icon: '🌍',
              titleAr: l10n.applicationAccessibilityLinksGlobalUnicefTitle,
              descriptionAr: l10n.applicationAccessibilityLinksGlobalUnicefDesc,
              url: 'https://www.unicef.org/disabilities',
            ),
            _ImportantLink(
              icon: '🌍',
              titleAr: l10n.applicationAccessibilityLinksGlobalUndesaTitle,
              descriptionAr: l10n.applicationAccessibilityLinksGlobalUndesaDesc,
              url: 'https://social.desa.un.org/issues/disability',
            ),
            _ImportantLink(
              icon: '♿',
              titleAr: l10n.applicationAccessibilityLinksGlobalW3cTitle,
              descriptionAr: l10n.applicationAccessibilityLinksGlobalW3cDesc,
              url: 'https://www.w3.org/WAI/',
            ),
          ],
        ),
        _LinkSection(
          title: l10n.applicationAccessibilityLinksSectionKnowledge,
          visualMarker: '📚',
          items: <_ImportantLink>[
            _ImportantLink(
              icon: '📚',
              titleAr: l10n.applicationAccessibilityLinksKnowledgeLocTitle,
              descriptionAr: l10n.applicationAccessibilityLinksKnowledgeLocDesc,
              url: 'https://www.loc.gov/nls/',
            ),
            _ImportantLink(
              icon: '📚',
              titleAr:
                  l10n.applicationAccessibilityLinksKnowledgeBookshareTitle,
              descriptionAr:
                  l10n.applicationAccessibilityLinksKnowledgeBookshareDesc,
              url: 'https://www.bookshare.org/',
            ),
            _ImportantLink(
              icon: '📚',
              titleAr: l10n.applicationAccessibilityLinksKnowledgeDaisyTitle,
              descriptionAr:
                  l10n.applicationAccessibilityLinksKnowledgeDaisyDesc,
              url: 'https://daisy.org/',
            ),
            _ImportantLink(
              icon: '👁️',
              titleAr: l10n.applicationAccessibilityLinksKnowledgeWbuTitle,
              descriptionAr: l10n.applicationAccessibilityLinksKnowledgeWbuDesc,
              url: 'https://worldblindunion.org/',
            ),
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.accessibilityLinksView,
      sourceScreen: 'Accessibility Links',
      sourceWidget: 'AccessibilityLinksPage',
      action: 'view',
    );
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF2B1B0D),
      body: SafeArea(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 960),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_background),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= 900;
                  final horizontalPadding = isDesktop ? 60.0 : 24.0;
                  final contentMaxWidth = isDesktop ? 900.0 : 800.0;

                  return ListView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      34,
                      horizontalPadding,
                      40,
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _AccessibilityCardBackButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: contentMaxWidth),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Semantics(
                                header: true,
                                label:
                                    l10n.applicationAccessibilityLinksCardTitle,
                                child: _SpeakableText(
                                  text:
                                      '🔗 ${l10n.applicationAccessibilityLinksCardTitle}',
                                  onSpeak: () => _showSpeechPlaceholder(context,
                                      l10n.applicationAccessibilityLinksCardTitle),
                                  style: const TextStyle(
                                    color: Color(0xFF7A4A00),
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              _SpeakableText(
                                text:
                                    '🌍 ${l10n.applicationAccessibilityLinksCardSubtitle}',
                                onSpeak: () => _showSpeechPlaceholder(context,
                                    l10n.applicationAccessibilityLinksCardSubtitle),
                                style: const TextStyle(
                                  color: Color(0xFF3A2A18),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 24),
                              _LegendBlock(items: _legend(l10n)),
                              const SizedBox(height: 18),
                              for (final section in _sections(l10n)) ...[
                                _SectionHeader(
                                    title: section.title,
                                    marker: section.visualMarker),
                                const SizedBox(height: 8),
                                for (final item in section.items)
                                  _LinkRow(item: item),
                                const SizedBox(height: 14),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Links',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

class _LegendBlock extends StatelessWidget {
  const _LegendBlock({required this.items});

  final List<_LegendItem> items;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x998B5E34)),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0x22C99A38),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SpeakableText(
              text: '🧭 ${l10n.applicationAccessibilityLegendTitle}',
              onSpeak: () => _showSpeechPlaceholder(
                  context, l10n.applicationAccessibilityLegendTitle),
              style: const TextStyle(
                color: Color(0xFF8B5E34),
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 18,
              runSpacing: 10,
              children: [
                for (final item in items)
                  _LegendChip(icon: item.icon, label: item.label),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Links',
      sourceWidget: 'LegendBlockAudioIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showSpeechPlaceholder(context, label),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$icon $label',
                style: const TextStyle(
                  color: Color(0xFF3A2A18),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              const AccessibilityGuideIcon(size: 18),
            ],
          ),
        ),
      ),
    );
  }

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Links',
      sourceWidget: 'LegendChipAudioIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.marker});

  final String title;
  final String marker;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Semantics(
          header: true,
          label: title,
          child: _SpeakableText(
            text: '$marker $title',
            onSpeak: () => _showSpeechPlaceholder(context, title),
            style: const TextStyle(
              color: Color(0xFF8B5E34),
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const SizedBox(
          width: double.infinity,
          child: Divider(color: Color(0x99B6842F), thickness: 1.4),
        ),
      ],
    );
  }

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Links',
      sourceWidget: 'SectionHeaderAudioIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  const _LinkRow({required this.item});

  final _ImportantLink item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Semantics(
      button: true,
      label: '${item.titleAr}. ${item.descriptionAr}',
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0x18C99A38),
              border: Border.all(color: const Color(0x668B5E34)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _SpeakableText(
                    text: '${item.icon} ${item.titleAr}',
                    onSpeak: () =>
                        _showSpeechPlaceholder(context, item.titleAr),
                    style: const TextStyle(
                      color: Color(0xFF3A2A18),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.descriptionAr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF3A2A18),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () => _openExternal(item.url),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF1D5F63),
                          side: const BorderSide(color: Color(0x881D5F63)),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          '🔗 ${l10n.applicationClientDialogLinksOpen}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AccessibilityGuideIcon(
                        size: 24,
                        onPressed: () =>
                            _showSpeechPlaceholder(context, item.titleAr),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Links',
      sourceWidget: 'LinkRowAudioIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

Future<void> _openExternal(String url) async {
  ResidentialSignalEmitter.emit(
    signalCode: ResidentialSignalCode.linkOpen,
    sourceScreen: 'Accessibility Links',
    sourceWidget: 'LinkRowOpenButton',
    action: 'open_external_link',
  );
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

class _SpeakableText extends StatelessWidget {
  const _SpeakableText({
    required this.text,
    required this.onSpeak,
    required this.style,
  });

  final String text;
  final VoidCallback onSpeak;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: style,
          ),
        ),
        const SizedBox(width: 8),
        AccessibilityGuideIcon(
          size: style.fontSize != null ? style.fontSize! + 4 : 26,
          onPressed: onSpeak,
        ),
      ],
    );
  }
}

class _AccessibilityCardBackButton extends StatelessWidget {
  const _AccessibilityCardBackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'رجوع',
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xFF1B1007).withValues(alpha: 0.55),
        side: BorderSide(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.58),
        ),
        fixedSize: const Size.square(44),
      ),
      icon: const Icon(
        Icons.arrow_back_rounded,
        textDirection: TextDirection.ltr,
        color: Color(0xFFFFE7B2),
      ),
    );
  }
}

class _LegendItem {
  const _LegendItem(this.icon, this.label);

  final String icon;
  final String label;
}

class _LinkSection {
  const _LinkSection({
    required this.title,
    required this.visualMarker,
    required this.items,
  });

  final String title;
  final String visualMarker;
  final List<_ImportantLink> items;
}

class _ImportantLink {
  const _ImportantLink({
    required this.icon,
    required this.titleAr,
    required this.descriptionAr,
    required this.url,
  });

  final String icon;
  final String titleAr;
  final String descriptionAr;
  final String url;
}
