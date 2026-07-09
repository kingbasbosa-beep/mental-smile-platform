import 'package:flutter/material.dart';

const Color kernelBlack = Color(0xFF050505);
const Color kernelPanel = Color(0xCC10100E);
const Color kernelGold = Color(0xFFE8C46A);
const Color kernelSoft = Color(0xFFEADCA7);

class KernelMetric {
  const KernelMetric(this.label, this.value, this.icon);
  final String label;
  final String value;
  final IconData icon;
}

class KernelItem {
  const KernelItem({
    required this.title,
    required this.subtitle,
    required this.section,
    required this.type,
    required this.status,
    required this.health,
    required this.missingItems,
  });

  final String title;
  final String subtitle;
  final String section;
  final String type;
  final String status;
  final int health;
  final List<String> missingItems;

  bool matches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return [title, subtitle, section, type, status, ...missingItems]
        .any((value) => value.toLowerCase().contains(q));
  }
}

class KernelDashboardPage extends StatefulWidget {
  const KernelDashboardPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.metrics,
    required this.items,
    required this.searchHint,
    this.actions = const <Widget>[],
  });

  final String title;
  final String subtitle;
  final List<KernelMetric> metrics;
  final List<KernelItem> items;
  final String searchHint;
  final List<Widget> actions;

  @override
  State<KernelDashboardPage> createState() => _KernelDashboardPageState();
}

class _KernelDashboardPageState extends State<KernelDashboardPage> {
  String _query = '';
  String _status = 'All';
  String _type = 'All';
  String _section = 'All';
  KernelItem? _selected;

  List<KernelItem> get _items {
    return widget.items.where((item) {
      final statusOk = _status == 'All' || item.status == _status;
      final typeOk = _type == 'All' || item.type == _type;
      final sectionOk = _section == 'All' || item.section == _section;
      return statusOk && typeOk && sectionOk && item.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final selected = _selected ?? (items.isNotEmpty ? items.first : null);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kernelBlack,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 1.18,
              colors: <Color>[Color(0xFF241505), kernelBlack],
            ),
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 22, 28, 14),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                          icon: const Icon(Icons.arrow_forward,
                              color: kernelGold),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.title,
                                  style: const TextStyle(
                                      color: kernelGold,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800)),
                              const SizedBox(height: 4),
                              Text(widget.subtitle,
                                  style: const TextStyle(
                                      color: kernelSoft,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        ...widget.actions,
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 8, 28, 34),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1280),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: widget.metrics
                                    .map((m) => KernelCounter(metric: m))
                                    .toList()),
                            const SizedBox(height: 22),
                            KernelSearch(
                                hint: widget.searchHint,
                                onChanged: (v) => setState(() => _query = v)),
                            const SizedBox(height: 14),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: <Widget>[
                                KernelDropdown(
                                    value: _status,
                                    values: [
                                      'All',
                                      ...widget.items
                                          .map((i) => i.status)
                                          .toSet()
                                    ],
                                    onChanged: (v) =>
                                        setState(() => _status = v)),
                                KernelDropdown(
                                    value: _type,
                                    values: [
                                      'All',
                                      ...widget.items.map((i) => i.type).toSet()
                                    ],
                                    onChanged: (v) =>
                                        setState(() => _type = v)),
                                KernelDropdown(
                                    value: _section,
                                    values: [
                                      'All',
                                      ...widget.items
                                          .map((i) => i.section)
                                          .toSet()
                                    ],
                                    onChanged: (v) =>
                                        setState(() => _section = v)),
                                const KernelChip(label: 'Snapshot only'),
                                const KernelChip(
                                    label:
                                        'Not Connected Yet where source is unavailable'),
                              ],
                            ),
                            const SizedBox(height: 22),
                            if (items.isEmpty)
                              const KernelEmpty(
                                  message:
                                      'No items matched the current filters.')
                            else
                              Wrap(
                                spacing: 14,
                                runSpacing: 14,
                                children: items
                                    .map((item) => KernelItemCard(
                                        item: item,
                                        onTap: () =>
                                            setState(() => _selected = item)))
                                    .toList(),
                              ),
                            const SizedBox(height: 22),
                            if (selected != null) KernelDetail(item: selected),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KernelCounter extends StatelessWidget {
  const KernelCounter({super.key, required this.metric});
  final KernelMetric metric;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: kernelPanel,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kernelGold.withValues(alpha: 0.38))),
      child: Row(children: <Widget>[
        Icon(metric.icon, color: kernelGold, size: 23),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text(metric.value,
                  style: const TextStyle(
                      color: kernelGold,
                      fontSize: 21,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(metric.label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: kernelSoft, fontSize: 12)),
            ])),
      ]),
    );
  }
}

class KernelSearch extends StatelessWidget {
  const KernelSearch({super.key, required this.hint, required this.onChanged});
  final String hint;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: kernelSoft),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFBDA56A)),
        prefixIcon: const Icon(Icons.search, color: kernelGold),
        filled: true,
        fillColor: const Color(0xAA0C0C0B),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: kernelGold.withValues(alpha: 0.28))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: kernelGold)),
      ),
    );
  }
}

class KernelDropdown extends StatelessWidget {
  const KernelDropdown(
      {super.key,
      required this.value,
      required this.values,
      required this.onChanged});
  final String value;
  final List<String> values;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: const Color(0xAA0C0C0B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kernelGold.withValues(alpha: 0.28))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: const Color(0xFF15120B),
          iconEnabledColor: kernelGold,
          style: const TextStyle(color: kernelSoft),
          items: values
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (next) {
            if (next != null) onChanged(next);
          },
        ),
      ),
    );
  }
}

class KernelChip extends StatelessWidget {
  const KernelChip({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    final warning = label.contains('Missing') ||
        label.contains('Not Connected') ||
        label.contains('Required') ||
        label.contains('Risk');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: warning ? const Color(0xFF2C1B0A) : const Color(0xFF172211),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
            color: warning ? const Color(0xFFE19A2E) : const Color(0xFF9FD27B)),
      ),
      child: Text(label,
          style: TextStyle(
              color:
                  warning ? const Color(0xFFFFCC75) : const Color(0xFFD7F7BC),
              fontSize: 12,
              fontWeight: FontWeight.w700)),
    );
  }
}

class KernelItemCard extends StatelessWidget {
  const KernelItemCard({super.key, required this.item, required this.onTap});
  final KernelItem item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: kernelPanel,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kernelGold.withValues(alpha: 0.34))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: kernelGold,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: kernelSoft, fontSize: 13)),
              const SizedBox(height: 12),
              Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
                KernelChip(label: item.type),
                KernelChip(label: item.status)
              ]),
              const SizedBox(height: 12),
              KernelHealth(label: 'Health', value: item.health),
            ]),
      ),
    );
  }
}

class KernelDetail extends StatelessWidget {
  const KernelDetail({super.key, required this.item});
  final KernelItem item;
  @override
  Widget build(BuildContext context) {
    final tabs = <String, List<String>>{
      'Overview': [
        item.subtitle,
        'Section: ${item.section}',
        'Type: ${item.type}',
        'Status: ${item.status}'
      ],
      'Health': [
        'Health: ${item.health}%',
        'Source: generated repository snapshot'
      ],
      'Missing Items': item.missingItems.isEmpty
          ? ['No missing items detected in snapshot']
          : item.missingItems,
      'Timeline': ['Snapshot generated: 2026-06-29'],
      'Not Connected Yet': [
        'Live source reader',
        'Runtime writer',
        'Automated exporter'
      ],
    };
    return DefaultTabController(
      length: tabs.length,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: kernelPanel,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kernelGold.withValues(alpha: 0.34))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(item.title,
                  style: const TextStyle(
                      color: kernelGold,
                      fontSize: 24,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              TabBar(
                  isScrollable: true,
                  labelColor: kernelGold,
                  unselectedLabelColor: kernelSoft,
                  indicatorColor: kernelGold,
                  tabs: tabs.keys.map((t) => Tab(text: t)).toList()),
              SizedBox(
                height: 280,
                child: TabBarView(
                    children: tabs.values
                        .map((lines) => ListView(
                            padding: const EdgeInsets.all(12),
                            children: lines
                                .map((line) => Text('- $line',
                                    style: const TextStyle(
                                        color: kernelSoft, height: 1.5)))
                                .toList()))
                        .toList()),
              ),
            ]),
      ),
    );
  }
}

class KernelHealth extends StatelessWidget {
  const KernelHealth({super.key, required this.label, required this.value});
  final String label;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                child: Text(label,
                    style: const TextStyle(color: kernelSoft, fontSize: 12))),
            Text('$value%',
                style: const TextStyle(
                    color: kernelGold, fontWeight: FontWeight.w800))
          ]),
          const SizedBox(height: 5),
          ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                  minHeight: 8,
                  value: value.clamp(0, 100) / 100,
                  backgroundColor: const Color(0xFF2A2415),
                  color: kernelGold)),
        ]);
  }
}

class KernelEmpty extends StatelessWidget {
  const KernelEmpty({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: kernelPanel,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kernelGold.withValues(alpha: 0.24))),
      child: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: kernelSoft)),
    );
  }
}
