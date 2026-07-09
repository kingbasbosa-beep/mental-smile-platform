import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/intelligence_engine_foundation/domain/intelligence_runtime_models.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const intelligenceMetrics = <KernelMetric>[
  KernelMetric('Runtime layers', '10', Icons.hub_outlined),
  KernelMetric('Provider connections', '0', Icons.link_off_outlined),
  KernelMetric('Prompt execution', 'NO', Icons.play_disabled_outlined),
  KernelMetric('Automation', 'NO', Icons.smart_toy_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const initialRuntimeState = IntelligenceRuntimeState(
  id: 'intelligence-runtime-foundation-v1',
  status: IntelligenceRuntimeStatus.ready,
  configurationName: 'Generation Two Block 2.1 Foundation',
  healthPercent: 72,
  metrics: {
    'runtime_layers': '10',
    'provider_connections': '0',
    'background_agents': '0',
    'prompt_execution': 'NO',
  },
  snapshots: [
    IntelligenceRuntimeSnapshot(
      name: 'Foundation Snapshot',
      description:
          'Initial runtime foundation created without provider integrations.',
      createdAtLabel: '2026-06-29',
      validationStatus: IntelligenceValidationStatus.pendingReview,
    ),
  ],
  missingItems: [
    'Provider connectors: Not Connected Yet',
    'Background agents: Forbidden',
    'Prompt execution: Not Connected Yet',
    'Runtime persistence: Not Connected Yet',
  ],
);

const intelligenceOverviewItems = <KernelItem>[
  KernelItem(
      title: 'Intelligence Runtime',
      subtitle:
          'Runtime state, status, configuration, initialization, shutdown, recovery, health, metrics, and snapshots.',
      section: 'Intelligence Engine',
      type: 'Runtime',
      status: 'Foundation Created',
      health: 72,
      missingItems: [
        'Provider execution: Not Connected Yet',
        'Runtime persistence: Not Connected Yet'
      ]),
  KernelItem(
      title: 'AI Session Runtime',
      subtitle:
          'Sessions, history, active session, registry, metadata, context, recovery, and validation.',
      section: 'Intelligence Engine',
      type: 'Sessions',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Live session storage: Not Connected Yet']),
  KernelItem(
      title: 'Context Runtime',
      subtitle:
          'Context loading, resolution, layers, priorities, sources, packages, and validation.',
      section: 'Intelligence Engine',
      type: 'Context',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Live context loader: Not Connected Yet']),
  KernelItem(
      title: 'Memory Runtime',
      subtitle:
          'Memory packages, registry, resolver, loader, health, and validation under constitutional doctrine.',
      section: 'Intelligence Engine',
      type: 'Memory',
      status: 'Foundation Created',
      health: 71,
      missingItems: ['Memory writer: Not Connected Yet']),
  KernelItem(
      title: 'Knowledge Runtime',
      subtitle:
          'Knowledge packs, registry, loader, resolver, categories, dependencies, and validation.',
      section: 'Intelligence Engine',
      type: 'Knowledge',
      status: 'Foundation Created',
      health: 69,
      missingItems: [
        'Embeddings: Forbidden in this block',
        'Vector DB: Forbidden in this block'
      ]),
  KernelItem(
      title: 'Prompt Runtime',
      subtitle:
          'Prompt registry, packs, variables, templates, validation, execution state, history, versioning, and rollback.',
      section: 'Intelligence Engine',
      type: 'Prompts',
      status: 'Foundation Created',
      health: 73,
      missingItems: ['Prompt execution: Not Connected Yet']),
  KernelItem(
      title: 'AI Capability Registry',
      subtitle:
          'AI members, capabilities, limitations, preferred tasks, supported operations, health, availability, and status.',
      section: 'Intelligence Engine',
      type: 'Capabilities',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Live availability: Not Connected Yet']),
  KernelItem(
      title: 'Intelligence Dashboard Foundation',
      subtitle:
          'Dashboard runtime for health, sessions, context, memory, prompts, knowledge, AI status, errors, metrics, and snapshots.',
      section: 'Intelligence Engine',
      type: 'Dashboard',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Live metrics stream: Not Connected Yet']),
  KernelItem(
      title: 'Runtime Logs',
      subtitle:
          'Event log, error log, audit log, runtime timeline, and recovery timeline foundations.',
      section: 'Intelligence Engine',
      type: 'Logs',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Persistent log store: Not Connected Yet']),
];

const sessionRuntimeItems = <KernelItem>[
  KernelItem(
      title: 'Session Registry',
      subtitle: 'Registry model for AI sessions and active session lookup.',
      section: 'AI Sessions',
      type: 'Registry',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Live session database: Not Connected Yet']),
  KernelItem(
      title: 'Session History',
      subtitle:
          'History model for owner/AI interactions without provider execution.',
      section: 'AI Sessions',
      type: 'History',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['History persistence: Not Connected Yet']),
  KernelItem(
      title: 'Session Metadata',
      subtitle:
          'Metadata foundation for scope, owner, related project, and runtime status.',
      section: 'AI Sessions',
      type: 'Metadata',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Metadata editor: Not Connected Yet']),
  KernelItem(
      title: 'Session Recovery',
      subtitle:
          'Recovery notes and validation state for interrupted or resumed sessions.',
      section: 'AI Sessions',
      type: 'Recovery',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Automatic recovery: Forbidden']),
];

const contextRuntimeItems = <KernelItem>[
  KernelItem(
      title: 'Context Layers',
      subtitle:
          'Constitutional, workshop, project, task, and local runtime context layers.',
      section: 'Context Runtime',
      type: 'Layer',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Live layer resolver']),
  KernelItem(
      title: 'Context Priorities',
      subtitle:
          'Priority model for deciding which context package should guide future execution.',
      section: 'Context Runtime',
      type: 'Priority',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Conflict resolver: Not Connected Yet']),
  KernelItem(
      title: 'Context Sources',
      subtitle:
          'Source categories for docs, runtime state, owner prompt, reports, registries, and snapshots.',
      section: 'Context Runtime',
      type: 'Source',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Source reader adapters']),
  KernelItem(
      title: 'Context Validation',
      subtitle:
          'Validation state for completeness, freshness, authority, and compatibility.',
      section: 'Context Runtime',
      type: 'Validation',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Automated validator: Not Connected Yet']),
];

const memoryRuntimeItems = <KernelItem>[
  KernelItem(
      title: 'Memory Package Registry',
      subtitle:
          'Package model for governed memory groups inherited from Generation One and Workshop.',
      section: 'Memory Runtime',
      type: 'Registry',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Live package reader']),
  KernelItem(
      title: 'Memory Resolver',
      subtitle:
          'Resolver foundation for choosing relevant memory without rewriting approved docs.',
      section: 'Memory Runtime',
      type: 'Resolver',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Resolver implementation: Not Connected Yet']),
  KernelItem(
      title: 'Memory Loader',
      subtitle:
          'Loader contract only. No document mutation or external provider calls.',
      section: 'Memory Runtime',
      type: 'Loader',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Loader adapters pending']),
  KernelItem(
      title: 'Memory Health',
      subtitle:
          'Health model for stale, missing, conflicting, or superseded memory.',
      section: 'Memory Runtime',
      type: 'Health',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Health scanner: Not Connected Yet']),
];

const knowledgeRuntimeItems = <KernelItem>[
  KernelItem(
      title: 'Knowledge Pack Registry',
      subtitle: 'Registry model for future curated knowledge packs.',
      section: 'Knowledge Runtime',
      type: 'Registry',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Knowledge source import pending']),
  KernelItem(
      title: 'Knowledge Loader',
      subtitle:
          'Loader foundation for books, articles, docs, government references, and technical references.',
      section: 'Knowledge Runtime',
      type: 'Loader',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['External sync: Not Connected Yet']),
  KernelItem(
      title: 'Knowledge Dependencies',
      subtitle:
          'Dependency model for relationships between packs and sections.',
      section: 'Knowledge Runtime',
      type: 'Dependencies',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Dependency graph runtime']),
  KernelItem(
      title: 'No Embeddings Gate',
      subtitle:
          'Embeddings, vector databases, and AI indexing are explicitly outside Block 2.1.',
      section: 'Knowledge Runtime',
      type: 'Safety Gate',
      status: 'Constitutional Boundary',
      health: 100,
      missingItems: []),
];

const promptRuntimeItems = <KernelItem>[
  KernelItem(
      title: 'Prompt Registry',
      subtitle:
          'Registry model for future prompt packs, templates, variables, and versions.',
      section: 'Prompt Runtime',
      type: 'Registry',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Prompt content reader']),
  KernelItem(
      title: 'Prompt Variables',
      subtitle: 'Variable model for future reusable prompt composition.',
      section: 'Prompt Runtime',
      type: 'Variables',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Variable validator']),
  KernelItem(
      title: 'Prompt Execution State',
      subtitle:
          'Execution state exists as metadata only. No prompt execution occurs.',
      section: 'Prompt Runtime',
      type: 'Execution State',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Executor: Not Connected Yet']),
  KernelItem(
      title: 'Prompt Versioning + Rollback',
      subtitle:
          'Version and rollback metadata model under immutable documentation rules.',
      section: 'Prompt Runtime',
      type: 'Versioning',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Rollback UI pending']),
];

const capabilityRegistryItems = <KernelItem>[
  KernelItem(
      title: 'ChatGPT Capability Record',
      subtitle:
          'Architecture, structure, governance, and high-level reasoning capability profile.',
      section: 'AI Capability Registry',
      type: 'AI Member',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Live availability: Not Connected Yet']),
  KernelItem(
      title: 'Codex Capability Record',
      subtitle:
          'Implementation, runtime, repository, and Flutter engineering capability profile.',
      section: 'AI Capability Registry',
      type: 'AI Member',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Autonomous execution: Forbidden']),
  KernelItem(
      title: 'Future Provider Capability Records',
      subtitle:
          'Gemini, Claude, Cursor AI, Copilot, local models, and future AI providers.',
      section: 'AI Capability Registry',
      type: 'Future AI Member',
      status: 'Not Connected Yet',
      health: 45,
      missingItems: ['Capability validation pending']),
  KernelItem(
      title: 'Preferred Task Mapping',
      subtitle:
          'Mapping foundation between AI strengths and future work categories.',
      section: 'AI Capability Registry',
      type: 'Task Map',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Orchestration: Not Connected Yet']),
];

const logRuntimeItems = <KernelItem>[
  KernelItem(
      title: 'Event Log',
      subtitle: 'Runtime event log model for future intelligence operations.',
      section: 'Runtime Logs',
      type: 'Event Log',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Persistent log store']),
  KernelItem(
      title: 'Error Log',
      subtitle:
          'Error log model for runtime failures and provider-independent errors.',
      section: 'Runtime Logs',
      type: 'Error Log',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Error capture runtime']),
  KernelItem(
      title: 'Audit Log',
      subtitle: 'Audit log model to preserve constitutional traceability.',
      section: 'Runtime Logs',
      type: 'Audit Log',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Audit writer: Not Connected Yet']),
  KernelItem(
      title: 'Recovery Timeline',
      subtitle:
          'Recovery event model for interrupted sessions and runtime restoration.',
      section: 'Runtime Logs',
      type: 'Recovery Timeline',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Recovery runner: Not Connected Yet']),
];
