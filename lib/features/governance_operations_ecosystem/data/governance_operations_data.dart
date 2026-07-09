import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const governanceOpsMetrics = <KernelMetric>[
  KernelMetric('Governance areas', '18', Icons.policy_outlined),
  KernelMetric('Playbooks', '10', Icons.menu_book_outlined),
  KernelMetric('Document rules', '9', Icons.description_outlined),
  KernelMetric('Vault templates', '18', Icons.mark_email_read_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const governanceOperationsItems = <KernelItem>[
  KernelItem(
      title: 'Complaint Governance',
      subtitle:
          'Complaint intake, routing, review, resolution, appeal, archive, and reporting doctrine.',
      section: 'Governance Operations',
      type: 'Complaint',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Live complaint intake: Not Connected Yet']),
  KernelItem(
      title: 'Suggestion Governance',
      subtitle:
          'Suggestion intake, classification, review, owner visibility, and archival process.',
      section: 'Governance Operations',
      type: 'Suggestion',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Suggestion runtime: Not Connected Yet']),
  KernelItem(
      title: 'Community Moderation',
      subtitle:
          'Moderation doctrine centered on safety, education, de-escalation, and restoration.',
      section: 'Governance Operations',
      type: 'Moderation',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Moderator assignment runtime']),
  KernelItem(
      title: 'Investigation Engine',
      subtitle:
          'Investigation stages for evidence review, parties, context, findings, escalation, and closure.',
      section: 'Governance Operations',
      type: 'Investigation',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Investigation case store']),
  KernelItem(
      title: 'Evidence Management',
      subtitle:
          'Evidence collection, accepted sources, retention, archive requirements, and review status.',
      section: 'Governance Operations',
      type: 'Evidence',
      status: 'Foundation Created',
      health: 84,
      missingItems: ['Evidence storage runtime']),
  KernelItem(
      title: 'Temporary Restriction Logic',
      subtitle:
          'Temporary restriction doctrine for safety while preserving review and appeal rights.',
      section: 'Governance Operations',
      type: 'Restriction',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Restriction runtime: Not Connected Yet']),
  KernelItem(
      title: 'Rehabilitation-first Resolution',
      subtitle:
          'Education, de-escalation, restoration, and safe correction are preferred whenever appropriate.',
      section: 'Governance Operations',
      type: 'Resolution',
      status: 'Foundation Created',
      health: 88,
      missingItems: ['Resolution workflow runtime']),
  KernelItem(
      title: 'False Report Handling',
      subtitle:
          'False, malicious, mistaken, or unsupported report handling with proportional response.',
      section: 'Governance Operations',
      type: 'False Report',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Pattern detection: Not Connected Yet']),
  KernelItem(
      title: 'Appeals Workflow',
      subtitle:
          'Appeal intake, evidence review, independent review, outcome, archive, and notification doctrine.',
      section: 'Governance Operations',
      type: 'Appeal',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Appeal panel runtime']),
  KernelItem(
      title: 'Escalation Workflow',
      subtitle:
          'Escalation routing to technical, governance, compliance, owner, archive, monitoring, or external safety channels.',
      section: 'Governance Operations',
      type: 'Escalation',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Escalation dispatcher']),
  KernelItem(
      title: 'Incident Management',
      subtitle:
          'Incident classification, severity, evidence, containment, resolution, recovery, and timeline doctrine.',
      section: 'Governance Operations',
      type: 'Incident',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Incident runtime']),
  KernelItem(
      title: 'Criminal Incident Handling',
      subtitle:
          'High-severity doctrine for potential criminal incidents, preservation, owner/legal escalation, and safety-first handling.',
      section: 'Governance Operations',
      type: 'Critical Incident',
      status: 'Foundation Created',
      health: 86,
      missingItems: ['Legal/external process not connected']),
  KernelItem(
      title: 'Identity Fraud Handling',
      subtitle:
          'Impersonation, fake credentials, account misuse, false identity, and provider/organization fraud doctrine.',
      section: 'Governance Operations',
      type: 'Identity Fraud',
      status: 'Foundation Created',
      health: 84,
      missingItems: ['Identity verification runtime']),
  KernelItem(
      title: 'Child Safety Escalation',
      subtitle:
          'Child safety concerns require immediate protective escalation and careful evidence preservation.',
      section: 'Governance Operations',
      type: 'Child Safety',
      status: 'Foundation Created',
      health: 90,
      missingItems: ['External escalation channel not connected']),
  KernelItem(
      title: 'Copyright Handling',
      subtitle:
          'Copyright reports, asset ownership review, takedown review, dispute, and archive doctrine.',
      section: 'Governance Operations',
      type: 'Copyright',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Rights registry runtime']),
  KernelItem(
      title: 'Technical Complaint Handling',
      subtitle:
          'Technical bugs, access issues, data issues, device/browser problems, and recovery routing.',
      section: 'Governance Operations',
      type: 'Technical Complaint',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Issue tracker runtime']),
  KernelItem(
      title: 'Accessibility Complaint Handling',
      subtitle:
          'Accessibility barriers, assistive experience gaps, inclusive design concerns, and response doctrine.',
      section: 'Governance Operations',
      type: 'Accessibility Complaint',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Accessibility audit runtime']),
  KernelItem(
      title: 'Provider + Organization Complaint Routing',
      subtitle:
          'Separate routing logic for provider and organization complaints, evidence, review, escalation, and resolution.',
      section: 'Governance Operations',
      type: 'Routing',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Routing automation: Not Connected Yet']),
];

const governancePlaybookItems = <KernelItem>[
  KernelItem(
      title: 'Technical Issues',
      subtitle:
          'Intake, reproduction, impact, workaround, priority, review, resolution, and archive.',
      section: 'Playbooks',
      type: 'Technical',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Issue tracker not connected']),
  KernelItem(
      title: 'Community Conflicts',
      subtitle:
          'De-escalation-first handling for interpersonal conflicts and community tension.',
      section: 'Playbooks',
      type: 'Community',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Community moderation runtime']),
  KernelItem(
      title: 'Harassment',
      subtitle:
          'Safety-first handling, evidence capture, temporary restriction review, escalation, and support.',
      section: 'Playbooks',
      type: 'Safety',
      status: 'Foundation Created',
      health: 86,
      missingItems: ['Live report intake']),
  KernelItem(
      title: 'Spam',
      subtitle:
          'Spam classification, user education, restriction review, repeat abuse escalation.',
      section: 'Playbooks',
      type: 'Abuse',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Spam detector not connected']),
  KernelItem(
      title: 'Impersonation',
      subtitle:
          'Identity fraud and impersonation review, evidence, claim verification, and escalation.',
      section: 'Playbooks',
      type: 'Identity',
      status: 'Foundation Created',
      health: 84,
      missingItems: ['Identity verification not connected']),
  KernelItem(
      title: 'Provider Complaints',
      subtitle:
          'Provider complaint routing, evidence, review, provider response, outcome, and archive.',
      section: 'Playbooks',
      type: 'Provider',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Provider complaint runtime']),
  KernelItem(
      title: 'Organization Complaints',
      subtitle:
          'Organization complaint routing, official contact review, evidence, and escalation.',
      section: 'Playbooks',
      type: 'Organization',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Organization registry runtime']),
  KernelItem(
      title: 'Platform Abuse',
      subtitle:
          'Misuse of Mental Smile tools, accounts, AI, content, or publication surfaces.',
      section: 'Playbooks',
      type: 'Abuse',
      status: 'Foundation Created',
      health: 84,
      missingItems: ['Abuse detector not connected']),
  KernelItem(
      title: 'Child Safety',
      subtitle: 'Critical escalation doctrine for child safety concerns.',
      section: 'Playbooks',
      type: 'Critical Safety',
      status: 'Foundation Created',
      health: 92,
      missingItems: ['External escalation channel not connected']),
  KernelItem(
      title: 'Emergency Escalation',
      subtitle:
          'Emergency escalation doctrine with safety-first response and archive record.',
      section: 'Playbooks',
      type: 'Emergency',
      status: 'Foundation Created',
      health: 88,
      missingItems: ['Emergency service integration: Not Connected Yet']),
];

const documentGovernanceItems = <KernelItem>[
  KernelItem(
      title: 'Active Document Rule',
      subtitle:
          'Every active document must have one current/canonical destination.',
      section: 'Document Governance',
      type: 'Rule',
      status: 'Foundation Created',
      health: 90,
      missingItems: ['Canonical pointer runtime']),
  KernelItem(
      title: 'Single Source of Truth',
      subtitle:
          'One active source per governed document type, with history preserved separately.',
      section: 'Document Governance',
      type: 'Rule',
      status: 'Foundation Created',
      health: 90,
      missingItems: ['Latest layer runtime']),
  KernelItem(
      title: 'Document Lifecycle',
      subtitle:
          'Draft, review, current, frozen, superseded, retired, archived, restored.',
      section: 'Document Governance',
      type: 'Lifecycle',
      status: 'Foundation Created',
      health: 88,
      missingItems: ['Lifecycle automation forbidden']),
  KernelItem(
      title: 'Version Governance',
      subtitle:
          'Meaningful changes require new versions, old versions remain readable.',
      section: 'Document Governance',
      type: 'Versioning',
      status: 'Foundation Created',
      health: 92,
      missingItems: []),
  KernelItem(
      title: 'Freeze Governance',
      subtitle: 'Freezing prevents unsafe mutation while preserving evidence.',
      section: 'Document Governance',
      type: 'Freeze',
      status: 'Foundation Created',
      health: 88,
      missingItems: ['Freeze registry runtime']),
  KernelItem(
      title: 'Amendment Governance',
      subtitle:
          'Amendments are recorded as addenda or new versions, not silent overwrites.',
      section: 'Document Governance',
      type: 'Amendment',
      status: 'Foundation Created',
      health: 90,
      missingItems: []),
  KernelItem(
      title: 'Archive Governance',
      subtitle:
          'Archive preserves history and invalidated/superseded truth without deletion.',
      section: 'Document Governance',
      type: 'Archive',
      status: 'Foundation Created',
      health: 92,
      missingItems: ['Archive reader runtime']),
  KernelItem(
      title: 'Restoration Governance',
      subtitle:
          'Restoration requires evidence, owner review, and documented reason.',
      section: 'Document Governance',
      type: 'Restoration',
      status: 'Foundation Created',
      health: 86,
      missingItems: ['Restoration workflow runtime']),
  KernelItem(
      title: 'Naming + Ownership Standards',
      subtitle:
          'Documents must declare section, owner, version, status, and constitutional home.',
      section: 'Document Governance',
      type: 'Standards',
      status: 'Foundation Created',
      health: 88,
      missingItems: ['Naming validator not connected']),
];

const corporateVaultItems = <KernelItem>[
  KernelItem(
      title: 'Official Email Templates',
      subtitle: 'General official communication templates.',
      section: 'Corporate Communication Vault',
      type: 'Template',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Template content approval']),
  KernelItem(
      title: 'Sponsor + Investor Templates',
      subtitle: 'Sponsor and investor outreach templates.',
      section: 'Corporate Communication Vault',
      type: 'Template',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Business review pending']),
  KernelItem(
      title: 'Government + NGO Templates',
      subtitle: 'Government and NGO official communication templates.',
      section: 'Corporate Communication Vault',
      type: 'Template',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Legal review pending']),
  KernelItem(
      title: 'Media Templates + Media Kit + Press Kit',
      subtitle: 'Media communication and brand package foundations.',
      section: 'Corporate Communication Vault',
      type: 'Media',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Brand review pending']),
  KernelItem(
      title: 'Official Letters + Certificates',
      subtitle: 'Formal letters, certificates, signatures, and letterheads.',
      section: 'Corporate Communication Vault',
      type: 'Official Document',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Signature authority pending']),
  KernelItem(
      title: 'Meeting Templates + Minutes',
      subtitle: 'Meeting agenda, minutes, and decision record templates.',
      section: 'Corporate Communication Vault',
      type: 'Meeting',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Meeting registry runtime']),
  KernelItem(
      title: 'Executive Summary + One Pager + Organization Profile',
      subtitle: 'Core external-facing summary templates.',
      section: 'Corporate Communication Vault',
      type: 'Profile',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Final copy approval']),
  KernelItem(
      title: 'Incoming + Outgoing Registry',
      subtitle:
          'Official communication intake and outgoing record registry foundation.',
      section: 'Corporate Communication Vault',
      type: 'Registry',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Registry runtime not connected']),
];
