enum OrchestrationTaskPriority {
  low,
  normal,
  high,
  urgent,
  ownerCritical,
}

enum OrchestrationTaskStatus {
  draft,
  planning,
  pending,
  ready,
  running,
  waiting,
  review,
  completed,
  failed,
  cancelled,
  retry,
  blocked,
}

enum OrchestrationWorkflowPhase {
  draft,
  planning,
  assignment,
  execution,
  validation,
  review,
  approval,
  publishing,
  archive,
  snapshot,
}

enum OrchestrationReviewType {
  technical,
  governance,
  content,
  design,
  owner,
  manualApproval,
  audit,
  compliance,
}

enum OrchestrationValidationStatus {
  valid,
  pendingReview,
  incomplete,
  blocked,
  notConnectedYet,
}

class OrchestrationTask {
  const OrchestrationTask({
    required this.id,
    required this.title,
    required this.metadata,
    required this.priority,
    required this.type,
    required this.owner,
    required this.consumer,
    required this.dependencies,
    required this.lifecycle,
    required this.result,
    required this.validationStatus,
  });

  final String id;
  final String title;
  final Map<String, String> metadata;
  final OrchestrationTaskPriority priority;
  final String type;
  final String owner;
  final String consumer;
  final List<String> dependencies;
  final OrchestrationTaskStatus lifecycle;
  final String result;
  final OrchestrationValidationStatus validationStatus;
}

class OrchestrationWorkflowDefinition {
  const OrchestrationWorkflowDefinition({
    required this.id,
    required this.name,
    required this.phases,
    required this.configurable,
    required this.validationStatus,
  });

  final String id;
  final String name;
  final List<OrchestrationWorkflowPhase> phases;
  final bool configurable;
  final OrchestrationValidationStatus validationStatus;
}

class CapabilityMatchDecision {
  const CapabilityMatchDecision({
    required this.id,
    required this.suitableAi,
    required this.promptPack,
    required this.knowledgePack,
    required this.tools,
    required this.ownerApprovalRequired,
    required this.notes,
  });

  final String id;
  final String suitableAi;
  final String promptPack;
  final String knowledgePack;
  final List<String> tools;
  final bool ownerApprovalRequired;
  final List<String> notes;
}

class RuntimeDependencyNode {
  const RuntimeDependencyNode({
    required this.id,
    required this.name,
    required this.type,
    required this.dependsOn,
    required this.healthPercent,
  });

  final String id;
  final String name;
  final String type;
  final List<String> dependsOn;
  final int healthPercent;
}

class OrchestrationQueueState {
  const OrchestrationQueueState({
    required this.name,
    required this.status,
    required this.count,
    required this.healthPercent,
  });

  final String name;
  final OrchestrationTaskStatus status;
  final int count;
  final int healthPercent;
}

class ReviewGateDefinition {
  const ReviewGateDefinition({
    required this.type,
    required this.owner,
    required this.requiredFor,
    required this.validationStatus,
  });

  final OrchestrationReviewType type;
  final String owner;
  final List<String> requiredFor;
  final OrchestrationValidationStatus validationStatus;
}

class IntelligenceTimelineEvent {
  const IntelligenceTimelineEvent({
    required this.id,
    required this.type,
    required this.title,
    required this.source,
    required this.snapshotLabel,
  });

  final String id;
  final String type;
  final String title;
  final String source;
  final String snapshotLabel;
}

class OrchestrationHealthIndicator {
  const OrchestrationHealthIndicator({
    required this.name,
    required this.value,
    required this.healthPercent,
    required this.notes,
  });

  final String name;
  final String value;
  final int healthPercent;
  final List<String> notes;
}
