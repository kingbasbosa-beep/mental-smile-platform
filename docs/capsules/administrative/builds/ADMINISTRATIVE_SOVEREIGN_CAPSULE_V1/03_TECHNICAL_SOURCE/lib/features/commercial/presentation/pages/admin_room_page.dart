import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminRoomPage extends StatelessWidget {
  const AdminRoomPage({super.key});

  static const String _desktop =
      'assets/branding/rooms/client_room/client_room_background_desktop.png';
  static const String _tablet =
      'assets/branding/rooms/client_room/client_room_background_tablet.png';
  static const String _mobile =
      'assets/branding/rooms/client_room/client_room_background_mobile.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 760;
          final columns = constraints.maxWidth >= 860 ? 2 : 1;
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                _assetFor(constraints),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF120A05).withValues(alpha: 0.74),
                      const Color(0xFF29160D).withValues(alpha: 0.52),
                      const Color(0xFF060403).withValues(alpha: 0.82),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    compact ? 14 : 28,
                    compact ? 16 : 24,
                    compact ? 14 : 28,
                    compact ? 24 : 32,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1240),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const _OwnerRoomIdentity(),
                          SizedBox(height: compact ? 12 : 14),
                          const _DailyNoteFeatherButton(),
                          SizedBox(height: compact ? 14 : 20),
                          _SectionShortcutPanel(compact: compact),
                          SizedBox(height: compact ? 14 : 20),
                          _OperationsCardGrid(
                            columns: columns,
                            compact: compact,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _assetFor(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    if (width < 700 || (isPortrait && width < 900)) return _mobile;
    if (width < 1100) return _tablet;
    return _desktop;
  }
}

class _OwnerRoomIdentity extends StatelessWidget {
  const _OwnerRoomIdentity();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF100906).withValues(alpha: 0.74),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.52),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE7A94C).withValues(alpha: 0.16),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Column(
          children: [
            Text(
              'Creative Operations Room',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFE7B2),
                fontSize: 25,
                fontWeight: FontWeight.w900,
                letterSpacing: 0,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 12),
                ],
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Daily cockpit for archive review, publishing tools, support discovery, and official presence.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFE8C77B),
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionShortcutPanel extends StatelessWidget {
  const _SectionShortcutPanel({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 12 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D131E).withValues(alpha: 0.84),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF82D8FF).withValues(alpha: 0.50),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF65D7FF).withValues(alpha: 0.16),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFF65D7FF).withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.tv_rounded,
                  color: Color(0xFF95E3FF),
                  size: 23,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SECTION SHORTCUTS',
                      style: TextStyle(
                        color: Color(0xFFFFE7B2),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Quick section inspection from the Operations Room TV area.',
                      style: TextStyle(
                        color: Color(0xFFBDEBFF),
                        fontSize: 12,
                        height: 1.25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              final tileWidth = compact ? constraints.maxWidth : 164.0;
              return Wrap(
                spacing: compact ? 8 : 10,
                runSpacing: compact ? 8 : 10,
                children: [
                  for (final shortcut in _sectionShortcuts)
                    SizedBox(
                      width: tileWidth,
                      child: _SectionShortcutCard(data: shortcut),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SectionShortcutCard extends StatefulWidget {
  const _SectionShortcutCard({required this.data});

  final _SectionShortcutData data;

  @override
  State<_SectionShortcutCard> createState() => _SectionShortcutCardState();
}

class _SectionShortcutCardState extends State<_SectionShortcutCard> {
  bool _hovered = false;

  bool get _enabled => widget.data.route != null;

  @override
  Widget build(BuildContext context) {
    final accent = _enabled
        ? widget.data.accent
        : const Color(0xFFFFE7B2).withValues(alpha: 0.38);
    final textColor = _enabled
        ? const Color(0xFFFFF3D0)
        : const Color(0xFFFFF3D0).withValues(alpha: 0.46);
    return MouseRegion(
      onEnter: (_) {
        if (_enabled) setState(() => _hovered = true);
      },
      onExit: (_) {
        if (_enabled) setState(() => _hovered = false);
      },
      child: AnimatedScale(
        scale: _hovered ? 1.025 : 1,
        duration: const Duration(milliseconds: 140),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: _enabled
              ? () => Navigator.of(context).pushNamed(widget.data.route!)
              : null,
          child: Container(
            height: 94,
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: (_enabled ? widget.data.background : Colors.black)
                  .withValues(alpha: _enabled ? 0.72 : 0.24),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: accent.withValues(alpha: _hovered ? 0.78 : 0.42),
              ),
              boxShadow: [
                if (_enabled)
                  BoxShadow(
                    color: widget.data.accent.withValues(
                      alpha: _hovered ? 0.22 : 0.10,
                    ),
                    blurRadius: _hovered ? 18 : 12,
                    offset: const Offset(0, 7),
                  ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(widget.data.icon, color: accent, size: 18),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        widget.data.code,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.data.purpose,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor.withValues(alpha: 0.76),
                    fontSize: 11,
                    height: 1.18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _enabled ? 'OPEN' : 'ROUTE_PENDING',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: accent.withValues(alpha: 0.82),
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
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

class _OperationsCardGrid extends StatelessWidget {
  const _OperationsCardGrid({
    required this.columns,
    required this.compact,
  });

  final int columns;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = compact ? 12.0 : 16.0;
        final cardWidth = columns == 1
            ? constraints.maxWidth
            : (constraints.maxWidth - spacing) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            SizedBox(width: cardWidth, child: const _ArchiveExplorerCard()),
            SizedBox(
              width: cardWidth,
              child: const _LinkCollectionCard(
                title: 'SEC-PUB-TOOLS',
                subtitle: 'Publishing / Creative Tools',
                icon: Icons.auto_fix_high_rounded,
                accent: Color(0xFF65D7FF),
                background: Color(0xFF071821),
                rows: _adminToolRows,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: const _GroupedLinkCollectionCard(
                title: 'SEC-PUB-SUPPORT-LINKS',
                subtitle: 'Support / NGOs / Accessibility Resources',
                icon: Icons.diversity_3_rounded,
                accent: Color(0xFFFFB36C),
                background: Color(0xFF241007),
                groups: _supportGroups,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: const _LinkCollectionCard(
                title: 'SEC-PUB-ACCOUNTS',
                subtitle: 'Mental Smile Official Accounts',
                icon: Icons.account_balance_rounded,
                accent: Color(0xFFE8D27B),
                background: Color(0xFF111421),
                rows: _officialAccountRows,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DailyNoteFeatherButton extends StatefulWidget {
  const _DailyNoteFeatherButton();

  @override
  State<_DailyNoteFeatherButton> createState() =>
      _DailyNoteFeatherButtonState();
}

class _DailyNoteFeatherButtonState extends State<_DailyNoteFeatherButton> {
  static const String _noteFeather =
      'assets/branding/rooms/accessibility_room/cards/accessibility_note_feather_button.png';

  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.02 : 1,
        duration: const Duration(milliseconds: 150),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AdminOperationsDailyNotePage(),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2A160B).withValues(alpha: 0.78),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFFFC978).withValues(
                  alpha: _hovered ? 0.82 : 0.46,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFB36C).withValues(
                    alpha: _hovered ? 0.25 : 0.12,
                  ),
                  blurRadius: _hovered ? 24 : 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  width: 28,
                  height: 28,
                  child: Image(
                    image: AssetImage(_noteFeather),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Owner Daily Note',
                  style: TextStyle(
                    color: Color(0xFFFFE7B2),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
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

class AdminOperationsDailyNotePage extends StatefulWidget {
  const AdminOperationsDailyNotePage({super.key});

  @override
  State<AdminOperationsDailyNotePage> createState() =>
      _AdminOperationsDailyNotePageState();
}

class _AdminOperationsDailyNotePageState
    extends State<AdminOperationsDailyNotePage> {
  static const String _exitCup =
      'assets/branding/rooms/client_room/accessibility_room_exit_button.png';

  late final List<TextEditingController> _controllers;

  final List<_DailyNoteSectionData> _sections = const [
    _DailyNoteSectionData(
      title: "Today's Publishing Goals",
      hint: 'Posts, pages, visual checks, publishing order, approvals.',
      icon: Icons.campaign_outlined,
      accent: Color(0xFFFFC978),
    ),
    _DailyNoteSectionData(
      title: 'Archive / Import / Export Notes',
      hint: 'Files to move, records to review, exports to prepare.',
      icon: Icons.inventory_2_outlined,
      accent: Color(0xFF8FD7FF),
    ),
    _DailyNoteSectionData(
      title: 'Accounts / Links Follow-up',
      hint: 'Official accounts, missing URLs, profile checks, link cleanup.',
      icon: Icons.link_rounded,
      accent: Color(0xFFE8D27B),
    ),
    _DailyNoteSectionData(
      title: 'Signals To Watch',
      hint: 'Patterns, warnings, owner attention points, strange behavior.',
      icon: Icons.radar_outlined,
      accent: Color(0xFFFF9DB6),
    ),
    _DailyNoteSectionData(
      title: 'Technical Notes',
      hint: 'Bugs, layout issues, code reminders, manual command notes.',
      icon: Icons.construction_outlined,
      accent: Color(0xFFBCA7FF),
    ),
    _DailyNoteSectionData(
      title: 'Ideas For Later',
      hint: 'Small sparks, future rooms, brand ideas, quiet improvements.',
      icon: Icons.lightbulb_outline,
      accent: Color(0xFFA8E6A1),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List<TextEditingController>.generate(
      _sections.length,
      (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100906),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 760;
          final cardWidth = compact
              ? constraints.maxWidth
              : (constraints.maxWidth.clamp(0, 1180) - 18) / 2;
          return Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.45, -0.75),
                    radius: 1.2,
                    colors: [
                      const Color(0xFF573016).withValues(alpha: 0.92),
                      const Color(0xFF1B0F09).withValues(alpha: 0.96),
                      const Color(0xFF070504),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    compact ? 14 : 28,
                    compact ? 16 : 24,
                    compact ? 14 : 28,
                    compact ? 28 : 34,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1180),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _DailyNoteHeader(compact: compact),
                          SizedBox(height: compact ? 14 : 18),
                          Wrap(
                            spacing: 18,
                            runSpacing: 18,
                            children: [
                              for (var i = 0; i < _sections.length; i++)
                                SizedBox(
                                  width: cardWidth.toDouble(),
                                  child: _DailyNoteSection(
                                    data: _sections[i],
                                    controller: _controllers[i],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: compact ? 14 : 24,
                bottom: compact ? 14 : 22,
                child: _CoffeeCupExitButton(
                  assetPath: _exitCup,
                  onTap: () => Navigator.of(context).maybePop(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DailyNoteHeader extends StatelessWidget {
  const _DailyNoteHeader({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 16 : 20),
      decoration: BoxDecoration(
        color: const Color(0xFF140B07).withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.44),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB36C).withValues(alpha: 0.14),
            blurRadius: 26,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD98A).withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.edit_note_rounded,
                  color: Color(0xFFFFD98A),
                  size: 27,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Owner Daily Note',
                  style: TextStyle(
                    color: Color(0xFFFFE7B2),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'A warm local scratchpad for today\'s creative operations. Nothing is saved to Firebase, Firestore, Storage, or any account vault.',
            style: TextStyle(
              color: Color(0xFFE8C77B),
              fontSize: 13,
              height: 1.45,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyNoteSection extends StatelessWidget {
  const _DailyNoteSection({
    required this.data,
    required this.controller,
  });

  final _DailyNoteSectionData data;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF100906).withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: data.accent.withValues(alpha: 0.40)),
        boxShadow: [
          BoxShadow(
            color: data.accent.withValues(alpha: 0.10),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(data.icon, color: data.accent, size: 23),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  data.title,
                  style: const TextStyle(
                    color: Color(0xFFFFE7B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            minLines: 4,
            maxLines: 8,
            style: const TextStyle(
              color: Color(0xFFFFF3D0),
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: data.accent,
            decoration: InputDecoration(
              hintText: data.hint,
              hintStyle: TextStyle(
                color: const Color(0xFFFFE7B2).withValues(alpha: 0.46),
                fontSize: 12,
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
              filled: true,
              fillColor: Colors.black.withValues(alpha: 0.22),
              contentPadding: const EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: data.accent.withValues(alpha: 0.22),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: data.accent, width: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CoffeeCupExitButton extends StatefulWidget {
  const _CoffeeCupExitButton({
    required this.assetPath,
    required this.onTap,
  });

  final String assetPath;
  final VoidCallback onTap;

  @override
  State<_CoffeeCupExitButton> createState() => _CoffeeCupExitButtonState();
}

class _CoffeeCupExitButtonState extends State<_CoffeeCupExitButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.05 : 1,
        duration: const Duration(milliseconds: 150),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: widget.onTap,
          child: Container(
            width: 58,
            height: 58,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1D1009).withValues(alpha: 0.82),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFFD98A).withValues(alpha: 0.56),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFB36C).withValues(alpha: 0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Image.asset(widget.assetPath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

class _DailyNoteSectionData {
  const _DailyNoteSectionData({
    required this.title,
    required this.hint,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String hint;
  final IconData icon;
  final Color accent;
}

class _ArchiveExplorerCard extends StatelessWidget {
  const _ArchiveExplorerCard();

  @override
  Widget build(BuildContext context) {
    return _OperationsRoomCard(
      title: 'Archive Explorer',
      subtitle: 'Operational memory and archive review',
      icon: Icons.inventory_2_outlined,
      accent: const Color(0xFFFFD98A),
      background: const Color(0xFF120B05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardBodyText(
            'Open the existing archive explorer without changing its route, behavior, or governance.',
          ),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: () => Navigator.of(context).pushNamed(
              Routes.commercialAdminArchive,
            ),
            icon: const Icon(Icons.archive_outlined),
            label: const Text('Open Archive Explorer'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFFFD98A),
              foregroundColor: const Color(0xFF221203),
              textStyle: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkCollectionCard extends StatelessWidget {
  const _LinkCollectionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.background,
    required this.rows,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final Color background;
  final List<_AdminLinkRowData> rows;

  @override
  Widget build(BuildContext context) {
    return _OperationsRoomCard(
      title: title,
      subtitle: subtitle,
      icon: icon,
      accent: accent,
      background: background,
      child: Column(
        children: [
          for (final row in rows) _AdminLinkRow(data: row, accent: accent),
        ],
      ),
    );
  }
}

class _GroupedLinkCollectionCard extends StatelessWidget {
  const _GroupedLinkCollectionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.background,
    required this.groups,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final Color background;
  final List<_AdminLinkGroupData> groups;

  @override
  Widget build(BuildContext context) {
    return _OperationsRoomCard(
      title: title,
      subtitle: subtitle,
      icon: icon,
      accent: accent,
      background: background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardBodyText(
            'Discovery-only resources. No diagnosis, treatment endorsement, or medical claim is implied.',
          ),
          const SizedBox(height: 12),
          for (final group in groups) ...[
            Row(
              children: [
                Icon(group.icon, color: accent, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    group.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFFFE7B2),
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            for (final row in group.rows)
              _AdminLinkRow(data: row, accent: accent),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _OperationsRoomCard extends StatelessWidget {
  const _OperationsRoomCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.background,
    required this.child,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final Color background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 360),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.50), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.16),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accent.withValues(alpha: 0.32)),
                ),
                child: Icon(icon, color: accent, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFFFE7B2),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFFFFE7B2).withValues(alpha: 0.72),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _AdminLinkRow extends StatefulWidget {
  const _AdminLinkRow({required this.data, required this.accent});

  final _AdminLinkRowData data;
  final Color accent;

  @override
  State<_AdminLinkRow> createState() => _AdminLinkRowState();
}

class _AdminLinkRowState extends State<_AdminLinkRow> {
  bool _hovered = false;

  bool get _enabled => widget.data.url != null;

  @override
  Widget build(BuildContext context) {
    final color = _enabled
        ? const Color(0xFFFFF0C9)
        : const Color(0xFFFFF0C9).withValues(alpha: 0.42);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        onEnter: (_) {
          if (_enabled) setState(() => _hovered = true);
        },
        onExit: (_) {
          if (_enabled) setState(() => _hovered = false);
        },
        child: AnimatedScale(
          scale: _hovered ? 1.01 : 1,
          duration: const Duration(milliseconds: 140),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: _enabled
                ? () => _openExternal(context, widget.data.url!)
                : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: _enabled ? 0.075 : 0.035),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: widget.accent.withValues(
                    alpha: _hovered ? 0.46 : 0.18,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    widget.data.icon,
                    color: _enabled
                        ? widget.accent
                        : widget.accent.withValues(alpha: 0.42),
                    size: 21,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: color,
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.data.purpose,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: color.withValues(alpha: 0.70),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _enabled ? widget.data.code : 'URL_PENDING',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color.withValues(alpha: 0.72),
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardBodyText extends StatelessWidget {
  const _CardBodyText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFFFFE7B2).withValues(alpha: 0.76),
        fontSize: 12,
        height: 1.4,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _AdminLinkRowData {
  const _AdminLinkRowData({
    required this.code,
    required this.label,
    required this.purpose,
    required this.owner,
    required this.status,
    required this.icon,
    this.url,
  });

  final String code;
  final String label;
  final String purpose;
  final String owner;
  final String status;
  final IconData icon;
  final String? url;
}

class _AdminLinkGroupData {
  const _AdminLinkGroupData({
    required this.title,
    required this.icon,
    required this.rows,
  });

  final String title;
  final IconData icon;
  final List<_AdminLinkRowData> rows;
}

class _SectionShortcutData {
  const _SectionShortcutData({
    required this.code,
    required this.purpose,
    required this.icon,
    required this.accent,
    required this.background,
    this.route,
  });

  final String code;
  final String purpose;
  final IconData icon;
  final Color accent;
  final Color background;
  final String? route;
}

const List<_SectionShortcutData> _sectionShortcuts = [
  _SectionShortcutData(
    code: 'SEC-LIB',
    purpose: 'Library Display',
    icon: Icons.local_library_outlined,
    accent: Color(0xFF95E3FF),
    background: Color(0xFF071821),
    route: Routes.webLibrary,
  ),
  _SectionShortcutData(
    code: 'SEC-RES',
    purpose: 'Client Room',
    icon: Icons.meeting_room_outlined,
    accent: Color(0xFFFFC978),
    background: Color(0xFF241007),
    route: Routes.clientRoom,
  ),
  _SectionShortcutData(
    code: 'SEC-LIB-SP',
    purpose: 'Library Specialists',
    icon: Icons.badge_outlined,
    accent: Color(0xFFA8E6A1),
    background: Color(0xFF0B1E12),
    route: Routes.libraryProviderSpecialists,
  ),
  _SectionShortcutData(
    code: 'SEC-LIB-CTR',
    purpose: 'Library Centers',
    icon: Icons.apartment_outlined,
    accent: Color(0xFFBCA7FF),
    background: Color(0xFF151127),
    route: Routes.libraryProviderCenters,
  ),
  _SectionShortcutData(
    code: 'SEC-CV2',
    purpose: 'Commercial V2 Showcase',
    icon: Icons.web_asset_outlined,
    accent: Color(0xFFFF9DB6),
    background: Color(0xFF260C16),
    route: Routes.commercialV2Web,
  ),
];

Future<void> _openExternal(BuildContext context, String url) async {
  final opened = await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  );
  if (!opened && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open this link right now.')),
    );
  }
}

const List<_AdminLinkRowData> _adminToolRows = [
  _AdminLinkRowData(
      code: 'TOOL-CANVA',
      label: 'Canva',
      purpose: 'Design publishing assets',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.palette_outlined,
      url: 'https://www.canva.com/'),
  _AdminLinkRowData(
      code: 'TOOL-CHATGPT',
      label: 'ChatGPT',
      purpose: 'Drafting and creative assistance',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.auto_awesome_rounded,
      url: 'https://chatgpt.com/'),
  _AdminLinkRowData(
      code: 'TOOL-GEMINI',
      label: 'Gemini',
      purpose: 'Creative AI review',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.diamond_outlined,
      url: 'https://gemini.google.com/'),
  _AdminLinkRowData(
      code: 'TOOL-GOOGLE-AI-STUDIO',
      label: 'Google AI Studio',
      purpose: 'AI prompt experiments',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.science_outlined,
      url: 'https://aistudio.google.com/'),
  _AdminLinkRowData(
      code: 'TOOL-FIGMA',
      label: 'Figma',
      purpose: 'Design inspection',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.design_services_outlined,
      url: 'https://www.figma.com/'),
  _AdminLinkRowData(
      code: 'TOOL-CAPCUT',
      label: 'CapCut',
      purpose: 'Short video editing',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.movie_creation_outlined,
      url: 'https://www.capcut.com/'),
  _AdminLinkRowData(
      code: 'TOOL-ADOBE-EXPRESS',
      label: 'Adobe Express',
      purpose: 'Quick brand assets',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.brush_outlined,
      url: 'https://www.adobe.com/express/'),
  _AdminLinkRowData(
      code: 'TOOL-MS-DESIGNER',
      label: 'Microsoft Designer',
      purpose: 'Generated design drafts',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.dashboard_customize_outlined,
      url: 'https://designer.microsoft.com/'),
  _AdminLinkRowData(
      code: 'TOOL-YOUTUBE-STUDIO',
      label: 'YouTube Studio',
      purpose: 'Video channel review',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.video_library_outlined,
      url: 'https://studio.youtube.com/'),
  _AdminLinkRowData(
      code: 'TOOL-META-BUSINESS',
      label: 'Meta Business Suite',
      purpose: 'Meta account publishing review',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.business_center_outlined,
      url: 'https://business.facebook.com/'),
  _AdminLinkRowData(
      code: 'TOOL-GOOGLE-DRIVE',
      label: 'Google Drive',
      purpose: 'Creative file workspace',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.cloud_outlined,
      url: 'https://drive.google.com/'),
  _AdminLinkRowData(
      code: 'TOOL-GOOGLE-DOCS',
      label: 'Google Docs',
      purpose: 'Drafting workspace',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.description_outlined,
      url: 'https://docs.google.com/'),
  _AdminLinkRowData(
      code: 'TOOL-GOOGLE-SHEETS',
      label: 'Google Sheets',
      purpose: 'Planning sheets',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.table_chart_outlined,
      url: 'https://sheets.google.com/'),
];

const List<_AdminLinkGroupData> _supportGroups = [
  _AdminLinkGroupData(
      title: 'Mental Health',
      icon: Icons.favorite_border_rounded,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-EGY-MOHP',
            label: 'Egypt Ministry of Health',
            purpose: 'Official health information discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.account_balance_outlined,
            url: 'https://www.mohp.gov.eg/'),
        _AdminLinkRowData(
            code: 'SUP-EGY-MENTAL-HEALTH',
            label: 'Egypt Mental Health Secretariat',
            purpose: 'Official mental health resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.local_hospital_outlined,
            url: 'https://mentalhealth.mohp.gov.eg/'),
      ]),
  _AdminLinkGroupData(
      title: 'Addiction Recovery',
      icon: Icons.spa_outlined,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-REC-NA',
            label: 'Narcotics Anonymous',
            purpose: 'Recovery fellowship information',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.eco_outlined,
            url: 'https://www.na.org/'),
        _AdminLinkRowData(
            code: 'SUP-REC-AA',
            label: 'Alcoholics Anonymous',
            purpose: 'Recovery fellowship information',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.groups_outlined,
            url: 'https://www.aa.org/'),
        _AdminLinkRowData(
            code: 'SUP-REC-SAMHSA',
            label: 'SAMHSA Find Support',
            purpose: 'Support information discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.info_outline,
            url: 'https://www.samhsa.gov/find-support'),
      ]),
  _AdminLinkGroupData(
      title: 'Family',
      icon: Icons.family_restroom_outlined,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-FAM-UNICEF',
            label: 'UNICEF Parenting',
            purpose: 'Family resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.child_care_outlined,
            url: 'https://www.unicef.org/parenting/ar'),
        _AdminLinkRowData(
            code: 'SUP-FAM-NCCM',
            label: 'Egypt NCCM',
            purpose: 'Child and family official resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.verified_user_outlined,
            url: 'https://www.nccm.gov.eg/'),
      ]),
  _AdminLinkGroupData(
      title: 'Accessibility',
      icon: Icons.accessibility_new_outlined,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-ACC-NCPD',
            label: 'Egypt NCPD',
            purpose: 'Disability and accessibility official resource',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.accessible_forward_outlined,
            url: 'https://ncpd.org.eg/'),
        _AdminLinkRowData(
            code: 'SUP-ACC-WAI',
            label: 'W3C WAI',
            purpose: 'Web accessibility knowledge',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.public_outlined,
            url: 'https://www.w3.org/WAI/'),
      ]),
  _AdminLinkGroupData(
      title: 'Deaf / Mute / Blind Support',
      icon: Icons.hearing_outlined,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-DEAF-WFD',
            label: 'World Federation of the Deaf',
            purpose: 'Deaf community resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.sign_language_outlined,
            url: 'https://wfdeaf.org/'),
        _AdminLinkRowData(
            code: 'SUP-BLIND-WBU',
            label: 'World Blind Union',
            purpose: 'Blind community resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.visibility_outlined,
            url: 'https://worldblindunion.org/'),
        _AdminLinkRowData(
            code: 'SUP-BLIND-NVDA',
            label: 'NV Access',
            purpose: 'Screen reader resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.record_voice_over_outlined,
            url: 'https://www.nvaccess.org/'),
      ]),
  _AdminLinkGroupData(
      title: 'NGOs',
      icon: Icons.volunteer_activism_outlined,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-NGO-UNICEF',
            label: 'UNICEF',
            purpose: 'Civil society and child support resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.public_outlined,
            url: 'https://www.unicef.org/'),
        _AdminLinkRowData(
            code: 'SUP-NGO-IFRC',
            label: 'IFRC',
            purpose: 'Humanitarian network discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.handshake_outlined,
            url: 'https://www.ifrc.org/'),
      ]),
  _AdminLinkGroupData(
      title: 'Innovation',
      icon: Icons.lightbulb_outline,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-INN-MAHARATECH',
            label: 'Mahara-Tech',
            purpose: 'Skills and innovation learning discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.school_outlined,
            url: 'https://maharatech.gov.eg/'),
        _AdminLinkRowData(
            code: 'SUP-INN-EDRAAK',
            label: 'Edraak',
            purpose: 'Learning and community skill discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.menu_book_outlined,
            url: 'https://www.edraak.org/'),
      ]),
  _AdminLinkGroupData(
      title: 'Funding',
      icon: Icons.account_balance_wallet_outlined,
      rows: [
        _AdminLinkRowData(
            code: 'SUP-FUND-UNDP',
            label: 'UNDP',
            purpose: 'Partnership and development opportunity discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.language_outlined,
            url: 'https://www.undp.org/'),
        _AdminLinkRowData(
            code: 'SUP-FUND-WORLD-BANK',
            label: 'World Bank Health',
            purpose: 'Funding and health development resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.account_balance_outlined,
            url: 'https://www.worldbank.org/en/topic/health'),
        _AdminLinkRowData(
            code: 'SUP-FUND-EU-HEALTH',
            label: 'EU Health',
            purpose: 'Opportunity and policy resource discovery',
            owner: 'Owner Review',
            status: 'DISCOVERY_ONLY',
            icon: Icons.travel_explore_outlined,
            url: 'https://health.ec.europa.eu/'),
      ]),
];

const List<_AdminLinkRowData> _officialAccountRows = [
  _AdminLinkRowData(
      code: 'ACC-WEBSITE',
      label: 'Website',
      purpose: 'Official public website',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.language_rounded,
      url: 'https://mental-smile-platform.web.app'),
  _AdminLinkRowData(
      code: 'ACC-FACEBOOK',
      label: 'Facebook',
      purpose: 'Official social presence',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.facebook_rounded,
      url: 'https://www.facebook.com/MentalSmileOrg'),
  _AdminLinkRowData(
      code: 'ACC-INSTAGRAM',
      label: 'Instagram',
      purpose: 'Official visual presence',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.photo_camera_rounded,
      url: 'https://instagram.com/mentalsmile.platform'),
  _AdminLinkRowData(
      code: 'ACC-YOUTUBE',
      label: 'YouTube',
      purpose: 'Official video channel',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.play_circle_outline_rounded,
      url: 'https://www.youtube.com/@MentalSmileOs'),
  _AdminLinkRowData(
      code: 'ACC-TIKTOK',
      label: 'TikTok',
      purpose: 'Official short video presence',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.music_note_rounded,
      url: 'https://www.tiktok.com/@mentalsmileorg'),
  _AdminLinkRowData(
      code: 'ACC-X',
      label: 'X / Twitter',
      purpose: 'Official updates channel',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.alternate_email_rounded,
      url: 'https://x.com/MentaSmileorg'),
  _AdminLinkRowData(
      code: 'ACC-LINKEDIN',
      label: 'LinkedIn',
      purpose: 'Official professional presence',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.business_center_rounded,
      url: 'https://www.linkedin.com/company/mentalsmileorg'),
  _AdminLinkRowData(
      code: 'ACC-WHATSAPP',
      label: 'WhatsApp / Phone',
      purpose: 'Official contact channel',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.chat_rounded,
      url: 'https://wa.me/201014116531'),
  _AdminLinkRowData(
      code: 'ACC-TELEGRAM',
      label: 'Telegram',
      purpose: 'Official community channel',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.send_rounded,
      url: 'https://t.me/MentalSmileOrg'),
  _AdminLinkRowData(
      code: 'ACC-GITHUB',
      label: 'GitHub',
      purpose: 'Public-facing repository',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.code_rounded,
      url: 'https://github.com/kingbasbosa-beep/mental-smile-os'),
  _AdminLinkRowData(
      code: 'ACC-EMAIL',
      label: 'Email',
      purpose: 'Public-facing email',
      owner: 'Owner',
      status: 'ACTIVE',
      icon: Icons.mail_outline_rounded,
      url: 'mailto:mentalsmile.platform@gmail.com'),
];
