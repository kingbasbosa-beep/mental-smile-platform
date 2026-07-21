import 'package:flutter/material.dart';
import 'package:mental_smile_residential_capsule/mental_smile_residential_capsule.dart'
    as res;

import 'capsule_compatibility_gate.dart';
import 'capsule_compatibility_report.dart';
import 'capsule_mode.dart';
import 'capsule_mount_result.dart';
import 'capsule_port.dart';
import 'capsule_port_registry.dart';
import 'residential_test_host_adapters.dart';

class ResidentialCapsuleTestMountController {
  ResidentialCapsuleTestMountController({
    CapsulePort? port,
    res.ResidentialCapsuleDescriptor? descriptor,
    CapsuleCompatibilityGate? gate,
    ResidentialTestHostAdapters? adapters,
  })  : port = port ?? CapsulePortRegistry.residentialTestPort,
        descriptor =
            descriptor ?? res.ResidentialCapsuleDescriptorProvider.descriptor,
        gate = gate ?? const CapsuleCompatibilityGate(),
        adapters = adapters ?? _createDefaultAdapters();

  final CapsulePort port;
  final res.ResidentialCapsuleDescriptor descriptor;
  final CapsuleCompatibilityGate gate;
  final ResidentialTestHostAdapters adapters;

  CapsuleMountState state = CapsuleMountState.unmounted;
  CapsuleCompatibilityReport? lastReport;

  Future<CapsuleMountResult> mount() async {
    state = CapsuleMountState.validating;
    final report = gate.validate(port: port, descriptor: descriptor);
    lastReport = report;

    if (!report.compatible) {
      state = CapsuleMountState.incompatible;
      return CapsuleMountResult(
        mounted: false,
        mountState: state,
        report: report,
      );
    }

    state = CapsuleMountState.ready;
    state = CapsuleMountState.mounting;
    adapters.lifecycle.initialize();
    adapters.routeRegistry.register(
      res.ResidentialCapsuleRoutes.descriptors.map((route) => route.routePath),
    );
    state = CapsuleMountState.mountedTest;

    return CapsuleMountResult(
      mounted: true,
      mountState: state,
      report: report,
    );
  }

  Future<void> unmount({
    bool deleteTestLocalState = false,
  }) async {
    state = CapsuleMountState.unmounting;
    await adapters.speech.stop();
    adapters.disposeListenersAndControllers();
    adapters.signalSink.flushLocalOnly();
    state = CapsuleMountState.unmounted;
  }

  static ResidentialTestHostAdapters _createDefaultAdapters() {
    return ResidentialTestHostAdapters(
      lifecycle: ResidentialTestLifecycleAdapter(),
      routeRegistry: ResidentialTestRouteNamespaceRegistry(
        namespace: CapsulePortRegistry.residentialTestRoute,
      ),
      error: ResidentialTestErrorAdapter(),
      externalAction: ResidentialTestExternalActionAdapter(),
      localState: const ResidentialTestLocalStateNamespace(
        prefix: CapsulePortRegistry.residentialTestLocalStatePrefix,
        capsuleId: res.ResidentialCapsuleIdentity.capsuleId,
        portId: CapsulePortRegistry.residentialTestPortId,
        instanceId: CapsulePortRegistry.residentialTestInstanceId,
      ),
      signalSink: ResidentialTestSignalSink(),
      speech: ResidentialTestSpeechAdapter(),
      localization: ResidentialTestHostLocalizationAdapter(),
      assets: ResidentialTestHostAssetAdapter(),
      themeConfig: const ResidentialTestThemeConfigAdapter(),
    );
  }
}

class ResidentialCapsuleTestRoute extends StatefulWidget {
  const ResidentialCapsuleTestRoute({
    super.key,
    this.controller,
  });

  final ResidentialCapsuleTestMountController? controller;

  @override
  State<ResidentialCapsuleTestRoute> createState() =>
      _ResidentialCapsuleTestRouteState();
}

class _ResidentialCapsuleTestRouteState
    extends State<ResidentialCapsuleTestRoute> {
  late final ResidentialCapsuleTestMountController _controller =
      widget.controller ?? ResidentialCapsuleTestMountController();
  late final Future<CapsuleMountResult> _mount = _controller.mount();

  @override
  void dispose() {
    _controller.unmount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CapsuleMountResult>(
      future: _mount,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final result = snapshot.data!;
        if (!result.mounted) {
          return _ResidentialCapsuleBlocked(report: result.report);
        }

        return const Column(
          children: [
            _ResidentialCapsuleTestMarker(),
            Expanded(child: res.ResidentialCapsuleEntry()),
          ],
        );
      },
    );
  }
}

class _ResidentialCapsuleBlocked extends StatelessWidget {
  const _ResidentialCapsuleBlocked({required this.report});

  final CapsuleCompatibilityReport report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Residential capsule test port blocked: '
            '${report.failureCodes.join(', ')}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _ResidentialCapsuleTestMarker extends StatelessWidget {
  const _ResidentialCapsuleTestMarker();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF101820),
      child: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text(
            'RESIDENTIAL CAPSULE - TEST',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFD47A),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}
