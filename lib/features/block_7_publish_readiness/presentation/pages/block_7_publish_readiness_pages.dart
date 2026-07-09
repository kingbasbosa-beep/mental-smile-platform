import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_7_publish_readiness/data/block_7_publish_readiness_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

class Block7PublishReadinessDashboardPage extends StatelessWidget {
  const Block7PublishReadinessDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 7 Publish Readiness',
      subtitle:
          'Final publish gates for owner review without deployment execution.',
      metrics: block7Metrics,
      items: block7PublishItems,
      searchHint: 'Search publish gates');
}

class Block7SelfEvolutionDashboardPage extends StatelessWidget {
  const Block7SelfEvolutionDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 7 Self Evolution',
      subtitle:
          'Self evolution boundaries, immutable docs, and future generation readiness.',
      metrics: block7Metrics,
      items: block7EvolutionItems,
      searchHint: 'Search self evolution');
}

class Block7OsHealthDashboardPage extends StatelessWidget {
  const Block7OsHealthDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 7 OS Health',
      subtitle:
          'Generation 1 health snapshot across archive, guides, cards, reports, prompts, and DNA.',
      metrics: block7Metrics,
      items: block7OsHealthItems,
      searchHint: 'Search OS health');
}

class Block7FinalGatesDashboardPage extends StatelessWidget {
  const Block7FinalGatesDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 7 Final Gates',
      subtitle:
          'Final owner review gates and manual verification requirements.',
      metrics: block7Metrics,
      items: block7FinalGateItems,
      searchHint: 'Search final gates');
}
