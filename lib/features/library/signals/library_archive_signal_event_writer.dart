import 'package:flutter/foundation.dart';
import 'package:mental_smile_os/core/local_signals/local_section_signal_buffer.dart';

import 'library_archive_signal_package_builder.dart';
import 'library_signal_payload.dart';

class LibraryArchiveSignalWriteResult {
  const LibraryArchiveSignalWriteResult({
    required this.success,
    this.eventId,
    this.errorMessage,
  });

  final bool success;
  final String? eventId;
  final String? errorMessage;
}

class LibraryArchiveSignalEventWriter {
  const LibraryArchiveSignalEventWriter._();

  static final Set<String> _sessionWrittenKeys = <String>{};

  static Future<LibraryArchiveSignalWriteResult> writeControlledSignal(
    LibrarySignalPayload payload,
  ) async {
    if (!LibraryArchiveSignalPackageBuilder.accepts(payload)) {
      return LibraryArchiveSignalWriteResult(
        success: false,
        errorMessage: 'Skipped non-controlled Library signal: '
            '${payload.signalCode}',
      );
    }

    final sessionKey = LibraryArchiveSignalPackageBuilder.sessionKeyFor(
      payload,
    );
    if (!_sessionWrittenKeys.add(sessionKey)) {
      return LibraryArchiveSignalWriteResult(
        success: false,
        errorMessage: 'Skipped duplicate session signal: ${payload.signalCode}',
      );
    }

    final createdAt = DateTime.now().toUtc();
    final eventId = 'lib_signal_${createdAt.microsecondsSinceEpoch.toString()}';
    final event = LibraryArchiveSignalPackageBuilder.buildEvent(
      payload: payload,
      eventId: eventId,
    );
    if (event == null) {
      return LibraryArchiveSignalWriteResult(
        success: false,
        eventId: eventId,
        errorMessage: 'No Archive route for signal: ${payload.signalCode}',
      );
    }

    final context = <String, Object?>{
      'sourceScreen': payload.sourceScreen,
      'sourceWidget': payload.sourceWidget,
      'action': payload.action,
      'runtimeVersion': payload.runtimeVersion,
      'signalFamily': payload.signalFamily,
      'archiveMagnetCode': payload.archiveMagnetCode,
      'archiveRoute': event['archive_destination_code'],
    };

    debugPrint(
      'LIB_LOCAL_SIGNAL_BUFFER_PAYLOAD event_id=$eventId payload=$context',
    );

    try {
      final result = await LocalSectionSignalBuffer().append(
        sectionId: LocalSectionSignalBuffer.librarySection,
        code: payload.signalCode,
        eventName: payload.signalFamily,
        context: context,
      );
      if (!result.stored) {
        _sessionWrittenKeys.remove(sessionKey);
        return LibraryArchiveSignalWriteResult(
          success: false,
          eventId: eventId,
          errorMessage: result.reason,
        );
      }
      debugPrint(
        'LIB_LOCAL_SIGNAL_BUFFER_SUCCESS event_id=$eventId '
        'section=${LocalSectionSignalBuffer.librarySection}',
      );
      return LibraryArchiveSignalWriteResult(
        success: true,
        eventId: eventId,
      );
    } catch (error, stackTrace) {
      _sessionWrittenKeys.remove(sessionKey);
      debugPrint(
        'LIB_LOCAL_SIGNAL_BUFFER_FAILURE event_id=$eventId error=$error',
      );
      debugPrintStack(stackTrace: stackTrace);
      return LibraryArchiveSignalWriteResult(
        success: false,
        eventId: eventId,
        errorMessage: error.toString(),
      );
    }
  }
}
