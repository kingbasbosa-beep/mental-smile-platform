import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/intelligence_engine_foundation/data/intelligence_engine_foundation_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class IntelligenceEngineDashboardPage extends StatelessWidget {
  const IntelligenceEngineDashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceTitle,
      subtitle: l10n.intelligenceSubtitle,
      metrics: intelligenceMetrics,
      items: intelligenceOverviewItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligenceRuntimePage extends StatelessWidget {
  const IntelligenceRuntimePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceRuntimeTitle,
      subtitle: l10n.intelligenceRuntimeSubtitle,
      metrics: intelligenceMetrics,
      items: intelligenceOverviewItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligenceSessionsPage extends StatelessWidget {
  const IntelligenceSessionsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceSessionsTitle,
      subtitle: l10n.intelligenceSessionsSubtitle,
      metrics: intelligenceMetrics,
      items: sessionRuntimeItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligenceContextPage extends StatelessWidget {
  const IntelligenceContextPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceContextTitle,
      subtitle: l10n.intelligenceContextSubtitle,
      metrics: intelligenceMetrics,
      items: contextRuntimeItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligenceMemoryPage extends StatelessWidget {
  const IntelligenceMemoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceMemoryTitle,
      subtitle: l10n.intelligenceMemorySubtitle,
      metrics: intelligenceMetrics,
      items: memoryRuntimeItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligenceKnowledgePage extends StatelessWidget {
  const IntelligenceKnowledgePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceKnowledgeTitle,
      subtitle: l10n.intelligenceKnowledgeSubtitle,
      metrics: intelligenceMetrics,
      items: knowledgeRuntimeItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligencePromptsPage extends StatelessWidget {
  const IntelligencePromptsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligencePromptsTitle,
      subtitle: l10n.intelligencePromptsSubtitle,
      metrics: intelligenceMetrics,
      items: promptRuntimeItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligenceCapabilitiesPage extends StatelessWidget {
  const IntelligenceCapabilitiesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceCapabilitiesTitle,
      subtitle: l10n.intelligenceCapabilitiesSubtitle,
      metrics: intelligenceMetrics,
      items: capabilityRegistryItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class IntelligenceLogsPage extends StatelessWidget {
  const IntelligenceLogsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.intelligenceLogsTitle,
      subtitle: l10n.intelligenceLogsSubtitle,
      metrics: intelligenceMetrics,
      items: logRuntimeItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}
