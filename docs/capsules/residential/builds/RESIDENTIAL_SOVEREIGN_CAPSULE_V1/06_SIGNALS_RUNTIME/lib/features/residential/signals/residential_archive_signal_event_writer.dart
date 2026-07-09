import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'residential_archive_signal_package_builder.dart';
import 'residential_signal_payload.dart';

class ResidentialArchiveSignalWriteResult {
  const ResidentialArchiveSignalWriteResult({
    required this.success,
    this.eventId,
    this.errorMessage,
  });

  final bool success;
  final String? eventId;
  final String? errorMessage;
}

class ResidentialArchiveSignalEventWriter {
  const ResidentialArchiveSignalEventWriter._();

  static Future<ResidentialArchiveSignalWriteResult> writeToolSignal(
    ResidentialSignalPayload payload,
  ) async {
    if (!ResidentialArchiveSignalPackageBuilder.accepts(payload)) {
      return ResidentialArchiveSignalWriteResult(
        success: false,
        errorMessage: 'Skipped non-tool signal: ${payload.signalCode}',
      );
    }

    final createdAt = DateTime.now().toUtc();
    final eventId = 'res_tool_${createdAt.microsecondsSinceEpoch.toString()}';
    final event = ResidentialArchiveSignalPackageBuilder.buildEvent(
      payload: payload,
      eventId: eventId,
    );

    debugPrint('RES_FIRST_TOOL_WRITE_PAYLOAD event_id=$eventId payload=$event');

    try {
      await FirebaseFirestore.instance
          .collection(ResidentialArchiveSignalPackageBuilder.collectionPath)
          .doc(eventId)
          .set(event)
          .timeout(const Duration(seconds: 8));
      debugPrint(
        'RES_FIRST_TOOL_WRITE_SUCCESS event_id=$eventId '
        'collection=${ResidentialArchiveSignalPackageBuilder.collectionPath}',
      );
      return ResidentialArchiveSignalWriteResult(
        success: true,
        eventId: eventId,
      );
    } catch (error, stackTrace) {
      debugPrint(
        'RES_FIRST_TOOL_WRITE_FAILURE event_id=$eventId '
        'collection=${ResidentialArchiveSignalPackageBuilder.collectionPath} '
        'error=$error',
      );
      debugPrintStack(stackTrace: stackTrace);
      return ResidentialArchiveSignalWriteResult(
        success: false,
        eventId: eventId,
        errorMessage: error.toString(),
      );
    }
  }
}
