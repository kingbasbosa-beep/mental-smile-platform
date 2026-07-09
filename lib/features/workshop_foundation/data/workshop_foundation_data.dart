import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

const workshopMetrics = <KernelMetric>[
  KernelMetric(
      'Workshop sections', '10', Icons.precision_manufacturing_outlined),
  KernelMetric('API connections', 'NO', Icons.link_off_outlined),
  KernelMetric('Automation', 'NO', Icons.smart_toy_outlined),
  KernelMetric('Generation', '1.5', Icons.auto_awesome_outlined),
  KernelMetric('Firebase changed', 'NO', Icons.cloud_off_outlined),
];

const workshopOverviewItems = <KernelItem>[
  KernelItem(
      title: 'AI Team',
      subtitle:
          'Permanent AI workforce registry for ChatGPT, Codex, Gemini, Claude, Cursor AI, Copilot, local models, and future assistants.',
      section: 'Workshop',
      type: 'AI Workforce',
      status: 'Foundation Created',
      health: 78,
      missingItems: [
        'Live availability: Not Connected Yet',
        'Automated task assignment: Not Connected Yet'
      ]),
  KernelItem(
      title: 'AI Tools',
      subtitle:
          'Engineering tool inventory for coding, design, Firebase, DevTools, local AI, automation tools, and future toolchains.',
      section: 'Workshop',
      type: 'Tools',
      status: 'Foundation Created',
      health: 76,
      missingItems: [
        'Version detector: Not Connected Yet',
        'Install automation: Forbidden'
      ]),
  KernelItem(
      title: 'Digital Presence',
      subtitle:
          'Public presence governance for website, domains, social accounts, communication channels, and brand health.',
      section: 'Workshop',
      type: 'Presence',
      status: 'Foundation Created',
      health: 72,
      missingItems: [
        'Followers: Not Connected Yet',
        'Verification reader: Not Connected Yet'
      ]),
  KernelItem(
      title: 'Accounts Registry',
      subtitle:
          'Governed account map for Google, OpenAI, GitHub, Firebase, Figma, Meta, Telegram, Microsoft, Cloudflare, and stores.',
      section: 'Workshop',
      type: 'Accounts',
      status: 'Foundation Created',
      health: 74,
      missingItems: [
        'Security review automation: Not Connected Yet',
        'Credential storage: Forbidden'
      ]),
  KernelItem(
      title: 'Prompt Workshop',
      subtitle:
          'Prompt engineering center for architecture, Flutter, governance, content, marketing, branding, accessibility, reports, and migration.',
      section: 'Workshop',
      type: 'Prompts',
      status: 'Foundation Created',
      health: 80,
      missingItems: [
        'Prompt execution: Not Connected Yet',
        'Prompt writer: Not Connected Yet'
      ]),
  KernelItem(
      title: 'Knowledge Library',
      subtitle:
          'Reference library for books, papers, WHO, government sources, accessibility, mental health, Flutter, Firebase, and architecture.',
      section: 'Workshop',
      type: 'Knowledge',
      status: 'Foundation Created',
      health: 73,
      missingItems: ['External source sync: Not Connected Yet']),
  KernelItem(
      title: 'Workstation Readiness',
      subtitle:
          'Planning surface for future Sovereign Desktop hardware, software, models, storage, backup, and synchronization.',
      section: 'Workshop',
      type: 'Workstation',
      status: 'Foundation Created',
      health: 70,
      missingItems: [
        'Install automation: Forbidden',
        'Hardware scan: Not Connected Yet'
      ]),
  KernelItem(
      title: 'Asset Library',
      subtitle:
          'Inventory layer for icons, illustrations, backgrounds, videos, logos, audio, animations, fonts, mockups, and templates.',
      section: 'Workshop',
      type: 'Assets',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Asset preview browser: Not Connected Yet']),
  KernelItem(
      title: 'Owner Desk',
      subtitle:
          'Daily operating desk for priorities, open operations, reports, weekly review, pinned tools, prompts, accounts, and future goals.',
      section: 'Workshop',
      type: 'Owner Desk',
      status: 'Foundation Created',
      health: 75,
      missingItems: ['Daily live feed: Not Connected Yet']),
  KernelItem(
      title: 'Generation Two Preparation',
      subtitle:
          'Readiness checklist for Kernel, Workshop, AI Team, Accounts, Tools, Presence, Prompts, Knowledge, Assets, and publish gates.',
      section: 'Workshop',
      type: 'Generation Two',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Owner readiness approval', 'Workshop complete review']),
];

const aiTeamItems = <KernelItem>[
  KernelItem(
      title: 'ChatGPT',
      subtitle:
          'Architecture, governance, structure, strategy, memory shaping, and high-level reasoning partner.',
      section: 'AI Team',
      type: 'AI Member',
      status: 'Foundation Created',
      health: 82,
      missingItems: [
        'Live availability: Not Connected Yet',
        'Prompt pack binding'
      ]),
  KernelItem(
      title: 'Codex',
      subtitle:
          'Implementation, runtime, Flutter editing, documentation generation, verification support, and repository operations.',
      section: 'AI Team',
      type: 'AI Member',
      status: 'Foundation Created',
      health: 84,
      missingItems: ['Background agent execution: Forbidden']),
  KernelItem(
      title: 'Gemini',
      subtitle: 'Future multimodal and research assistant candidate.',
      section: 'AI Team',
      type: 'AI Member',
      status: 'Not Connected Yet',
      health: 45,
      missingItems: ['Capabilities review pending']),
  KernelItem(
      title: 'Claude',
      subtitle:
          'Future long-context writing, reasoning, and documentation assistant candidate.',
      section: 'AI Team',
      type: 'AI Member',
      status: 'Not Connected Yet',
      health: 45,
      missingItems: ['Capabilities review pending']),
  KernelItem(
      title: 'Cursor AI',
      subtitle: 'Future IDE-integrated coding assistant candidate.',
      section: 'AI Team',
      type: 'AI Member',
      status: 'Not Connected Yet',
      health: 42,
      missingItems: ['IDE policy pending']),
  KernelItem(
      title: 'GitHub Copilot',
      subtitle: 'Future code completion and repository assistant candidate.',
      section: 'AI Team',
      type: 'AI Member',
      status: 'Not Connected Yet',
      health: 42,
      missingItems: ['License/account review pending']),
  KernelItem(
      title: 'Future Local Models',
      subtitle:
          'Local/private model family for future sovereign workstation work.',
      section: 'AI Team',
      type: 'AI Member',
      status: 'Future',
      health: 35,
      missingItems: ['Local workstation not implemented']),
];

const aiToolsItems = <KernelItem>[
  KernelItem(
      title: 'OpenAI + Codex',
      subtitle: 'Primary AI engineering and implementation environment.',
      section: 'AI Tools',
      type: 'AI Tool',
      status: 'Foundation Created',
      health: 82,
      missingItems: ['Version/account status: Not Connected Yet']),
  KernelItem(
      title: 'Flutter + Dart',
      subtitle: 'Primary application runtime and UI framework.',
      section: 'AI Tools',
      type: 'Runtime Tool',
      status: 'Foundation Created',
      health: 78,
      missingItems: ['Version detector: Not Connected Yet']),
  KernelItem(
      title: 'Firebase',
      subtitle:
          'Backend platform inventory only. No Firestore or rules changes in Workshop.',
      section: 'AI Tools',
      type: 'Backend Tool',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Project health reader: Not Connected Yet']),
  KernelItem(
      title: 'Git + GitHub Desktop',
      subtitle: 'Source control and future owner review workflow.',
      section: 'AI Tools',
      type: 'Version Control',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Commit automation: Forbidden']),
  KernelItem(
      title: 'VS Code + Android Studio',
      subtitle: 'Development environments for Flutter and platform work.',
      section: 'AI Tools',
      type: 'IDE',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Installation verification: Not Connected Yet']),
  KernelItem(
      title: 'Docker + Python + PowerShell',
      subtitle:
          'Future tooling, scripting, local services, and workstation operations.',
      section: 'AI Tools',
      type: 'System Tool',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Automation policy pending']),
  KernelItem(
      title: 'Figma + Chrome DevTools + Postman',
      subtitle: 'Design, browser inspection, and API testing inventory.',
      section: 'AI Tools',
      type: 'Design/Test Tool',
      status: 'Foundation Created',
      health: 64,
      missingItems: ['Account/license review pending']),
  KernelItem(
      title: 'LM Studio + Ollama + AnythingLLM + n8n',
      subtitle:
          'Future local AI and automation candidates. No automation connected.',
      section: 'AI Tools',
      type: 'Future Tool',
      status: 'Not Connected Yet',
      health: 38,
      missingItems: ['Local AI plan pending', 'Automation forbidden for now']),
];

const digitalPresenceItems = <KernelItem>[
  KernelItem(
      title: 'Website + Domains',
      subtitle: 'Official website, domains, and future public entry points.',
      section: 'Digital Presence',
      type: 'Web Presence',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['DNS verification: Not Connected Yet']),
  KernelItem(
      title: 'Emails + Phone + WhatsApp',
      subtitle: 'Communication identity and support reachability.',
      section: 'Digital Presence',
      type: 'Contact',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Verification status: Not Connected Yet']),
  KernelItem(
      title: 'Telegram + Facebook + Instagram',
      subtitle: 'Public social presence inventory.',
      section: 'Digital Presence',
      type: 'Social',
      status: 'Foundation Created',
      health: 66,
      missingItems: [
        'Followers: Not Connected Yet',
        'Brand asset review pending'
      ]),
  KernelItem(
      title: 'LinkedIn + X + TikTok + YouTube',
      subtitle: 'Professional and media presence inventory.',
      section: 'Digital Presence',
      type: 'Social',
      status: 'Foundation Created',
      health: 64,
      missingItems: [
        'Followers: Not Connected Yet',
        'Posting pipeline not connected'
      ]),
  KernelItem(
      title: 'GitHub + Zoom + Google Business',
      subtitle: 'Technical, meeting, and business listing surfaces.',
      section: 'Digital Presence',
      type: 'Public Account',
      status: 'Foundation Created',
      health: 62,
      missingItems: ['Account verification pending']),
  KernelItem(
      title: 'Future Stores',
      subtitle: 'Future app/product stores and distribution channels.',
      section: 'Digital Presence',
      type: 'Future',
      status: 'Not Connected Yet',
      health: 35,
      missingItems: ['Store accounts not reviewed']),
];

const accountsItems = <KernelItem>[
  KernelItem(
      title: 'Google Account Family',
      subtitle:
          'Google, Search Console, Analytics, Play Console, and business surfaces.',
      section: 'Accounts',
      type: 'Account Group',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Security review pending', 'Recovery review pending']),
  KernelItem(
      title: 'OpenAI Account',
      subtitle:
          'AI platform account used for architecture and implementation collaboration.',
      section: 'Accounts',
      type: 'Account',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['License/status reader: Not Connected Yet']),
  KernelItem(
      title: 'GitHub Account',
      subtitle:
          'Repository ownership, source control, and future release governance.',
      section: 'Accounts',
      type: 'Account',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Branch protection review pending']),
  KernelItem(
      title: 'Firebase Account',
      subtitle: 'Backend project authority and deployment governance.',
      section: 'Accounts',
      type: 'Account',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Rules review pending']),
  KernelItem(
      title: 'Figma + Meta + Telegram',
      subtitle: 'Design, social/business, and communication account surfaces.',
      section: 'Accounts',
      type: 'Account Group',
      status: 'Foundation Created',
      health: 62,
      missingItems: ['Recovery and ownership review pending']),
  KernelItem(
      title: 'Microsoft + Cloudflare + Domain Provider',
      subtitle: 'Infrastructure and identity account candidates.',
      section: 'Accounts',
      type: 'Account Group',
      status: 'Foundation Created',
      health: 60,
      missingItems: ['Provider details pending']),
  KernelItem(
      title: 'Apple Developer',
      subtitle: 'Future Apple ecosystem distribution account.',
      section: 'Accounts',
      type: 'Future Account',
      status: 'Not Connected Yet',
      health: 30,
      missingItems: ['Account not confirmed']),
];

const promptWorkshopItems = <KernelItem>[
  KernelItem(
      title: 'Architecture Prompts',
      subtitle:
          'Architecture, planning, system boundaries, and operating model prompt packs.',
      section: 'Prompt Workshop',
      type: 'Prompt Group',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Pack versioning']),
  KernelItem(
      title: 'Flutter Prompts',
      subtitle: 'Surgical UI/runtime prompts for Flutter implementation.',
      section: 'Prompt Workshop',
      type: 'Prompt Group',
      status: 'Foundation Created',
      health: 80,
      missingItems: ['Reusable templates pending']),
  KernelItem(
      title: 'Governance Prompts',
      subtitle:
          'Constitutional, registry, audit, and immutable documentation prompts.',
      section: 'Prompt Workshop',
      type: 'Prompt Group',
      status: 'Foundation Created',
      health: 84,
      missingItems: ['Approval workflow pending']),
  KernelItem(
      title: 'Content + Marketing + Branding Prompts',
      subtitle: 'Future controlled content generation and brand prompt packs.',
      section: 'Prompt Workshop',
      type: 'Prompt Group',
      status: 'Not Connected Yet',
      health: 52,
      missingItems: ['No AI generation connected']),
  KernelItem(
      title: 'Accessibility + Reports + Migration Prompts',
      subtitle:
          'Specialized prompt packs for inclusive UX, reports, and migration operations.',
      section: 'Prompt Workshop',
      type: 'Prompt Group',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Prompt health scoring pending']),
  KernelItem(
      title: 'Commercial + Residential Prompt History',
      subtitle: 'Historic prompt memory for major runtime surfaces.',
      section: 'Prompt Workshop',
      type: 'Prompt History',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['History reader: Not Connected Yet']),
];

const knowledgeLibraryItems = <KernelItem>[
  KernelItem(
      title: 'Books + Articles + Research Papers',
      subtitle: 'Curated references for future owner/AI work.',
      section: 'Knowledge Library',
      type: 'Knowledge',
      status: 'Foundation Created',
      health: 62,
      missingItems: ['No external sync']),
  KernelItem(
      title: 'WHO + Government References',
      subtitle: 'Public health and regulatory reference categories.',
      section: 'Knowledge Library',
      type: 'Reference',
      status: 'Foundation Created',
      health: 64,
      missingItems: ['Source links pending']),
  KernelItem(
      title: 'Accessibility References',
      subtitle:
          'Inclusive design and accessibility organizations/reference material.',
      section: 'Knowledge Library',
      type: 'Reference',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Reference validation pending']),
  KernelItem(
      title: 'Mental Health References',
      subtitle:
          'Mental health, addiction, recovery, family support, and care references.',
      section: 'Knowledge Library',
      type: 'Reference',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Clinical review pending']),
  KernelItem(
      title: 'Flutter + Firebase Docs',
      subtitle:
          'Official technical documentation categories for future development.',
      section: 'Knowledge Library',
      type: 'Technical Docs',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Version tracking pending']),
  KernelItem(
      title: 'Architecture References',
      subtitle:
          'Architecture, governance, and operating system design references.',
      section: 'Knowledge Library',
      type: 'Architecture',
      status: 'Foundation Created',
      health: 68,
      missingItems: ['Tagging rules pending']),
];

const workstationItems = <KernelItem>[
  KernelItem(
      title: 'Installed',
      subtitle: 'Current installed software/hardware inventory category.',
      section: 'Workstation',
      type: 'Readiness',
      status: 'Foundation Created',
      health: 55,
      missingItems: ['Local scan not connected']),
  KernelItem(
      title: 'Missing',
      subtitle: 'Future missing tools, accounts, models, and storage category.',
      section: 'Workstation',
      type: 'Readiness',
      status: 'Foundation Created',
      health: 58,
      missingItems: ['Manual owner review']),
  KernelItem(
      title: 'Recommended',
      subtitle: 'Recommended setup category for future Sovereign Desktop.',
      section: 'Workstation',
      type: 'Planning',
      status: 'Foundation Created',
      health: 60,
      missingItems: ['Hardware target pending']),
  KernelItem(
      title: 'Optional',
      subtitle: 'Optional tooling and experiments category.',
      section: 'Workstation',
      type: 'Planning',
      status: 'Foundation Created',
      health: 60,
      missingItems: ['Owner preference pending']),
  KernelItem(
      title: 'AI Models + External Memory',
      subtitle:
          'Future local AI, storage, backup, and synchronization planning.',
      section: 'Workstation',
      type: 'Future Local AI',
      status: 'Not Connected Yet',
      health: 40,
      missingItems: ['No local AI installation automation']),
];

const assetLibraryItems = <KernelItem>[
  KernelItem(
      title: 'Icons',
      subtitle: 'Icon inventory and accessibility icon memory.',
      section: 'Asset Library',
      type: 'Asset Group',
      status: 'Foundation Created',
      health: 72,
      missingItems: ['Preview browser pending']),
  KernelItem(
      title: 'Illustrations + Backgrounds',
      subtitle: 'Visual scenes, backgrounds, and page art assets.',
      section: 'Asset Library',
      type: 'Asset Group',
      status: 'Foundation Created',
      health: 74,
      missingItems: ['Asset health scanner pending']),
  KernelItem(
      title: 'Videos + Audio + Animations',
      subtitle: 'Future media asset categories.',
      section: 'Asset Library',
      type: 'Asset Group',
      status: 'Not Connected Yet',
      health: 42,
      missingItems: ['Media library not connected']),
  KernelItem(
      title: 'Brand Assets + Logos',
      subtitle: 'Mental Smile logo and brand source assets.',
      section: 'Asset Library',
      type: 'Brand',
      status: 'Foundation Created',
      health: 76,
      missingItems: ['Canonical brand kit pointer pending']),
  KernelItem(
      title: 'Fonts + Mockups + Templates',
      subtitle: 'Design system support categories.',
      section: 'Asset Library',
      type: 'Template',
      status: 'Foundation Created',
      health: 62,
      missingItems: ['Template registry pending']),
];

const ownerDeskItems = <KernelItem>[
  KernelItem(
      title: "Today's Priorities",
      subtitle: 'Daily owner priority list category.',
      section: 'Owner Desk',
      type: 'Daily Workspace',
      status: 'Foundation Created',
      health: 60,
      missingItems: ['Live priority feed not connected']),
  KernelItem(
      title: 'Open Operations',
      subtitle: 'Current operations and active work category.',
      section: 'Owner Desk',
      type: 'Operations',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Operation assignment runtime pending']),
  KernelItem(
      title: 'Recent Reports + Weekly Review',
      subtitle: 'Owner review category for reports and weekly rhythm.',
      section: 'Owner Desk',
      type: 'Review',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Calendar integration not connected']),
  KernelItem(
      title: 'Pinned Cards + Prompts + Tools + Accounts',
      subtitle: 'Owner pinboard for high-value operating objects.',
      section: 'Owner Desk',
      type: 'Pinned Memory',
      status: 'Foundation Created',
      health: 64,
      missingItems: ['Pin persistence not connected']),
  KernelItem(
      title: 'Pinned Projects + Future Goals',
      subtitle: 'Forward planning and decision context category.',
      section: 'Owner Desk',
      type: 'Planning',
      status: 'Foundation Created',
      health: 62,
      missingItems: ['Goal approval workflow pending']),
];

const generationTwoItems = <KernelItem>[
  KernelItem(
      title: 'Kernel Complete',
      subtitle:
          'Generation 1 kernel completed and certified for owner publish review.',
      section: 'Generation Two',
      type: 'Checklist',
      status: 'Ready',
      health: 88,
      missingItems: ['Owner publish review pending']),
  KernelItem(
      title: 'Workshop Complete',
      subtitle: 'Generation 1.5 Workshop foundation created.',
      section: 'Generation Two',
      type: 'Checklist',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['Workshop review pending']),
  KernelItem(
      title: 'AI Team Ready',
      subtitle: 'AI workforce registry foundation is present.',
      section: 'Generation Two',
      type: 'Checklist',
      status: 'Foundation Created',
      health: 70,
      missingItems: ['AI member health review pending']),
  KernelItem(
      title: 'Accounts + Tools + Presence Ready',
      subtitle:
          'Governed account, tool, and public presence foundations are present.',
      section: 'Generation Two',
      type: 'Checklist',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Security/recovery review pending']),
  KernelItem(
      title: 'Prompt + Knowledge + Assets Ready',
      subtitle:
          'Prompt workshop, knowledge library, and asset library foundations are present.',
      section: 'Generation Two',
      type: 'Checklist',
      status: 'Foundation Created',
      health: 66,
      missingItems: ['Canonical source review pending']),
  KernelItem(
      title: 'Generation Two Ready',
      subtitle:
          'This state appears only after owner review confirms all gates.',
      section: 'Generation Two',
      type: 'Final Gate',
      status: 'Not Ready Yet',
      health: 45,
      missingItems: [
        'Owner approval',
        'Manual verification',
        'Workshop completion review'
      ]),
];
