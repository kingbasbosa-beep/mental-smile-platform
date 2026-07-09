import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/data/block_2_snapshot_data.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/presentation/widgets/block_2_governance_widgets.dart';

class Block2GuidesDashboardPage extends StatefulWidget {
  const Block2GuidesDashboardPage({super.key});

  @override
  State<Block2GuidesDashboardPage> createState() =>
      _Block2GuidesDashboardPageState();
}

class _Block2GuidesDashboardPageState extends State<Block2GuidesDashboardPage> {
  String _query = '';
  String _status = 'All';
  String _type = 'All';
  String _owner = 'All';
  Block2GuideEntry? _selected;

  List<Block2GuideEntry> get _items {
    return Block2SnapshotData.guideEntries.where((guide) {
      final statusOk = _status == 'All' || guide.status == _status;
      final typeOk = _type == 'All' || guide.type == _type;
      final ownerOk = _owner == 'All' || guide.owner == _owner;
      return statusOk && typeOk && ownerOk && guide.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final selected = _selected ?? (items.isNotEmpty ? items.first : null);
    final active = Block2SnapshotData.guideEntries
        .where((g) => g.status == 'Active')
        .length;
    final draft = Block2SnapshotData.guideEntries
        .where((g) => g.status == 'Draft')
        .length;
    final archived = Block2SnapshotData.guideEntries
        .where((g) => g.status == 'Archived')
        .length;
    final needsReview = Block2SnapshotData.guideEntries
        .where((g) => g.status == 'Needs Review')
        .length;
    final missingCards = Block2SnapshotData.guideEntries
        .where((g) => g.missingItems.contains('Missing cards'))
        .length;
    final missingRegistry = Block2SnapshotData.guideEntries
        .where((g) => g.missingItems.contains('Missing registry'))
        .length;
    final missingOperations = Block2SnapshotData.guideEntries
        .where((g) => g.missingItems.contains('Missing operation evidence'))
        .length;

    return Block2Shell(
      title: 'Guides Dashboard',
      subtitle: 'Governed Knowledge Objects',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              const Block2CounterCard(
                  label: 'Total Guides',
                  value: '${Block2SnapshotData.totalGuides}',
                  icon: Icons.menu_book),
              Block2CounterCard(
                  label: 'Active Guides',
                  value: '$active',
                  icon: Icons.verified),
              Block2CounterCard(
                  label: 'Draft Guides',
                  value: '$draft',
                  icon: Icons.edit_note),
              const Block2CounterCard(
                  label: 'Deprecated Guides', value: '0', icon: Icons.block),
              Block2CounterCard(
                  label: 'Archived Guides',
                  value: '$archived',
                  icon: Icons.archive),
              Block2CounterCard(
                  label: 'Needs Review',
                  value: '$needsReview',
                  icon: Icons.rate_review),
              const Block2CounterCard(
                  label: 'Missing Owner', value: '0', icon: Icons.person_off),
              Block2CounterCard(
                  label: 'Missing Cards',
                  value: '$missingCards',
                  icon: Icons.badge),
              Block2CounterCard(
                  label: 'Missing Registry',
                  value: '$missingRegistry',
                  icon: Icons.fact_check),
              Block2CounterCard(
                  label: 'Missing Operations',
                  value: '$missingOperations',
                  icon: Icons.history),
              const Block2CounterCard(
                  label: 'Coverage', value: '100%', icon: Icons.radar),
              const Block2CounterCard(
                  label: 'Completion', value: '71%', icon: Icons.task_alt),
            ],
          ),
          const SizedBox(height: 22),
          Block2SearchBar(
            hint:
                'Search by guide name, ID, section, owner, status, version, card, registry, operation',
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
                    'Needs Review',
                    'Deprecated'
                  ],
                  onChanged: (v) => setState(() => _status = v)),
              Block2Dropdown(
                  value: _type,
                  items: const <String>[
                    'All',
                    'Constitution Guide',
                    'Master Guide',
                    'Section Guide',
                    'Technical Guide',
                    'Runtime Guide',
                    'Card Guide',
                    'Registry Guide',
                    'Signal Guide',
                    'Localization Guide',
                    'Asset Guide',
                    'Prompt Guide',
                    'Marketing Guide',
                    'Content Guide',
                    'Infrastructure Guide',
                    'Archive Guide',
                    'Historical Guide'
                  ],
                  onChanged: (v) => setState(() => _type = v)),
              Block2Dropdown(
                  value: _owner,
                  items: const <String>[
                    'All',
                    'Residential',
                    'Commercial',
                    'Commercial V2 Web',
                    'Owner',
                    'Monitoring',
                    'Administration',
                    'Library',
                    'Archive',
                    'Governance',
                    'Operations',
                    'DNA',
                    'Unclassified'
                  ],
                  onChanged: (v) => setState(() => _owner = v)),
              const Block2StatusChip(label: 'Snapshot Source'),
              const Block2StatusChip(
                  label: 'Not Connected Yet sources are explicit'),
            ],
          ),
          const SizedBox(height: 22),
          if (items.isEmpty)
            const Block2EmptyState(
                message: 'No guides matched the current filters.')
          else
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: items.map((guide) {
                return Block2SectionCard(
                  title: guide.title,
                  subtitle: '${guide.section} · ${guide.version}',
                  status: guide.status,
                  health: guide.health,
                  onTap: () => setState(() => _selected = guide),
                );
              }).toList(),
            ),
          const SizedBox(height: 22),
          if (selected != null)
            Block2DetailTabs(
              title: selected.title,
              panels: <String, Widget>{
                'Overview':
                    _Lines(lines: <String>[selected.purpose, selected.path]),
                'Metadata': _Lines(lines: <String>[
                  'ID: ${selected.id}',
                  'Section: ${selected.section}',
                  'Owner: ${selected.owner}',
                  'Status: ${selected.status}',
                  'Version: ${selected.version}',
                  'Type: ${selected.type}'
                ]),
                'Related Cards': _Lines(
                    lines: <String>['Related cards: ${selected.relatedCards}']),
                'Related Registries': _Lines(lines: <String>[
                  'Related registries: ${selected.relatedRegistries}'
                ]),
                'Related Operations': _Lines(lines: <String>[
                  'Related operations: ${selected.relatedOperations}'
                ]),
                'Related Reports': const Block2NotConnectedState(),
                'Dependencies': Block2DependencyList(items: <String>[
                  selected.section,
                  'Cards',
                  'Registries',
                  'Operations'
                ]),
                'Health': Block2HealthPanel(
                    health: selected.health, completion: selected.completion),
                'Missing Items':
                    Block2MissingItemsPanel(items: selected.missingItems),
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
