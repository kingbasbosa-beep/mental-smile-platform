import 'package:mental_smile_platform_capsule/mental_smile_platform_capsule.dart';

void main() {
  final port = PlatformCapsuleTestPort();
  final compatibility = port.validatePlatformCapsule();
  final mount = port.mountTest();
  final diagnostics = port.diagnosticSnapshot();

  print('Platform Capsule Example');
  print('Register: ${PlatformCapsuleDefaults.registrySnapshot.entries.length}');
  print('Validate: ${compatibility.compatible}');
  print('Mount Test: ${mount.mounted}');
  print('Diagnostic Snapshot: ${diagnostics.capsuleCount} capsules');
}
