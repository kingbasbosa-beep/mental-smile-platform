import 'package:flutter/material.dart';

class OfficialPlatformLinksPage extends StatelessWidget {
  const OfficialPlatformLinksPage({super.key});

  static const String _backgroundAsset =
      'assets/library/backgrounds/official_links_background.webp.png';

  static const List<_OfficialLinksGroup> _groups = [
    _OfficialLinksGroup(
      title: 'Official Website',
      icon: Icons.public_rounded,
      items: [
        _OfficialLinkItem(
          title: 'Mental Smile Website',
          icon: Icons.language_rounded,
          placeholderUrl: 'https://example.com',
        ),
      ],
    ),
    _OfficialLinksGroup(
      title: 'Mobile Applications',
      icon: Icons.phone_iphone_rounded,
      items: [
        _OfficialLinkItem(
          title: 'Android Application',
          icon: Icons.android_rounded,
          placeholderUrl: 'https://example.com/android',
        ),
        _OfficialLinkItem(
          title: 'iOS Application',
          icon: Icons.phone_iphone_rounded,
          placeholderUrl: 'https://example.com/ios',
        ),
      ],
    ),
    _OfficialLinksGroup(
      title: 'Social Media',
      icon: Icons.alternate_email_rounded,
      items: [
        _OfficialLinkItem(
          title: 'Facebook',
          icon: Icons.facebook_rounded,
          placeholderUrl: 'https://example.com/facebook',
        ),
        _OfficialLinkItem(
          title: 'Instagram',
          icon: Icons.camera_alt_outlined,
          placeholderUrl: 'https://example.com/instagram',
        ),
        _OfficialLinkItem(
          title: 'YouTube',
          icon: Icons.play_circle_outline_rounded,
          placeholderUrl: 'https://example.com/youtube',
        ),
      ],
    ),
    _OfficialLinksGroup(
      title: 'Community Groups',
      icon: Icons.groups_2_rounded,
      items: [
        _OfficialLinkItem(
          title: 'Community Group',
          icon: Icons.diversity_3_rounded,
          placeholderUrl: 'https://example.com/community',
        ),
      ],
    ),
    _OfficialLinksGroup(
      title: 'Specialists',
      icon: Icons.psychology_alt_rounded,
      items: [
        _OfficialLinkItem(
          title: 'Specialists Directory',
          icon: Icons.medical_services_outlined,
          placeholderUrl: 'https://example.com/specialists',
        ),
      ],
    ),
    _OfficialLinksGroup(
      title: 'Centers',
      icon: Icons.apartment_rounded,
      items: [
        _OfficialLinkItem(
          title: 'Centers Directory',
          icon: Icons.local_hospital_outlined,
          placeholderUrl: 'https://example.com/centers',
        ),
      ],
    ),
    _OfficialLinksGroup(
      title: 'Contact Information',
      icon: Icons.contact_support_outlined,
      items: [
        _OfficialLinkItem(
          title: 'Contact Support',
          icon: Icons.chat_bubble_outline_rounded,
          placeholderUrl: 'https://example.com/contact',
        ),
        _OfficialLinkItem(
          title: 'Email',
          icon: Icons.mail_outline_rounded,
          placeholderUrl: 'mailto:placeholder@example.com',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              _backgroundAsset,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                    sliver: SliverToBoxAdapter(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: _BackButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 42),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 860),
                          child: Column(
                            children: [
                              for (var index = 0;
                                  index < _groups.length;
                                  index++) ...[
                                _OfficialLinksGroupCard(group: _groups[index]),
                                if (index != _groups.length - 1)
                                  const SizedBox(height: 14),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfficialLinksGroup {
  const _OfficialLinksGroup({
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<_OfficialLinkItem> items;
}

class _OfficialLinkItem {
  const _OfficialLinkItem({
    required this.title,
    required this.icon,
    required this.placeholderUrl,
  });

  final String title;
  final IconData icon;
  final String placeholderUrl;
}

class _OfficialLinksGroupCard extends StatelessWidget {
  const _OfficialLinksGroupCard({required this.group});

  final _OfficialLinksGroup group;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF050402).withValues(alpha: 0.70),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7B95C).withValues(alpha: 0.46),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE1A94B).withValues(alpha: 0.12),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                _GoldIcon(icon: group.icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    group.title,
                    style: const TextStyle(
                      color: Color(0xFFFFE5A8),
                      fontSize: 20,
                      height: 1.2,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            for (var index = 0; index < group.items.length; index++) ...[
              _OfficialLinkRow(item: group.items[index]),
              if (index != group.items.length - 1) const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}

class _OfficialLinkRow extends StatefulWidget {
  const _OfficialLinkRow({required this.item});

  final _OfficialLinkItem item;

  @override
  State<_OfficialLinkRow> createState() => _OfficialLinkRowState();
}

class _OfficialLinkRowState extends State<_OfficialLinkRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.item.title,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: const Color(0xFF0E0A04).withValues(
              alpha: _hovered ? 0.76 : 0.58,
            ),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFE7B95C).withValues(
                alpha: _hovered ? 0.64 : 0.30,
              ),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => debugPrint(
                'official_platform_link_placeholder_opened '
                'title=${widget.item.title} url=${widget.item.placeholderUrl}',
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      widget.item.icon,
                      color: const Color(0xFFFFD987),
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.item.title,
                        style: const TextStyle(
                          color: Color(0xFFFFF1C7),
                          fontSize: 16,
                          height: 1.25,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.north_east_rounded,
                      color: Color(0xFFC89D45),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GoldIcon extends StatelessWidget {
  const _GoldIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE7B95C).withValues(alpha: 0.16),
        border: Border.all(
          color: const Color(0xFFE7B95C).withValues(alpha: 0.46),
        ),
      ),
      child: SizedBox(
        width: 42,
        height: 42,
        child: Icon(
          icon,
          color: const Color(0xFFFFD987),
          size: 22,
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.52),
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFFFFE5A8),
            size: 22,
          ),
        ),
      ),
    );
  }
}
