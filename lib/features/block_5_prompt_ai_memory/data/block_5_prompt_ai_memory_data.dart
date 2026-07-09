import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const block5Metrics = <KernelMetric>[
  KernelMetric('Prompt files', '44', Icons.psychology_alt_outlined),
  KernelMetric('Guides available', '61', Icons.menu_book_outlined),
  KernelMetric('Registries available', '96', Icons.fact_check_outlined),
  KernelMetric('AI writes enabled', 'NO', Icons.memory_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const block5PromptItems = <KernelItem>[
  KernelItem(
      title: 'Prompt Library Surface',
      subtitle:
          'Read-only prompt memory dashboard for discovered prompt records.',
      section: 'Prompts',
      type: 'Prompt',
      status: 'Connected',
      health: 80,
      missingItems: ['Full prompt content reader: Not Connected Yet']),
  KernelItem(
      title: 'Commercial Prompt Memory',
      subtitle:
          'Commercial room and profile prompt records remain discoverable as evidence.',
      section: 'Prompts',
      type: 'Commercial',
      status: 'Connected',
      health: 78,
      missingItems: ['Runtime prompt execution: Not Connected Yet']),
  KernelItem(
      title: 'Archive Prompt Memory',
      subtitle:
          'Archive related prompt history is visible as static documentation memory.',
      section: 'Prompts',
      type: 'Archive',
      status: 'Connected',
      health: 82,
      missingItems: ['Canonical prompt pointer']),
  KernelItem(
      title: 'Accessibility Prompt Memory',
      subtitle:
          'Accessibility icon and room prompt records included in the prompt kernel map.',
      section: 'Prompts',
      type: 'Accessibility',
      status: 'Connected',
      health: 77,
      missingItems: ['Audio playback integration: Not Connected Yet']),
];

const block5PackItems = <KernelItem>[
  KernelItem(
      title: 'UI Refinement Packs',
      subtitle:
          'Reusable instruction packs for surgical UI refinement operations.',
      section: 'Prompt Packs',
      type: 'Pack',
      status: 'Connected',
      health: 78,
      missingItems: ['Pack version registry: Not Connected Yet']),
  KernelItem(
      title: 'Forensic Audit Packs',
      subtitle:
          'Read-only audit prompt patterns used across routing, archive, and runtime checks.',
      section: 'Prompt Packs',
      type: 'Pack',
      status: 'Connected',
      health: 82,
      missingItems: ['Automated audit scheduler']),
  KernelItem(
      title: 'Generation Kernel Packs',
      subtitle:
          'Block 1-7 completion prompts tracked as Generation 1 kernel material.',
      section: 'Prompt Packs',
      type: 'Pack',
      status: 'Connected',
      health: 84,
      missingItems: ['Owner approval status field']),
  KernelItem(
      title: 'Marketing Generation Packs',
      subtitle:
          'Future marketing generation prompts are acknowledged but not executed here.',
      section: 'Prompt Packs',
      type: 'Pack',
      status: 'Not Connected Yet',
      health: 45,
      missingItems: [
        'Marketing runtime not implemented',
        'AI generation not implemented'
      ]),
];

const block5MemoryItems = <KernelItem>[
  KernelItem(
      title: 'AI Memory Registry',
      subtitle:
          'Static memory view for AI-related project instructions and handoffs.',
      section: 'AI Memory',
      type: 'Memory',
      status: 'Connected',
      health: 76,
      missingItems: ['Live memory mutation: Not Connected Yet']),
  KernelItem(
      title: 'Prompt Risk Memory',
      subtitle:
          'Tracks prompt operations that must not mutate approved immutable docs.',
      section: 'AI Memory',
      type: 'Risk',
      status: 'Connected',
      health: 82,
      missingItems: ['Automated risk classifier']),
  KernelItem(
      title: 'Owner Prompt Authority',
      subtitle:
          'Prompt changes require owner/admin level instruction under immutable documentation rule.',
      section: 'AI Memory',
      type: 'Authority',
      status: 'Connected',
      health: 85,
      missingItems: []),
  KernelItem(
      title: 'Not Connected Yet Memory',
      subtitle:
          'AI generation, prompt execution, and memory writers are intentionally not connected.',
      section: 'AI Memory',
      type: 'Boundary',
      status: 'Not Connected Yet',
      health: 50,
      missingItems: ['AI generation runtime', 'Prompt writer runtime']),
];

const block5HealthItems = <KernelItem>[
  KernelItem(
      title: 'Prompt Search Health',
      subtitle:
          'Prompt dashboards expose searchable and filterable categories.',
      section: 'Health',
      type: 'Gate',
      status: 'Connected',
      health: 78,
      missingItems: ['File preview modal: Not Connected Yet']),
  KernelItem(
      title: 'Prompt Pack Health',
      subtitle: 'Prompt packs are listed without executing model calls.',
      section: 'Health',
      type: 'Gate',
      status: 'Connected',
      health: 74,
      missingItems: ['Pack lineage registry']),
  KernelItem(
      title: 'AI Memory Safety Health',
      subtitle: 'No prompt runtime writes or AI generation were created.',
      section: 'Health',
      type: 'Gate',
      status: 'Connected',
      health: 90,
      missingItems: []),
  KernelItem(
      title: 'Manual Verification Gate',
      subtitle: 'Owner must run dart format and flutter analyze manually.',
      section: 'Health',
      type: 'Gate',
      status: 'Pending Manual Verification',
      health: 55,
      missingItems: ['dart format not run', 'flutter analyze not run']),
];
