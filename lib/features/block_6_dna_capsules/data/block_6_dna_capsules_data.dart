import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const block6Metrics = <KernelMetric>[
  KernelMetric('DNA records', '14', Icons.fingerprint_outlined),
  KernelMetric('Capsules discovered', '0', Icons.inventory_2_outlined),
  KernelMetric('Cards available', '188', Icons.dashboard_customize_outlined),
  KernelMetric('Constitutions', '44', Icons.account_balance_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const block6DnaItems = <KernelItem>[
  KernelItem(
      title: 'Mental Smile Identity DNA',
      subtitle:
          'Project identity, visual philosophy, and accessibility direction.',
      section: 'DNA',
      type: 'Identity',
      status: 'Connected',
      health: 86,
      missingItems: ['Canonical DNA pointer: Not Connected Yet']),
  KernelItem(
      title: 'Commercial Room DNA',
      subtitle: 'Specialist and Center room visual behavior and card identity.',
      section: 'DNA',
      type: 'Commercial',
      status: 'Connected',
      health: 82,
      missingItems: ['Room DNA runtime registry']),
  KernelItem(
      title: 'Archive OS DNA',
      subtitle:
          'Immutable documentation and history-preserving archive principles.',
      section: 'DNA',
      type: 'Archive',
      status: 'Connected',
      health: 88,
      missingItems: []),
  KernelItem(
      title: 'Accessibility DNA',
      subtitle:
          'Accessibility guide icon, audio/listening presence, and main room icon standards.',
      section: 'DNA',
      type: 'Accessibility',
      status: 'Connected',
      health: 84,
      missingItems: ['Inner page rollout pending']),
];

const block6CapsuleItems = <KernelItem>[
  KernelItem(
      title: 'Runtime Capsule Registry',
      subtitle:
          'No explicit capsule source files were discovered in the current snapshot.',
      section: 'Capsules',
      type: 'Capsule',
      status: 'Not Connected Yet',
      health: 35,
      missingItems: [
        'Capsule files: 0 discovered',
        'Capsule registry: Not Connected Yet'
      ]),
  KernelItem(
      title: 'Documentation Capsule Candidate',
      subtitle:
          'Guides, reports, cards, and registries are candidate capsule sources only.',
      section: 'Capsules',
      type: 'Candidate',
      status: 'Pending Manual Verification',
      health: 55,
      missingItems: ['Owner capsule approval', 'Capsule packaging rule']),
  KernelItem(
      title: 'Archive Capsule Candidate',
      subtitle: 'Archive history can later package stable recovery capsules.',
      section: 'Capsules',
      type: 'Candidate',
      status: 'Not Connected Yet',
      health: 50,
      missingItems: ['Archive capsule writer', 'Restore reader']),
];

const block6EvolutionItems = <KernelItem>[
  KernelItem(
      title: 'Generation 1 Evolution Trail',
      subtitle: 'Blocks 1-7 record the first coherent OS kernel trail.',
      section: 'Evolution',
      type: 'Timeline',
      status: 'Connected',
      health: 80,
      missingItems: ['Future Generation 2 pointer']),
  KernelItem(
      title: 'Commercial Evolution Trail',
      subtitle:
          'Commercial V2 freeze, clean web foundation, specialist/center rooms.',
      section: 'Evolution',
      type: 'Commercial',
      status: 'Connected',
      health: 78,
      missingItems: ['Final public showcase wiring pending']),
  KernelItem(
      title: 'Archive Evolution Trail',
      subtitle:
          'Archive OS, immutable docs, block dashboards, and registry memory.',
      section: 'Evolution',
      type: 'Archive',
      status: 'Connected',
      health: 84,
      missingItems: ['Archive reader runtime pending']),
  KernelItem(
      title: 'Owner Review Evolution Trail',
      subtitle:
          'Admin visual room and archive section are present, but owner publish review remains pending.',
      section: 'Evolution',
      type: 'Owner',
      status: 'Pending Manual Verification',
      health: 62,
      missingItems: ['Owner publish review']),
];

const block6RestoreItems = <KernelItem>[
  KernelItem(
      title: 'Restore Readiness: Documentation',
      subtitle:
          'Documentation is preserved and indexed enough for owner review.',
      section: 'Restore',
      type: 'Readiness',
      status: 'Connected',
      health: 78,
      missingItems: ['Latest/canonical pointer runtime']),
  KernelItem(
      title: 'Restore Readiness: Runtime',
      subtitle:
          'Routes exist for block dashboards, but analyzer/build verification is manual pending.',
      section: 'Restore',
      type: 'Readiness',
      status: 'Pending Manual Verification',
      health: 58,
      missingItems: [
        'dart format not run',
        'flutter analyze not run',
        'flutter build web not run'
      ]),
  KernelItem(
      title: 'Restore Readiness: Firebase',
      subtitle:
          'No Firebase/Firestore changes were made by the kernel completion blocks.',
      section: 'Restore',
      type: 'Readiness',
      status: 'Connected',
      health: 90,
      missingItems: []),
];
