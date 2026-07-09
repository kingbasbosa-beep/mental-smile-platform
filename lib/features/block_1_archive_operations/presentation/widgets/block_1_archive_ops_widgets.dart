import 'package:flutter/material.dart';

const Color block1Gold = Color(0xFFE8C46A);
const Color block1GoldDark = Color(0xFF9B6B18);
const Color block1Black = Color(0xFF050505);
const Color block1Panel = Color(0xCC10100E);

class Block1Shell extends StatelessWidget {
  const Block1Shell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: block1Black,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 1.2,
              colors: <Color>[Color(0xFF211608), block1Black],
            ),
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 22, 28, 12),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                          icon: const Icon(Icons.arrow_forward,
                              color: block1Gold),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: const TextStyle(
                                  color: block1Gold,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  color: Color(0xFFD7C08A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (trailing != null) trailing!,
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 8, 28, 32),
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

class Block1CounterCard extends StatelessWidget {
  const Block1CounterCard({
    super.key,
    required this.label,
    required this.value,
    this.icon = Icons.inventory_2_outlined,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: block1Panel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: block1Gold.withValues(alpha: 0.42)),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: block1Gold, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  value,
                  style: const TextStyle(
                    color: block1Gold,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFEADCA7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Block1SearchField extends StatelessWidget {
  const Block1SearchField({
    super.key,
    required this.hint,
    required this.onChanged,
  });

  final String hint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textDirection: TextDirection.rtl,
      style: const TextStyle(color: Color(0xFFF4E6B1)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFBDA56A)),
        prefixIcon: const Icon(Icons.search, color: block1Gold),
        filled: true,
        fillColor: const Color(0xAA0C0C0B),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: block1Gold.withValues(alpha: 0.28)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: block1Gold),
        ),
      ),
    );
  }
}

class Block1FilterDropdown extends StatelessWidget {
  const Block1FilterDropdown({
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
        border: Border.all(color: block1Gold.withValues(alpha: 0.28)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: const Color(0xFF15120B),
          iconEnabledColor: block1Gold,
          style: const TextStyle(color: Color(0xFFF4E6B1)),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (next) {
            if (next != null) onChanged(next);
          },
        ),
      ),
    );
  }
}

class Block1StatusChip extends StatelessWidget {
  const Block1StatusChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final isWarning = label.contains('Missing') ||
        label.contains('Pending') ||
        label.contains('Not Connected') ||
        label.contains('Frozen');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isWarning ? const Color(0xFF2C1B0A) : const Color(0xFF172211),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: isWarning ? const Color(0xFFE19A2E) : const Color(0xFF9FD27B),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isWarning ? const Color(0xFFFFCC75) : const Color(0xFFD7F7BC),
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class Block1HealthBar extends StatelessWidget {
  const Block1HealthBar({
    super.key,
    required this.label,
    required this.value,
  });

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
              child: Text(
                label,
                style: const TextStyle(color: Color(0xFFEADCA7), fontSize: 12),
              ),
            ),
            Text(
              '$value%',
              style: const TextStyle(
                  color: block1Gold, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            minHeight: 8,
            value: value.clamp(0, 100) / 100,
            backgroundColor: const Color(0xFF2A2415),
            color: block1Gold,
          ),
        ),
      ],
    );
  }
}

class Block1ActionButton extends StatelessWidget {
  const Block1ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: block1Gold,
        side: BorderSide(color: block1Gold.withValues(alpha: 0.55)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class Block1EmptyState extends StatelessWidget {
  const Block1EmptyState({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: block1Panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: block1Gold.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: <Widget>[
          const Icon(Icons.search_off, color: block1Gold, size: 36),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFFEADCA7), fontSize: 16),
          ),
        ],
      ),
    );
  }
}
