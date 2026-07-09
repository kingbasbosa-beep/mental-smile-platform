import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/intelligence_orchestration_engine/data/intelligence_orchestration_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class IntelligenceOrchestrationDashboardPage extends StatelessWidget {
  const IntelligenceOrchestrationDashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationTitle,
      subtitle: l10n.orchestrationSubtitle,
      metrics: orchestrationMetrics,
      items: orchestrationOverviewItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationTaskEnginePage extends StatelessWidget {
  const OrchestrationTaskEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationTaskEngineTitle,
      subtitle: l10n.orchestrationTaskEngineSubtitle,
      metrics: orchestrationMetrics,
      items: taskEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationWorkflowEnginePage extends StatelessWidget {
  const OrchestrationWorkflowEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationWorkflowEngineTitle,
      subtitle: l10n.orchestrationWorkflowEngineSubtitle,
      metrics: orchestrationMetrics,
      items: workflowEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationCapabilityMatchingPage extends StatelessWidget {
  const OrchestrationCapabilityMatchingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationCapabilityMatchingTitle,
      subtitle: l10n.orchestrationCapabilityMatchingSubtitle,
      metrics: orchestrationMetrics,
      items: matchingEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationDependencyEnginePage extends StatelessWidget {
  const OrchestrationDependencyEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationDependencyEngineTitle,
      subtitle: l10n.orchestrationDependencyEngineSubtitle,
      metrics: orchestrationMetrics,
      items: dependencyEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationQueueManagerPage extends StatelessWidget {
  const OrchestrationQueueManagerPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationQueueManagerTitle,
      subtitle: l10n.orchestrationQueueManagerSubtitle,
      metrics: orchestrationMetrics,
      items: queueManagerItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationReviewEnginePage extends StatelessWidget {
  const OrchestrationReviewEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationReviewEngineTitle,
      subtitle: l10n.orchestrationReviewEngineSubtitle,
      metrics: orchestrationMetrics,
      items: reviewEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationTimelinePage extends StatelessWidget {
  const OrchestrationTimelinePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationTimelineTitle,
      subtitle: l10n.orchestrationTimelineSubtitle,
      metrics: orchestrationMetrics,
      items: intelligenceTimelineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationWorkspacePage extends StatelessWidget {
  const OrchestrationWorkspacePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationWorkspaceTitle,
      subtitle: l10n.orchestrationWorkspaceSubtitle,
      metrics: orchestrationMetrics,
      items: intelligenceWorkspaceItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class OrchestrationObservabilityPage extends StatelessWidget {
  const OrchestrationObservabilityPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.orchestrationObservabilityTitle,
      subtitle: l10n.orchestrationObservabilitySubtitle,
      metrics: orchestrationMetrics,
      items: observabilityItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}
