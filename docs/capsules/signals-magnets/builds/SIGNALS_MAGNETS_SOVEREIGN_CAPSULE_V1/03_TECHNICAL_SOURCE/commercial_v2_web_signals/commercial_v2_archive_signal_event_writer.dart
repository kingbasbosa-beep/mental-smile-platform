import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'commercial_v2_inbox_outbox_interfaces.dart';
import 'commercial_v2_signal_codes.dart';
import 'commercial_v2_signal_payload.dart';

class CommercialV2ArchiveSignalWriteResult {
  const CommercialV2ArchiveSignalWriteResult({
    required this.success,
    this.eventId,
    this.errorMessage,
  });

  final bool success;
  final String? eventId;
  final String? errorMessage;
}

class CommercialV2ArchiveSignalEventWriter {
  const CommercialV2ArchiveSignalEventWriter._();

  static const String collectionPath = 'archive_signal_events';
  static const String archiveDestinationCode = 'ARC-SIG-CV2-SHOWCASE-001';
  static const String destinationSectionCode = 'SEC-ARC';
  static const String destinationInboxPlug = 'PLG-ARC-IN';
  static const String packageFamily = 'signal_event';
  static const String acceptedGuardStatus = 'accepted';
  static const String noQuarantineReason = 'NONE';

  static Future<CommercialV2ArchiveSignalWriteResult>
      writeFirstControlledSignal(CommercialV2SignalPayload payload) async {
    if (payload.signalCode != CommercialV2SignalCode.openLibrary) {
      return CommercialV2ArchiveSignalWriteResult(
        success: false,
        errorMessage: 'Skipped non-library signal: ${payload.signalCode}',
      );
    }

    return _write(payload);
  }

  static Future<CommercialV2ArchiveSignalWriteResult> _write(
    CommercialV2SignalPayload payload,
  ) async {
    final createdAt = DateTime.now().toUtc();
    final eventId =
        'cv2_open_library_${createdAt.microsecondsSinceEpoch.toString()}';
    final traceId = 'trace_$eventId';

    final event = <String, Object>{
      'event_id': eventId,
      'source_section_code': CommercialV2PlugCodes.sectionCode,
      'source_outbox_plug': CommercialV2PlugCodes.outboxPlug,
      'destination_section_code': destinationSectionCode,
      'destination_inbox_plug': destinationInboxPlug,
      'archive_destination_code': archiveDestinationCode,
      'package_family': packageFamily,
      'signal_code': payload.signalCode,
      'magnet_code': payload.archiveMagnetCode,
      'privacy_class': payload.privacyClass,
      'retention_class': payload.retentionClass,
      'payload_minimal': <String, Object>{
        'source_screen': payload.sourceScreen,
        'source_widget': payload.sourceWidget,
        'action': payload.action,
        'runtime_version': payload.runtimeVersion,
      },
      'created_at': FieldValue.serverTimestamp(),
      'guard_status': acceptedGuardStatus,
      'quarantine_reason': noQuarantineReason,
      'trace_id': traceId,
    };

    debugPrint('CV2_FIRST_WRITE_PAYLOAD event_id=$eventId payload=$event');

    try {
      await FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(eventId)
          .set(event)
          .timeout(const Duration(seconds: 8));
      debugPrint(
        'CV2_FIRST_WRITE_SUCCESS event_id=$eventId '
        'collection=$collectionPath',
      );
      return CommercialV2ArchiveSignalWriteResult(
        success: true,
        eventId: eventId,
      );
    } catch (error, stackTrace) {
      debugPrint(
        'CV2_FIRST_WRITE_FAILURE event_id=$eventId '
        'collection=$collectionPath error=$error',
      );
      debugPrintStack(stackTrace: stackTrace);
      return CommercialV2ArchiveSignalWriteResult(
        success: false,
        eventId: eventId,
        errorMessage: error.toString(),
      );
    }
  }
}
