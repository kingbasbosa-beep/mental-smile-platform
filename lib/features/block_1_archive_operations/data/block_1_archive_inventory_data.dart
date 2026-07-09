class Block1ArchiveCounters {
  const Block1ArchiveCounters({
    required this.totalSections,
    required this.totalGuides,
    required this.totalCards,
    required this.totalReports,
    required this.totalOperations,
    required this.totalPromptPacks,
    required this.totalAssets,
    required this.totalLocalization,
    required this.totalRegistries,
    required this.totalSnapshots,
    required this.totalDnaCapsules,
    required this.pending,
    required this.deprecated,
    required this.frozen,
    required this.coveragePercent,
    required this.completionPercent,
  });

  final int totalSections;
  final int totalGuides;
  final int totalCards;
  final int totalReports;
  final int totalOperations;
  final int totalPromptPacks;
  final int totalAssets;
  final int totalLocalization;
  final int totalRegistries;
  final int totalSnapshots;
  final int totalDnaCapsules;
  final int pending;
  final int deprecated;
  final int frozen;
  final int coveragePercent;
  final int completionPercent;
}

class Block1ArchiveSection {
  const Block1ArchiveSection({
    required this.name,
    required this.owner,
    required this.status,
    required this.type,
    required this.totalItems,
    required this.guides,
    required this.cards,
    required this.reports,
    required this.operations,
    required this.prompts,
    required this.assets,
    required this.localization,
    required this.registries,
    required this.snapshots,
    required this.healthPercent,
    required this.completionPercent,
    required this.lastUpdated,
    required this.inventorySamples,
    required this.dependencies,
    required this.missingItems,
  });

  final String name;
  final String owner;
  final String status;
  final String type;
  final int totalItems;
  final int guides;
  final int cards;
  final int reports;
  final int operations;
  final int prompts;
  final int assets;
  final int localization;
  final int registries;
  final int snapshots;
  final int healthPercent;
  final int completionPercent;
  final String lastUpdated;
  final List<String> inventorySamples;
  final List<String> dependencies;
  final List<String> missingItems;

  bool matches(String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) return true;
    return [
      name,
      owner,
      status,
      type,
      ...inventorySamples,
      ...dependencies,
      ...missingItems,
    ].any((value) => value.toLowerCase().contains(normalized));
  }
}

class Block1ArchiveInventoryData {
  static const generatedAt = '2026-06-29';
  static const source =
      'Local filesystem snapshot: docs, assets, lib/l10n, operations index';

  static const counters = Block1ArchiveCounters(
    totalSections: 22,
    totalGuides: 46,
    totalCards: 181,
    totalReports: 407,
    totalOperations: 266,
    totalPromptPacks: 44,
    totalAssets: 184,
    totalLocalization: 5,
    totalRegistries: 89,
    totalSnapshots: 14,
    totalDnaCapsules: 13,
    pending: 1,
    deprecated: 0,
    frozen: 14,
    coveragePercent: 95,
    completionPercent: 64,
  );

  static const sections = <Block1ArchiveSection>[
    Block1ArchiveSection(
      name: 'Residential',
      owner: 'Residential',
      status: 'Existing',
      type: 'Section',
      totalItems: 88,
      guides: 7,
      cards: 18,
      reports: 35,
      operations: 0,
      prompts: 2,
      assets: 0,
      localization: 4,
      registries: 5,
      snapshots: 0,
      healthPercent: 82,
      completionPercent: 78,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/accessibility/RESIDENTIAL_EXIT_PORTAL_CLEAN_GOODBYE_ONLY_REPORT_V1.md',
        'docs/archive/global-documentation-purification/history/residential',
        'docs/constitutional-baseline/operations',
      ],
      dependencies: <String>[
        'Cards',
        'Assets',
        'Localization',
        'Guides',
        'Reports'
      ],
      missingItems: <String>['Dynamic archive reader: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Commercial',
      owner: 'Commercial',
      status: 'Existing',
      type: 'Section',
      totalItems: 408,
      guides: 0,
      cards: 73,
      reports: 124,
      operations: 2,
      prompts: 9,
      assets: 0,
      localization: 1,
      registries: 16,
      snapshots: 0,
      healthPercent: 76,
      completionPercent: 61,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/commercial-production-chain',
        'docs/archive/platform-extraction/history/commercial/full-block',
        'docs/commercial',
      ],
      dependencies: <String>['Runtime', 'Cards', 'Reports', 'Archive History'],
      missingItems: <String>[
        'Commercial V2 legacy block still frozen as history'
      ],
    ),
    Block1ArchiveSection(
      name: 'Commercial V2 Web',
      owner: 'Commercial V2 Web',
      status: 'Pending Review',
      type: 'Section',
      totalItems: 2,
      guides: 0,
      cards: 0,
      reports: 1,
      operations: 0,
      prompts: 0,
      assets: 0,
      localization: 0,
      registries: 0,
      snapshots: 0,
      healthPercent: 34,
      completionPercent: 18,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/commercial-v2-web/OLD_SHOWCASE_BLOCK_ARCHIVE_MAP_V1.md',
        'docs/commercial-v2-web/COMMERCIAL_V2_WEB_EMPTY_SECTION_REPORT_V1.md',
      ],
      dependencies: <String>[
        'Showcase Routes',
        'Future Cards',
        'Public Content'
      ],
      missingItems: <String>[
        'Cards: Not Connected Yet',
        'Dynamic public content: Not Connected Yet'
      ],
    ),
    Block1ArchiveSection(
      name: 'Owner',
      owner: 'Owner',
      status: 'Existing',
      type: 'Department',
      totalItems: 55,
      guides: 1,
      cards: 4,
      reports: 14,
      operations: 2,
      prompts: 3,
      assets: 0,
      localization: 0,
      registries: 21,
      snapshots: 0,
      healthPercent: 78,
      completionPercent: 66,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/departmental-vaults/ARCHIVE_OWNER_VAULT_CONSTITUTION_V1.md',
        'docs/owner',
        'docs/archive/platform-extraction/OWNER_ARCHIVE_SEPARATION_MAP_V1.md',
      ],
      dependencies: <String>['Archive', 'Strategic', 'Operations'],
      missingItems: <String>['Owner live archive reader: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Monitoring',
      owner: 'Monitoring',
      status: 'Existing',
      type: 'Section',
      totalItems: 48,
      guides: 3,
      cards: 5,
      reports: 17,
      operations: 0,
      prompts: 2,
      assets: 0,
      localization: 0,
      registries: 9,
      snapshots: 0,
      healthPercent: 70,
      completionPercent: 58,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/platform-extraction/history/administrative/MONITORING_AUTHORITY_REGISTRY_V1.md'
      ],
      dependencies: <String>['Signals', 'Reports', 'Operations'],
      missingItems: <String>['Runtime health source: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Administration',
      owner: 'Administration',
      status: 'Frozen',
      type: 'Historical Section',
      totalItems: 105,
      guides: 0,
      cards: 11,
      reports: 32,
      operations: 2,
      prompts: 5,
      assets: 0,
      localization: 1,
      registries: 12,
      snapshots: 0,
      healthPercent: 68,
      completionPercent: 52,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/platform-extraction/history/administrative'
      ],
      dependencies: <String>['Archive History', 'Operations Registry'],
      missingItems: <String>['Active runtime intentionally removed'],
    ),
    Block1ArchiveSection(
      name: 'Library',
      owner: 'Library',
      status: 'Existing',
      type: 'Section',
      totalItems: 145,
      guides: 13,
      cards: 27,
      reports: 26,
      operations: 6,
      prompts: 35,
      assets: 0,
      localization: 3,
      registries: 7,
      snapshots: 0,
      healthPercent: 86,
      completionPercent: 71,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/global-documentation-purification/history/library',
        'lib/features/library'
      ],
      dependencies: <String>['Cards', 'Prompt Packs', 'Commercial V2 Web'],
      missingItems: <String>[
        'Dynamic published cards source: Not Connected Yet'
      ],
    ),
    Block1ArchiveSection(
      name: 'Brand',
      owner: 'Brand',
      status: 'Existing',
      type: 'Asset Layer',
      totalItems: 152,
      guides: 0,
      cards: 10,
      reports: 12,
      operations: 0,
      prompts: 0,
      assets: 0,
      localization: 0,
      registries: 0,
      snapshots: 0,
      healthPercent: 64,
      completionPercent: 49,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'assets/branding',
        'docs/archive/platform-extraction/history/commercial/full-block'
      ],
      dependencies: <String>['Assets', 'Commercial', 'Marketing'],
      missingItems: <String>[
        'Canonical brand asset registry: Not Connected Yet'
      ],
    ),
    Block1ArchiveSection(
      name: 'Infrastructure',
      owner: 'Technical',
      status: 'Existing',
      type: 'Technical Layer',
      totalItems: 64,
      guides: 2,
      cards: 7,
      reports: 8,
      operations: 0,
      prompts: 34,
      assets: 0,
      localization: 2,
      registries: 4,
      snapshots: 0,
      healthPercent: 73,
      completionPercent: 56,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/technical-recovery-vault',
        'firestore.rules',
        'storage.rules'
      ],
      dependencies: <String>['Firebase', 'Rules', 'Technical Recovery'],
      missingItems: <String>[
        'Live infrastructure telemetry: Not Connected Yet'
      ],
    ),
    Block1ArchiveSection(
      name: 'Governance',
      owner: 'Governance',
      status: 'Existing',
      type: 'Governance Layer',
      totalItems: 316,
      guides: 10,
      cards: 51,
      reports: 117,
      operations: 17,
      prompts: 4,
      assets: 0,
      localization: 1,
      registries: 44,
      snapshots: 0,
      healthPercent: 91,
      completionPercent: 74,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/ARCHIVE_CONSTITUTION_V1.md',
        'docs/archive/archive-os'
      ],
      dependencies: <String>['Constitutions', 'Registries', 'Operations'],
      missingItems: <String>[
        'Latest/canonical pointer runtime: Not Connected Yet'
      ],
    ),
    Block1ArchiveSection(
      name: 'Operations',
      owner: 'Operations',
      status: 'Existing',
      type: 'Ledger',
      totalItems: 266,
      guides: 5,
      cards: 16,
      reports: 62,
      operations: 266,
      prompts: 1,
      assets: 0,
      localization: 0,
      registries: 8,
      snapshots: 0,
      healthPercent: 88,
      completionPercent: 69,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md'
      ],
      dependencies: <String>['Registry', 'Index', 'Reports', 'Timeline'],
      missingItems: <String>[
        'Affected files are not consistently structured in older operation records'
      ],
    ),
    Block1ArchiveSection(
      name: 'Archive',
      owner: 'Archive',
      status: 'Existing',
      type: 'Operating Memory',
      totalItems: 475,
      guides: 12,
      cards: 58,
      reports: 118,
      operations: 8,
      prompts: 36,
      assets: 0,
      localization: 6,
      registries: 39,
      snapshots: 0,
      healthPercent: 93,
      completionPercent: 77,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive',
        'docs/archive/archive-os',
        'docs/archive/platform-extraction'
      ],
      dependencies: <String>[
        'Operations',
        'History',
        'Constitutions',
        'Reports'
      ],
      missingItems: <String>['Live file browser: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Prompt Packs',
      owner: 'Prompt Packs',
      status: 'Existing',
      type: 'Knowledge Input',
      totalItems: 46,
      guides: 3,
      cards: 10,
      reports: 4,
      operations: 1,
      prompts: 46,
      assets: 0,
      localization: 2,
      registries: 0,
      snapshots: 0,
      healthPercent: 69,
      completionPercent: 48,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/technical-recovery-vault/prompt-library'
      ],
      dependencies: <String>['Archive', 'Operations', 'Sections'],
      missingItems: <String>['Prompt pack registry: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Assets',
      owner: 'Assets',
      status: 'Existing',
      type: 'Asset Layer',
      totalItems: 184,
      guides: 1,
      cards: 9,
      reports: 0,
      operations: 0,
      prompts: 2,
      assets: 184,
      localization: 0,
      registries: 0,
      snapshots: 0,
      healthPercent: 63,
      completionPercent: 42,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'assets/backgrounds',
        'assets/icons',
        'assets/branding'
      ],
      dependencies: <String>['Brand', 'Rooms', 'Pages'],
      missingItems: <String>['Asset usage map: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Localization',
      owner: 'Localization',
      status: 'Existing',
      type: 'Runtime Text',
      totalItems: 5,
      guides: 1,
      cards: 2,
      reports: 9,
      operations: 0,
      prompts: 2,
      assets: 0,
      localization: 5,
      registries: 1,
      snapshots: 0,
      healthPercent: 58,
      completionPercent: 40,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>['lib/l10n'],
      dependencies: <String>['UI', 'Arabic', 'Accessibility'],
      missingItems: <String>[
        'Full localization coverage scanner: Not Connected Yet'
      ],
    ),
    Block1ArchiveSection(
      name: 'Cards',
      owner: 'Cards',
      status: 'Existing',
      type: 'Governance Cards',
      totalItems: 181,
      guides: 12,
      cards: 181,
      reports: 27,
      operations: 5,
      prompts: 10,
      assets: 0,
      localization: 2,
      registries: 7,
      snapshots: 0,
      healthPercent: 84,
      completionPercent: 72,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/accessibility/*CARD*.md',
        'docs/commercial/*CARD*.md'
      ],
      dependencies: <String>['Sections', 'Guides', 'Routes'],
      missingItems: <String>[
        'Card-to-route automatic verifier: Not Connected Yet'
      ],
    ),
    Block1ArchiveSection(
      name: 'Guides',
      owner: 'Guides',
      status: 'Existing',
      type: 'Operating Guides',
      totalItems: 46,
      guides: 46,
      cards: 12,
      reports: 6,
      operations: 1,
      prompts: 3,
      assets: 0,
      localization: 1,
      registries: 1,
      snapshots: 0,
      healthPercent: 80,
      completionPercent: 67,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/constitutional-baseline/guides',
        'docs/archive/*GUIDE*.md'
      ],
      dependencies: <String>['Constitutions', 'Cards', 'Reports'],
      missingItems: <String>['Latest guide pointer layer: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'DNA',
      owner: 'DNA',
      status: 'Existing',
      type: 'Baseline',
      totalItems: 13,
      guides: 1,
      cards: 1,
      reports: 5,
      operations: 0,
      prompts: 0,
      assets: 0,
      localization: 0,
      registries: 0,
      snapshots: 0,
      healthPercent: 73,
      completionPercent: 62,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/constitutional-baseline/seal',
        'docs/constitutional-baseline/guides/DNA_GOVERNANCE_GUIDE_V1.md'
      ],
      dependencies: <String>['Baseline', 'Seal', 'Snapshots'],
      missingItems: <String>['DNA capsule runtime viewer: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Capsules',
      owner: 'Capsules',
      status: 'Missing',
      type: 'Memory Capsule',
      totalItems: 0,
      guides: 0,
      cards: 0,
      reports: 0,
      operations: 0,
      prompts: 0,
      assets: 0,
      localization: 0,
      registries: 0,
      snapshots: 0,
      healthPercent: 0,
      completionPercent: 0,
      lastUpdated: 'UNKNOWN_NOT_CONNECTED',
      inventorySamples: <String>[],
      dependencies: <String>['Archive', 'DNA'],
      missingItems: <String>['Capsule source: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Snapshots',
      owner: 'Snapshots',
      status: 'Existing',
      type: 'State Capture',
      totalItems: 14,
      guides: 0,
      cards: 0,
      reports: 6,
      operations: 0,
      prompts: 0,
      assets: 0,
      localization: 0,
      registries: 2,
      snapshots: 14,
      healthPercent: 76,
      completionPercent: 58,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>['docs/constitutional-baseline/snapshots'],
      dependencies: <String>['Archive', 'Reports', 'Registries'],
      missingItems: <String>['Snapshot diff viewer: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Reports',
      owner: 'Reports',
      status: 'Existing',
      type: 'Evidence',
      totalItems: 407,
      guides: 6,
      cards: 27,
      reports: 407,
      operations: 0,
      prompts: 4,
      assets: 0,
      localization: 0,
      registries: 4,
      snapshots: 6,
      healthPercent: 87,
      completionPercent: 70,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>['docs/**/*REPORT*.md', 'docs/**/*AUDIT*.md'],
      dependencies: <String>['Operations', 'Cards', 'Archive'],
      missingItems: <String>['Report quality validator: Not Connected Yet'],
    ),
    Block1ArchiveSection(
      name: 'Graveyard',
      owner: 'Archive',
      status: 'Frozen',
      type: 'Retired History',
      totalItems: 14,
      guides: 0,
      cards: 0,
      reports: 14,
      operations: 0,
      prompts: 0,
      assets: 0,
      localization: 0,
      registries: 0,
      snapshots: 0,
      healthPercent: 65,
      completionPercent: 55,
      lastUpdated: '2026-06-29',
      inventorySamples: <String>[
        'docs/archive/platform-extraction/history',
        'docs/archive/commercial'
      ],
      dependencies: <String>['Archive', 'Frozen Blocks'],
      missingItems: <String>[
        'Retired object canonical index: Not Connected Yet'
      ],
    ),
  ];
}
