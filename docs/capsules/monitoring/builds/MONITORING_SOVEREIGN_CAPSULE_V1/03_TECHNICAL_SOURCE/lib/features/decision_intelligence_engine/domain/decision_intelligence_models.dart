enum DecisionType {
  runtime,
  governance,
  technical,
  content,
  publication,
  archive,
  recovery,
  owner,
}

enum DecisionScope {
  local,
  section,
  workshop,
  generation,
  platform,
  constitutional,
}

enum DecisionStatus {
  draft,
  pendingEvaluation,
  evaluated,
  approvalRequired,
  escalated,
  accepted,
  rejected,
  blocked,
  archived,
}

enum ApprovalStage {
  noApprovalRequired,
  aiApproval,
  technicalReview,
  governanceReview,
  complianceReview,
  ownerApproval,
  finalDecision,
}

enum RuleCategory {
  constitutional,
  workshop,
  owner,
  runtime,
  safety,
  compliance,
  publication,
  archive,
}

enum RiskType {
  operational,
  governance,
  compliance,
  privacy,
  safety,
  content,
  architecture,
  publication,
}

enum EscalationTarget {
  technical,
  governance,
  compliance,
  owner,
  archive,
  monitoring,
}

class DecisionRecord {
  const DecisionRecord({
    required this.id,
    required this.title,
    required this.type,
    required this.scope,
    required this.context,
    required this.dependencies,
    required this.confidencePercent,
    required this.explanation,
    required this.status,
    required this.history,
    required this.outcome,
  });

  final String id;
  final String title;
  final DecisionType type;
  final DecisionScope scope;
  final Map<String, String> context;
  final List<String> dependencies;
  final int confidencePercent;
  final String explanation;
  final DecisionStatus status;
  final List<String> history;
  final String outcome;
}

class DecisionRule {
  const DecisionRule({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.required,
    required this.source,
  });

  final String id;
  final String title;
  final RuleCategory category;
  final String description;
  final bool required;
  final String source;
}

class DecisionPolicy {
  const DecisionPolicy({
    required this.id,
    required this.title,
    required this.area,
    required this.permissions,
    required this.humanApprovalRequired,
    required this.status,
  });

  final String id;
  final String title;
  final String area;
  final List<String> permissions;
  final bool humanApprovalRequired;
  final DecisionStatus status;
}

class RiskEvaluation {
  const RiskEvaluation({
    required this.type,
    required this.score,
    required this.reason,
    required this.recommendedAction,
  });

  final RiskType type;
  final int score;
  final String reason;
  final String recommendedAction;
}

class RecommendationRecord {
  const RecommendationRecord({
    required this.id,
    required this.bestAi,
    required this.bestPromptPack,
    required this.bestKnowledgePack,
    required this.bestWorkflow,
    required this.bestReviewPath,
    required this.bestPublishingPath,
    required this.bestRecoveryPath,
    required this.reason,
  });

  final String id;
  final String bestAi;
  final String bestPromptPack;
  final String bestKnowledgePack;
  final String bestWorkflow;
  final String bestReviewPath;
  final String bestPublishingPath;
  final String bestRecoveryPath;
  final String reason;
}

class EscalationRule {
  const EscalationRule({
    required this.id,
    required this.target,
    required this.trigger,
    required this.configurable,
    required this.notes,
  });

  final String id;
  final EscalationTarget target;
  final String trigger;
  final bool configurable;
  final List<String> notes;
}

class DecisionAnalyticsRecord {
  const DecisionAnalyticsRecord({
    required this.name,
    required this.value,
    required this.notes,
  });

  final String name;
  final String value;
  final List<String> notes;
}
