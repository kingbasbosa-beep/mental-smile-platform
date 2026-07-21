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
      home: LibraryCapsuleExampleHome(),
    );
  }
}

class LibraryCapsuleExampleHome extends StatelessWidget {
  const LibraryCapsuleExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Library Capsule Example'),
            Text('Routes: 5'),
            Text('Runtime files: 28'),
            Text('Speech controls: 25'),
            Text('Speech connected: 2'),
            Text('Speech pending: 23'),
            Text('Runtime content: 1'),
            Text('Editorial sources: 3'),
          ],
        ),
      ),
    );
  }
}
