import 'package:cloud_firestore/cloud_firestore.dart';

import 'residential_signal_codes.dart';
import 'residential_signal_payload.dart';

class ResidentialArchiveSignalPackageBuilder {
  const ResidentialArchiveSignalPackageBuilder._();

  static const String collectionPath = 'archive_signal_events';
  static const String sourceSectionCode = 'SEC-RES';
  static const String sourceOutboxPlug = 'PLG-RES-OUT';
  static const String destinationSectionCode = 'SEC-ARC';
  static const String destinationInboxPlug = 'PLG-ARC-IN';
  static const String archiveDestinationCode = 'ARC-SIG-RES-TOOLS-001';
  static const String packageFamily = 'signal_event';
  static const String magnetCode = 'RES-MAG-TOOLS';
  static const String privacyClass = 'anonymous_navigation_signal';
  static const String retentionClass = 'operational_summary';
  static const String acceptedGuardStatus = 'accepted';
  static const String noQuarantineReason = 'NONE';

  static const Set<String> toolSignalCodes = <String>{
    ResidentialSignalCode.localToolsOpen,
    ResidentialSignalCode.accessibilityToolOpen,
    ResidentialSignalCode.checkinToolOpen,
    ResidentialSignalCode.communityToolOpen,
  };

  static bool accepts(ResidentialSignalPayload payload) {
    return toolSignalCodes.contains(payload.signalCode) &&
        payload.signalFamily == ResidentialSignalFamily.toolUsage.label;
  }

  static Map<String, Object> buildEvent({
    required ResidentialSignalPayload payload,
    required String eventId,
  }) {
    return <String, Object>{
      'event_id': eventId,
      'source_section_code': sourceSectionCode,
      'source_outbox_plug': sourceOutboxPlug,
      'destination_section_code': destinationSectionCode,
      'destination_inbox_plug': destinationInboxPlug,
      'archive_destination_code': archiveDestinationCode,
      'package_family': packageFamily,
      'signal_code': payload.signalCode,
      'magnet_code': magnetCode,
      'privacy_class': privacyClass,
      'retention_class': retentionClass,
      'payload_minimal': <String, Object>{
        'source_screen': payload.sourceScreen,
        'source_widget': payload.sourceWidget,
        'action': payload.action,
        'runtime_version': payload.runtimeVersion,
      },
      'created_at': FieldValue.serverTimestamp(),
      'guard_status': acceptedGuardStatus,
      'quarantine_reason': noQuarantineReason,
      'trace_id': 'trace_$eventId',
    };
  }
}
