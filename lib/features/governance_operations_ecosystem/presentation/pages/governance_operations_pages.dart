import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/governance_operations_ecosystem/data/governance_operations_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class GovernanceOperationsDashboardPage extends StatelessWidget {
  const GovernanceOperationsDashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.governanceTitle,
      subtitle: l10n.governanceSubtitle,
      metrics: governanceOpsMetrics,
      items: governanceOperationsItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class GovernancePlaybooksPage extends StatelessWidget {
  const GovernancePlaybooksPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.governancePlaybooksTitle,
      subtitle: l10n.governancePlaybooksSubtitle,
      metrics: governanceOpsMetrics,
      items: governancePlaybookItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class DocumentGovernancePage extends StatelessWidget {
  const DocumentGovernancePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.governanceDocumentTitle,
      subtitle: l10n.governanceDocumentSubtitle,
      metrics: governanceOpsMetrics,
      items: documentGovernanceItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class CorporateCommunicationVaultPage extends StatelessWidget {
  const CorporateCommunicationVaultPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.governanceVaultTitle,
      subtitle: l10n.governanceVaultSubtitle,
      metrics: governanceOpsMetrics,
      items: corporateVaultItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}
