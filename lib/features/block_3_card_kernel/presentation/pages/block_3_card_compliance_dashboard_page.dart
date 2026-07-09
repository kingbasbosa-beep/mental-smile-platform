import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/data/block_3_card_kernel_snapshot_data.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/widgets/block_3_card_kernel_widgets.dart';

class Block3CardComplianceDashboardPage extends StatefulWidget {
  const Block3CardComplianceDashboardPage({super.key});
  @override
  State<Block3CardComplianceDashboardPage> createState() =>
      _Block3CardComplianceDashboardPageState();
}

class _Block3CardComplianceDashboardPageState
    extends State<Block3CardComplianceDashboardPage> {
  String _query = '';
  String _severity = 'All';
  @override
  Widget build(BuildContext context) {
    final findings = Block3CardKernelSnapshotData.complianceFindings.where((f) {
      final severityOk = _severity == 'All' || f.severity == _severity;
      return severityOk && f.matches(_query);
    }).toList();
    final critical = findings.where((f) => f.severity == 'Critical').length;
    final high = findings.where((f) => f.severity == 'High').length;
    final medium = findings.where((f) => f.severity == 'Medium').length;
    final low = findings.where((f) => f.severity == 'Low').length;
    return Block3Shell(
      title: 'Card Compliance Engine',
      subtitle: 'Validate Card Governance',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(spacing: 12, runSpacing: 12, children: <Widget>[
            Block3CounterCard(
                label: 'Findings',
                value: '${findings.length}',
                icon: Icons.rule),
            Block3CounterCard(
                label: 'Critical', value: '$critical', icon: Icons.dangerous),
            Block3CounterCard(
                label: 'High', value: '$high', icon: Icons.priority_high),
            Block3CounterCard(
                label: 'Medium', value: '$medium', icon: Icons.warning),
            Block3CounterCard(label: 'Low', value: '$low', icon: Icons.info),
          ]),
          const SizedBox(height: 18),
          Block3Search(
              hint: 'Search by card, finding, severity, status',
              onChanged: (v) => setState(() => _query = v)),
          const SizedBox(height: 14),
          Block3Dropdown(
              value: _severity,
              items: const <String>[
                'All',
                'Critical',
                'High',
                'Medium',
                'Low',
                'Info'
              ],
              onChanged: (v) => setState(() => _severity = v)),
          const SizedBox(height: 18),
          if (findings.isEmpty)
            const Block3Empty(
                message: 'No compliance findings matched the current filters.')
          else
            Column(
              children: findings
                  .map((f) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: block3Panel,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: block3Gold.withValues(alpha: 0.3))),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Text('${f.cardName}\n${f.type}',
                                  style: const TextStyle(
                                      color: block3Soft, height: 1.4))),
                          Block3StatusChip(label: f.severity),
                          const SizedBox(width: 8),
                          Block3StatusChip(label: f.status),
                        ]),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
