import 'package:cloud_firestore/cloud_firestore.dart';

import 'library_signal_codes.dart';
import 'library_signal_payload.dart';

class LibraryArchiveSignalRoute {
  const LibraryArchiveSignalRoute({
    required this.sourceSectionCode,
    required this.sourceOutboxPlug,
    required this.archiveDestinationCode,
    required this.magnetCode,
  });

  final String sourceSectionCode;
  final String sourceOutboxPlug;
  final String archiveDestinationCode;
  final String magnetCode;
}

class LibraryArchiveSignalPackageBuilder {
  const LibraryArchiveSignalPackageBuilder._();

  static const String collectionPath = 'archive_signal_events';
  static const String destinationSectionCode = 'SEC-ARC';
  static const String destinationInboxPlug = 'PLG-ARC-IN';
  static const String packageFamily = 'signal_event';
  static const String privacyClass = 'anonymous_navigation_signal';
  static const String retentionClass = 'operational_summary';
  static const String acceptedGuardStatus = 'accepted';
  static const String noQuarantineReason = 'NONE';

  static const Set<String> allowedSignalCodes = <String>{
    LibrarySignalCode.libraryHomeView,
    LibrarySignalCode.categoryCardOpen,
    LibrarySignalCode.specialistsBranchView,
    LibrarySignalCode.providerSpecialistsOpen,
    LibrarySignalCode.centersBranchView,
    LibrarySignalCode.providerCentersOpen,
  };

  static bool accepts(LibrarySignalPayload payload) {
    return allowedSignalCodes.contains(payload.signalCode);
  }

  static LibraryArchiveSignalRoute? routeFor(LibrarySignalPayload payload) {
    switch (payload.signalCode) {
      case LibrarySignalCode.libraryHomeView:
      case LibrarySignalCode.categoryCardOpen:
        return const LibraryArchiveSignalRoute(
          sourceSectionCode: 'SEC-LIB',
          sourceOutboxPlug: 'PLG-LIB-OUT',
          archiveDestinationCode: 'ARC-SIG-LIB-HOME-001',
          magnetCode: 'LIB-MAG-HOME',
        );
      case LibrarySignalCode.specialistsBranchView:
      case LibrarySignalCode.providerSpecialistsOpen:
        return const LibraryArchiveSignalRoute(
          sourceSectionCode: 'SEC-LIB-SP',
          sourceOutboxPlug: 'PLG-LIB-SP-OUT',
          archiveDestinationCode: 'ARC-SIG-LIB-SP-001',
          magnetCode: 'LIB-MAG-SPECIALISTS',
        );
      case LibrarySignalCode.centersBranchView:
      case LibrarySignalCode.providerCentersOpen:
        return const LibraryArchiveSignalRoute(
          sourceSectionCode: 'SEC-LIB-CTR',
          sourceOutboxPlug: 'PLG-LIB-CTR-OUT',
          archiveDestinationCode: 'ARC-SIG-LIB-CTR-001',
          magnetCode: 'LIB-MAG-CENTERS',
        );
    }
    return null;
  }

  static String sessionKeyFor(LibrarySignalPayload payload) {
    final route = routeFor(payload);

    return [
      payload.signalCode,
      payload.sourceScreen,
      payload.sourceWidget,
      payload.action,
      route?.archiveDestinationCode ?? 'NO_ARCHIVE_ROUTE',
      route?.magnetCode ?? 'NO_MAGNET',
    ].join('|');
  }

  static Map<String, Object>? buildEvent({
    required LibrarySignalPayload payload,
    required String eventId,
  }) {
    final route = routeFor(payload);
    if (route == null) {
      return null;
    }

    return <String, Object>{
      'event_id': eventId,
      'source_section_code': route.sourceSectionCode,
      'source_outbox_plug': route.sourceOutboxPlug,
      'destination_section_code': destinationSectionCode,
      'destination_inbox_plug': destinationInboxPlug,
      'archive_destination_code': route.archiveDestinationCode,
      'package_family': packageFamily,
      'signal_code': payload.signalCode,
      'magnet_code': route.magnetCode,
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
