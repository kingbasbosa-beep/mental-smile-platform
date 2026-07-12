import '../contracts/core_signal_request.dart';
import '../contracts/platform_section_adapter.dart';
import '../gateway/core_output_gateway.dart';
import '../gateway/firebase_core_output_gateway.dart';
import '../gateway/production_firebase_core_output_gateway.dart';
import '../platform_core_facade.dart';
import '../resolver/core_signal_resolver.dart';

class PlatformCoreSignalBridge {
  PlatformCoreSignalBridge({
    required PlatformSectionAdapter adapter,
    CoreOutputGateway? outputGateway,
    PlatformCore? core,
  })  : _adapter = adapter,
        _core = core ??
            PlatformCore(
              outputGateway: outputGateway ??
                  ProductionFirebaseCoreOutputGateway(
                    writer: FirebaseCoreFirestoreWriter(),
                  ),
            );

  final PlatformSectionAdapter _adapter;
  final PlatformCore _core;
  bool _connected = false;

  Future<CoreEmitResult> emit({
    required String code,
    required Map<String, Object?> context,
  }) async {
    if (!_isApprovedRuntimeContext(context)) {
      return CoreEmitResult.rejected(CoreEmitReason.invalidContext);
    }

    try {
      _connectOnce();
      return await _core.emit(
        CoreSignalRequest(
          sectionId: _adapter.createSocket().sectionId,
          code: code,
          context: context,
        ),
      );
    } catch (_) {
      return CoreEmitResult.rejected(CoreEmitReason.gatewayFailure);
    }
  }

  void _connectOnce() {
    if (_connected) return;
    final result = _core.connectSection(_adapter.createSocket());
    _connected = result.connected ||
        _core.dockRegistry.contains(
          _adapter.createSocket().sectionId,
        );
  }

  bool _isApprovedRuntimeContext(Map<String, Object?> context) {
    const allowedKeys = <String>{
      'surface',
      'actionType',
      'actorType',
      'formType',
      'status',
      'submissionStatus',
    };
    const blockedKeys = <String>{
      'email',
      'phone',
      'uid',
      'userId',
      'password',
      'token',
      'secret',
      'note',
      'notes',
      'text',
      'message',
      'content',
      'answers',
      'answer',
      'image',
      'file',
      'bytes',
      'device',
      'session',
      'profile',
      'clientData',
      'providerData',
      'centerData',
      'specialistData',
    };

    if (context.length > 8) return false;
    for (final entry in context.entries) {
      if (!allowedKeys.contains(entry.key)) return false;
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
