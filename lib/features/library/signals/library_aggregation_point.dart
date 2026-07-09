import 'package:flutter/foundation.dart';

import 'library_signal_payload.dart';

class LibrarySignalDebugLog {
  const LibrarySignalDebugLog._();

  static final List<LibrarySignalPayload> _events = <LibrarySignalPayload>[];

  static List<LibrarySignalPayload> get events =>
      List<LibrarySignalPayload>.unmodifiable(_events);

  static int get count => _events.length;

  static void add(LibrarySignalPayload payload) {
    _events.add(payload);
    debugPrint('Library signal emitted: ${payload.toJson()}');
  }

  static void clear() {
    _events.clear();
  }
}

class LibraryAggregationPoint {
  const LibraryAggregationPoint._();

  static void collect(LibrarySignalPayload payload) {
    LibrarySignalDebugLog.add(payload);
  }
}
