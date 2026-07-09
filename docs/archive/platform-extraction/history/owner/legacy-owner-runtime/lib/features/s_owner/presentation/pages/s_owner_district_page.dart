import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';

enum SOwnerDistrictFocus {
  overview,
  ownerRoom,
  executiveIntelligence,
}

// [S] Owner District Package
// Construction Era placeholder. No Firebase writes.
class SOwnerDistrictPage extends StatelessWidget {
  const SOwnerDistrictPage({
    super.key,
    this.focus = SOwnerDistrictFocus.overview,
  });

  final SOwnerDistrictFocus focus;

  @override
  Widget build(BuildContext context) {
    final panels = _panelsForFocus(focus);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FB),
      appBar: AppBar(
        title: const Text('Emergency Owner Room | غرفة المالك الاحتياطية'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF172033),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const _OwnerHero(),
                  const SizedBox(height: 18),
                  const _OwnerNavigation(),
                  const SizedBox(height: 18),
                  const _OwnerOverviewCard(),
                  const SizedBox(height: 18),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth >= 900;
                      if (!isWide) {
                        return Column(
                          children: panels
                              .map(
                                (panel) => Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: panel,
                                ),
                              )
                              .toList(growable: false),
                        );
                      }
                      return Wrap(
                        spacing: 14,
                        runSpacing: 14,
                        children: panels
                            .map(
                              (panel) => SizedBox(
                                width: (constraints.maxWidth - 14) / 2,
                                child: panel,
                              ),
                            )
                            .toList(growable: false),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  const _OwnerDoctrineFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static List<Widget> _panelsForFocus(SOwnerDistrictFocus focus) {
    switch (focus) {
      case SOwnerDistrictFocus.ownerRoom:
        return <Widget>[const _OwnerRoomPanel()];
      case SOwnerDistrictFocus.executiveIntelligence:
        return const <Widget>[_ExecutiveIntelligencePanel()];
      case SOwnerDistrictFocus.overview:
        return const <Widget>[
          _OwnerRoomPanel(),
          _ExecutiveIntelligencePanel(),
        ];
    }
  }
}

class _OwnerHero extends StatelessWidget {
  const _OwnerHero();

  @override
  Widget build(BuildContext context) {
    return const _OwnerCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Stamp(text: 'Emergency Owner Room | غرفة المالك الاحتياطية'),
          SizedBox(height: 14),
          Text(
            'Emergency Owner Room',
            style: TextStyle(
              color: Color(0xFF172033),
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Fallback owner access for emergency continuity. The active visual '
            'Owner Operational Room is the primary operational gateway.',
            style: TextStyle(
              color: Color(0xFF40506A),
              fontSize: 16,
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _OwnerNavigation extends StatelessWidget {
  const _OwnerNavigation();

  static const _items = <_NavItem>[
    _NavItem('Overview', Routes.sOwnerHome),
    _NavItem('Emergency Owner Room', Routes.sOwnerRoom),
    _NavItem('Executive Intelligence', Routes.sSovereignIntelligence),
    _NavItem('Construction Workbench', Routes.ownerConstructionWorkbench),
  ];

  @override
  Widget build(BuildContext context) {
    return _OwnerCard(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _items
            .map(
              (item) => OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed(item.route),
                child: Text(item.label),
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class _OwnerOverviewCard extends StatelessWidget {
  const _OwnerOverviewCard();

  @override
  Widget build(BuildContext context) {
    return const _OwnerCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _SectionTitle(
            title: '[S] Owner Overview',
            subtitle:
                'Placeholder survival visibility for the whole federation.',
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              _StatusPill(label: 'City Status', value: 'Placeholder'),
              _StatusPill(label: 'Capital Status', value: 'Placeholder'),
              _StatusPill(label: 'Direction Status', value: 'Placeholder'),
              _StatusPill(label: 'Coordination Status', value: 'Placeholder'),
            ],
          ),
        ],
      ),
    );
  }
}

class _OwnerRoomPanel extends StatelessWidget {
  const _OwnerRoomPanel();

  @override
  Widget build(BuildContext context) {
    return _OwnerCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const _SectionTitle(
            title: '[S] Owner Room',
            subtitle:
                'Central operational gateway. Owner sees and routes; departments remain separate.',
          ),
          const SizedBox(height: 16),
          _StrategicScreenButton(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.sSovereignIntelligence,
            ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 760;
              final width = isWide ? (constraints.maxWidth - 12) / 2 : null;
              final cards = <Widget>[
                _OperationalGatewayCard(
                  title: 'Archive',
                  subtitle: 'Certified memory and historical records.',
                  icon: Icons.archive_outlined,
                  route: Routes.ownerArchiveRoom,
                ),
                _OperationalGatewayCard(
                  title: 'Marketing & Media',
                  subtitle: 'Media visibility and future publication work.',
                  icon: Icons.campaign_outlined,
                  route: Routes.ownerMarketingMediaRoom,
                ),
                _OperationalGatewayCard(
                  title: 'Technical & Maintenance',
                  subtitle: 'Technical reliability and maintenance view.',
                  icon: Icons.construction_outlined,
                  route: Routes.technicalMaintenanceRoom,
                ),
                _OperationalGatewayCard(
                  title: 'Accounting',
                  subtitle: 'Financial visibility and records destination.',
                  icon: Icons.account_balance_wallet_outlined,
                  route: Routes.accountingRoom,
                ),
                _OperationalGatewayCard(
                  title: 'Legal',
                  subtitle: 'Policy, compliance, and risk review visibility.',
                  icon: Icons.gavel_outlined,
                  route: Routes.legalRoom,
                ),
              ];

              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (final card in cards)
                    SizedBox(
                      width: width,
                      child: card,
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          const _LabelRow(
            title: 'Authority Boundary',
            values: <String>[
              'Owner routes',
              'Departments operate separately',
              'Monitoring observes',
              'Archive remembers',
              'No Firebase mutation',
              'No business logic',
            ],
          ),
        ],
      ),
    );
  }
}

class _StrategicScreenButton extends StatelessWidget {
  const _StrategicScreenButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF172033),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF2A3852)),
        ),
        child: const Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.tv_outlined,
                color: Colors.white,
                size: 34,
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Strategic Screen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Opens the existing Executive Intelligence section.',
                      style: TextStyle(
                        color: Color(0xFFDCE5F5),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OperationalGatewayCard extends StatelessWidget {
  const _OperationalGatewayCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => Navigator.of(context).pushNamed(route),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE1E5EE)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF5630A6), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF172033),
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF667085),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xFF667085),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExecutiveIntelligencePanel extends StatelessWidget {
  const _ExecutiveIntelligencePanel();

  @override
  Widget build(BuildContext context) {
    return const _DistrictCard(
      title: '[S] Executive Intelligence',
      subtitle:
          'Strategic summary placeholders. Intelligence informs; it does not decide.',
      groups: <_DistrictGroup>[
        _DistrictGroup('AI Strategic Summary', <String>[
          'AI summary placeholder',
          'AI does not decide',
        ]),
        _DistrictGroup('Signal-First Intelligence', <String>[
          'Aggregated signal trends',
          'Gap detection summaries',
          'Expansion opportunity notes',
        ]),
        _DistrictGroup('Human Strategic Summary', <String>[
          'Human summary placeholder',
        ]),
        _DistrictGroup('Department Summary', <String>[
          'Department summary placeholder',
        ]),
        _DistrictGroup('Federation Summary', <String>[
          'Federation summary placeholder',
        ]),
      ],
    );
  }
}

class _DistrictCard extends StatelessWidget {
  const _DistrictCard({
    required this.title,
    required this.subtitle,
    required this.groups,
  });

  final String title;
  final String subtitle;
  final List<_DistrictGroup> groups;

  @override
  Widget build(BuildContext context) {
    return _OwnerCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _SectionTitle(title: title, subtitle: subtitle),
          const SizedBox(height: 14),
          for (final group in groups)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _LabelRow(title: group.title, values: group.values),
            ),
        ],
      ),
    );
  }
}

class _LabelRow extends StatelessWidget {
  const _LabelRow({
    required this.title,
    required this.values,
  });

  final String title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: _OwnerTextStyles.groupTitle),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: values
              .map((value) => _SignalBadge(label: value))
              .toList(growable: false),
        ),
      ],
    );
  }
}

class _OwnerDoctrineFooter extends StatelessWidget {
  const _OwnerDoctrineFooter();

  @override
  Widget build(BuildContext context) {
    return const _OwnerCard(
      child: Text(
        'The city grows. The rooms evolve. The signals guide. The intelligence '
        'learns. Departments serve. Owner sees the whole picture. Archive is '
        'a separate certified surface.',
        style: TextStyle(
          color: Color(0xFF40506A),
          fontSize: 15,
          fontWeight: FontWeight.w800,
          height: 1.4,
        ),
      ),
    );
  }
}

class _OwnerCard extends StatelessWidget {
  const _OwnerCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1E5EE)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: child,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF172033),
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF667085),
            fontWeight: FontWeight.w600,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}

class _SignalBadge extends StatelessWidget {
  const _SignalBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F0FF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE1D7FF)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF5630A6),
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1E5EE)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Text(
          '$label: $value',
          style: const TextStyle(
            color: Color(0xFF26324A),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _Stamp extends StatelessWidget {
  const _Stamp({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF172033),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}

class _DistrictGroup {
  const _DistrictGroup(this.title, this.values);

  final String title;
  final List<String> values;
}

class _NavItem {
  const _NavItem(this.label, this.route);

  final String label;
  final String route;
}

class _OwnerTextStyles {
  const _OwnerTextStyles._();

  static const TextStyle groupTitle = TextStyle(
    color: Color(0xFF172033),
    fontWeight: FontWeight.w800,
  );
}
