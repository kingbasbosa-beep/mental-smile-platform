import 'library_aggregation_point.dart';
import 'library_archive_signal_event_writer.dart';
import 'library_signal_codes.dart';
import 'library_signal_payload.dart';
import 'library_signal_registry.dart';

class LibrarySignalEmitter {
  const LibrarySignalEmitter._();

  static const String runtimeVersion = 'library-l2-local-v1';

  static void emit({
    required String signalCode,
    required String sourceScreen,
    required String sourceWidget,
    required String action,
  }) {
    final definition = LibrarySignalRegistry.resolve(signalCode);
    final payload = definition.toPayload(
      sourceScreen: sourceScreen,
      sourceWidget: sourceWidget,
      action: action,
    );
    LibraryAggregationPoint.collect(payload);
    LibraryArchiveSignalEventWriter.writeControlledSignal(payload);
  }
}

extension on LibrarySignalDefinition {
  LibrarySignalPayload toPayload({
    required String sourceScreen,
    required String sourceWidget,
    required String action,
  }) {
    return LibrarySignalPayload(
      signalCode: signalCode,
      signalFamily: signalFamily.label,
      sourceSection: LibrarySignalRegistry.sourceSection,
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
      runtimeVersion: LibrarySignalEmitter.runtimeVersion,
    );
  }
}
