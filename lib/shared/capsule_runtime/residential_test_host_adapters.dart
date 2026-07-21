import 'package:flutter/widgets.dart';

class ResidentialTestRouteNamespaceRegistry {
  ResidentialTestRouteNamespaceRegistry({required this.namespace});

  final String namespace;
  final registeredRoutes = <String>{};
  bool enabled = false;

  void register(Iterable<String> routePaths) {
    enabled = true;
    registeredRoutes
      ..clear()
      ..addAll(routePaths.map((path) => '$namespace$path'));
  }

  void disable() {
    enabled = false;
    registeredRoutes.clear();
  }
}

class ResidentialTestLocalStateNamespace {
  const ResidentialTestLocalStateNamespace({
    required this.prefix,
    required this.capsuleId,
    required this.portId,
    required this.instanceId,
    this.localSignalTtl = const Duration(hours: 24),
  });

  final String prefix;
  final String capsuleId;
  final String portId;
  final String instanceId;
  final Duration localSignalTtl;

  String key(String name) {
    return '$prefix$instanceId.$name';
  }
}

class ResidentialTestSignalRecord {
  const ResidentialTestSignalRecord({
    required this.capsuleId,
    required this.portId,
    required this.instanceId,
    required this.signalCode,
    required this.timestamp,
    required this.testOnly,
  });

  final String capsuleId;
  final String portId;
  final String instanceId;
  final String signalCode;
  final DateTime timestamp;
  final bool testOnly;
}

class ResidentialTestSignalSink {
  final records = <ResidentialTestSignalRecord>[];
  int productionWrites = 0;

  void append({
    required String capsuleId,
    required String portId,
    required String instanceId,
    required String signalCode,
    DateTime? timestamp,
  }) {
    records.add(ResidentialTestSignalRecord(
      capsuleId: capsuleId,
      portId: portId,
      instanceId: instanceId,
      signalCode: signalCode,
      timestamp: timestamp ?? DateTime.now().toUtc(),
      testOnly: true,
    ));
  }

  void flushLocalOnly() {}
}

class ResidentialTestLifecycleAdapter {
  bool initialized = false;
  bool disposed = false;

  void initialize() {
    initialized = true;
  }

  void dispose() {
    disposed = true;
  }
}

class ResidentialTestErrorAdapter {
  final errors = <Object>[];

  void report(Object error) {
    errors.add(error);
  }
}

class ResidentialTestExternalActionAdapter {
  final opened = <Uri>[];

  Future<bool> open(Uri uri) async {
    opened.add(uri);
    return false;
  }
}

class ResidentialTestSpeechAdapter {
  bool stopped = false;
  final spoken = <String>[];

  Future<void> speak(String text) async {
    spoken.add(text);
    stopped = false;
  }

  Future<void> stop() async {
    stopped = true;
  }
}

class ResidentialTestHostLocalizationAdapter {
  String resolve(String key, Locale locale) {
    if (locale.languageCode.toLowerCase() == 'ar') {
      return 'ar:$key';
    }
    return 'en:$key';
  }
}

class ResidentialTestHostAssetAdapter {
  String packageAsset(String assetPath) {
    return 'packages/mental_smile_residential_capsule/$assetPath';
  }

  String centralContractedAsset(String assetPath) {
    return assetPath;
  }
}

class ResidentialTestThemeConfigAdapter {
  const ResidentialTestThemeConfigAdapter();

  bool get productionThemeMutationAllowed => false;
}

class ResidentialTestHostAdapters {
  ResidentialTestHostAdapters({
    required this.lifecycle,
    required this.routeRegistry,
    required this.error,
    required this.externalAction,
    required this.localState,
    required this.signalSink,
    required this.speech,
    required this.localization,
    required this.assets,
    required this.themeConfig,
  });

  final ResidentialTestLifecycleAdapter lifecycle;
  final ResidentialTestRouteNamespaceRegistry routeRegistry;
  final ResidentialTestErrorAdapter error;
  final ResidentialTestExternalActionAdapter externalAction;
  final ResidentialTestLocalStateNamespace localState;
  final ResidentialTestSignalSink signalSink;
  final ResidentialTestSpeechAdapter speech;
  final ResidentialTestHostLocalizationAdapter localization;
  final ResidentialTestHostAssetAdapter assets;
  final ResidentialTestThemeConfigAdapter themeConfig;

  bool disposed = false;

  void disposeListenersAndControllers() {
    disposed = true;
    lifecycle.dispose();
    routeRegistry.disable();
  }
}
