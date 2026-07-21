class CommercialTestRouteNamespaceRegistry {
  CommercialTestRouteNamespaceRegistry({required this.namespace});

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

class CommercialTestLifecycleAdapter {
  bool initialized = false;
  bool disposed = false;

  void initialize() {
    initialized = true;
  }

  void dispose() {
    disposed = true;
  }
}

class CommercialTestAuthAdapter {
  int productionMutations = 0;

  bool createAccount() => false;
  bool signIn() => false;
}

class CommercialTestDataAdapter {
  int productionWrites = 0;

  bool write() => false;
  Map<String, Object?> read() => const <String, Object?>{};
}

class CommercialTestStorageAdapter {
  int productionUploads = 0;
  final uploads = <String>[];

  bool upload(String path) {
    uploads.add(path);
    return false;
  }

  void discardTestUploads() {
    uploads.clear();
  }
}

class CommercialTestSignalRecord {
  const CommercialTestSignalRecord({
    required this.capsuleId,
    required this.portId,
    required this.instanceId,
    required this.signalCode,
    required this.testOnly,
  });

  final String capsuleId;
  final String portId;
  final String instanceId;
  final String signalCode;
  final bool testOnly;
}

class CommercialTestSignalSink {
  final records = <CommercialTestSignalRecord>[];
  int productionWrites = 0;

  void append({
    required String capsuleId,
    required String portId,
    required String instanceId,
    required String signalCode,
  }) {
    records.add(CommercialTestSignalRecord(
      capsuleId: capsuleId,
      portId: portId,
      instanceId: instanceId,
      signalCode: signalCode,
      testOnly: true,
    ));
  }

  void flushLocalOnly() {}
}

class CommercialTestLocalStateNamespace {
  const CommercialTestLocalStateNamespace({
    required this.prefix,
    required this.instanceId,
    this.localSignalTtl = const Duration(hours: 24),
  });

  final String prefix;
  final String instanceId;
  final Duration localSignalTtl;

  String key(String name) => '$prefix$instanceId.$name';
}

class CommercialTestLocalizationAdapter {
  String resolve(String key, String localeCode) => '$localeCode:$key';
}

class CommercialTestAssetAdapter {
  String packageAsset(String assetPath) {
    return 'packages/mental_smile_commercial_capsule/$assetPath';
  }

  String centralContractedAsset(String assetPath) => assetPath;
}

class CommercialTestExternalActionAdapter {
  final opened = <Uri>[];

  bool open(Uri uri) {
    opened.add(uri);
    return false;
  }
}

class CommercialTestErrorAdapter {
  final errors = <Object>[];

  void report(Object error) {
    errors.add(error);
  }
}

class CommercialTestSpeechAdapter {
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

class CommercialTestProviderProfileAdapter {
  int duplicateTypes = 0;
}

class CommercialTestHostAdapters {
  CommercialTestHostAdapters({
    required this.lifecycle,
    required this.routes,
    required this.auth,
    required this.data,
    required this.storage,
    required this.signals,
    required this.localState,
    required this.localization,
    required this.assets,
    required this.externalActions,
    required this.errors,
    required this.speech,
    required this.providerProfiles,
  });

  final CommercialTestLifecycleAdapter lifecycle;
  final CommercialTestRouteNamespaceRegistry routes;
  final CommercialTestAuthAdapter auth;
  final CommercialTestDataAdapter data;
  final CommercialTestStorageAdapter storage;
  final CommercialTestSignalSink signals;
  final CommercialTestLocalStateNamespace localState;
  final CommercialTestLocalizationAdapter localization;
  final CommercialTestAssetAdapter assets;
  final CommercialTestExternalActionAdapter externalActions;
  final CommercialTestErrorAdapter errors;
  final CommercialTestSpeechAdapter speech;
  final CommercialTestProviderProfileAdapter providerProfiles;

  bool disposed = false;

  void disposeListenersAndControllers() {
    disposed = true;
    lifecycle.dispose();
    routes.disable();
  }
}
