enum GovernanceCaseStatus {
  intake,
  triage,
  investigation,
  evidenceReview,
  restrictionReview,
  rehabilitationReview,
  appeal,
  escalated,
  resolved,
  archived,
}

enum GovernanceSeverity {
  low,
  medium,
  high,
  critical,
  criminal,
  childSafety,
}

enum GovernanceResolutionMode {
  education,
  deEscalation,
  restoration,
  temporaryRestriction,
  escalation,
  archiveOnly,
}

class GovernanceOperationCaseType {
  const GovernanceOperationCaseType({
    required this.id,
    required this.name,
    required this.owner,
    required this.defaultSeverity,
    required this.requiredEvidence,
    required this.defaultWorkflow,
  });

  final String id;
  final String name;
  final String owner;
  final GovernanceSeverity defaultSeverity;
  final List<String> requiredEvidence;
  final List<GovernanceCaseStatus> defaultWorkflow;
}

class GovernancePlaybook {
  const GovernancePlaybook({
    required this.id,
    required this.title,
    required this.scope,
    required this.steps,
    required this.escalationTriggers,
    required this.resolutionModes,
  });

  final String id;
  final String title;
  final String scope;
  final List<String> steps;
  final List<String> escalationTriggers;
  final List<GovernanceResolutionMode> resolutionModes;
}

class EvidenceRequirement {
  const EvidenceRequirement({
    required this.id,
    required this.name,
    required this.acceptedSources,
    required this.retentionRule,
    required this.archiveRequired,
  });

  final String id;
  final String name;
  final List<String> acceptedSources;
  final String retentionRule;
  final bool archiveRequired;
}

class CorporateCommunicationTemplate {
  const CorporateCommunicationTemplate({
    required this.id,
    required this.name,
    required this.audience,
    required this.owner,
    required this.status,
    required this.requiredReview,
  });

  final String id;
  final String name;
  final String audience;
  final String owner;
  final String status;
  final String requiredReview;
}
