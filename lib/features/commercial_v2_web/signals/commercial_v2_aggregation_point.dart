import 'package:flutter/foundation.dart';

import 'commercial_v2_signal_payload.dart';

class CommercialV2SignalDebugLog {
  const CommercialV2SignalDebugLog._();

  static final List<CommercialV2SignalPayload> _events =
      <CommercialV2SignalPayload>[];

  static List<CommercialV2SignalPayload> get events =>
      List<CommercialV2SignalPayload>.unmodifiable(_events);

  static int get count => _events.length;

  static void add(CommercialV2SignalPayload payload) {
    _events.add(payload);
    debugPrint('Commercial V2 signal emitted: ${payload.toJson()}');
  }

  static void clear() {
    _events.clear();
  }
}

class CommercialV2AggregationPoint {
  const CommercialV2AggregationPoint._();

  static void collect(CommercialV2SignalPayload payload) {
    CommercialV2SignalDebugLog.add(payload);
  }
}
