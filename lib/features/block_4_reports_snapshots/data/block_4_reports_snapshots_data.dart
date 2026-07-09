import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const block4Metrics = <KernelMetric>[
  KernelMetric('Reports discovered', '362', Icons.article_outlined),
  KernelMetric('Snapshots discovered', '7', Icons.camera_outlined),
  KernelMetric('Audits discovered', '72', Icons.fact_check_outlined),
  KernelMetric('Completion records', '17', Icons.verified_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const block4ReportItems = <KernelItem>[
  KernelItem(
      title: 'Completion Reports',
      subtitle:
          'Completion evidence documents discovered in repository documentation.',
      section: 'Reports',
      type: 'Completion',
      status: 'Connected',
      health: 88,
      missingItems: ['Automated latest pointer: Not Connected Yet']),
  KernelItem(
      title: 'Forensic Audits',
      subtitle: 'Audit documents used as historical and operational evidence.',
      section: 'Reports',
      type: 'Audit',
      status: 'Connected',
      health: 86,
      missingItems: ['Live audit reader: Not Connected Yet']),
  KernelItem(
      title: 'Runtime Reports',
      subtitle: 'Runtime creation, cleanup, routing, and UI operation reports.',
      section: 'Reports',
      type: 'Runtime',
      status: 'Connected',
      health: 82,
      missingItems: ['Automated report classifier: Not Connected Yet']),
  KernelItem(
      title: 'Archive Reports',
      subtitle:
          'Archive extraction, vault, history, and immutable governance reports.',
      section: 'Archive',
      type: 'Archive',
      status: 'Connected',
      health: 84,
      missingItems: ['Archive room reader: Not Connected Yet']),
  KernelItem(
      title: 'Snapshot Records',
      subtitle:
          'Repository snapshot documents and generated kernel snapshot counters.',
      section: 'Snapshots',
      type: 'Snapshot',
      status: 'Connected',
      health: 76,
      missingItems: ['Scheduled snapshot runtime: Not Connected Yet']),
  KernelItem(
      title: 'Health Findings',
      subtitle:
          'Manual health findings exposed as read-only dashboard records.',
      section: 'Health',
      type: 'Health',
      status: 'Not Connected Yet',
      health: 61,
      missingItems: [
        'Live analyzer gate',
        'Build gate',
        'Firebase deployment gate'
      ]),
  KernelItem(
      title: 'Timeline Feed',
      subtitle:
          'Operations timeline material based on registry and index evidence.',
      section: 'Timeline',
      type: 'Timeline',
      status: 'Connected',
      health: 80,
      missingItems: ['Chronological UI drilldown: Not Connected Yet']),
];

const block4SnapshotItems = <KernelItem>[
  KernelItem(
      title: 'Operations Snapshot',
      subtitle: 'Operations registry/index are the active evidence base.',
      section: 'Snapshots',
      type: 'Snapshot',
      status: 'Connected',
      health: 90,
      missingItems: []),
  KernelItem(
      title: 'Documentation Snapshot',
      subtitle:
          'Reports, guides, registries, cards, and constitutions counted from repository files.',
      section: 'Snapshots',
      type: 'Snapshot',
      status: 'Connected',
      health: 84,
      missingItems: ['Immutable latest pointer: Not Connected Yet']),
  KernelItem(
      title: 'Runtime Route Snapshot',
      subtitle: 'Route count captured from current routes.dart inventory.',
      section: 'Snapshots',
      type: 'Route Snapshot',
      status: 'Connected',
      health: 78,
      missingItems: ['Route health runner: Not Connected Yet']),
  KernelItem(
      title: 'Missing Item Snapshot',
      subtitle:
          'Missing and pending items are displayed without creating replacements.',
      section: 'Snapshots',
      type: 'Missing Items',
      status: 'Connected',
      health: 72,
      missingItems: ['Automated owner approval gate']),
];

const block4HealthItems = <KernelItem>[
  KernelItem(
      title: 'Report Health Gate',
      subtitle:
          'Reports are visible, searchable, and filterable by dashboard category.',
      section: 'Health',
      type: 'Gate',
      status: 'Connected',
      health: 82,
      missingItems: ['Direct file opening: Not Connected Yet']),
  KernelItem(
      title: 'Snapshot Health Gate',
      subtitle: 'Snapshots are evidence-only and do not mutate documentation.',
      section: 'Health',
      type: 'Gate',
      status: 'Connected',
      health: 79,
      missingItems: ['Scheduled snapshot capture']),
  KernelItem(
      title: 'Timeline Health Gate',
      subtitle: 'Timeline is registry-based and avoids fake events.',
      section: 'Health',
      type: 'Gate',
      status: 'Connected',
      health: 80,
      missingItems: ['Calendar view: Not Connected Yet']),
  KernelItem(
      title: 'Publish Gate',
      subtitle:
          'Requires manual dart format, flutter analyze, and owner publish review.',
      section: 'Health',
      type: 'Gate',
      status: 'Pending Manual Verification',
      health: 55,
      missingItems: [
        'dart format not run',
        'flutter analyze not run',
        'flutter build web not run'
      ]),
];

const block4TimelineItems = <KernelItem>[
  KernelItem(
      title: 'Block 1 Completed',
      subtitle: 'Archive and Operations module completed on 2026-06-29.',
      section: 'Timeline',
      type: 'Operation',
      status: 'Connected',
      health: 92,
      missingItems: []),
  KernelItem(
      title: 'Block 2 Completed',
      subtitle:
          'Guides, Constitutions, and Governance module completed on 2026-06-29.',
      section: 'Timeline',
      type: 'Operation',
      status: 'Connected',
      health: 92,
      missingItems: []),
  KernelItem(
      title: 'Block 3 Completed',
      subtitle: 'Card Kernel module completed on 2026-06-29.',
      section: 'Timeline',
      type: 'Operation',
      status: 'Connected',
      health: 92,
      missingItems: []),
  KernelItem(
      title: 'Block 4 Completion',
      subtitle:
          'Reports and Snapshots module created as Generation 1 completion block.',
      section: 'Timeline',
      type: 'Operation',
      status: 'Connected',
      health: 86,
      missingItems: ['Owner manual verification pending']),
];
