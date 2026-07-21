import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('example harness renders Library diagnostics', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Library Capsule Example'), findsOneWidget);
    expect(find.text('Speech controls: 25'), findsOneWidget);
    expect(find.text('Speech pending: 23'), findsOneWidget);
  });
}
