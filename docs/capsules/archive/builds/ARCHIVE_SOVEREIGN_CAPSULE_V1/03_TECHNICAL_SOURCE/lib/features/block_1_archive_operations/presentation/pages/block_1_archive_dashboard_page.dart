import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/block_1_archive_operations/data/block_1_archive_inventory_data.dart';
import 'package:mental_smile_os/features/block_1_archive_operations/presentation/widgets/block_1_archive_ops_widgets.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class Block1ArchiveDashboardPage extends StatefulWidget {
  const Block1ArchiveDashboardPage({super.key});

  @override
  State<Block1ArchiveDashboardPage> createState() =>
      _Block1ArchiveDashboardPageState();
}

class _Block1ArchiveDashboardPageState
    extends State<Block1ArchiveDashboardPage> {
  String _query = '';
  String _status = 'All';
  String _type = 'All';
  Block1ArchiveSection? _selected;

  List<Block1ArchiveSection> get _filteredSections {
    return Block1ArchiveInventoryData.sections.where((section) {
      final statusOk = _status == 'All' || section.status == _status;
      final typeOk = _type == 'All' || section.type == _type;
      return statusOk && typeOk && section.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final counters = Block1ArchiveInventoryData.counters;
    final selected = _selected ??
        (_filteredSections.isNotEmpty ? _filteredSections.first : null);

    return Block1Shell(
      title: l10n.archiveTitle,
      subtitle: l10n.archiveSubtitle,
      trailing: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          Block1ActionButton(
            label: l10n.workshopOrchestration,
            icon: Icons.timeline,
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.commercialAdminOperations),
          ),
          Block1ActionButton(
            label: l10n.ownerBranchPurpose,
            icon: Icons.menu_book,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.commercialAdminGuides),
          ),
          Block1ActionButton(
            label: 'Constitutions',
            icon: Icons.gavel,
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.commercialAdminConstitutions),
          ),
          Block1ActionButton(
            label: 'Governance',
            icon: Icons.policy,
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.commercialAdminGovernance),
          ),
          Block1ActionButton(
            label: 'Card Kernel',
            icon: Icons.hub,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.commercialAdminCards),
          ),
          Block1ActionButton(
            label: 'Reports',
            icon: Icons.summarize,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.commercialAdminReports),
          ),
          Block1ActionButton(
            label: 'Prompts',
            icon: Icons.psychology,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.commercialAdminPrompts),
          ),
          Block1ActionButton(
            label: 'DNA',
            icon: Icons.fingerprint,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.commercialAdminDna),
          ),
          Block1ActionButton(
            label: 'Publish Gates',
            icon: Icons.rocket_launch,
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.commercialAdminPublishReadiness),
          ),
          Block1ActionButton(
            label: l10n.workshopTitle,
            icon: Icons.precision_manufacturing,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.commercialAdminWorkshop),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              Block1CounterCard(
                  label: 'Total Sections',
                  value: '${counters.totalSections}',
                  icon: Icons.account_tree),
              Block1CounterCard(
                  label: 'Guides',
                  value: '${counters.totalGuides}',
                  icon: Icons.menu_book),
              Block1CounterCard(
                  label: 'Cards',
                  value: '${counters.totalCards}',
                  icon: Icons.badge),
              Block1CounterCard(
                  label: 'Reports',
                  value: '${counters.totalReports}',
                  icon: Icons.summarize),
              Block1CounterCard(
                  label: 'Operations',
                  value: '${counters.totalOperations}',
                  icon: Icons.history),
              Block1CounterCard(
                  label: 'Prompt Packs',
                  value: '${counters.totalPromptPacks}',
                  icon: Icons.psychology),
              Block1CounterCard(
                  label: 'Assets',
                  value: '${counters.totalAssets}',
                  icon: Icons.image),
              Block1CounterCard(
                  label: 'Localization',
                  value: '${counters.totalLocalization}',
                  icon: Icons.translate),
              Block1CounterCard(
                  label: 'Registries',
                  value: '${counters.totalRegistries}',
                  icon: Icons.fact_check),
              Block1CounterCard(
                  label: 'Snapshots',
                  value: '${counters.totalSnapshots}',
                  icon: Icons.camera),
              Block1CounterCard(
                  label: 'DNA Capsules',
                  value: '${counters.totalDnaCapsules}',
                  icon: Icons.fingerprint),
              Block1CounterCard(
                  label: 'Pending',
                  value: '${counters.pending}',
                  icon: Icons.pending_actions),
              Block1CounterCard(
                  label: 'Deprecated',
                  value: '${counters.deprecated}',
                  icon: Icons.block),
              Block1CounterCard(
                  label: 'Frozen',
                  value: '${counters.frozen}',
                  icon: Icons.ac_unit),
              Block1CounterCard(
                  label: 'Coverage',
                  value: '${counters.coveragePercent}%',
                  icon: Icons.radar),
              Block1CounterCard(
                  label: 'Completion',
                  value: '${counters.completionPercent}%',
                  icon: Icons.verified),
            ],
          ),
          const SizedBox(height: 24),
          Block1SearchField(
            hint: l10n.archiveSearchHint,
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              Block1FilterDropdown(
                value: _status,
                items: const <String>[
                  'All',
                  'Existing',
                  'Pending Review',
                  'Frozen',
                  'Missing'
                ],
                onChanged: (value) => setState(() => _status = value),
              ),
              Block1FilterDropdown(
                value: _type,
                items: const <String>[
                  'All',
                  'Section',
                  'Department',
                  'Historical Section',
                  'Asset Layer',
                  'Technical Layer',
                  'Governance Layer',
                  'Ledger',
                  'Operating Memory',
                  'Knowledge Input',
                  'Runtime Text',
                  'Governance Cards',
                  'Operating Guides',
                  'Baseline',
                  'Memory Capsule',
                  'State Capture',
                  'Evidence',
                  'Retired History',
                ],
                onChanged: (value) => setState(() => _type = value),
              ),
              const Block1StatusChip(label: 'Missing Source reports enabled'),
              const Block1StatusChip(
                  label: 'Dynamic sources: Not Connected Yet where listed'),
            ],
          ),
          const SizedBox(height: 24),
          if (_filteredSections.isEmpty)
            Block1EmptyState(message: l10n.archiveEmptyState)
          else
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: _filteredSections
                  .map(
                    (section) => _ArchiveSectionCard(
                      section: section,
                      selected: selected?.name == section.name,
                      onTap: () => setState(() => _selected = section),
                    ),
                  )
                  .toList(),
            ),
          const SizedBox(height: 24),
          if (selected != null)
            _ArchiveSectionDashboard(l10n: l10n, section: selected),
        ],
      ),
    );
  }
}

class _ArchiveSectionCard extends StatelessWidget {
  const _ArchiveSectionCard({
    required this.section,
    required this.selected,
    required this.onTap,
  });

  final Block1ArchiveSection section;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 292,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected ? const Color(0xDD1A1407) : block1Panel,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
              color:
                  selected ? block1Gold : block1Gold.withValues(alpha: 0.34)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(Icons.folder_special, color: block1Gold),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    section.name,
                    style: const TextStyle(
                      color: block1Gold,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                Block1StatusChip(label: section.status),
                Block1StatusChip(label: section.type),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              '${section.totalItems} items · ${section.reports} reports · ${section.cards} cards',
              style: const TextStyle(color: Color(0xFFEADCA7)),
            ),
            const SizedBox(height: 12),
            Block1HealthBar(label: 'Health', value: section.healthPercent),
          ],
        ),
      ),
    );
  }
}

class _ArchiveSectionDashboard extends StatelessWidget {
  const _ArchiveSectionDashboard({required this.l10n, required this.section});

  final AppLocalizations l10n;
  final Block1ArchiveSection section;

  void _notConnected(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.archiveNotConnected(action))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: block1Panel,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: block1Gold.withValues(alpha: 0.38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  l10n.archiveDashboardTitle(section.name),
                  style: const TextStyle(
                    color: block1Gold,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Block1StatusChip(label: 'Last Update: ${section.lastUpdated}'),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              _MiniInventory(label: 'Guides', value: section.guides),
              _MiniInventory(label: 'Cards', value: section.cards),
              _MiniInventory(label: 'Reports', value: section.reports),
              _MiniInventory(label: 'Prompts', value: section.prompts),
              _MiniInventory(label: 'Assets', value: section.assets),
              _MiniInventory(
                  label: 'Localization', value: section.localization),
              _MiniInventory(label: 'Registries', value: section.registries),
              _MiniInventory(label: 'Operations', value: section.operations),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > 900;
              final panels = <Widget>[
                _TextPanel(
                  title: l10n.archiveInventory,
                  icon: Icons.inventory,
                  lines: section.inventorySamples.isEmpty
                      ? const <String>['No files discovered in this snapshot.']
                      : section.inventorySamples,
                ),
                _TextPanel(
                  title: l10n.archiveDependencies,
                  icon: Icons.account_tree,
                  lines: section.dependencies,
                ),
                _TextPanel(
                  title: l10n.archiveMissingItems,
                  icon: Icons.warning_amber_rounded,
                  lines: section.missingItems,
                ),
              ];
              if (!wide) {
                return Column(
                  children: panels
                      .map((panel) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: panel))
                      .toList(),
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: panels
                    .map((panel) => Expanded(
                        child: Padding(
                            padding: const EdgeInsetsDirectional.only(end: 12),
                            child: panel)))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 18),
          Block1HealthBar(label: 'Coverage', value: section.healthPercent),
          const SizedBox(height: 12),
          Block1HealthBar(
              label: 'Completion', value: section.completionPercent),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              Block1ActionButton(
                  label: 'Run Audit',
                  icon: Icons.manage_search,
                  onPressed: () => _notConnected(context, 'Run Audit')),
              Block1ActionButton(
                  label: 'Generate Checklist',
                  icon: Icons.checklist,
                  onPressed: () =>
                      _notConnected(context, 'Generate Checklist')),
              Block1ActionButton(
                  label: 'Show Missing',
                  icon: Icons.report_problem,
                  onPressed: () => _notConnected(context, 'Show Missing')),
              Block1ActionButton(
                  label: 'Generate Missing Cards',
                  icon: Icons.badge,
                  onPressed: () =>
                      _notConnected(context, 'Generate Missing Cards')),
              Block1ActionButton(
                  label: 'Generate Missing Guides',
                  icon: Icons.menu_book,
                  onPressed: () =>
                      _notConnected(context, 'Generate Missing Guides')),
              Block1ActionButton(
                  label: 'Generate Missing Reports',
                  icon: Icons.summarize,
                  onPressed: () =>
                      _notConnected(context, 'Generate Missing Reports')),
              Block1ActionButton(
                  label: 'Export Summary',
                  icon: Icons.ios_share,
                  onPressed: () => _notConnected(context, 'Export Summary')),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniInventory extends StatelessWidget {
  const _MiniInventory({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xAA090908),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: block1Gold.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$value',
            style: const TextStyle(
                color: block1Gold, fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Text(label,
              style: const TextStyle(color: Color(0xFFEADCA7), fontSize: 12)),
        ],
      ),
    );
  }
}

class _TextPanel extends StatelessWidget {
  const _TextPanel({
    required this.title,
    required this.icon,
    required this.lines,
  });

  final String title;
  final IconData icon;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 190),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xAA090908),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: block1Gold.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, color: block1Gold, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                    color: block1Gold,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...lines.map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '• $line',
                style: const TextStyle(color: Color(0xFFEADCA7), height: 1.35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
