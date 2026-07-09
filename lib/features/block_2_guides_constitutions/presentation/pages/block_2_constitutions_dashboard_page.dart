import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/data/block_2_snapshot_data.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/presentation/widgets/block_2_governance_widgets.dart';

class Block2ConstitutionsDashboardPage extends StatefulWidget {
  const Block2ConstitutionsDashboardPage({super.key});

  @override
  State<Block2ConstitutionsDashboardPage> createState() =>
      _Block2ConstitutionsDashboardPageState();
}

class _Block2ConstitutionsDashboardPageState
    extends State<Block2ConstitutionsDashboardPage> {
  String _query = '';
  String _status = 'All';
  String _section = 'All';
  Block2ConstitutionEntry? _selected;

  List<Block2ConstitutionEntry> get _items {
    return Block2SnapshotData.constitutionEntries.where((item) {
      final statusOk = _status == 'All' || item.status == _status;
      final sectionOk = _section == 'All' || item.section == _section;
      return statusOk && sectionOk && item.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final selected = _selected ?? (items.isNotEmpty ? items.first : null);
    final active = Block2SnapshotData.constitutionEntries
        .where((c) => c.status == 'Active')
        .length;
    final archived = Block2SnapshotData.constitutionEntries
        .where((c) => c.status == 'Archived')
        .length;
    final certified = Block2SnapshotData.constitutionEntries
        .where((c) => c.certified == 'YES')
        .length;
    final withoutCards = Block2SnapshotData.constitutionEntries
        .where((c) => c.relatedCards == 0)
        .length;
    final withoutGuides = Block2SnapshotData.constitutionEntries
        .where((c) => c.relatedGuides == 0)
        .length;

    return Block2Shell(
      title: 'Constitutions Dashboard',
      subtitle: 'Section Source-of-Truth Documents',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              const Block2CounterCard(
                  label: 'Total Constitutions',
                  value: '${Block2SnapshotData.totalConstitutions}',
                  icon: Icons.gavel),
              Block2CounterCard(
                  label: 'Active Constitutions',
                  value: '$active',
                  icon: Icons.verified),
              Block2CounterCard(
                  label: 'Certified',
                  value: '$certified',
                  icon: Icons.workspace_premium),
              const Block2CounterCard(
                  label: 'Draft', value: '0', icon: Icons.edit_note),
              Block2CounterCard(
                  label: 'Archived', value: '$archived', icon: Icons.archive),
              const Block2CounterCard(
                  label: 'Missing Sections',
                  value: '0',
                  icon: Icons.account_tree),
              const Block2CounterCard(
                  label: 'Sections Without Constitution',
                  value: '0',
                  icon: Icons.rule_folder),
              Block2CounterCard(
                  label: 'Without Cards',
                  value: '$withoutCards',
                  icon: Icons.badge),
              Block2CounterCard(
                  label: 'Without Guides',
                  value: '$withoutGuides',
                  icon: Icons.menu_book),
              const Block2CounterCard(
                  label: 'Coverage', value: '100%', icon: Icons.radar),
              const Block2CounterCard(
                  label: 'Compliance', value: '74%', icon: Icons.policy),
            ],
          ),
          const SizedBox(height: 22),
          Block2SearchBar(
            hint:
                'Search by constitution title, section, status, version, violation, keyword',
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: 14),
          Block2FilterPanel(
            children: <Widget>[
              Block2Dropdown(
                  value: _status,
                  items: const <String>[
                    'All',
                    'Active',
                    'Archived',
                    'Draft',
                    'Deprecated',
                    'Needs Review'
                  ],
                  onChanged: (v) => setState(() => _status = v)),
              Block2Dropdown(
                  value: _section,
                  items: const <String>[
                    'All',
                    'Residential',
                    'Commercial',
                    'Commercial V2 Web',
                    'Administration',
                    'Monitoring',
                    'Owner',
                    'Archive',
                    'Library',
                    'Governance',
                    'Operations',
                    'DNA',
                    'Unclassified'
                  ],
                  onChanged: (v) => setState(() => _section = v)),
            ],
          ),
          const SizedBox(height: 22),
          if (items.isEmpty)
            const Block2EmptyState(
                message: 'No constitutions matched the current filters.')
          else
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: items.map((constitution) {
                return Block2SectionCard(
                  title: constitution.title,
                  subtitle:
                      '${constitution.section} · Certified: ${constitution.certified}',
                  status: constitution.status,
                  health: constitution.health,
                  onTap: () => setState(() => _selected = constitution),
                );
              }).toList(),
            ),
          const SizedBox(height: 22),
          if (selected != null)
            Block2DetailTabs(
              title: selected.title,
              panels: <String, Widget>{
                'Overview': _Lines(lines: <String>[
                  selected.path,
                  'Section: ${selected.section}',
                  'Certified: ${selected.certified}'
                ]),
                'Rules': const Block2NotConnectedState(),
                'Governed Sections':
                    Block2DependencyList(items: selected.governedSections),
                'Related Guides': _Lines(lines: <String>[
                  'Related guides: ${selected.relatedGuides}'
                ]),
                'Related Cards': _Lines(
                    lines: <String>['Related cards: ${selected.relatedCards}']),
                'Related Registries': _Lines(lines: <String>[
                  'Related registries: ${selected.relatedRegistries}'
                ]),
                'Related Operations': _Lines(lines: <String>[
                  'Related operations: ${selected.relatedOperations}'
                ]),
                'Violations':
                    Block2MissingItemsPanel(items: selected.violations),
                'Compliance': Block2HealthPanel(
                    health: selected.health,
                    completion: selected.completion,
                    compliance: selected.health),
                'Missing Items':
                    Block2MissingItemsPanel(items: selected.violations),
                'Timeline': Block2TimelinePanel(items: <String>[
                  'Snapshot generated: ${Block2SnapshotData.generatedAt}',
                  'Last updated: ${selected.lastUpdated}'
                ]),
              },
            ),
        ],
      ),
    );
  }
}

class _Lines extends StatelessWidget {
  const _Lines({required this.lines});
  final List<String> lines;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: lines
          .map((line) => Text('• $line',
              style: const TextStyle(color: block2GoldSoft, height: 1.5)))
          .toList(),
    );
  }
}
