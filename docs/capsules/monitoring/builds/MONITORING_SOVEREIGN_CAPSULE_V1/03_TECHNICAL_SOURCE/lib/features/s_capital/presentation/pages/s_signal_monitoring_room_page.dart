import 'package:flutter/material.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

// [S] Monitoring & Intelligence Room Package
// Observability-only construction asset. No Firebase writes.
class SSignalMonitoringRoomPage extends StatelessWidget {
  const SSignalMonitoringRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FB),
      appBar: AppBar(
        title: Text(l10n.monitoringTitle),
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
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _ControlRoomHero(l10n: l10n),
                  const SizedBox(height: 18),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth >= 900;
                      final panels = <Widget>[
                        _SignalRegistryHall(l10n: l10n),
                        _AiIntelligenceTrack(l10n: l10n),
                        _HumanIntelligenceTrack(l10n: l10n),
                        _ReportsInbox(l10n: l10n),
                        _GapDetectionPanel(l10n: l10n),
                        _DepartmentDistributionBoard(l10n: l10n),
                      ];
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
                  const _DoctrineFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ControlRoomHero extends StatelessWidget {
  const _ControlRoomHero({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _ControlCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Stamp(text: l10n.monitoringTitle),
          const SizedBox(height: 14),
          const Text(
            'Aggregate. Analyze. Detect Gaps. Report.',
            style: TextStyle(
              color: Color(0xFF172033),
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.monitoringSubtitle,
            style: const TextStyle(
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

class _SignalRegistryHall extends StatelessWidget {
  const _SignalRegistryHall({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: l10n.monitoringSignalRegistryTitle,
      subtitle: 'Read-only registry visibility for governed signal families.',
      groups: const <_ControlGroup>[
        _ControlGroup('Signal Families', <String>[
          'Client Signals',
          'Provider Signals',
          'Center Signals',
          'Knowledge Signals',
          'Content Signals',
          'Trust Signals',
          'Continuity Signals',
          'System Signals',
        ]),
        _ControlGroup('Registry State', <String>[
          'Static readiness view',
          'No connected registry',
          'No write actions',
        ]),
      ],
    );
  }
}

class _AiIntelligenceTrack extends StatelessWidget {
  const _AiIntelligenceTrack({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: l10n.monitoringAiIntelligenceTitle,
      subtitle: 'AI analyzes. AI does not decide.',
      groups: const <_ControlGroup>[
        _ControlGroup('AI Observations', <String>[
          'AI Patterns',
          'AI Trends',
          'AI Anomalies',
        ]),
        _ControlGroup('AI Notes', <String>[
          'AI Risk Notes',
          'AI Opportunity Notes',
        ]),
      ],
    );
  }
}

class _HumanIntelligenceTrack extends StatelessWidget {
  const _HumanIntelligenceTrack({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: l10n.monitoringHumanIntelligenceTitle,
      subtitle: 'Humans interpret context. Policies govern decisions.',
      groups: const <_ControlGroup>[
        _ControlGroup('Human Context', <String>[
          'Human Review Notes',
          'Field Context',
          'Reality Validation',
        ]),
        _ControlGroup('Listening Inputs', <String>[
          'Monitoring Observations',
          'Listening Notes',
        ]),
      ],
    );
  }
}

class _ReportsInbox extends StatelessWidget {
  const _ReportsInbox({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: l10n.monitoringReportStreamTitle,
      subtitle: 'Incoming report readiness without aggregation runtime.',
      groups: const <_ControlGroup>[
        _ControlGroup('Incoming Reports', <String>[
          'Incoming Signal Reports',
          'Human Impact Reports',
          'Content Reports',
          'Provider Reports',
          'Organization Reports',
          'Technical Reports',
          'Partnership Reports',
          'Strategic Reports',
        ]),
      ],
    );
  }
}

class _GapDetectionPanel extends StatelessWidget {
  const _GapDetectionPanel({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: l10n.monitoringGapDetectionTitle,
      subtitle:
          'Detection visibility only. No decision or execution authority.',
      groups: const <_ControlGroup>[
        _ControlGroup('Detection Families', <String>[
          'Human impact gaps',
          'Content gaps',
          'Provider capability gaps',
          'Organization program gaps',
          'Technical risk patterns',
          'Partnership opportunities',
        ]),
      ],
    );
  }
}

class _DepartmentDistributionBoard extends StatelessWidget {
  const _DepartmentDistributionBoard({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: l10n.monitoringDepartmentBoardTitle,
      subtitle: 'Routing visibility only. Departments act outside this room.',
      groups: const <_ControlGroup>[
        _ControlGroup('Departments', <String>[
          'Human Impact',
          'Content',
          'Provider Operations',
          'Organization Operations',
          'Technical',
          'Partnerships',
          'Strategy',
        ]),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.groups,
  });

  final String title;
  final String subtitle;
  final List<_ControlGroup> groups;

  @override
  Widget build(BuildContext context) {
    return _ControlCard(
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
        Text(title, style: _ControlTextStyles.groupTitle),
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

class _DoctrineFooter extends StatelessWidget {
  const _DoctrineFooter();

  @override
  Widget build(BuildContext context) {
    return const _ControlCard(
      child: Text(
        'Monitoring observes. Intelligence aggregates. Departments serve. '
        'Owner receives aggregated intelligence. Archive remembers.',
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

class _ControlCard extends StatelessWidget {
  const _ControlCard({required this.child});

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
        color: const Color(0xFFF1F5FF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFD7E2FF)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF2547A0),
            fontSize: 12,
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

class _ControlGroup {
  const _ControlGroup(this.title, this.values);

  final String title;
  final List<String> values;
}

class _ControlTextStyles {
  const _ControlTextStyles._();

  static const TextStyle groupTitle = TextStyle(
    color: Color(0xFF172033),
    fontWeight: FontWeight.w800,
  );
}
