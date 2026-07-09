import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/data/block_3_card_kernel_snapshot_data.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/widgets/block_3_card_kernel_widgets.dart';

class Block3CardRelationsDashboardPage extends StatefulWidget {
  const Block3CardRelationsDashboardPage({super.key});
  @override
  State<Block3CardRelationsDashboardPage> createState() =>
      _Block3CardRelationsDashboardPageState();
}

class _Block3CardRelationsDashboardPageState
    extends State<Block3CardRelationsDashboardPage> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    final cards = Block3CardKernelSnapshotData.entries
        .where((c) => c.matches(_query))
        .take(36)
        .toList();
    return Block3Shell(
      title: 'Card Relation Engine',
      subtitle: 'Visual Knowledge Graph',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Block3Search(
              hint:
                  'Search relation by card, guide, constitution, registry, operation, report, route',
              onChanged: (v) => setState(() => _query = v)),
          const SizedBox(height: 18),
          Block3Panel(
            child: Wrap(
              spacing: 14,
              runSpacing: 14,
              children: cards.map((card) => _RelationNode(card: card)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _RelationNode extends StatelessWidget {
  const _RelationNode({required this.card});
  final Block3CardEntry card;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: const Color(0xAA090908),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: block3Gold.withValues(alpha: 0.26))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(card.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: block3Gold, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            const Text(
                'Card ↓ Guide ↓ Constitution ↓ Registry ↓ Operations ↓ Reports ↓ Assets ↓ Localization ↓ Routes ↓ Signals ↓ Collections',
                style: TextStyle(color: block3Soft, height: 1.45)),
            const SizedBox(height: 10),
            Block3StatusChip(
                label: card.missingItems.isEmpty
                    ? 'Relation Healthy'
                    : 'Relation Warnings ${card.missingItems.length}'),
          ]),
    );
  }
}
