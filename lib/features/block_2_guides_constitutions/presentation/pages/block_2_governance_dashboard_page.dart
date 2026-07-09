import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/data/block_2_snapshot_data.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/presentation/widgets/block_2_governance_widgets.dart';

class Block2GovernanceDashboardPage extends StatefulWidget {
  const Block2GovernanceDashboardPage({super.key});

  @override
  State<Block2GovernanceDashboardPage> createState() =>
      _Block2GovernanceDashboardPageState();
}

class _Block2GovernanceDashboardPageState
    extends State<Block2GovernanceDashboardPage> {
  String _query = '';
  String _area = 'All';
  String _severity = 'All';
  String _status = 'All';

  List<Block2GovernanceFinding> get _items {
    return Block2SnapshotData.governanceFindings.where((finding) {
      final areaOk = _area == 'All' || finding.area == _area;
      final severityOk = _severity == 'All' || finding.severity == _severity;
      final statusOk = _status == 'All' || finding.status == _status;
      return areaOk && severityOk && statusOk && finding.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final existing = Block2SnapshotData.governanceFindings
        .where((f) => f.status == 'Existing')
        .length;
    final missing = Block2SnapshotData.governanceFindings
        .where((f) => f.status == 'Missing')
        .length;

    return Block2Shell(
      title: 'Governance Dashboard',
      subtitle: 'System Governance Health',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              const Block2CounterCard(
                  label: 'Total Sections',
                  value: '17',
                  icon: Icons.account_tree),
              const Block2CounterCard(
                  label: 'Sections With Constitution',
                  value: '${Block2SnapshotData.totalConstitutions}',
                  icon: Icons.gavel),
              const Block2CounterCard(
                  label: 'Sections With Guide',
                  value: '${Block2SnapshotData.totalGuides}',
                  icon: Icons.menu_book),
              const Block2CounterCard(
                  label: 'Sections With Cards',
                  value: '${Block2SnapshotData.totalCards}',
                  icon: Icons.badge),
              const Block2CounterCard(
                  label: 'Sections With Registry',
                  value: '${Block2SnapshotData.totalRegistries}',
                  icon: Icons.fact_check),
              const Block2CounterCard(
                  label: 'Sections With Operations',
                  value: '${Block2SnapshotData.totalOperations}',
                  icon: Icons.history),
              Block2CounterCard(
                  label: 'Missing Governance',
                  value: '$missing',
                  icon: Icons.warning),
              Block2CounterCard(
                  label: 'Existing Areas',
                  value: '$existing',
                  icon: Icons.verified),
              const Block2CounterCard(
                  label: 'Governance Coverage',
                  value: '94%',
                  icon: Icons.radar),
              const Block2CounterCard(
                  label: 'Compliance', value: '72%', icon: Icons.policy),
            ],
          ),
          const SizedBox(height: 22),
          Block2SearchBar(
            hint:
                'Search by section, document, card, registry, operation, finding, violation, keyword',
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: 14),
          Block2FilterPanel(
            children: <Widget>[
              Block2Dropdown(
                  value: _area,
                  items: const <String>[
                    'All',
                    'Sections',
                    'Guides',
                    'Constitutions',
                    'Cards',
                    'Registries',
                    'Operations',
                    'Reports',
                    'Snapshots',
                    'DNA',
                    'Capsules',
                    'Signals',
                    'Collections',
                    'Routes',
                    'Assets',
                    'Localization',
                    'Prompts',
                    'Graveyard'
                  ],
                  onChanged: (v) => setState(() => _area = v)),
              Block2Dropdown(
                  value: _severity,
                  items: const <String>[
                    'All',
                    'Critical',
                    'High',
                    'Medium',
                    'Low',
                    'Info'
                  ],
                  onChanged: (v) => setState(() => _severity = v)),
              Block2Dropdown(
                  value: _status,
                  items: const <String>['All', 'Existing', 'Missing'],
                  onChanged: (v) => setState(() => _status = v)),
              const Block2StatusChip(label: 'Legacy risk checks visible'),
            ],
          ),
          const SizedBox(height: 22),
          if (items.isEmpty)
            const Block2EmptyState(
                message: 'No governance finding matched the current filters.')
          else
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: items.map((finding) {
                return Block2SectionCard(
                  title: finding.area,
                  subtitle: finding.finding,
                  status: '${finding.status} · ${finding.severity}',
                  health: finding.compliance,
                  onTap: () {},
                );
              }).toList(),
            ),
          const SizedBox(height: 22),
          Block2DetailTabs(
            title: 'Governance Health Checks',
            panels: <String, Widget>{
              'Missing Items': Block2MissingItemsPanel(
                  items: items
                      .where((f) => f.status == 'Missing')
                      .map((f) => '${f.area}: ${f.missingType}')
                      .toList()),
              'Not Connected Yet Sources': Block2MissingItemsPanel(
                  items: items
                      .where((f) => f.missingType == 'Not Connected Yet')
                      .map((f) => f.area)
                      .toList()),
              'Dependencies': const Block2DependencyList(items: <String>[
                'Sections',
                'Constitutions',
                'Guides',
                'Cards',
                'Registries',
                'Operations',
                'Reports'
              ]),
              'Timeline': const Block2TimelinePanel(
                  items: <String>['Snapshot generated: 2026-06-29']),
            },
          ),
        ],
      ),
    );
  }
}
