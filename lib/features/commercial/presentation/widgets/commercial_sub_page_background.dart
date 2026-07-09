import 'package:flutter/material.dart';

class CommercialSubPageBackground extends StatelessWidget {
  const CommercialSubPageBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/backgrounds/commercial_background_dark.webp',
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
