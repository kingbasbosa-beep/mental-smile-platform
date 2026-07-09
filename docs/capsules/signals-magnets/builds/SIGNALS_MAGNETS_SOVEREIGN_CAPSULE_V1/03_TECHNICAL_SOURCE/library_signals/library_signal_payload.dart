import 'library_signal_codes.dart';

class LibraryArchiveMagnet {
  const LibraryArchiveMagnet({
    required this.code,
    required this.destination,
  });

  final String code;
  final String destination;
}

class LibraryAggregationDestination {
  const LibraryAggregationDestination(this.name);

  final String name;
}

class LibraryStrategicSummaryDestination {
  const LibraryStrategicSummaryDestination(this.name);

  final String name;
}

class LibrarySignalDefinition {
  const LibrarySignalDefinition({
    required this.signalCode,
    required this.signalFamily,
    required this.archiveMagnet,
    required this.aggregationDestination,
    required this.strategicSummaryDestination,
    required this.privacyClass,
    required this.retentionClass,
  });

  final String signalCode;
  final LibrarySignalFamily signalFamily;
  final LibraryArchiveMagnet archiveMagnet;
  final LibraryAggregationDestination aggregationDestination;
  final LibraryStrategicSummaryDestination strategicSummaryDestination;
  final String privacyClass;
  final String retentionClass;
}

class LibrarySignalPayload {
  const LibrarySignalPayload({
    required this.signalCode,
    required this.signalFamily,
    required this.sourceSection,
    required this.sourceScreen,
    required this.sourceWidget,
    required this.action,
    required this.archiveMagnetCode,
    required this.archiveDestination,
    required this.aggregationDestination,
    required this.strategicSummaryDestination,
    required this.privacyClass,
    required this.retentionClass,
    required this.timestamp,
    required this.runtimeVersion,
  });

  final String signalCode;
  final String signalFamily;
  final String sourceSection;
  final String sourceScreen;
  final String sourceWidget;
  final String action;
  final String archiveMagnetCode;
  final String archiveDestination;
  final String aggregationDestination;
  final String strategicSummaryDestination;
  final String privacyClass;
  final String retentionClass;
  final DateTime timestamp;
  final String runtimeVersion;

  Map<String, Object> toJson() {
    return <String, Object>{
      'signalCode': signalCode,
      'signalFamily': signalFamily,
      'sourceSection': sourceSection,
      'sourceScreen': sourceScreen,
      'sourceWidget': sourceWidget,
      'action': action,
      'archiveMagnetCode': archiveMagnetCode,
      'archiveDestination': archiveDestination,
      'aggregationDestination': aggregationDestination,
      'strategicSummaryDestination': strategicSummaryDestination,
      'privacyClass': privacyClass,
      'retentionClass': retentionClass,
      'timestamp': timestamp.toIso8601String(),
      'runtimeVersion': runtimeVersion,
    };
  }
}
