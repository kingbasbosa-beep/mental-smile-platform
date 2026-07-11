import '../contracts/core_signal_envelope.dart';

abstract class CoreOutputGateway {
  Future<void> emit(CoreSignalEnvelope envelope);
}

class NoopCoreOutputGateway implements CoreOutputGateway {
  const NoopCoreOutputGateway();

  @override
  Future<void> emit(CoreSignalEnvelope envelope) async {}
}

class MemoryCoreOutputGateway implements CoreOutputGateway {
  final List<CoreSignalEnvelope> _envelopes = <CoreSignalEnvelope>[];

  List<CoreSignalEnvelope> get envelopes =>
      List<CoreSignalEnvelope>.unmodifiable(_envelopes);

  @override
  Future<void> emit(CoreSignalEnvelope envelope) async {
    _envelopes.add(envelope);
  }

  void clear() {
    _envelopes.clear();
  }
}
