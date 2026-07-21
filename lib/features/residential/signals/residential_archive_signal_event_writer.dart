import 'package:flutter/foundation.dart';
import 'package:mental_smile_os/core/local_signals/local_section_signal_buffer.dart';

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
    final context = <String, Object?>{
      'sourceScreen': payload.sourceScreen,
      'sourceWidget': payload.sourceWidget,
      'action': payload.action,
      'runtimeVersion': payload.runtimeVersion,
      'signalFamily': payload.signalFamily,
      'archiveMagnetCode': payload.archiveMagnetCode,
    };

    debugPrint(
      'RES_LOCAL_SIGNAL_BUFFER_PAYLOAD event_id=$eventId payload=$context',
    );

    try {
      final result = await LocalSectionSignalBuffer().append(
        sectionId: LocalSectionSignalBuffer.residentialSection,
        code: payload.signalCode,
        eventName: payload.signalFamily,
        context: context,
      );
      if (!result.stored) {
        return ResidentialArchiveSignalWriteResult(
          success: false,
          eventId: eventId,
          errorMessage: result.reason,
        );
      }
      debugPrint(
        'RES_LOCAL_SIGNAL_BUFFER_SUCCESS event_id=$eventId '
        'section=${LocalSectionSignalBuffer.residentialSection}',
      );
      return ResidentialArchiveSignalWriteResult(
        success: true,
        eventId: eventId,
      );
    } catch (error, stackTrace) {
      debugPrint(
        'RES_LOCAL_SIGNAL_BUFFER_FAILURE event_id=$eventId error=$error',
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
