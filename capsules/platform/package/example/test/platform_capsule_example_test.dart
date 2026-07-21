import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('Platform capsule example renders harness snapshot', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PlatformCapsuleExampleApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Platform Capsule identity'), findsOneWidget);
    expect(find.text('MS-CAPSULE-PLATFORM-INFRASTRUCTURE'), findsOneWidget);
    expect(find.text('Registered capsule count'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('Platform test port'), findsOneWidget);
    expect(find.text('MS-PORT-PLATFORM-TEST-01'), findsOneWidget);
    expect(find.text('Compatibility result'), findsOneWidget);
    expect(find.text('compatible'), findsOneWidget);
    expect(find.text('Diagnostic summary'), findsOneWidget);
  });
}
