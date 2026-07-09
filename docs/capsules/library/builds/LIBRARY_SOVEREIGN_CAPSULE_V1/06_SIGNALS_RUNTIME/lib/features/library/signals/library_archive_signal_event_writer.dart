import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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

    debugPrint('LIB_PROVIDER_WRITE_PAYLOAD event_id=$eventId payload=$event');

    try {
      await FirebaseFirestore.instance
          .collection(LibraryArchiveSignalPackageBuilder.collectionPath)
          .doc(eventId)
          .set(event)
          .timeout(const Duration(seconds: 8));
      debugPrint(
        'LIB_PROVIDER_WRITE_SUCCESS event_id=$eventId '
        'collection=${LibraryArchiveSignalPackageBuilder.collectionPath}',
      );
      return LibraryArchiveSignalWriteResult(
        success: true,
        eventId: eventId,
      );
    } catch (error, stackTrace) {
      _sessionWrittenKeys.remove(sessionKey);
      debugPrint(
        'LIB_PROVIDER_WRITE_FAILURE event_id=$eventId '
        'collection=${LibraryArchiveSignalPackageBuilder.collectionPath} '
        'error=$error',
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
