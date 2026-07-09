import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/data/block_3_card_kernel_snapshot_data.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/widgets/block_3_card_kernel_widgets.dart';

class Block3CardKernelDashboardPage extends StatefulWidget {
  const Block3CardKernelDashboardPage({super.key});
  @override
  State<Block3CardKernelDashboardPage> createState() =>
      _Block3CardKernelDashboardPageState();
}

class _Block3CardKernelDashboardPageState
    extends State<Block3CardKernelDashboardPage> {
  String _query = '';
  String _type = 'All';
  String _status = 'All';
  String _section = 'All';
  Block3CardEntry? _selected;

  List<Block3CardEntry> get _items {
    return Block3CardKernelSnapshotData.entries.where((card) {
      final typeOk = _type == 'All' || card.type == _type;
      final statusOk = _status == 'All' || card.status == _status;
      final sectionOk = _section == 'All' || card.section == _section;
      return typeOk && statusOk && sectionOk && card.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selected ?? (_items.isNotEmpty ? _items.first : null);
    return Block3Shell(
      title: 'Card Kernel Dashboard',
      subtitle: 'Core Knowledge Engine',
      actions: <Widget>[
        Block3Action(
            label: 'Registries',
            icon: Icons.fact_check,
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.commercialAdminCardRegistries)),
        const SizedBox(width: 8),
        Block3Action(
            label: 'Relations',
            icon: Icons.hub,
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.commercialAdminCardRelations)),
        const SizedBox(width: 8),
        Block3Action(
            label: 'Compliance',
            icon: Icons.verified_user,
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.commercialAdminCardCompliance)),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Counters(),
          const SizedBox(height: 22),
          Block3Search(
              hint:
                  'Search by card name, ID, section, registry, guide, constitution, owner, status',
              onChanged: (value) => setState(() => _query = value)),
          const SizedBox(height: 14),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              Block3Dropdown(
                  value: _type,
                  items: const <String>[
                    'All',
                    'Master',
                    'Ownership',
                    'Runtime',
                    'Registry',
                    'Signal',
                    'Gateway',
                    'Collection',
                    'Feature',
                    'Zone',
                    'Surface',
                    'Screen',
                    'Component',
                    'Localization',
                    'Asset',
                    'Prompt',
                    'Assessment',
                    'Tool',
                    'Metadata',
                    'Topology'
                  ],
                  onChanged: (v) => setState(() => _type = v)),
              Block3Dropdown(
                  value: _status,
                  items: const <String>[
                    'All',
                    'Active',
                    'Archived',
                    'Deprecated',
                    'Frozen',
                    'Draft'
                  ],
                  onChanged: (v) => setState(() => _status = v)),
              Block3Dropdown(
                  value: _section,
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
                    'Accessibility',
                    'Governance',
                    'Operations',
                    'DNA',
                    'Unclassified'
                  ],
                  onChanged: (v) => setState(() => _section = v)),
              const Block3StatusChip(label: 'DNA Lock enabled'),
              const Block3StatusChip(label: 'Live sources: Not Connected Yet'),
            ],
          ),
          const SizedBox(height: 22),
          if (_items.isEmpty)
            const Block3Empty(message: 'No cards matched the current filters.')
          else
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: _items
                  .map((card) => _CardTile(
                      card: card,
                      onTap: () => setState(() => _selected = card)))
                  .toList(),
            ),
          const SizedBox(height: 22),
          if (selected != null) _CardDetail(card: selected),
        ],
      ),
    );
  }
}

class _Counters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: <Widget>[
        Block3CounterCard(
            label: 'Total Cards',
            value: Block3CardKernelSnapshotData.totalCards.toString(),
            icon: Icons.badge),
        Block3CounterCard(
            label: 'Master',
            value: Block3CardKernelSnapshotData.masterCards.toString(),
            icon: Icons.workspace_premium),
        Block3CounterCard(
            label: 'Ownership',
            value: Block3CardKernelSnapshotData.ownershipCards.toString(),
            icon: Icons.verified_user),
        Block3CounterCard(
            label: 'Runtime',
            value: Block3CardKernelSnapshotData.runtimeCards.toString(),
            icon: Icons.memory),
        Block3CounterCard(
            label: 'Registry',
            value: Block3CardKernelSnapshotData.registryCards.toString(),
            icon: Icons.fact_check),
        Block3CounterCard(
            label: 'Signal',
            value: Block3CardKernelSnapshotData.signalCards.toString(),
            icon: Icons.sensors),
        Block3CounterCard(
            label: 'Collection',
            value: Block3CardKernelSnapshotData.collectionCards.toString(),
            icon: Icons.storage),
        Block3CounterCard(
            label: 'Gateway',
            value: Block3CardKernelSnapshotData.gatewayCards.toString(),
            icon: Icons.door_front_door),
        Block3CounterCard(
            label: 'Feature',
            value: Block3CardKernelSnapshotData.featureCards.toString(),
            icon: Icons.extension),
        Block3CounterCard(
            label: 'Surface',
            value: Block3CardKernelSnapshotData.surfaceCards.toString(),
            icon: Icons.web_asset),
        Block3CounterCard(
            label: 'Zone',
            value: Block3CardKernelSnapshotData.zoneCards.toString(),
            icon: Icons.grid_view),
        Block3CounterCard(
            label: 'Screen',
            value: Block3CardKernelSnapshotData.screenCards.toString(),
            icon: Icons.monitor),
        Block3CounterCard(
            label: 'Tool',
            value: Block3CardKernelSnapshotData.toolCards.toString(),
            icon: Icons.handyman),
        Block3CounterCard(
            label: 'Asset',
            value: Block3CardKernelSnapshotData.assetCards.toString(),
            icon: Icons.image),
        Block3CounterCard(
            label: 'Localization',
            value: Block3CardKernelSnapshotData.localizationCards.toString(),
            icon: Icons.translate),
        Block3CounterCard(
            label: 'Assessment',
            value: Block3CardKernelSnapshotData.assessmentCards.toString(),
            icon: Icons.rule),
        Block3CounterCard(
            label: 'Prompt',
            value: Block3CardKernelSnapshotData.promptCards.toString(),
            icon: Icons.psychology),
        Block3CounterCard(
            label: 'Metadata',
            value: Block3CardKernelSnapshotData.metadataCards.toString(),
            icon: Icons.data_object),
        Block3CounterCard(
            label: 'Archived',
            value: Block3CardKernelSnapshotData.archivedCards.toString(),
            icon: Icons.archive),
        Block3CounterCard(
            label: 'Deprecated',
            value: Block3CardKernelSnapshotData.deprecatedCards.toString(),
            icon: Icons.block),
        Block3CounterCard(
            label: 'Missing',
            value: Block3CardKernelSnapshotData.missingCards.toString(),
            icon: Icons.warning),
        const Block3CounterCard(
            label: 'Coverage',
            value: '${Block3CardKernelSnapshotData.coveragePercent}%',
            icon: Icons.radar),
      ],
    );
  }
}

class _CardTile extends StatelessWidget {
  const _CardTile({required this.card, required this.onTap});
  final Block3CardEntry card;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: block3Panel,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: block3Gold.withValues(alpha: 0.34))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(card.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: block3Gold,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text('${card.section} · ${card.version}',
                style: const TextStyle(color: block3Soft, fontSize: 13)),
            const SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
              Block3StatusChip(label: card.type),
              Block3StatusChip(label: card.status)
            ]),
            const SizedBox(height: 12),
            Block3Health(label: 'DNA Health', value: card.health),
          ],
        ),
      ),
    );
  }
}

class _CardDetail extends StatelessWidget {
  const _CardDetail({required this.card});
  final Block3CardEntry card;
  @override
  Widget build(BuildContext context) {
    final tabs = <String, List<String>>{
      'Overview': [card.path, 'Purpose source: discovered card snapshot'],
      'Metadata': [
        'Card ID: ${card.id}',
        'Version: ${card.version}',
        'Status: ${card.status}',
        'Owner: ${card.owner}',
        'Lifecycle: ${card.lifecycle}',
        'Created By: ${card.createdBy}',
        'Created Operation: ${card.createdOperation}',
        'Last Review: ${card.lastReview}'
      ],
      'Dependencies': [
        'Guide',
        'Constitution',
        'Registry',
        'Operations',
        'Reports'
      ],
      'Parent': ['Parent source: Not Connected Yet'],
      'Children': ['Children source: Not Connected Yet'],
      'Consumers': ['Consumers source: Not Connected Yet'],
      'Producers': ['Producers source: Not Connected Yet'],
      'Signals': ['Signal source: Not Connected Yet'],
      'Collections': ['Collection source: Not Connected Yet'],
      'Routes': ['Route source: Not Connected Yet'],
      'Screens': ['Screen source: Not Connected Yet'],
      'Assets': ['Asset source: Not Connected Yet'],
      'Localization': ['Localization source: Not Connected Yet'],
      'Reports': ['Related reports: ${card.relatedReports}'],
      'Operations': [
        'Related operations index rows: ${card.relatedOperations}'
      ],
      'Guide': ['Related guides: ${card.relatedGuides}'],
      'Constitution': ['Related constitutions: ${card.relatedConstitutions}'],
      'Registry': ['Related registries: ${card.relatedRegistries}'],
      'Timeline': [
        'Snapshot generated: ${Block3CardKernelSnapshotData.generatedAt}'
      ],
      'Health': ['Health: ${card.health}%', 'Compliance: ${card.compliance}%'],
      'Compliance': card.missingItems.isEmpty
          ? ['No compliance warning in snapshot']
          : card.missingItems,
      'Missing Items': card.missingItems.isEmpty
          ? ['No missing items detected']
          : card.missingItems,
    };
    return DefaultTabController(
      length: tabs.length,
      child: Block3Panel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(card.name,
                style: const TextStyle(
                    color: block3Gold,
                    fontSize: 24,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
              Block3StatusChip(label: card.id),
              Block3StatusChip(label: card.owner),
              Block3StatusChip(label: card.lifecycle)
            ]),
            const SizedBox(height: 14),
            TabBar(
                isScrollable: true,
                labelColor: block3Gold,
                unselectedLabelColor: block3Soft,
                indicatorColor: block3Gold,
                tabs: tabs.keys.map((t) => Tab(text: t)).toList()),
            SizedBox(
              height: 320,
              child: TabBarView(
                children: tabs.values.map((lines) {
                  return ListView(
                      padding: const EdgeInsets.all(12),
                      children: lines
                          .map((line) => Text('• $line',
                              style: const TextStyle(
                                  color: block3Soft, height: 1.5)))
                          .toList());
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
