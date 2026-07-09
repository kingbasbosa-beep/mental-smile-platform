import 'commercial_v2_aggregation_point.dart';
import 'commercial_v2_archive_signal_event_writer.dart';
import 'commercial_v2_signal_codes.dart';
import 'commercial_v2_signal_payload.dart';
import 'commercial_v2_signal_registry.dart';

class CommercialV2SignalEmitter {
  const CommercialV2SignalEmitter._();

  static const String runtimeVersion = 'commercial-v2-c2-local-v1';

  static Future<CommercialV2ArchiveSignalWriteResult> emit({
    required String signalCode,
    required String sourceScreen,
    required String sourceWidget,
    required String action,
  }) {
    final definition = CommercialV2SignalRegistry.resolve(signalCode);
    final payload = definition.toPayload(
      sourceScreen: sourceScreen,
      sourceWidget: sourceWidget,
      action: action,
    );
    CommercialV2AggregationPoint.collect(payload);
    return CommercialV2ArchiveSignalEventWriter.writeFirstControlledSignal(
      payload,
    );
  }
}

extension on CommercialV2SignalDefinition {
  CommercialV2SignalPayload toPayload({
    required String sourceScreen,
    required String sourceWidget,
    required String action,
  }) {
    return CommercialV2SignalPayload(
      signalCode: signalCode,
      signalFamily: signalFamily.label,
      sourceSection: CommercialV2SignalRegistry.sourceSection,
      sourceScreen: sourceScreen,
      sourceWidget: sourceWidget,
      action: action,
      archiveMagnetCode: archiveMagnet.code,
      archiveDestination: archiveMagnet.destination,
      aggregationDestination: aggregationDestination.name,
      strategicSummaryDestination: strategicSummaryDestination.name,
      privacyClass: privacyClass,
      retentionClass: retentionClass,
      outboxParticipation: outboxParticipation,
      timestamp: DateTime.now().toUtc(),
      runtimeVersion: CommercialV2SignalEmitter.runtimeVersion,
    );
  }
}
