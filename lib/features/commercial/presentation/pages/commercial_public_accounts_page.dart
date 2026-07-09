import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_sub_page_background.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class CommercialPublicAccountsPage extends StatelessWidget {
  const CommercialPublicAccountsPage({super.key});

  static const String _logoAsset = 'assets/branding/logo_transparent.png';
  static const String pendingUrl = '';
  static const Color _gold = Color(0xFFFFE29A);
  static const Color _mutedGold = Color(0xFFE0C174);

  List<_PublicAccountLink> _platformAccounts(AppLocalizations l10n) => [
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsWebsite,
            icon: Icons.language_rounded),
        _PublicAccountLink(
          label: l10n.commercialPublicAccountsSpecialists,
          icon: Icons.person_search_rounded,
        ),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsCenters,
            icon: Icons.apartment_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsLibrary,
            icon: Icons.menu_book_rounded),
      ];

  List<_PublicAccountLink> _socialAccounts(AppLocalizations l10n) => [
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsFacebook,
            icon: Icons.groups_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsInstagram,
            icon: Icons.photo_camera_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsLinkedin,
            icon: Icons.business_center_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsX,
            icon: Icons.alternate_email_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsTiktok,
            icon: Icons.music_note_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsYoutube,
            icon: Icons.play_circle_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsTelegram,
            icon: Icons.send_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsWhatsapp,
            icon: Icons.chat_rounded),
      ];

  List<_PublicAccountLink> _productAccounts(AppLocalizations l10n) => [
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsBusinessCards,
            icon: Icons.badge_rounded),
        _PublicAccountLink(
          label: l10n.commercialPublicAccountsResume,
          icon: Icons.description_rounded,
        ),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsPosters,
            icon: Icons.article_rounded),
        _PublicAccountLink(
            label: l10n.commercialPublicAccountsQrProfiles,
            icon: Icons.qr_code_rounded),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommercialSubPageBackground(
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                _TopBar(onBack: () => Navigator.of(context).maybePop()),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(22, 10, 22, 42),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1040),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            const _PageHeader(logoAsset: _logoAsset),
                            const SizedBox(height: 28),
                            _AccountsSection(
                              title:
                                  l10n.commercialPublicAccountsSectionPlatform,
                              icon: Icons.public_rounded,
                              accounts: _platformAccounts(l10n),
                            ),
                            const SizedBox(height: 18),
                            _AccountsSection(
                              title: l10n.commercialPublicAccountsSectionSocial,
                              icon: Icons.groups_rounded,
                              accounts: _socialAccounts(l10n),
                            ),
                            const SizedBox(height: 18),
                            _AccountsSection(
                              title:
                                  l10n.commercialPublicAccountsSectionIdentity,
                              icon: Icons.badge_outlined,
                              accounts: _productAccounts(l10n),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      child: Row(
        children: [
          IconButton(
            tooltip: l10n.commonBack,
            onPressed: onBack,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: CommercialPublicAccountsPage._gold,
              size: 28,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AccessibilityGuideIcon(
                size: 22,
                onPressed: () => _showSpeechPlaceholder(context),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.public_rounded,
                color: CommercialPublicAccountsPage._gold,
                size: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({required this.logoAsset});

  final String logoAsset;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Image.asset(
          logoAsset,
          height: 128,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.spa_outlined,
            color: CommercialPublicAccountsPage._gold,
            size: 76,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          l10n.commercialPublicAccountsTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: CommercialPublicAccountsPage._gold,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.commercialPublicAccountsSubtitle,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: CommercialPublicAccountsPage._mutedGold,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _AccountsSection extends StatelessWidget {
  const _AccountsSection({
    required this.title,
    required this.icon,
    required this.accounts,
  });

  final String title;
  final IconData icon;
  final List<_PublicAccountLink> accounts;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: CommercialPublicAccountsPage._gold.withValues(alpha: 0.22),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SectionTitle(title: title, icon: icon),
            const SizedBox(height: 14),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final account in accounts)
                  _PublicAccountChip(account: account),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AccessibilityGuideIcon(
          size: 22,
          onPressed: () => _showSpeechPlaceholder(context),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: CommercialPublicAccountsPage._gold,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          icon,
          color: CommercialPublicAccountsPage._gold,
          size: 22,
        ),
      ],
    );
  }
}

class _PublicAccountChip extends StatelessWidget {
  const _PublicAccountChip({required this.account});

  final _PublicAccountLink account;

  Future<void> _open() async {
    if (account.url.isEmpty) return;
    await launchUrl(
      Uri.parse(account.url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final enabled = account.url.isNotEmpty;
    final foreground =
        enabled ? Colors.black : CommercialPublicAccountsPage._gold;
    return Semantics(
      button: enabled,
      label:
          '${account.label} ${enabled ? l10n.applicationClientDialogLinksOpen : l10n.libraryComingSoon}',
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: enabled ? _open : null,
        child: Container(
          constraints: const BoxConstraints(minHeight: 48, minWidth: 166),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: BoxDecoration(
            color: enabled
                ? CommercialPublicAccountsPage._gold
                : Colors.black.withValues(alpha: 0.38),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: CommercialPublicAccountsPage._gold.withValues(
                alpha: enabled ? 0.88 : 0.38,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                enabled ? Icons.open_in_new_rounded : Icons.schedule_rounded,
                color: foreground,
                size: 17,
              ),
              const SizedBox(width: 8),
              AccessibilityGuideIcon(
                size: 20,
                onPressed: () => _showSpeechPlaceholder(context),
              ),
              const SizedBox(width: 8),
              Text(
                enabled
                    ? account.label
                    : '${account.label} · ${l10n.libraryComingSoon}',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: enabled
                      ? Colors.black
                      : CommercialPublicAccountsPage._mutedGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                account.icon,
                color: foreground,
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PublicAccountLink {
  const _PublicAccountLink({
    required this.label,
    required this.icon,
  }) : url = CommercialPublicAccountsPage.pendingUrl;

  final String label;
  final IconData icon;
  final String url;
}

void _showSpeechPlaceholder(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
    ),
  );
}
