import 'package:flutter/foundation.dart';

import 'residential_signal_payload.dart';

class ResidentialSignalDebugLog {
  const ResidentialSignalDebugLog._();

  static final List<ResidentialSignalPayload> _events =
      <ResidentialSignalPayload>[];

  static List<ResidentialSignalPayload> get events =>
      List<ResidentialSignalPayload>.unmodifiable(_events);

  static int get count => _events.length;

  static void add(ResidentialSignalPayload payload) {
    _events.add(payload);
    debugPrint('Residential signal emitted: ${payload.toJson()}');
  }

  static void clear() {
    _events.clear();
  }
}

class ResidentialAggregationPoint {
  const ResidentialAggregationPoint._();

  static void collect(ResidentialSignalPayload payload) {
    ResidentialSignalDebugLog.add(payload);
  }
}
