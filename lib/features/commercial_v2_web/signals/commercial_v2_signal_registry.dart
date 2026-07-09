import 'commercial_v2_signal_codes.dart';
import 'commercial_v2_signal_payload.dart';

class CommercialV2SignalRegistry {
  const CommercialV2SignalRegistry._();

  static const sourceSection = 'SEC-CV2';

  static const _localAggregation =
      CommercialV2AggregationDestination('Commercial V2 Local Aggregation');
  static const _outboxAggregation =
      CommercialV2AggregationDestination('Commercial V2 Outbox Aggregation');
  static const _strategicSummary = CommercialV2StrategicSummaryDestination(
    'Commercial V2 Strategic Summary',
  );
  static const _publishingSummary = CommercialV2StrategicSummaryDestination(
    'Commercial V2 Publishing Readiness Summary',
  );

  static const Map<String, CommercialV2SignalDefinition> definitions =
      <String, CommercialV2SignalDefinition>{
    CommercialV2SignalCode.openLibrary: CommercialV2SignalDefinition(
      signalCode: CommercialV2SignalCode.openLibrary,
      signalFamily: CommercialV2SignalFamily.showcaseNavigation,
      archiveMagnet: CommercialV2ArchiveMagnet(
        code: 'CV2-MAG-LIBRARY-INTEREST',
        destination: 'Commercial V2 Library Showcase Interest',
      ),
      aggregationDestination: _localAggregation,
      strategicSummaryDestination: _strategicSummary,
      privacyClass: 'anonymous_navigation_signal',
      retentionClass: 'operational_summary',
      outboxParticipation: 'NO_OUTBOX_PACKAGE_YET',
    ),
    CommercialV2SignalCode.openSpecialists: CommercialV2SignalDefinition(
      signalCode: CommercialV2SignalCode.openSpecialists,
      signalFamily: CommercialV2SignalFamily.showcaseNavigation,
      archiveMagnet: CommercialV2ArchiveMagnet(
        code: 'CV2-MAG-SPECIALISTS-INTEREST',
        destination: 'Commercial V2 Specialists Showcase Interest',
      ),
      aggregationDestination: _localAggregation,
      strategicSummaryDestination: _strategicSummary,
      privacyClass: 'anonymous_navigation_signal',
      retentionClass: 'operational_summary',
      outboxParticipation: 'NO_OUTBOX_PACKAGE_YET',
    ),
    CommercialV2SignalCode.openCenters: CommercialV2SignalDefinition(
      signalCode: CommercialV2SignalCode.openCenters,
      signalFamily: CommercialV2SignalFamily.showcaseNavigation,
      archiveMagnet: CommercialV2ArchiveMagnet(
        code: 'CV2-MAG-CENTERS-INTEREST',
        destination: 'Commercial V2 Centers Showcase Interest',
      ),
      aggregationDestination: _localAggregation,
      strategicSummaryDestination: _strategicSummary,
      privacyClass: 'anonymous_navigation_signal',
      retentionClass: 'operational_summary',
      outboxParticipation: 'NO_OUTBOX_PACKAGE_YET',
    ),
    CommercialV2SignalCode.back: CommercialV2SignalDefinition(
      signalCode: CommercialV2SignalCode.back,
      signalFamily: CommercialV2SignalFamily.navigationControl,
      archiveMagnet: CommercialV2ArchiveMagnet(
        code: 'CV2-MAG-NAVIGATION',
        destination: 'Commercial V2 Navigation Summary',
      ),
      aggregationDestination: _localAggregation,
      strategicSummaryDestination: _strategicSummary,
      privacyClass: 'anonymous_navigation_signal',
      retentionClass: 'operational_summary',
      outboxParticipation: 'NO_OUTBOX_PACKAGE_YET',
    ),
    CommercialV2SignalCode.registrationPackageReady:
        CommercialV2SignalDefinition(
      signalCode: CommercialV2SignalCode.registrationPackageReady,
      signalFamily: CommercialV2SignalFamily.registrationPackage,
      archiveMagnet: CommercialV2ArchiveMagnet(
        code: 'CV2-MAG-REGISTRATION-PACKAGE',
        destination: 'Commercial V2 Registration Package',
      ),
      aggregationDestination: _outboxAggregation,
      strategicSummaryDestination: _publishingSummary,
      privacyClass: 'governed_provider_package',
      retentionClass: 'archive_ready',
      outboxParticipation: 'YES_FUTURE_ARCHIVE_OUTBOX',
    ),
    CommercialV2SignalCode.profileGenerationReady: CommercialV2SignalDefinition(
      signalCode: CommercialV2SignalCode.profileGenerationReady,
      signalFamily: CommercialV2SignalFamily.profileGeneration,
      archiveMagnet: CommercialV2ArchiveMagnet(
        code: 'CV2-MAG-GENERATION-PACKAGE',
        destination: 'Commercial V2 Profile Generation Package',
      ),
      aggregationDestination: _outboxAggregation,
      strategicSummaryDestination: _publishingSummary,
      privacyClass: 'governed_provider_package',
      retentionClass: 'archive_ready',
      outboxParticipation: 'YES_FUTURE_ARCHIVE_OUTBOX',
    ),
    CommercialV2SignalCode.publishingPackageReady: CommercialV2SignalDefinition(
      signalCode: CommercialV2SignalCode.publishingPackageReady,
      signalFamily: CommercialV2SignalFamily.publishingPackage,
      archiveMagnet: CommercialV2ArchiveMagnet(
        code: 'CV2-MAG-PUBLISHING-PACKAGE',
        destination: 'Commercial V2 Publishing Package',
      ),
      aggregationDestination: _outboxAggregation,
      strategicSummaryDestination: _publishingSummary,
      privacyClass: 'governed_publishing_package',
      retentionClass: 'archive_ready',
      outboxParticipation: 'YES_FUTURE_ARCHIVE_OUTBOX',
    ),
  };

  static CommercialV2SignalDefinition resolve(String signalCode) {
    final definition = definitions[signalCode];
    if (definition == null) {
      throw ArgumentError.value(signalCode, 'signalCode', 'Unknown signal');
    }
    return definition;
  }
}
