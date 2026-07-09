import 'package:mental_smile_os/features/intelligence_orchestration_engine/domain/orchestration_runtime_models.dart';

class OrchestrationCapabilityMatcher {
  const OrchestrationCapabilityMatcher();

  CapabilityMatchDecision describeDecision({
    required String taskType,
    required bool ownerCritical,
  }) {
    return CapabilityMatchDecision(
      id: 'match-$taskType',
      suitableAi: ownerCritical
          ? 'ChatGPT + Codex review pair'
          : 'Best available AI member',
      promptPack: '$taskType prompt pack',
      knowledgePack: '$taskType knowledge pack',
      tools: const <String>['Workshop', 'Prompt Runtime', 'Knowledge Runtime'],
      ownerApprovalRequired: ownerCritical,
      notes: const <String>[
        'Decision layer only.',
        'No AI provider execution.',
        'No prompt execution.',
      ],
    );
  }
}

class OrchestrationQueueClassifier {
  const OrchestrationQueueClassifier();

  OrchestrationTaskStatus classify(OrchestrationTask task) {
    if (task.validationStatus == OrchestrationValidationStatus.blocked) {
      return OrchestrationTaskStatus.blocked;
    }
    return task.lifecycle;
  }
}

class OrchestrationWorkflowPlanner {
  const OrchestrationWorkflowPlanner();

  List<OrchestrationWorkflowPhase> defaultPhases() {
    return const <OrchestrationWorkflowPhase>[
      OrchestrationWorkflowPhase.draft,
      OrchestrationWorkflowPhase.planning,
      OrchestrationWorkflowPhase.assignment,
      OrchestrationWorkflowPhase.execution,
      OrchestrationWorkflowPhase.validation,
      OrchestrationWorkflowPhase.review,
      OrchestrationWorkflowPhase.approval,
      OrchestrationWorkflowPhase.publishing,
      OrchestrationWorkflowPhase.archive,
      OrchestrationWorkflowPhase.snapshot,
    ];
  }
}
