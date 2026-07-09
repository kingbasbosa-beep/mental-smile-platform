import 'residential_signal_codes.dart';

class ResidentialArchiveMagnet {
  const ResidentialArchiveMagnet({
    required this.code,
    required this.destination,
  });

  final String code;
  final String destination;
}

class ResidentialAggregationDestination {
  const ResidentialAggregationDestination(this.name);

  final String name;
}

class ResidentialStrategicSummaryDestination {
  const ResidentialStrategicSummaryDestination(this.name);

  final String name;
}

class ResidentialSignalDefinition {
  const ResidentialSignalDefinition({
    required this.signalCode,
    required this.signalFamily,
    required this.archiveMagnet,
    required this.aggregationDestination,
    required this.strategicSummaryDestination,
    required this.privacyClass,
    required this.retentionClass,
  });

  final String signalCode;
  final ResidentialSignalFamily signalFamily;
  final ResidentialArchiveMagnet archiveMagnet;
  final ResidentialAggregationDestination aggregationDestination;
  final ResidentialStrategicSummaryDestination strategicSummaryDestination;
  final String privacyClass;
  final String retentionClass;
}

class ResidentialSignalPayload {
  const ResidentialSignalPayload({
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
