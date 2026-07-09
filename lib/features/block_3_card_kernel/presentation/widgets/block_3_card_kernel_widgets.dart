import 'package:flutter/material.dart';

const Color block3Black = Color(0xFF050505);
const Color block3Panel = Color(0xCC10100E);
const Color block3Gold = Color(0xFFE8C46A);
const Color block3Soft = Color(0xFFEADCA7);

class Block3Shell extends StatelessWidget {
  const Block3Shell({
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
        backgroundColor: block3Black,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 1.18,
              colors: <Color>[Color(0xFF241505), block3Black],
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
                              color: block3Gold),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(title,
                                  style: const TextStyle(
                                      color: block3Gold,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800)),
                              const SizedBox(height: 4),
                              Text(subtitle,
                                  style: const TextStyle(
                                      color: block3Soft,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
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

class Block3CounterCard extends StatelessWidget {
  const Block3CounterCard(
      {super.key,
      required this.label,
      required this.value,
      required this.icon});
  final String label;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: block3Panel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: block3Gold.withValues(alpha: 0.38)),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: block3Gold, size: 23),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(value,
                    style: const TextStyle(
                        color: block3Gold,
                        fontSize: 21,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: block3Soft, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Block3Search extends StatelessWidget {
  const Block3Search({super.key, required this.hint, required this.onChanged});
  final String hint;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: block3Soft),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFBDA56A)),
        prefixIcon: const Icon(Icons.search, color: block3Gold),
        filled: true,
        fillColor: const Color(0xAA0C0C0B),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: block3Gold.withValues(alpha: 0.28))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: block3Gold)),
      ),
    );
  }
}

class Block3Dropdown extends StatelessWidget {
  const Block3Dropdown(
      {super.key,
      required this.value,
      required this.items,
      required this.onChanged});
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
        border: Border.all(color: block3Gold.withValues(alpha: 0.28)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: const Color(0xFF15120B),
          iconEnabledColor: block3Gold,
          style: const TextStyle(color: block3Soft),
          items: items
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

class Block3StatusChip extends StatelessWidget {
  const Block3StatusChip({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    final warning = label.contains('Missing') ||
        label.contains('UNKNOWN') ||
        label.contains('Archived') ||
        label.contains('High') ||
        label.contains('Open');
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

class Block3Health extends StatelessWidget {
  const Block3Health({super.key, required this.label, required this.value});
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
                  style: const TextStyle(color: block3Soft, fontSize: 12))),
          Text('$value%',
              style: const TextStyle(
                  color: block3Gold, fontWeight: FontWeight.w800))
        ]),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
              minHeight: 8,
              value: value.clamp(0, 100) / 100,
              backgroundColor: const Color(0xFF2A2415),
              color: block3Gold),
        ),
      ],
    );
  }
}

class Block3Action extends StatelessWidget {
  const Block3Action(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});
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
        foregroundColor: block3Gold,
        side: BorderSide(color: block3Gold.withValues(alpha: 0.55)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class Block3Panel extends StatelessWidget {
  const Block3Panel({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: block3Panel,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: block3Gold.withValues(alpha: 0.34)),
      ),
      child: child,
    );
  }
}

class Block3Empty extends StatelessWidget {
  const Block3Empty({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Block3Panel(
        child: Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: block3Soft)));
  }
}
