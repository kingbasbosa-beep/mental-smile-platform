class LibraryTestRouteNamespaceRegistry {
  LibraryTestRouteNamespaceRegistry({required this.namespace});

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

class LibraryTestLifecycleAdapter {
  bool initialized = false;
  bool disposed = false;

  void initialize() => initialized = true;
  void dispose() => disposed = true;
}

class LibraryTestDataReadAdapter {
  int productionReads = 0;

  bool readPublishedProfiles() => false;
}

class LibraryTestSignalRecord {
  const LibraryTestSignalRecord({
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

class LibraryTestSignalSink {
  final records = <LibraryTestSignalRecord>[];
  int productionWrites = 0;

  void append({
    required String capsuleId,
    required String portId,
    required String instanceId,
    required String signalCode,
  }) {
    records.add(LibraryTestSignalRecord(
      capsuleId: capsuleId,
      portId: portId,
      instanceId: instanceId,
      signalCode: signalCode,
      testOnly: true,
    ));
  }

  void flushLocalOnly() {}
}

class LibraryTestLocalStateNamespace {
  const LibraryTestLocalStateNamespace({
    required this.prefix,
    required this.instanceId,
    this.localSignalTtl = const Duration(hours: 24),
  });

  final String prefix;
  final String instanceId;
  final Duration localSignalTtl;

  String key(String name) => '$prefix$instanceId.$name';
}

class LibraryTestLocalizationAdapter {
  String resolve(String key, String localeCode) => '$localeCode:$key';
}

class LibraryTestAssetAdapter {
  String packageAsset(String assetPath) {
    return 'packages/mental_smile_library_capsule/$assetPath';
  }

  String centralContractedAsset(String assetPath) => assetPath;
}

class LibraryTestExternalActionAdapter {
  final opened = <Uri>[];

  bool open(Uri uri) {
    opened.add(uri);
    return false;
  }
}

class LibraryTestSpeechAdapter {
  bool stopped = false;
  final spoken = <String>[];

  Future<void> speak(String key) async {
    spoken.add(key);
    stopped = false;
  }

  Future<void> stop() async {
    stopped = true;
  }
}

class LibraryTestContentAdapter {
  int runtimeContent = 1;
  int editorialSources = 3;
  int organizationReferences = 0;
}

class LibraryTestHostAdapters {
  LibraryTestHostAdapters({
    required this.lifecycle,
    required this.routes,
    required this.dataRead,
    required this.signals,
    required this.localState,
    required this.localization,
    required this.assets,
    required this.externalActions,
    required this.speech,
    required this.content,
  });

  final LibraryTestLifecycleAdapter lifecycle;
  final LibraryTestRouteNamespaceRegistry routes;
  final LibraryTestDataReadAdapter dataRead;
  final LibraryTestSignalSink signals;
  final LibraryTestLocalStateNamespace localState;
  final LibraryTestLocalizationAdapter localization;
  final LibraryTestAssetAdapter assets;
  final LibraryTestExternalActionAdapter externalActions;
  final LibraryTestSpeechAdapter speech;
  final LibraryTestContentAdapter content;

  bool disposed = false;

  void disposeListenersAndControllers() {
    disposed = true;
    lifecycle.dispose();
    routes.disable();
  }
}
