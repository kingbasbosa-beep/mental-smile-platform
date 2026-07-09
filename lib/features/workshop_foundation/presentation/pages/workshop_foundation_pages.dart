import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';
import 'package:mental_smile_os/features/workshop_foundation/data/workshop_foundation_data.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class WorkshopOverviewPage extends StatelessWidget {
  const WorkshopOverviewPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopTitle,
      subtitle: l10n.workshopSubtitle,
      metrics: workshopMetrics,
      items: workshopOverviewItems,
      searchHint: l10n.workshopSearchHint,
      actions: <Widget>[
        FilledButton.icon(
          onPressed: () => Navigator.of(context)
              .pushNamed(Routes.commercialAdminWorkshopIntelligence),
          icon: const Icon(Icons.auto_awesome),
          label: Text(l10n.workshopIntelligenceEngine),
        ),
        FilledButton.icon(
          onPressed: () => Navigator.of(context)
              .pushNamed(Routes.commercialAdminWorkshopOrchestration),
          icon: const Icon(Icons.account_tree),
          label: Text(l10n.workshopOrchestration),
        ),
        FilledButton.icon(
          onPressed: () => Navigator.of(context)
              .pushNamed(Routes.commercialAdminWorkshopDecisions),
          icon: const Icon(Icons.balance),
          label: Text(l10n.workshopDecisionIntelligence),
        ),
        FilledButton.icon(
          onPressed: () => Navigator.of(context)
              .pushNamed(Routes.commercialAdminWorkshopGovernanceOps),
          icon: const Icon(Icons.verified_user),
          label: Text(l10n.workshopGovernanceOps),
        ),
      ],
    );
  }
}

class WorkshopAiTeamPage extends StatelessWidget {
  const WorkshopAiTeamPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopAiTeamTitle,
      subtitle: l10n.workshopAiTeamSubtitle,
      metrics: workshopMetrics,
      items: aiTeamItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopToolsPage extends StatelessWidget {
  const WorkshopToolsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopToolsTitle,
      subtitle: l10n.workshopToolsSubtitle,
      metrics: workshopMetrics,
      items: aiToolsItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopPresencePage extends StatelessWidget {
  const WorkshopPresencePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopPresenceTitle,
      subtitle: l10n.workshopPresenceSubtitle,
      metrics: workshopMetrics,
      items: digitalPresenceItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopAccountsPage extends StatelessWidget {
  const WorkshopAccountsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopAccountsTitle,
      subtitle: l10n.workshopAccountsSubtitle,
      metrics: workshopMetrics,
      items: accountsItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopPromptsPage extends StatelessWidget {
  const WorkshopPromptsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopPromptsTitle,
      subtitle: l10n.workshopPromptsSubtitle,
      metrics: workshopMetrics,
      items: promptWorkshopItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopLibraryPage extends StatelessWidget {
  const WorkshopLibraryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopKnowledgeTitle,
      subtitle: l10n.workshopKnowledgeSubtitle,
      metrics: workshopMetrics,
      items: knowledgeLibraryItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopWorkstationPage extends StatelessWidget {
  const WorkshopWorkstationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopWorkstationTitle,
      subtitle: l10n.workshopWorkstationSubtitle,
      metrics: workshopMetrics,
      items: workstationItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopAssetsPage extends StatelessWidget {
  const WorkshopAssetsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopAssetsTitle,
      subtitle: l10n.workshopAssetsSubtitle,
      metrics: workshopMetrics,
      items: assetLibraryItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopOwnerDeskPage extends StatelessWidget {
  const WorkshopOwnerDeskPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopOwnerDeskTitle,
      subtitle: l10n.workshopOwnerDeskSubtitle,
      metrics: workshopMetrics,
      items: ownerDeskItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class WorkshopGenerationTwoPage extends StatelessWidget {
  const WorkshopGenerationTwoPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.workshopGenTwoTitle,
      subtitle: l10n.workshopGenTwoSubtitle,
      metrics: workshopMetrics,
      items: generationTwoItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}
