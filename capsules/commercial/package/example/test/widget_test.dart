import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mental_smile_commercial_capsule_example/main.dart';

void main() {
  testWidgets('example harness renders Commercial diagnostics', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Commercial Capsule Example'), findsOneWidget);
    expect(find.text('Speech controls: 17'), findsOneWidget);
    expect(find.text('Speech pending: 15'), findsOneWidget);
  });
}
