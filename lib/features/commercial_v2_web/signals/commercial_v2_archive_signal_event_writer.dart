import 'package:flutter/foundation.dart';
import 'package:mental_smile_os/core/local_signals/local_section_signal_buffer.dart';

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
    final context = <String, Object?>{
      'sourceScreen': payload.sourceScreen,
      'sourceWidget': payload.sourceWidget,
      'action': payload.action,
      'runtimeVersion': payload.runtimeVersion,
      'signalFamily': payload.signalFamily,
      'archiveMagnetCode': payload.archiveMagnetCode,
      'sourceSectionCode': CommercialV2PlugCodes.sectionCode,
    };

    debugPrint(
      'CV2_LOCAL_SIGNAL_BUFFER_PAYLOAD event_id=$eventId payload=$context',
    );

    try {
      final result = await LocalSectionSignalBuffer().append(
        sectionId: LocalSectionSignalBuffer.commercialSection,
        code: payload.signalCode,
        eventName: payload.signalFamily,
        context: context,
      );
      if (!result.stored) {
        return CommercialV2ArchiveSignalWriteResult(
          success: false,
          eventId: eventId,
          errorMessage: result.reason,
        );
      }
      debugPrint(
        'CV2_LOCAL_SIGNAL_BUFFER_SUCCESS event_id=$eventId '
        'section=${LocalSectionSignalBuffer.commercialSection}',
      );
      return CommercialV2ArchiveSignalWriteResult(
        success: true,
        eventId: eventId,
      );
    } catch (error, stackTrace) {
      debugPrint(
        'CV2_LOCAL_SIGNAL_BUFFER_FAILURE event_id=$eventId error=$error',
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
