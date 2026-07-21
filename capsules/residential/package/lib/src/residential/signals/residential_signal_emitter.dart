import 'dart:async';

import 'package:mental_smile_residential_capsule/src/residential/platform_core/residential_runtime_signal_bridge.dart';

import 'residential_aggregation_point.dart';
import 'residential_archive_signal_event_writer.dart';
import 'residential_signal_codes.dart';
import 'residential_signal_registry.dart';
import 'residential_signal_payload.dart';

class ResidentialSignalEmitter {
  const ResidentialSignalEmitter._();

  static const String runtimeVersion = 'residential-r11-local-v1';

  static void emit({
    required String signalCode,
    required String sourceScreen,
    required String sourceWidget,
    required String action,
  }) {
    if (_emitApprovedCoreSignal(signalCode)) {
      return;
    }

    final definition = ResidentialSignalRegistry.resolve(signalCode);
    final payload = definition.toPayload(
      sourceScreen: sourceScreen,
      sourceWidget: sourceWidget,
      action: action,
    );
    ResidentialAggregationPoint.collect(payload);
    ResidentialArchiveSignalEventWriter.writeToolSignal(payload);
  }

  static bool _emitApprovedCoreSignal(String signalCode) {
    switch (signalCode) {
      case ResidentialSignalCode.checkinToolOpen:
        unawaited(
          ResidentialRuntimeSignalBridge.emitCheckinSubmitted().then<void>(
            (_) {},
          ),
        );
        return true;
      case ResidentialSignalCode.suggestionSubmit:
        unawaited(
          ResidentialRuntimeSignalBridge.emitSuggestionSubmitted().then<void>(
            (_) {},
          ),
        );
        return true;
      case ResidentialSignalCode.exit:
        unawaited(
          ResidentialRuntimeSignalBridge.emitClientLogoutCompleted().then<void>(
            (_) {},
          ),
        );
        return true;
    }
    return false;
  }
}

extension on ResidentialSignalDefinition {
  ResidentialSignalPayload toPayload({
    required String sourceScreen,
    required String sourceWidget,
    required String action,
  }) {
    return ResidentialSignalPayload(
      signalCode: signalCode,
      signalFamily: signalFamily.label,
      sourceSection: ResidentialSignalRegistry.sourceSection,
      sourceScreen: sourceScreen,
      sourceWidget: sourceWidget,
      action: action,
      archiveMagnetCode: archiveMagnet.code,
      archiveDestination: archiveMagnet.destination,
      aggregationDestination: aggregationDestination.name,
      strategicSummaryDestination: strategicSummaryDestination.name,
      privacyClass: privacyClass,
      retentionClass: retentionClass,
      timestamp: DateTime.now().toUtc(),
      runtimeVersion: ResidentialSignalEmitter.runtimeVersion,
    );
  }
}
