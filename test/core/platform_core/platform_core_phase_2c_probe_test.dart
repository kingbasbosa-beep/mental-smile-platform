import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../tool/platform_core_phase_2c_probe.dart';

void main() {
  testWidgets('phase 2C result panel displays successful delivery', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Phase2CProbeResultPanel(
            result: Phase2CProbeResultData(
              accepted: true,
              outputDelivered: true,
              reason: 'accepted',
              signalId: 'test_residential:cl001bt:1',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Full success'), findsOneWidget);
    expect(find.text('true'), findsNWidgets(2));
    expect(find.text('accepted'), findsNWidgets(2));
    expect(find.text('test_residential:cl001bt:1'), findsOneWidget);
  });

  testWidgets('phase 2C result panel displays gateway failure semantics', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Phase2CProbeResultPanel(
            result: Phase2CProbeResultData(
              accepted: true,
              outputDelivered: false,
              reason: 'gatewayFailure',
              signalId: 'test_residential:cl001bt:2',
            ),
          ),
        ),
      ),
    );

    expect(
        find.text('Core accepted; Firebase delivery failed'), findsOneWidget);
    expect(find.text('accepted'), findsOneWidget);
    expect(find.text('true'), findsOneWidget);
    expect(find.text('false'), findsOneWidget);
    expect(find.text('gatewayFailure'), findsOneWidget);
  });

  testWidgets('phase 2C result panel displays pre-gateway rejection', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Phase2CProbeResultPanel(
            result: Phase2CProbeResultData(
              accepted: false,
              outputDelivered: false,
              reason: 'unknownCode',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Core rejected before Firebase'), findsOneWidget);
    expect(find.text('none'), findsOneWidget);
  });
}
