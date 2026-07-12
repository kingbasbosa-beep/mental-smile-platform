import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/commercial/platform_core/commercial_section_adapter.dart';

class CommercialRuntimeSignalBridge {
  CommercialRuntimeSignalBridge._();

  static final PlatformCoreSignalBridge _bridge = PlatformCoreSignalBridge(
    adapter: const CommercialSectionAdapter(),
  );

  static Future<CoreEmitResult> emitSpecialistLoginSuccess() {
    return _bridge.emit(
      code: 'sp010bt',
      context: const <String, Object?>{
        'surface': 'specialist_login',
        'actorType': 'specialist',
        'status': 'success',
      },
    );
  }

  static Future<CoreEmitResult> emitCenterLoginSuccess() {
    return _bridge.emit(
      code: 'ct010bt',
      context: const <String, Object?>{
        'surface': 'center_login',
        'actorType': 'center',
        'status': 'success',
      },
    );
  }

  static Future<CoreEmitResult> emitSpecialistApplicationSubmitted() {
    return _bridge.emit(
      code: 'sp014sb',
      context: const <String, Object?>{
        'surface': 'specialist_application',
        'actorType': 'specialist',
        'formType': 'application',
        'status': 'submitted',
      },
    );
  }

  static Future<CoreEmitResult> emitCenterApplicationSubmitted() {
    return _bridge.emit(
      code: 'ct014sb',
      context: const <String, Object?>{
        'surface': 'center_application',
        'actorType': 'center',
        'formType': 'application',
        'status': 'submitted',
      },
    );
  }
}
