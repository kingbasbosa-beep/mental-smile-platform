enum IntelligenceRuntimeStatus {
  notInitialized,
  initializing,
  ready,
  paused,
  shuttingDown,
  recoveryRequired,
  error,
}

enum IntelligenceConnectionStatus {
  notConnectedYet,
  disabledByConstitution,
  readyForFutureConnection,
}

enum IntelligenceValidationStatus {
  valid,
  pendingReview,
  incomplete,
  blocked,
}

class IntelligenceRuntimeState {
  const IntelligenceRuntimeState({
    required this.id,
    required this.status,
    required this.configurationName,
    required this.healthPercent,
    required this.metrics,
    required this.snapshots,
    required this.missingItems,
  });

  final String id;
  final IntelligenceRuntimeStatus status;
  final String configurationName;
  final int healthPercent;
  final Map<String, String> metrics;
  final List<IntelligenceRuntimeSnapshot> snapshots;
  final List<String> missingItems;
}

class IntelligenceRuntimeSnapshot {
  const IntelligenceRuntimeSnapshot({
    required this.name,
    required this.description,
    required this.createdAtLabel,
    required this.validationStatus,
  });

  final String name;
  final String description;
  final String createdAtLabel;
  final IntelligenceValidationStatus validationStatus;
}

class AiSessionRuntimeRecord {
  const AiSessionRuntimeRecord({
    required this.sessionId,
    required this.title,
    required this.status,
    required this.metadata,
    required this.contextPackageIds,
    required this.recoveryNotes,
  });

  final String sessionId;
  final String title;
  final IntelligenceRuntimeStatus status;
  final Map<String, String> metadata;
  final List<String> contextPackageIds;
  final List<String> recoveryNotes;
}

class ContextRuntimePackage {
  const ContextRuntimePackage({
    required this.id,
    required this.name,
    required this.layer,
    required this.priority,
    required this.sources,
    required this.validationStatus,
  });

  final String id;
  final String name;
  final String layer;
  final int priority;
  final List<String> sources;
  final IntelligenceValidationStatus validationStatus;
}

class MemoryRuntimePackage {
  const MemoryRuntimePackage({
    required this.id,
    required this.name,
    required this.owner,
    required this.resolver,
    required this.healthPercent,
    required this.validationStatus,
  });

  final String id;
  final String name;
  final String owner;
  final String resolver;
  final int healthPercent;
  final IntelligenceValidationStatus validationStatus;
}

class KnowledgeRuntimePack {
  const KnowledgeRuntimePack({
    required this.id,
    required this.name,
    required this.category,
    required this.dependencies,
    required this.validationStatus,
  });

  final String id;
  final String name;
  final String category;
  final List<String> dependencies;
  final IntelligenceValidationStatus validationStatus;
}

class PromptRuntimePack {
  const PromptRuntimePack({
    required this.id,
    required this.name,
    required this.version,
    required this.variables,
    required this.executionState,
    required this.rollbackTarget,
    required this.validationStatus,
  });

  final String id;
  final String name;
  final String version;
  final List<String> variables;
  final String executionState;
  final String rollbackTarget;
  final IntelligenceValidationStatus validationStatus;
}

class AiCapabilityRecord {
  const AiCapabilityRecord({
    required this.memberName,
    required this.capabilities,
    required this.limitations,
    required this.preferredTasks,
    required this.supportedOperations,
    required this.healthPercent,
    required this.availability,
    required this.runtimeStatus,
  });

  final String memberName;
  final List<String> capabilities;
  final List<String> limitations;
  final List<String> preferredTasks;
  final List<String> supportedOperations;
  final int healthPercent;
  final IntelligenceConnectionStatus availability;
  final IntelligenceRuntimeStatus runtimeStatus;
}

class IntelligenceRuntimeLogRecord {
  const IntelligenceRuntimeLogRecord({
    required this.id,
    required this.type,
    required this.message,
    required this.timelineLabel,
    required this.recoveryAction,
  });

  final String id;
  final String type;
  final String message;
  final String timelineLabel;
  final String recoveryAction;
}
