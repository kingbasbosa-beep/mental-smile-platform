import 'package:flutter/material.dart';
import 'package:mental_smile_platform_capsule/mental_smile_platform_capsule.dart';

void main() {
  runApp(const PlatformCapsuleExampleApp());
}

class PlatformCapsuleExampleApp extends StatelessWidget {
  const PlatformCapsuleExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Platform Capsule',
      home: PlatformCapsuleExampleHome(port: PlatformCapsuleTestPort()),
    );
  }
}

class PlatformCapsuleExampleHome extends StatelessWidget {
  const PlatformCapsuleExampleHome({super.key, required this.port});

  final PlatformCapsuleTestPort port;

  @override
  Widget build(BuildContext context) {
    final compatibility = port.validatePlatformCapsule();
    final mount = port.mountTest();
    final diagnostics = port.diagnosticSnapshot();

    return Scaffold(
      appBar: AppBar(title: const Text('Platform Capsule')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _SnapshotRow(
            label: 'Platform Capsule identity',
            value: PlatformCapsuleDefaults.platformIdentity.capsuleId,
          ),
          _SnapshotRow(
            label: 'Registered capsule count',
            value: '${PlatformCapsuleDefaults.registrySnapshot.entries.length}',
          ),
          _SnapshotRow(
            label: 'Platform test port',
            value: PlatformCapsuleDefaults.testPort.portId,
          ),
          _SnapshotRow(
            label: 'Compatibility result',
            value: compatibility.compatible ? 'compatible' : 'incompatible',
          ),
          _SnapshotRow(
            label: 'Mount decision',
            value: mount.mounted ? 'mounted test' : 'blocked',
          ),
          _SnapshotRow(
            label: 'Diagnostic summary',
            value:
                '${diagnostics.capsuleCount} capsules, '
                '${diagnostics.portCount} port, '
                '${diagnostics.canonicalLineCount} lines',
          ),
        ],
      ),
    );
  }
}

class _SnapshotRow extends StatelessWidget {
  const _SnapshotRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 2),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
