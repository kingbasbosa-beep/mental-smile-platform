import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/residential/platform_core/residential_section_adapter.dart';

class ResidentialRuntimeSignalBridge {
  ResidentialRuntimeSignalBridge._();

  static final PlatformCoreSignalBridge _bridge = PlatformCoreSignalBridge(
    adapter: const ResidentialSectionAdapter(socketEnvironment: 'production'),
  );

  static Future<CoreEmitResult> emitCheckinSubmitted() {
    return _bridge.emit(
      code: 'cl012sb',
      context: const <String, Object?>{
        'surface': 'client_checkin',
        'formType': 'checkin',
        'status': 'submitted',
      },
    );
  }

  static Future<CoreEmitResult> emitSuggestionSubmitted() {
    return _bridge.emit(
      code: 'cl014sb',
      context: const <String, Object?>{
        'surface': 'client_suggestion',
        'formType': 'suggestion',
        'status': 'submitted',
      },
    );
  }

  static Future<CoreEmitResult> emitClientLogoutCompleted() {
    return _bridge.emit(
      code: 'cl016bt',
      context: const <String, Object?>{
        'surface': 'client_room',
        'actionType': 'logout',
        'status': 'completed',
      },
    );
  }
}
