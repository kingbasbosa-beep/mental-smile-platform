import 'contracts/core_signal_request.dart';
import 'contracts/section_socket.dart';
import 'dock/dock_registry.dart';
import 'gateway/core_output_gateway.dart';
import 'registry/core_code_registry.dart';
import 'resolver/core_signal_resolver.dart';

class PlatformCore {
  PlatformCore({
    DockRegistry? dockRegistry,
    CoreCodeRegistry? codeRegistry,
    CoreOutputGateway? outputGateway,
    CoreSignalResolver? resolver,
  })  : dockRegistry = dockRegistry ?? DockRegistry(),
        codeRegistry = codeRegistry ?? CoreCodeRegistry.testDefaults(),
        outputGateway = outputGateway ?? const NoopCoreOutputGateway(),
        _resolver = resolver;

  final DockRegistry dockRegistry;
  final CoreCodeRegistry codeRegistry;
  final CoreOutputGateway outputGateway;
  final CoreSignalResolver? _resolver;

  CoreSignalResolver get resolver {
    return _resolver ??
        CoreSignalResolver(
          dockRegistry: dockRegistry,
          codeRegistry: codeRegistry,
        );
  }

  DockConnectionResult connectSection(SectionSocket socket) {
    return dockRegistry.connect(socket);
  }

  bool disconnectSection(String sectionId) {
    return dockRegistry.disconnect(sectionId);
  }

  Future<CoreEmitResult> emit(CoreSignalRequest request) async {
    final result = resolver.resolve(request);
    if (!result.accepted || result.envelope == null) {
      return result;
    }

    try {
      await outputGateway.emit(result.envelope!);
      return result;
    } catch (_) {
      return CoreEmitResult.rejected(CoreEmitReason.gatewayFailure);
    }
  }
}
