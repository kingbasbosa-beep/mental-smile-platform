import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/data/block_3_card_kernel_snapshot_data.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/widgets/block_3_card_kernel_widgets.dart';

class Block3CardRegistriesDashboardPage extends StatefulWidget {
  const Block3CardRegistriesDashboardPage({super.key});
  @override
  State<Block3CardRegistriesDashboardPage> createState() =>
      _Block3CardRegistriesDashboardPageState();
}

class _Block3CardRegistriesDashboardPageState
    extends State<Block3CardRegistriesDashboardPage> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    final items = Block3CardKernelSnapshotData.registries
        .where((r) => r.matches(_query))
        .toList();
    return Block3Shell(
      title: 'Card Registry Center',
      subtitle: 'Registry Health',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Block3Search(
              hint: 'Search registries, dependencies, consumers, producers',
              onChanged: (v) => setState(() => _query = v)),
          const SizedBox(height: 18),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: items
                .map((r) => Container(
                      width: 320,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: block3Panel,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                              color: block3Gold.withValues(alpha: 0.34))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(r.name,
                                style: const TextStyle(
                                    color: block3Gold,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w800)),
                            const SizedBox(height: 12),
                            Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
                              Block3StatusChip(
                                  label: 'Inventory ${r.inventory}'),
                              Block3StatusChip(label: 'Missing ${r.missing}'),
                              Block3StatusChip(label: 'Orphans ${r.orphans}'),
                              Block3StatusChip(
                                  label: 'Duplicates ${r.duplicates}')
                            ]),
                            const SizedBox(height: 12),
                            Block3Health(label: 'Coverage', value: r.coverage),
                            const SizedBox(height: 10),
                            Block3Health(label: 'Health', value: r.health),
                            const SizedBox(height: 12),
                            Text('Dependencies: ${r.dependencies.join(' ↓ ')}',
                                style: const TextStyle(color: block3Soft)),
                          ]),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
