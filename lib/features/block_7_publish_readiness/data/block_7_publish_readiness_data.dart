import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const block7Metrics = <KernelMetric>[
  KernelMetric('Routes current', '114', Icons.route_outlined),
  KernelMetric('Assets snapshot', '184', Icons.image_outlined),
  KernelMetric('Operations records', '268', Icons.receipt_long_outlined),
  KernelMetric('Manual gates', '3', Icons.pending_actions_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const block7PublishItems = <KernelItem>[
  KernelItem(
      title: 'Owner Publish Review Gate',
      subtitle:
          'Generation 1 is prepared for owner review, not auto-published.',
      section: 'Publish Readiness',
      type: 'Gate',
      status: 'Pending Manual Verification',
      health: 65,
      missingItems: ['Owner publish decision']),
  KernelItem(
      title: 'Format Gate',
      subtitle: 'dart format must be run manually by owner as requested.',
      section: 'Publish Readiness',
      type: 'Manual Command',
      status: 'Pending Manual Verification',
      health: 50,
      missingItems: ['dart format not run']),
  KernelItem(
      title: 'Analyze Gate',
      subtitle: 'flutter analyze must be run manually by owner as requested.',
      section: 'Publish Readiness',
      type: 'Manual Command',
      status: 'Pending Manual Verification',
      health: 50,
      missingItems: ['flutter analyze not run']),
  KernelItem(
      title: 'Build Gate',
      subtitle: 'flutter build web is intentionally not run by this operation.',
      section: 'Publish Readiness',
      type: 'Manual Command',
      status: 'Pending Manual Verification',
      health: 45,
      missingItems: ['flutter build web not run']),
];

const block7EvolutionItems = <KernelItem>[
  KernelItem(
      title: 'Self Evolution Boundary',
      subtitle:
          'Self evolution is visible as governance/readiness only, not autonomous mutation.',
      section: 'Self Evolution',
      type: 'Boundary',
      status: 'Connected',
      health: 84,
      missingItems: ['Automated self-modification: Forbidden']),
  KernelItem(
      title: 'Future Generation 2 Hook',
      subtitle:
          'A future generation can read these blocks after owner approval.',
      section: 'Self Evolution',
      type: 'Future',
      status: 'Not Connected Yet',
      health: 58,
      missingItems: ['Generation 2 prompt not approved']),
  KernelItem(
      title: 'Immutable Docs Protection',
      subtitle:
          'Documentation updates preserve truth through new versions and indexes.',
      section: 'Self Evolution',
      type: 'Governance',
      status: 'Connected',
      health: 88,
      missingItems: []),
];

const block7OsHealthItems = <KernelItem>[
  KernelItem(
      title: 'Archive Health',
      subtitle: 'Archive and operations dashboards are present and searchable.',
      section: 'OS Health',
      type: 'Health',
      status: 'Connected',
      health: 86,
      missingItems: ['File reader runtime']),
  KernelItem(
      title: 'Guides and Constitution Health',
      subtitle: 'Governance layer is visible through Block 2 routes.',
      section: 'OS Health',
      type: 'Health',
      status: 'Connected',
      health: 84,
      missingItems: ['Latest document pointer']),
  KernelItem(
      title: 'Card Kernel Health',
      subtitle: 'Card kernel routes and compliance surfaces are present.',
      section: 'OS Health',
      type: 'Health',
      status: 'Connected',
      health: 82,
      missingItems: ['Live card mutation protection runtime']),
  KernelItem(
      title: 'Reports and Prompt Health',
      subtitle:
          'Blocks 4 and 5 expose reports, snapshots, prompts, and memory states.',
      section: 'OS Health',
      type: 'Health',
      status: 'Connected',
      health: 78,
      missingItems: ['Live source readers']),
  KernelItem(
      title: 'DNA and Publish Health',
      subtitle: 'Blocks 6 and 7 expose final readiness and manual gate risks.',
      section: 'OS Health',
      type: 'Health',
      status: 'Pending Manual Verification',
      health: 66,
      missingItems: ['Owner publish review', 'Manual command gates']),
];

const block7FinalGateItems = <KernelItem>[
  KernelItem(
      title: 'Runtime Changed',
      subtitle:
          'YES, routes/pages for Blocks 4-7 were added. No Firebase or Firestore changes.',
      section: 'Final Gates',
      type: 'Runtime',
      status: 'Connected',
      health: 80,
      missingItems: ['Manual analyze pending']),
  KernelItem(
      title: 'Firebase Gate',
      subtitle: 'Firebase, Firestore, Storage, and rules were not changed.',
      section: 'Final Gates',
      type: 'Safety',
      status: 'Connected',
      health: 100,
      missingItems: []),
  KernelItem(
      title: 'No Fake Data Gate',
      subtitle:
          'Counters use repository snapshot counts gathered before creation.',
      section: 'Final Gates',
      type: 'Evidence',
      status: 'Connected',
      health: 85,
      missingItems: ['Exact per-document reader pending']),
  KernelItem(
      title: 'Owner Review Gate',
      subtitle: 'Kernel is certified for owner publish review only.',
      section: 'Final Gates',
      type: 'Approval',
      status: 'Pending Manual Verification',
      health: 60,
      missingItems: ['Owner review not performed by Codex']),
];
