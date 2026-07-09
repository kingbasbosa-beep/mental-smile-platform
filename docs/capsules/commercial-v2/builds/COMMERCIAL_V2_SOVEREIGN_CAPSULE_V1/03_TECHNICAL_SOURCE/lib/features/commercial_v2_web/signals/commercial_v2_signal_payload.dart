import 'commercial_v2_signal_codes.dart';

class CommercialV2ArchiveMagnet {
  const CommercialV2ArchiveMagnet({
    required this.code,
    required this.destination,
  });

  final String code;
  final String destination;
}

class CommercialV2AggregationDestination {
  const CommercialV2AggregationDestination(this.name);

  final String name;
}

class CommercialV2StrategicSummaryDestination {
  const CommercialV2StrategicSummaryDestination(this.name);

  final String name;
}

class CommercialV2SignalDefinition {
  const CommercialV2SignalDefinition({
    required this.signalCode,
    required this.signalFamily,
    required this.archiveMagnet,
    required this.aggregationDestination,
    required this.strategicSummaryDestination,
    required this.privacyClass,
    required this.retentionClass,
    required this.outboxParticipation,
  });

  final String signalCode;
  final CommercialV2SignalFamily signalFamily;
  final CommercialV2ArchiveMagnet archiveMagnet;
  final CommercialV2AggregationDestination aggregationDestination;
  final CommercialV2StrategicSummaryDestination strategicSummaryDestination;
  final String privacyClass;
  final String retentionClass;
  final String outboxParticipation;
}

class CommercialV2SignalPayload {
  const CommercialV2SignalPayload({
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
    required this.outboxParticipation,
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
  final String outboxParticipation;
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
      'outboxParticipation': outboxParticipation,
      'timestamp': timestamp.toIso8601String(),
      'runtimeVersion': runtimeVersion,
    };
  }
}
