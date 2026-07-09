import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_6_dna_capsules/data/block_6_dna_capsules_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

class Block6DnaDashboardPage extends StatelessWidget {
  const Block6DnaDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 6 DNA',
      subtitle:
          'OS DNA map for identity, archive, accessibility, and commercial evolution.',
      metrics: block6Metrics,
      items: block6DnaItems,
      searchHint: 'Search DNA records');
}

class Block6CapsulesDashboardPage extends StatelessWidget {
  const Block6CapsulesDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 6 Capsules',
      subtitle:
          'Capsule registry readiness with honest zero-source disclosure.',
      metrics: block6Metrics,
      items: block6CapsuleItems,
      searchHint: 'Search capsules');
}

class Block6EvolutionDashboardPage extends StatelessWidget {
  const Block6EvolutionDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 6 Evolution',
      subtitle:
          'Evolution trail for Generation 1 runtime and documentation memory.',
      metrics: block6Metrics,
      items: block6EvolutionItems,
      searchHint: 'Search evolution trail');
}

class Block6RestoreReadinessDashboardPage extends StatelessWidget {
  const Block6RestoreReadinessDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 6 Restore Readiness',
      subtitle:
          'Restore readiness gates without archive execution or Firebase changes.',
      metrics: block6Metrics,
      items: block6RestoreItems,
      searchHint: 'Search restore readiness');
}
