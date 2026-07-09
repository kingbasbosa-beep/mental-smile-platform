import 'package:flutter/material.dart';

class CommercialV2WebBackground extends StatelessWidget {
  const CommercialV2WebBackground({
    super.key,
    required this.child,
    this.textDirection = TextDirection.rtl,
  });

  final Widget child;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0A0704),
                    Color(0xFF160E05),
                    Color(0xFF050403),
                  ],
                ),
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
