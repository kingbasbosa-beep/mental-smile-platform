import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_4_reports_snapshots/data/block_4_reports_snapshots_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

class Block4ReportsDashboardPage extends StatelessWidget {
  const Block4ReportsDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 4 Reports',
      subtitle:
          'Searchable report registry, categories, health, and missing item visibility.',
      metrics: block4Metrics,
      items: block4ReportItems,
      searchHint: 'Search reports');
}

class Block4SnapshotsDashboardPage extends StatelessWidget {
  const Block4SnapshotsDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 4 Snapshots',
      subtitle:
          'Snapshot memory for repository documentation and runtime evidence.',
      metrics: block4Metrics,
      items: block4SnapshotItems,
      searchHint: 'Search snapshots');
}

class Block4ReportHealthDashboardPage extends StatelessWidget {
  const Block4ReportHealthDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 4 Report Health',
      subtitle:
          'Readiness gates for report, snapshot, timeline, and publish evidence.',
      metrics: block4Metrics,
      items: block4HealthItems,
      searchHint: 'Search health gates');
}

class Block4TimelineDashboardPage extends StatelessWidget {
  const Block4TimelineDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 4 Timeline',
      subtitle:
          'Generation 1 timeline evidence from completed kernel operations.',
      metrics: block4Metrics,
      items: block4TimelineItems,
      searchHint: 'Search timeline');
}
