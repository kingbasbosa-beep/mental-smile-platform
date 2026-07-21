import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart';

void main() {
  testWidgets('example harness renders Residential capsule entry', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ResidentialCapsuleEntry());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
