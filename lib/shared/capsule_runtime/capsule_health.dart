import 'capsule_mode.dart';

class CapsuleHealth {
  const CapsuleHealth({
    required this.mode,
    required this.mountState,
    required this.compatible,
    this.message = '',
  });

  final CapsuleMode mode;
  final CapsuleMountState mountState;
  final bool compatible;
  final String message;

  static const unmounted = CapsuleHealth(
    mode: CapsuleMode.unmounted,
    mountState: CapsuleMountState.unmounted,
    compatible: false,
  );
}
