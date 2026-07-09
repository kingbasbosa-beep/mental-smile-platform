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
    final definition = ResidentialSignalRegistry.resolve(signalCode);
    final payload = definition.toPayload(
      sourceScreen: sourceScreen,
      sourceWidget: sourceWidget,
      action: action,
    );
    ResidentialAggregationPoint.collect(payload);
    ResidentialArchiveSignalEventWriter.writeToolSignal(payload);
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
