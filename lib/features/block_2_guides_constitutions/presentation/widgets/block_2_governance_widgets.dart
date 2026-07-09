import 'package:flutter/material.dart';

const Color block2Black = Color(0xFF050505);
const Color block2Panel = Color(0xCC10100E);
const Color block2Gold = Color(0xFFE8C46A);
const Color block2GoldSoft = Color(0xFFEADCA7);

class Block2Shell extends StatelessWidget {
  const Block2Shell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.actions = const <Widget>[],
  });

  final String title;
  final String subtitle;
  final Widget child;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: block2Black,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 1.15,
              colors: <Color>[Color(0xFF231607), block2Black],
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
                              color: block2Gold),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: const TextStyle(
                                  color: block2Gold,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  color: block2GoldSoft,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...actions,
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
                        child: child,
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

class Block2CounterCard extends StatelessWidget {
  const Block2CounterCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: block2Panel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: block2Gold.withValues(alpha: 0.38)),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: block2Gold, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(value,
                    style: const TextStyle(
                        color: block2Gold,
                        fontSize: 22,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: block2GoldSoft, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Block2SearchBar extends StatelessWidget {
  const Block2SearchBar(
      {super.key, required this.hint, required this.onChanged});

  final String hint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: block2GoldSoft),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFBDA56A)),
        prefixIcon: const Icon(Icons.search, color: block2Gold),
        filled: true,
        fillColor: const Color(0xAA0C0C0B),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: block2Gold.withValues(alpha: 0.28)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: block2Gold),
        ),
      ),
    );
  }
}

class Block2FilterPanel extends StatelessWidget {
  const Block2FilterPanel({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 12, runSpacing: 12, children: children);
  }
}

class Block2Dropdown extends StatelessWidget {
  const Block2Dropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xAA0C0C0B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: block2Gold.withValues(alpha: 0.28)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: const Color(0xFF15120B),
          iconEnabledColor: block2Gold,
          style: const TextStyle(color: block2GoldSoft),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
        ),
      ),
    );
  }
}

class Block2StatusChip extends StatelessWidget {
  const Block2StatusChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final warning = label.contains('Missing') ||
        label.contains('Deprecated') ||
        label.contains('Archived') ||
        label.contains('Needs Review') ||
        label.contains('High');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: warning ? const Color(0xFF2C1B0A) : const Color(0xFF172211),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
            color: warning ? const Color(0xFFE19A2E) : const Color(0xFF9FD27B)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: warning ? const Color(0xFFFFCC75) : const Color(0xFFD7F7BC),
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class Block2HealthPanel extends StatelessWidget {
  const Block2HealthPanel({
    super.key,
    required this.health,
    required this.completion,
    this.compliance,
  });

  final int health;
  final int completion;
  final int? compliance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _HealthLine(label: 'Health', value: health),
        const SizedBox(height: 10),
        _HealthLine(label: 'Completion', value: completion),
        if (compliance != null) ...<Widget>[
          const SizedBox(height: 10),
          _HealthLine(label: 'Compliance', value: compliance!),
        ],
      ],
    );
  }
}

class _HealthLine extends StatelessWidget {
  const _HealthLine({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Text(label,
                    style:
                        const TextStyle(color: block2GoldSoft, fontSize: 12))),
            Text('$value%',
                style: const TextStyle(
                    color: block2Gold, fontWeight: FontWeight.w800)),
          ],
        ),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            minHeight: 8,
            value: value.clamp(0, 100) / 100,
            backgroundColor: const Color(0xFF2A2415),
            color: block2Gold,
          ),
        ),
      ],
    );
  }
}

class Block2SectionCard extends StatelessWidget {
  const Block2SectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.health,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String status;
  final int health;
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
          color: block2Panel,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: block2Gold.withValues(alpha: 0.34)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: block2Gold,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: block2GoldSoft, fontSize: 13)),
            const SizedBox(height: 12),
            Block2StatusChip(label: status),
            const SizedBox(height: 12),
            Block2HealthPanel(health: health, completion: health),
          ],
        ),
      ),
    );
  }
}

class Block2DetailTabs extends StatelessWidget {
  const Block2DetailTabs(
      {super.key, required this.title, required this.panels});

  final String title;
  final Map<String, Widget> panels;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: panels.length,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: block2Panel,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: block2Gold.withValues(alpha: 0.34)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,
                style: const TextStyle(
                    color: block2Gold,
                    fontSize: 24,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 14),
            TabBar(
              isScrollable: true,
              labelColor: block2Gold,
              unselectedLabelColor: block2GoldSoft,
              indicatorColor: block2Gold,
              tabs: panels.keys.map((label) => Tab(text: label)).toList(),
            ),
            SizedBox(
              height: 300,
              child: TabBarView(children: panels.values.toList()),
            ),
          ],
        ),
      ),
    );
  }
}

class Block2MissingItemsPanel extends StatelessWidget {
  const Block2MissingItemsPanel({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Block2EmptyState(
          message: 'No missing items detected in this snapshot.');
    }
    return ListView(
      padding: const EdgeInsets.all(12),
      children: items
          .map((item) => Text('• $item',
              style: const TextStyle(color: Color(0xFFFFCC75), height: 1.5)))
          .toList(),
    );
  }
}

class Block2DependencyList extends StatelessWidget {
  const Block2DependencyList({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: items
          .map((item) => Text('↓ $item',
              style: const TextStyle(color: block2GoldSoft, height: 1.5)))
          .toList(),
    );
  }
}

class Block2TimelinePanel extends StatelessWidget {
  const Block2TimelinePanel({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: items
          .map((item) => Text(item,
              style: const TextStyle(color: block2GoldSoft, height: 1.5)))
          .toList(),
    );
  }
}

class Block2EmptyState extends StatelessWidget {
  const Block2EmptyState({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: block2Panel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: block2Gold.withValues(alpha: 0.24)),
      ),
      child: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: block2GoldSoft)),
    );
  }
}

class Block2NotConnectedState extends StatelessWidget {
  const Block2NotConnectedState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Block2EmptyState(message: 'Not Connected Yet');
  }
}
