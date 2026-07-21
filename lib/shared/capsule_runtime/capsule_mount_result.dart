import 'capsule_compatibility_report.dart';
import 'capsule_mode.dart';

class CapsuleMountResult {
  const CapsuleMountResult({
    required this.mounted,
    required this.mountState,
    required this.report,
  });

  final bool mounted;
  final CapsuleMountState mountState;
  final CapsuleCompatibilityReport report;
}
