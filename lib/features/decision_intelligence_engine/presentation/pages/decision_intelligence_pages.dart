import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/decision_intelligence_engine/data/decision_intelligence_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class DecisionIntelligenceDashboardPage extends StatelessWidget {
  const DecisionIntelligenceDashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionTitle,
      subtitle: l10n.decisionSubtitle,
      metrics: decisionMetrics,
      items: decisionOverviewItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class DecisionEnginePage extends StatelessWidget {
  const DecisionEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionEngineTitle,
      subtitle: l10n.decisionEngineSubtitle,
      metrics: decisionMetrics,
      items: decisionEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class ConstitutionalRuleEnginePage extends StatelessWidget {
  const ConstitutionalRuleEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionConstitutionalRuleEngineTitle,
      subtitle: l10n.decisionConstitutionalRuleEngineSubtitle,
      metrics: decisionMetrics,
      items: ruleEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class PolicyEnginePage extends StatelessWidget {
  const PolicyEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionPolicyEngineTitle,
      subtitle: l10n.decisionPolicyEngineSubtitle,
      metrics: decisionMetrics,
      items: policyEngineItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class ApprovalIntelligencePage extends StatelessWidget {
  const ApprovalIntelligencePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionApprovalTitle,
      subtitle: l10n.decisionApprovalSubtitle,
      metrics: decisionMetrics,
      items: approvalItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class RiskEvaluationEnginePage extends StatelessWidget {
  const RiskEvaluationEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionRiskTitle,
      subtitle: l10n.decisionRiskSubtitle,
      metrics: decisionMetrics,
      items: riskItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class RecommendationEnginePage extends StatelessWidget {
  const RecommendationEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionRecommendationTitle,
      subtitle: l10n.decisionRecommendationSubtitle,
      metrics: decisionMetrics,
      items: recommendationItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class EscalationEnginePage extends StatelessWidget {
  const EscalationEnginePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionEscalationTitle,
      subtitle: l10n.decisionEscalationSubtitle,
      metrics: decisionMetrics,
      items: escalationItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}

class DecisionAnalyticsPage extends StatelessWidget {
  const DecisionAnalyticsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KernelDashboardPage(
      title: l10n.decisionAnalyticsTitle,
      subtitle: l10n.decisionAnalyticsSubtitle,
      metrics: decisionMetrics,
      items: decisionAnalyticsItems,
      searchHint: l10n.workshopSearchHint,
    );
  }
}
