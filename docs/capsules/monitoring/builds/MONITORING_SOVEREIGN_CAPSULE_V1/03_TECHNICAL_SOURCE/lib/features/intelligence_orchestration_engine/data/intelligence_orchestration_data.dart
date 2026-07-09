import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const orchestrationMetrics = <KernelMetric>[
  KernelMetric('Engines', '10', Icons.account_tree_outlined),
  KernelMetric('External execution', 'NO', Icons.play_disabled_outlined),
  KernelMetric('Schedulers', 'NO', Icons.timer_off_outlined),
  KernelMetric('Queues', '10', Icons.queue_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const orchestrationOverviewItems = <KernelItem>[
  KernelItem(
      title: 'Task Engine',
      subtitle:
          'Task registry, metadata, priority, type, owner, consumer, dependencies, lifecycle, result, validation, and completion.',
      section: 'Orchestration',
      type: 'Task Engine',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Task execution: Not Connected Yet']),
  KernelItem(
      title: 'Workflow Engine',
      subtitle: 'Configurable workflow phases from Draft through Snapshot.',
      section: 'Orchestration',
      type: 'Workflow Engine',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Workflow runner: Not Connected Yet']),
  KernelItem(
      title: 'Capability Matching Engine',
      subtitle:
          'Decision layer for AI suitability, prompt packs, knowledge packs, tools, and owner approval.',
      section: 'Orchestration',
      type: 'Matching Engine',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['AI live availability: Not Connected Yet']),
  KernelItem(
      title: 'Dependency Engine',
      subtitle:
          'Dependency graph foundations for tasks, prompt packs, knowledge packs, assets, projects, registries, reports, cards, and guides.',
      section: 'Orchestration',
      type: 'Dependency Engine',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Graph resolver: Not Connected Yet']),
  KernelItem(
      title: 'Queue Manager',
      subtitle:
          'Pending, Ready, Running, Waiting, Review, Completed, Failed, Cancelled, Retry, and Blocked queue definitions.',
      section: 'Orchestration',
      type: 'Queue Manager',
      status: 'Foundation Created',
      health: 73,
      missingItems: ['Queue persistence: Not Connected Yet']),
  KernelItem(
      title: 'Review Engine',
      subtitle:
          'Technical, governance, content, design, owner, manual approval, audit, and compliance review gates.',
      section: 'Orchestration',
      type: 'Review Engine',
      status: 'Foundation Created',
      health: 75,
      missingItems: ['Review approval runtime: Not Connected Yet']),
  KernelItem(
      title: 'Intelligence Timeline',
      subtitle:
          'Operations, reports, tasks, prompt usage, knowledge usage, runtime events, snapshots, and recovery event timeline.',
      section: 'Orchestration',
      type: 'Timeline',
      status: 'Foundation Created',
      health: 71,
      missingItems: ['Timeline writer: Not Connected Yet']),
  KernelItem(
      title: 'Intelligence Workspace',
      subtitle:
          "Today's tasks, queues, running operations, reports, AI members, knowledge, prompts, assets, projects, health, and upcoming work.",
      section: 'Orchestration',
      type: 'Workspace',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Live workspace feed: Not Connected Yet']),
  KernelItem(
      title: 'Runtime Observability',
      subtitle:
          'Health indicators, queue metrics, workflow metrics, task statistics, review statistics, completion statistics, dependency health, and orchestration health.',
      section: 'Orchestration',
      type: 'Observability',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Metrics stream: Not Connected Yet']),
  KernelItem(
      title: 'Workshop Integration',
      subtitle:
          'Navigation integration with Workshop, Owner Desk, AI Team, Prompt Workshop, Knowledge Library, Assets, and Generation Two.',
      section: 'Orchestration',
      type: 'Integration',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Deep cross-section actions: Not Connected Yet']),
];

const taskEngineItems = <KernelItem>[
  KernelItem(
      title: 'Task Registry',
      subtitle: 'Foundation registry for every future intelligence task.',
      section: 'Task Engine',
      type: 'Registry',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Task persistence']),
  KernelItem(
      title: 'Task Metadata',
      subtitle:
          'Owner, consumer, type, priority, dependencies, result, and validation metadata.',
      section: 'Task Engine',
      type: 'Metadata',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Metadata editor']),
  KernelItem(
      title: 'Task Lifecycle',
      subtitle:
          'Draft, planning, pending, ready, running, waiting, review, completed, failed, cancelled, retry, blocked.',
      section: 'Task Engine',
      type: 'Lifecycle',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Lifecycle executor: Not Connected Yet']),
  KernelItem(
      title: 'Task Validation',
      subtitle: 'Validation and completion state without executing work.',
      section: 'Task Engine',
      type: 'Validation',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Automated validator']),
];

const workflowEngineItems = <KernelItem>[
  KernelItem(
      title: 'Draft to Planning',
      subtitle: 'Initial workflow intake and planning phases.',
      section: 'Workflow Engine',
      type: 'Workflow Phase',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Config UI']),
  KernelItem(
      title: 'Assignment to Execution',
      subtitle:
          'Assignment and execution states are modeled only, not executed.',
      section: 'Workflow Engine',
      type: 'Workflow Phase',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Execution engine: Not Connected Yet']),
  KernelItem(
      title: 'Validation to Approval',
      subtitle: 'Validation, review, approval, and manual approval gates.',
      section: 'Workflow Engine',
      type: 'Workflow Phase',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Approval runtime']),
  KernelItem(
      title: 'Publishing to Snapshot',
      subtitle:
          'Publishing, archive, and snapshot states are future finalization phases.',
      section: 'Workflow Engine',
      type: 'Workflow Phase',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Publishing automation: Forbidden']),
];

const matchingEngineItems = <KernelItem>[
  KernelItem(
      title: 'AI Suitability Decision',
      subtitle:
          'Maps task type to suitable AI member without contacting the AI.',
      section: 'Capability Matching',
      type: 'Decision',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Live AI availability']),
  KernelItem(
      title: 'Prompt Pack Requirement',
      subtitle: 'Determines required prompt pack as metadata only.',
      section: 'Capability Matching',
      type: 'Decision',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Prompt execution: Forbidden']),
  KernelItem(
      title: 'Knowledge Pack Requirement',
      subtitle: 'Determines required knowledge pack dependencies.',
      section: 'Capability Matching',
      type: 'Decision',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Knowledge resolver runtime']),
  KernelItem(
      title: 'Owner Approval Requirement',
      subtitle:
          'Flags owner approval when task is critical or governance-sensitive.',
      section: 'Capability Matching',
      type: 'Approval Decision',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Owner approval UI']),
];

const dependencyEngineItems = <KernelItem>[
  KernelItem(
      title: 'Task Dependencies',
      subtitle: 'Task-to-task dependency discovery foundation.',
      section: 'Dependency Engine',
      type: 'Dependency',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Graph visualization']),
  KernelItem(
      title: 'Prompt + Knowledge Dependencies',
      subtitle: 'Prompt pack and knowledge pack dependency discovery.',
      section: 'Dependency Engine',
      type: 'Dependency',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Live resolver']),
  KernelItem(
      title: 'Asset + Project Dependencies',
      subtitle: 'Asset and project dependency mapping foundation.',
      section: 'Dependency Engine',
      type: 'Dependency',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Asset reader']),
  KernelItem(
      title: 'Registry + Report + Card + Guide Dependencies',
      subtitle: 'Governance document dependency foundation.',
      section: 'Dependency Engine',
      type: 'Dependency',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Canonical pointer reader']),
];

const queueManagerItems = <KernelItem>[
  KernelItem(
      title: 'Pending Queue',
      subtitle: 'Tasks waiting for readiness.',
      section: 'Queue Manager',
      type: 'Queue',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Queue persistence']),
  KernelItem(
      title: 'Ready Queue',
      subtitle: 'Tasks ready for future assignment.',
      section: 'Queue Manager',
      type: 'Queue',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Runner not connected']),
  KernelItem(
      title: 'Running + Waiting Queues',
      subtitle: 'Runtime states modeled without execution.',
      section: 'Queue Manager',
      type: 'Queue',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['No running engine']),
  KernelItem(
      title: 'Review + Completed Queues',
      subtitle: 'Review and completion states for future operations.',
      section: 'Queue Manager',
      type: 'Queue',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Review runtime']),
  KernelItem(
      title: 'Failed + Cancelled + Retry + Blocked Queues',
      subtitle: 'Failure and recovery state categories.',
      section: 'Queue Manager',
      type: 'Queue',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Recovery runner']),
];

const reviewEngineItems = <KernelItem>[
  KernelItem(
      title: 'Technical Review',
      subtitle: 'Future technical correctness and analyzer/build review gate.',
      section: 'Review Engine',
      type: 'Review Gate',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Automated checks: Not Connected Yet']),
  KernelItem(
      title: 'Governance + Compliance Review',
      subtitle: 'Constitutional, audit, and compliance review gates.',
      section: 'Review Engine',
      type: 'Review Gate',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Approval runtime']),
  KernelItem(
      title: 'Content + Design Review',
      subtitle: 'Content quality and UI/design review gates.',
      section: 'Review Engine',
      type: 'Review Gate',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Reviewer assignment']),
  KernelItem(
      title: 'Owner Review + Manual Approval',
      subtitle: 'Owner decision and manual approval gate.',
      section: 'Review Engine',
      type: 'Review Gate',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Owner approval UI']),
];

const intelligenceTimelineItems = <KernelItem>[
  KernelItem(
      title: 'Operations Timeline',
      subtitle: 'Timeline support for operations and reports.',
      section: 'Intelligence Timeline',
      type: 'Timeline',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Timeline writer']),
  KernelItem(
      title: 'Task Timeline',
      subtitle: 'Timeline support for tasks and queue transitions.',
      section: 'Intelligence Timeline',
      type: 'Timeline',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Task event producer']),
  KernelItem(
      title: 'Prompt + Knowledge Usage Timeline',
      subtitle: 'Future prompt and knowledge usage events.',
      section: 'Intelligence Timeline',
      type: 'Timeline',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['No prompt execution']),
  KernelItem(
      title: 'Runtime + Recovery Timeline',
      subtitle: 'Runtime events, snapshots, and recovery event support.',
      section: 'Intelligence Timeline',
      type: 'Timeline',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Persistent event store']),
];

const intelligenceWorkspaceItems = <KernelItem>[
  KernelItem(
      title: "Today's Tasks",
      subtitle: 'Daily task surface foundation.',
      section: 'Intelligence Workspace',
      type: 'Workspace',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Live task feed']),
  KernelItem(
      title: 'Current Queue + Running Operations',
      subtitle: 'Queue and operation overview foundation.',
      section: 'Intelligence Workspace',
      type: 'Workspace',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Live queues']),
  KernelItem(
      title: 'Recent Reports + AI Members',
      subtitle: 'Recent report and AI member status foundation.',
      section: 'Intelligence Workspace',
      type: 'Workspace',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Live status']),
  KernelItem(
      title: 'Knowledge + Prompt + Assets + Projects',
      subtitle: 'Current resource status foundation.',
      section: 'Intelligence Workspace',
      type: 'Workspace',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Resource health readers']),
  KernelItem(
      title: 'System Health + Upcoming Work',
      subtitle: 'Operating health and future work foundation.',
      section: 'Intelligence Workspace',
      type: 'Workspace',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Scheduled planning: Forbidden']),
];

const observabilityItems = <KernelItem>[
  KernelItem(
      title: 'Health Indicators',
      subtitle:
          'Orchestration health indicators for future runtime supervision.',
      section: 'Observability',
      type: 'Metric',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Live metrics']),
  KernelItem(
      title: 'Queue Metrics',
      subtitle: 'Queue counts and health model.',
      section: 'Observability',
      type: 'Metric',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Queue persistence']),
  KernelItem(
      title: 'Workflow + Task Statistics',
      subtitle: 'Workflow and task statistics model.',
      section: 'Observability',
      type: 'Metric',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Stats collector']),
  KernelItem(
      title: 'Review + Completion Statistics',
      subtitle: 'Review and completion health model.',
      section: 'Observability',
      type: 'Metric',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Completion tracker']),
  KernelItem(
      title: 'Dependency + Orchestration Health',
      subtitle: 'Dependency health and orchestration health foundation.',
      section: 'Observability',
      type: 'Metric',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Graph health scanner']),
];
