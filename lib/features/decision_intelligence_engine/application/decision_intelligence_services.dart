import 'package:mental_smile_os/features/decision_intelligence_engine/domain/decision_intelligence_models.dart';

class DecisionRuleEvaluator {
  const DecisionRuleEvaluator();

  DecisionStatus evaluateRules(List<DecisionRule> rules) {
    final missingRequired =
        rules.any((rule) => rule.required && rule.source.isEmpty);
    return missingRequired ? DecisionStatus.blocked : DecisionStatus.evaluated;
  }
}

class RiskEvaluationService {
  const RiskEvaluationService();

  RiskEvaluation evaluate({
    required RiskType type,
    required int score,
    required String reason,
  }) {
    final action = score >= 80
        ? 'Escalate before execution.'
        : score >= 50
            ? 'Require review before execution.'
            : 'Record and continue to next gate.';
    return RiskEvaluation(
      type: type,
      score: score,
      reason: reason,
      recommendedAction: action,
    );
  }
}

class ApprovalPathResolver {
  const ApprovalPathResolver();

  List<ApprovalStage> pathFor({
    required bool ownerCritical,
    required bool complianceSensitive,
  }) {
    if (ownerCritical) {
      return const <ApprovalStage>[
        ApprovalStage.technicalReview,
        ApprovalStage.governanceReview,
        ApprovalStage.complianceReview,
        ApprovalStage.ownerApproval,
        ApprovalStage.finalDecision,
      ];
    }
    if (complianceSensitive) {
      return const <ApprovalStage>[
        ApprovalStage.governanceReview,
        ApprovalStage.complianceReview,
        ApprovalStage.finalDecision,
      ];
    }
    return const <ApprovalStage>[
      ApprovalStage.noApprovalRequired,
      ApprovalStage.finalDecision,
    ];
  }
}
