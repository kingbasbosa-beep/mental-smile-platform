import 'package:mental_smile_residential_capsule/src/contracts/residential_capsule_contracts.dart';

class FakeResidentialRouter {
  final visited = <String>[];

  void go(String routePath) {
    visited.add(routePath);
  }
}

class FakeResidentialLifecycle {
  bool mounted = false;
}

class FakeExternalAction implements ResidentialCapsuleExternalActionContract {
  final opened = <Uri>[];

  @override
  String get contractId => 'fake_external_action';

  @override
  String get lineCode => 'MS-LINE-EXTERNAL-ACTION-01';

  @override
  int get version => 1;

  @override
  Future<bool> openExternalUri(Uri uri) async {
    opened.add(uri);
    return true;
  }
}

class FakeLowLevelSpeechEngine implements LocalizedSpeechEngine {
  final spoken = <String>[];

  @override
  Future<void> speak(String text) async {
    spoken.add(text);
  }
}

class FakeErrorReporter {
  final errors = <Object>[];

  void report(Object error) {
    errors.add(error);
  }
}

class FakeHostLocalization
    implements ResidentialCapsuleHostLocalizationContract {
  @override
  String get contractId => 'fake_host_localization';

  @override
  String get lineCode => 'MS-LINE-LOCALIZATION-01';

  @override
  int get version => 1;

  @override
  String resolve(String key) => key;
}

class FakeAssetCatalog {
  String resolve(String path) => path;
}

class FakeSignalSink {
  final signals = <String>[];

  void append(String code) {
    signals.add(code);
  }
}
