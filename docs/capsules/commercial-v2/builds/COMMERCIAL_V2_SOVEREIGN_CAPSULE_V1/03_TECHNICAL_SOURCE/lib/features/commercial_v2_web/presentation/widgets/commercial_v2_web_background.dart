import 'package:flutter/material.dart';

class CommercialV2WebBackground extends StatelessWidget {
  const CommercialV2WebBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 1.05,
                  colors: [
                    Color(0xFF211608),
                    Color(0xFF050403),
                    Colors.black,
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
