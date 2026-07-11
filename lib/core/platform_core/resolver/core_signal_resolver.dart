import '../contracts/core_signal_envelope.dart';
import '../contracts/core_signal_request.dart';
import '../dock/dock_registry.dart';
import '../registry/core_code_registry.dart';

typedef CoreClock = DateTime Function();
typedef CoreSignalIdFactory = String Function(CoreSignalRequest request);

enum CoreEmitReason {
  accepted,
  missingCode,
  unknownCode,
  sectionNotConnected,
  sectionNotAllowed,
  codeDisabled,
  environmentMismatch,
  gateNotAllowed,
  prefixNotAllowed,
  invalidContext,
  gatewayFailure,
}

class CoreEmitResult {
  const CoreEmitResult({
    required this.accepted,
    required this.outputDelivered,
    required this.reason,
    this.envelope,
  });

  final bool accepted;
  final bool outputDelivered;
  final CoreEmitReason reason;
  final CoreSignalEnvelope? envelope;

  factory CoreEmitResult.accepted(CoreSignalEnvelope envelope) {
    return CoreEmitResult(
      accepted: true,
      outputDelivered: true,
      reason: CoreEmitReason.accepted,
      envelope: envelope,
    );
  }

  factory CoreEmitResult.rejected(CoreEmitReason reason) {
    return CoreEmitResult(
      accepted: false,
      outputDelivered: false,
      reason: reason,
    );
  }

  factory CoreEmitResult.outputFailed(CoreSignalEnvelope envelope) {
    return CoreEmitResult(
      accepted: true,
      outputDelivered: false,
      reason: CoreEmitReason.gatewayFailure,
      envelope: envelope,
    );
  }
}

class CoreSignalResolver {
  CoreSignalResolver({
    required this.dockRegistry,
    required this.codeRegistry,
    CoreClock? clock,
    CoreSignalIdFactory? signalIdFactory,
  })  : _clock = clock ?? DateTime.now,
        _signalIdFactory = signalIdFactory ??
            ((request) =>
                '${request.sectionId}:${request.code}:${DateTime.now().microsecondsSinceEpoch}');

  final DockRegistry dockRegistry;
  final CoreCodeRegistry codeRegistry;
  final CoreClock _clock;
  final CoreSignalIdFactory _signalIdFactory;

  CoreEmitResult resolve(CoreSignalRequest request) {
    if (request.code.trim().isEmpty) {
      return CoreEmitResult.rejected(CoreEmitReason.missingCode);
    }

    if (!_isSafeContext(request.context)) {
      return CoreEmitResult.rejected(CoreEmitReason.invalidContext);
    }

    final slot = dockRegistry.slotFor(request.sectionId);
    if (slot == null || slot.status == DockSlotStatus.disabled) {
      return CoreEmitResult.rejected(CoreEmitReason.sectionNotConnected);
    }

    final definition = codeRegistry.resolve(request.code);
    if (definition == null) {
      return CoreEmitResult.rejected(CoreEmitReason.unknownCode);
    }

    if (!definition.enabled) {
      return CoreEmitResult.rejected(CoreEmitReason.codeDisabled);
    }

    if (definition.environment != slot.socket.environment) {
      return CoreEmitResult.rejected(CoreEmitReason.environmentMismatch);
    }

    if (!definition.allowedSections.contains(slot.socket.sectionCode)) {
      return CoreEmitResult.rejected(CoreEmitReason.sectionNotAllowed);
    }

    if (!slot.socket.allowsGate(definition.logicalTarget)) {
      return CoreEmitResult.rejected(CoreEmitReason.gateNotAllowed);
    }

    if (!slot.socket.allowsCodePrefix(definition.code)) {
      return CoreEmitResult.rejected(CoreEmitReason.prefixNotAllowed);
    }

    return CoreEmitResult.accepted(
      CoreSignalEnvelope(
        signalId: _signalIdFactory(request),
        code: definition.code,
        family: definition.family,
        eventName: definition.eventName,
        logicalTarget: definition.logicalTarget,
        sourceSectionId: request.sectionId,
        environment: definition.environment,
        schemaVersion: definition.schemaVersion,
        createdAt: _clock(),
        context: Map<String, Object?>.unmodifiable(request.context),
      ),
    );
  }

  bool _isSafeContext(Map<String, Object?> context) {
    const blockedKeys = <String>{
      'password',
      'token',
      'secret',
      'image',
      'file',
      'personalData',
    };
    if (context.length > 20) return false;

    for (final entry in context.entries) {
      if (blockedKeys.contains(entry.key)) return false;
      final value = entry.value;
      if (value == null || value is String || value is num || value is bool) {
        continue;
      }
      return false;
    }
    return true;
  }
}
