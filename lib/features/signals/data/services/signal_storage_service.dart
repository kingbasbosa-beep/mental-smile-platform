import 'package:flutter/foundation.dart';
import 'package:mental_smile_os/core/local_signals/local_section_signal_buffer.dart';

import '../../domain/models/signal_package.dart';

class SignalStorageService {
  SignalStorageService({
    LocalSectionSignalBuffer? localBuffer,
  }) : _localBuffer = localBuffer ?? LocalSectionSignalBuffer();

  final LocalSectionSignalBuffer _localBuffer;

  static const String eventsCollection = 'signal_events';

  Future<void> saveSignal(SignalPackage signal) async {
    try {
      await _localBuffer.append(
        sectionId: _sectionIdFor(signal),
        code: signal.signalType,
        eventName: signal.signalCategory,
        context: <String, Object?>{
          'signalDomain': signal.signalDomain,
          'signalSource': signal.signalSource,
          'actorRole': signal.actorRole,
          'targetType': signal.targetType,
          'routingTarget': signal.routingTarget,
          'retentionClass': signal.retentionClass,
          'privacyLevel': signal.privacyLevel,
          'signalVersion': signal.signalVersion,
        },
      );
    } catch (e) {
      debugPrint('Local signal buffering failed: $e');
      // Signal observation must never block the initiating user flow.
    }
  }

  Stream<List<SignalPackage>> watchLatestEvents({
    required String actorId,
    int limit = 50,
  }) {
    return Stream<List<SignalPackage>>.value(const <SignalPackage>[]);
  }

  String _sectionIdFor(SignalPackage signal) {
    final routingTarget = signal.routingTarget.toLowerCase();
    final signalDomain = signal.signalDomain.toLowerCase();

    if (routingTarget.contains('commercial') ||
        signalDomain.contains('commercial')) {
      return LocalSectionSignalBuffer.commercialSection;
    }
    if (routingTarget.contains('library') || signalDomain.contains('library')) {
      return LocalSectionSignalBuffer.librarySection;
    }
    return LocalSectionSignalBuffer.residentialSection;
  }
}
