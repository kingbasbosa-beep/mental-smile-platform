import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommercialCapsuleExampleHome(),
    );
  }
}

class CommercialCapsuleExampleHome extends StatelessWidget {
  const CommercialCapsuleExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Commercial Capsule Example'),
            Text('Routes: 18'),
            Text('Speech controls: 17'),
            Text('Speech connected: 2'),
            Text('Speech pending: 15'),
          ],
        ),
      ),
    );
  }
}
