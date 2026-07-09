import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_1_archive_operations/data/block_1_operations_inventory_data.dart';
import 'package:mental_smile_os/features/block_1_archive_operations/presentation/widgets/block_1_archive_ops_widgets.dart';

class Block1OperationsDashboardPage extends StatefulWidget {
  const Block1OperationsDashboardPage({super.key});

  @override
  State<Block1OperationsDashboardPage> createState() =>
      _Block1OperationsDashboardPageState();
}

class _Block1OperationsDashboardPageState
    extends State<Block1OperationsDashboardPage> {
  String _query = '';
  String _year = 'All';
  String _quarter = 'All';
  String _type = 'All';
  String _result = 'All';

  List<Block1OperationEntry> get _filtered {
    return Block1OperationsInventoryData.entries.where((entry) {
      final yearOk = _year == 'All' || entry.year == _year;
      final quarterOk = _quarter == 'All' || entry.quarter == _quarter;
      final typeOk = _type == 'All' || entry.type == _type;
      final resultOk = _result == 'All' || entry.result == _result;
      return yearOk && quarterOk && typeOk && resultOk && entry.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Block1Shell(
      title: 'Operations Dashboard',
      subtitle: 'Executed Operations Timeline',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              const Block1CounterCard(
                  label: 'Latest Operation',
                  value: '266',
                  icon: Icons.new_releases),
              const Block1CounterCard(
                  label: 'Last Updated',
                  value: Block1OperationsInventoryData.lastUpdated,
                  icon: Icons.update),
              Block1CounterCard(
                  label: 'Total Operations',
                  value:
                      Block1OperationsInventoryData.totalOperations.toString(),
                  icon: Icons.history),
              Block1CounterCard(
                  label: 'This Month',
                  value: Block1OperationsInventoryData.thisMonth.toString(),
                  icon: Icons.calendar_month),
              Block1CounterCard(
                  label: 'This Week',
                  value: Block1OperationsInventoryData.thisWeek.toString(),
                  icon: Icons.view_week),
              Block1CounterCard(
                  label: 'Pending',
                  value: Block1OperationsInventoryData.pending.toString(),
                  icon: Icons.pending_actions),
            ],
          ),
          const SizedBox(height: 24),
          Block1SearchField(
            hint: 'Search by operation number, operation ID, keyword, date',
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              Block1FilterDropdown(
                value: _year,
                items: const <String>['All', '2026', 'UNKNOWN'],
                onChanged: (value) => setState(() => _year = value),
              ),
              Block1FilterDropdown(
                value: _quarter,
                items: const <String>['All', 'Q1', 'Q2', 'Q3', 'Q4', 'UNKNOWN'],
                onChanged: (value) => setState(() => _quarter = value),
              ),
              Block1FilterDropdown(
                value: _type,
                items: const <String>[
                  'All',
                  'AUDIT',
                  'DOC_CREATION',
                  'ARCHIVE',
                  'UI_REFINEMENT',
                  'UI_CONTENT',
                  'FOUNDATION',
                  'RUNTIME_UI',
                ],
                onChanged: (value) => setState(() => _type = value),
              ),
              Block1FilterDropdown(
                value: _result,
                items: const <String>['All', 'COMPLETED', 'PARTIAL'],
                onChanged: (value) => setState(() => _result = value),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _HealthPanel(entries: _filtered),
          const SizedBox(height: 24),
          if (_filtered.isEmpty)
            const Block1EmptyState(
                message: 'No operation matched the current search/filter.')
          else
            _OperationsTimeline(entries: _filtered),
          const SizedBox(height: 24),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              Block1ActionButton(
                  label: 'Generate Operations Summary',
                  icon: Icons.summarize,
                  onPressed: () =>
                      _notConnected(context, 'Generate Operations Summary')),
              Block1ActionButton(
                  label: 'Generate Missing Registry',
                  icon: Icons.fact_check,
                  onPressed: () =>
                      _notConnected(context, 'Generate Missing Registry')),
              Block1ActionButton(
                  label: 'Generate Missing Reports',
                  icon: Icons.report,
                  onPressed: () =>
                      _notConnected(context, 'Generate Missing Reports')),
              Block1ActionButton(
                  label: 'Generate Monthly Summary',
                  icon: Icons.calendar_view_month,
                  onPressed: () =>
                      _notConnected(context, 'Generate Monthly Summary')),
            ],
          ),
        ],
      ),
    );
  }

  void _notConnected(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$action: Not Connected Yet')),
    );
  }
}

class _HealthPanel extends StatelessWidget {
  const _HealthPanel({required this.entries});

  final List<Block1OperationEntry> entries;

  @override
  Widget build(BuildContext context) {
    final total = entries.isEmpty ? 1 : entries.length;
    final registry = entries.where((entry) => entry.hasRegistryEntry).length;
    final index = entries.where((entry) => entry.hasIndexEntry).length;
    final report = entries.where((entry) => entry.hasReport).length;
    final timeline =
        entries.where((entry) => entry.timestamp.isNotEmpty).length;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: block1Panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: block1Gold.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Operations Health',
            style: TextStyle(
                color: block1Gold, fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: <Widget>[
              SizedBox(
                  width: 270,
                  child: Block1HealthBar(
                      label: 'Registry Healthy',
                      value: (registry * 100 / total).round())),
              SizedBox(
                  width: 270,
                  child: Block1HealthBar(
                      label: 'Index Healthy',
                      value: (index * 100 / total).round())),
              SizedBox(
                  width: 270,
                  child: Block1HealthBar(
                      label: 'Report Healthy',
                      value: (report * 100 / total).round())),
              SizedBox(
                  width: 270,
                  child: Block1HealthBar(
                      label: 'Timeline Healthy',
                      value: (timeline * 100 / total).round())),
            ],
          ),
        ],
      ),
    );
  }
}

class _OperationsTimeline extends StatelessWidget {
  const _OperationsTimeline({required this.entries});

  final List<Block1OperationEntry> entries;

  @override
  Widget build(BuildContext context) {
    final sorted = [...entries]..sort((a, b) =>
        '${b.year}${b.quarter}${b.month}${b.order}'
            .compareTo('${a.year}${a.quarter}${a.month}${a.order}'));

    String? previousGroup;
    final children = <Widget>[];
    for (final entry in sorted) {
      final group = '${entry.year} / ${entry.quarter} / ${entry.month}';
      if (group != previousGroup) {
        previousGroup = group;
        children.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 10),
            child: Text(
              group,
              style: const TextStyle(
                  color: block1Gold, fontSize: 22, fontWeight: FontWeight.w800),
            ),
          ),
        );
      }
      children.add(_OperationTile(entry: entry));
    }
    return Column(children: children);
  }
}

class _OperationTile extends StatelessWidget {
  const _OperationTile({required this.entry});

  final Block1OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    final warnings = <String>[
      if (!entry.hasRegistryEntry) 'Missing registry entry',
      if (!entry.hasIndexEntry) 'Missing index entry',
      if (!entry.hasReport) 'Missing report',
      if (!entry.affectedModulesKnown) 'Affected modules not structured',
      if (!entry.affectedFilesKnown) 'Affected files not structured',
    ];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: block1Panel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: entry.isHealthy
                ? block1Gold.withValues(alpha: 0.28)
                : const Color(0xFFE19A2E)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '${entry.order} · ${entry.operationId}',
                  style: const TextStyle(
                      color: block1Gold,
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Block1StatusChip(label: entry.result),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            entry.title,
            style: const TextStyle(
                color: Color(0xFFF5E7B5),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              Block1StatusChip(label: entry.type),
              Block1StatusChip(label: entry.phase),
              Block1StatusChip(label: entry.timestamp),
              Block1StatusChip(label: entry.record),
            ],
          ),
          if (warnings.isNotEmpty) ...<Widget>[
            const SizedBox(height: 10),
            Text(
              warnings.join(' · '),
              style: const TextStyle(
                  color: Color(0xFFFFCC75), fontWeight: FontWeight.w700),
            ),
          ],
        ],
      ),
    );
  }
}
