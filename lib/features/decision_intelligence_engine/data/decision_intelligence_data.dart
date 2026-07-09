import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const decisionMetrics = <KernelMetric>[
  KernelMetric('Decision layers', '10', Icons.balance_outlined),
  KernelMetric('Rules execute', 'NO', Icons.rule_folder_outlined),
  KernelMetric('Decisions execute', 'NO', Icons.not_interested_outlined),
  KernelMetric('Policies', '7', Icons.policy_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const decisionOverviewItems = <KernelItem>[
  KernelItem(
      title: 'Decision Engine',
      subtitle:
          'Decision registry, type, scope, context, dependencies, confidence, explanation, status, history, and outcome.',
      section: 'Decision Intelligence',
      type: 'Decision Engine',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Decision execution: Forbidden']),
  KernelItem(
      title: 'Constitutional Rule Engine',
      subtitle:
          'Evaluates constitutional, workshop, owner, runtime, safety, compliance, publication, and archive rules.',
      section: 'Decision Intelligence',
      type: 'Rule Engine',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Rule executor: Not Connected Yet']),
  KernelItem(
      title: 'Policy Engine',
      subtitle:
          'Governed policies for AI, prompts, knowledge, assets, runtime permissions, publication permissions, and human approval.',
      section: 'Decision Intelligence',
      type: 'Policy Engine',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Policy editor: Not Connected Yet']),
  KernelItem(
      title: 'Approval Intelligence',
      subtitle:
          'Approval ladder from no approval required through final decision.',
      section: 'Decision Intelligence',
      type: 'Approval',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Approval runtime: Not Connected Yet']),
  KernelItem(
      title: 'Risk Evaluation Engine',
      subtitle:
          'Operational, governance, compliance, privacy, safety, content, architecture, and publication risk scoring.',
      section: 'Decision Intelligence',
      type: 'Risk',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Risk automation: Forbidden']),
  KernelItem(
      title: 'Recommendation Engine',
      subtitle:
          'Recommends best AI, prompt pack, knowledge pack, workflow, review path, publishing path, and recovery path.',
      section: 'Decision Intelligence',
      type: 'Recommendation',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Recommendation execution: Forbidden']),
  KernelItem(
      title: 'Escalation Engine',
      subtitle:
          'Configurable escalation to technical, governance, compliance, owner, archive, and monitoring.',
      section: 'Decision Intelligence',
      type: 'Escalation',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Escalation dispatch: Not Connected Yet']),
  KernelItem(
      title: 'Decision Dashboard',
      subtitle:
          'Pending decisions, high risk, recommendations, approval queue, policy violations, rules, timeline, escalations, health, and metrics.',
      section: 'Decision Intelligence',
      type: 'Dashboard',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Live decision feed: Not Connected Yet']),
  KernelItem(
      title: 'Decision Analytics',
      subtitle:
          'Decision statistics, approval statistics, risk distribution, recommendation accuracy, rule usage, policy usage, escalation frequency, and history.',
      section: 'Decision Intelligence',
      type: 'Analytics',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Analytics collector: Not Connected Yet']),
  KernelItem(
      title: 'Workshop Integration',
      subtitle:
          'Navigation integration with Workshop, Intelligence Runtime, Orchestration, AI Team, Knowledge, Prompt Runtime, and Owner Desk.',
      section: 'Decision Intelligence',
      type: 'Integration',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Cross-runtime enforcement: Not Connected Yet']),
];

const decisionEngineItems = <KernelItem>[
  KernelItem(
      title: 'Decision Registry',
      subtitle:
          'Registry foundation for future decisions before work execution.',
      section: 'Decision Engine',
      type: 'Registry',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Decision persistence']),
  KernelItem(
      title: 'Decision Context + Dependencies',
      subtitle:
          'Context and dependency model for evaluating work before execution.',
      section: 'Decision Engine',
      type: 'Context',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Context resolver binding']),
  KernelItem(
      title: 'Decision Confidence + Explanation',
      subtitle:
          'Confidence and explanation metadata for every future decision.',
      section: 'Decision Engine',
      type: 'Explanation',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Evidence collector']),
  KernelItem(
      title: 'Decision History + Outcome',
      subtitle:
          'Decision history and outcome records without applying the decision.',
      section: 'Decision Engine',
      type: 'History',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['History writer']),
];

const ruleEngineItems = <KernelItem>[
  KernelItem(
      title: 'Constitutional Rules',
      subtitle:
          'Generation One constitutional rules are the highest rule layer.',
      section: 'Rule Engine',
      type: 'Rule Layer',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Canonical rule reader']),
  KernelItem(
      title: 'Workshop + Owner Rules',
      subtitle: 'Workshop and owner instruction rules shape future decisions.',
      section: 'Rule Engine',
      type: 'Rule Layer',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Owner rule editor']),
  KernelItem(
      title: 'Runtime + Safety Rules',
      subtitle: 'Runtime and safety rules evaluate work before execution.',
      section: 'Rule Engine',
      type: 'Rule Layer',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Runtime enforcement not connected']),
  KernelItem(
      title: 'Compliance + Publication + Archive Rules',
      subtitle:
          'Compliance, publishing, and archive boundaries are evaluated only.',
      section: 'Rule Engine',
      type: 'Rule Layer',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Publication executor forbidden']),
];

const policyEngineItems = <KernelItem>[
  KernelItem(
      title: 'AI Usage Policy',
      subtitle: 'Policy foundation for how future AI members may be used.',
      section: 'Policy Engine',
      type: 'Policy',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Provider policy binding']),
  KernelItem(
      title: 'Prompt Usage Policy',
      subtitle:
          'Policy foundation for prompt packs, variables, versions, and rollback.',
      section: 'Policy Engine',
      type: 'Policy',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Prompt execution disabled']),
  KernelItem(
      title: 'Knowledge + Asset Usage Policy',
      subtitle:
          'Policy foundation for knowledge and asset usage before publication.',
      section: 'Policy Engine',
      type: 'Policy',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Asset license review']),
  KernelItem(
      title: 'Runtime + Publication Permissions',
      subtitle:
          'Policy foundation for runtime and publication permission decisions.',
      section: 'Policy Engine',
      type: 'Policy',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Permission enforcement not connected']),
  KernelItem(
      title: 'Human Approval Policy',
      subtitle:
          'Policy foundation for technical, governance, compliance, owner, and final approval paths.',
      section: 'Policy Engine',
      type: 'Policy',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Approval UI not connected']),
  KernelItem(
      title: 'Human AI Usage Boundaries',
      subtitle:
          'Role-based AI tool scope for clients, providers, organizations, and owner-supervised use.',
      section: 'Policy Engine',
      type: 'Constitutional Addendum',
      status: 'Current',
      health: 86,
      missingItems: ['Runtime enforcement not connected']),
  KernelItem(
      title: 'Platform Account Publication Logic',
      subtitle:
          'Requires scope, brand, safety, claim, source, decency, conflict, approval, and archive checks before publication.',
      section: 'Policy Engine',
      type: 'Publication Policy',
      status: 'Current',
      health: 88,
      missingItems: ['Publication gate runtime not connected']),
];

const approvalItems = <KernelItem>[
  KernelItem(
      title: 'No Approval Required',
      subtitle: 'Lowest approval level for safe future routine work.',
      section: 'Approval Intelligence',
      type: 'Approval Stage',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Eligibility rules pending']),
  KernelItem(
      title: 'AI Approval',
      subtitle: 'Future AI self-check stage without provider execution.',
      section: 'Approval Intelligence',
      type: 'Approval Stage',
      status: 'Not Connected Yet',
      health: 50,
      missingItems: ['AI providers not connected']),
  KernelItem(
      title: 'Technical + Governance Review',
      subtitle: 'Review gates for implementation and constitutional fit.',
      section: 'Approval Intelligence',
      type: 'Approval Stage',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Reviewer assignment']),
  KernelItem(
      title: 'Compliance + Owner Approval',
      subtitle: 'High authority gates before sensitive future actions.',
      section: 'Approval Intelligence',
      type: 'Approval Stage',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Owner approval runtime']),
  KernelItem(
      title: 'Final Decision',
      subtitle: 'Final decision record is stored as outcome metadata only.',
      section: 'Approval Intelligence',
      type: 'Approval Stage',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Decision application forbidden']),
];

const riskItems = <KernelItem>[
  KernelItem(
      title: 'Operational Risk',
      subtitle: 'Scores operational runtime and workflow risk.',
      section: 'Risk Evaluation',
      type: 'Risk',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Live metrics']),
  KernelItem(
      title: 'Governance + Compliance Risk',
      subtitle: 'Scores governance and compliance risk before work execution.',
      section: 'Risk Evaluation',
      type: 'Risk',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Rule source reader']),
  KernelItem(
      title: 'Privacy + Safety Risk',
      subtitle: 'Scores privacy and safety sensitivity.',
      section: 'Risk Evaluation',
      type: 'Risk',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Sensitive data classifier not connected']),
  KernelItem(
      title: 'Content + Architecture + Publication Risk',
      subtitle: 'Scores content, architecture, and publication risk.',
      section: 'Risk Evaluation',
      type: 'Risk',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Publication runtime forbidden']),
  KernelItem(
      title: 'AI Misuse Risk',
      subtitle:
          'Evaluates sexual misuse, offensive language, irrelevant commercial use, unsafe medical claims, self-diagnosis loops, and brand/account misuse.',
      section: 'Risk Evaluation',
      type: 'Abuse Prevention',
      status: 'Current',
      health: 84,
      missingItems: ['Abuse detector runtime not connected']),
];

const recommendationItems = <KernelItem>[
  KernelItem(
      title: 'Best AI Recommendation',
      subtitle: 'Recommends suitable AI member based on future task shape.',
      section: 'Recommendation Engine',
      type: 'Recommendation',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Live AI availability']),
  KernelItem(
      title: 'Best Prompt + Knowledge Pack',
      subtitle: 'Recommends prompt and knowledge pack metadata only.',
      section: 'Recommendation Engine',
      type: 'Recommendation',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Prompt execution forbidden']),
  KernelItem(
      title: 'Best Workflow + Review Path',
      subtitle: 'Recommends workflow and review route before execution.',
      section: 'Recommendation Engine',
      type: 'Recommendation',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Workflow runner not connected']),
  KernelItem(
      title: 'Best Publishing + Recovery Path',
      subtitle: 'Recommends publishing or recovery path without applying it.',
      section: 'Recommendation Engine',
      type: 'Recommendation',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Publishing automation forbidden']),
];

const escalationItems = <KernelItem>[
  KernelItem(
      title: 'Technical Escalation',
      subtitle: 'Escalates technical risks or implementation uncertainty.',
      section: 'Escalation Engine',
      type: 'Escalation',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Dispatch runtime']),
  KernelItem(
      title: 'Governance + Compliance Escalation',
      subtitle: 'Escalates rule, policy, and compliance issues.',
      section: 'Escalation Engine',
      type: 'Escalation',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Reviewer routing']),
  KernelItem(
      title: 'Owner Escalation',
      subtitle: 'Escalates owner-critical decisions.',
      section: 'Escalation Engine',
      type: 'Escalation',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Owner approval UI']),
  KernelItem(
      title: 'Archive + Monitoring Escalation',
      subtitle: 'Escalates archive/history and monitoring risks.',
      section: 'Escalation Engine',
      type: 'Escalation',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Monitoring runtime binding']),
];

const decisionAnalyticsItems = <KernelItem>[
  KernelItem(
      title: 'Decision Statistics',
      subtitle: 'Decision count and status distribution model.',
      section: 'Decision Analytics',
      type: 'Analytics',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Stats collector']),
  KernelItem(
      title: 'Approval Statistics',
      subtitle: 'Approval path distribution and queue model.',
      section: 'Decision Analytics',
      type: 'Analytics',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Approval runtime']),
  KernelItem(
      title: 'Risk Distribution',
      subtitle: 'Risk score and category distribution model.',
      section: 'Decision Analytics',
      type: 'Analytics',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Risk event source']),
  KernelItem(
      title: 'Recommendation Accuracy',
      subtitle: 'Future recommendation feedback model.',
      section: 'Decision Analytics',
      type: 'Analytics',
      status: 'Not Connected Yet',
      health: 45,
      missingItems: ['No execution feedback yet']),
  KernelItem(
      title: 'Rule + Policy Usage',
      subtitle: 'Rule and policy usage model for future audit visibility.',
      section: 'Decision Analytics',
      type: 'Analytics',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Usage tracker']),
  KernelItem(
      title: 'Escalation Frequency + History',
      subtitle: 'Escalation frequency and decision history model.',
      section: 'Decision Analytics',
      type: 'Analytics',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Timeline writer']),
];
