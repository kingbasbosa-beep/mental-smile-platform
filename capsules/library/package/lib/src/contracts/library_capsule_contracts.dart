class LibraryCapsuleCanonicalLine {
  const LibraryCapsuleCanonicalLine._();

  static const lifecycle = 'MS-LINE-LIFECYCLE-01';
  static const route = 'MS-LINE-ROUTE-01';
  static const dataRead = 'MS-LINE-DATA-READ-01';
  static const signal = 'MS-LINE-SIGNAL-01';
  static const localization = 'MS-LINE-LOCALIZATION-01';
  static const asset = 'MS-LINE-ASSET-01';
  static const externalAction = 'MS-LINE-EXTERNAL-ACTION-01';
  static const error = 'MS-LINE-ERROR-01';

  static const used = <String>[
    lifecycle,
    route,
    dataRead,
    signal,
    localization,
    asset,
    externalAction,
    error,
  ];
}

class LibraryCapsuleReservedExtensionLine {
  const LibraryCapsuleReservedExtensionLine._();

  static const extension01 = 'MS-LINE-EXT-01';
  static const extension02 = 'MS-LINE-EXT-02';
  static const extension03 = 'MS-LINE-EXT-03';

  static const reserved = <String>[extension01, extension02, extension03];
}

class LibraryContractRequest {
  const LibraryContractRequest({
    required this.operation,
    this.payload = const <String, Object?>{},
  });

  final String operation;
  final Map<String, Object?> payload;
}

class LibraryContractResponse {
  const LibraryContractResponse({
    required this.accepted,
    required this.code,
    this.payload = const <String, Object?>{},
  });

  final bool accepted;
  final String code;
  final Map<String, Object?> payload;
}

abstract class LibraryCapsuleLineContract {
  String get contractId;
  String get lineCode;
  int get version;
  String get direction;
  Set<String> get failureCodes;
}

abstract class LibraryRouteContract extends LibraryCapsuleLineContract {
  LibraryContractResponse openRoute(LibraryContractRequest request);
}

abstract class LibraryDataReadContract extends LibraryCapsuleLineContract {
  Future<LibraryContractResponse> read(LibraryContractRequest request);
}

abstract class LibrarySignalContract extends LibraryCapsuleLineContract {
  Future<LibraryContractResponse> emit(LibraryContractRequest request);
}

abstract class LibraryLocalizationContract extends LibraryCapsuleLineContract {
  String resolve(String key, String localeCode);
}

abstract class LibraryAssetContract extends LibraryCapsuleLineContract {
  String resolvePackageAsset(String assetPath);
  String resolveCentralAsset(String assetPath);
}

abstract class LibraryExternalActionContract
    extends LibraryCapsuleLineContract {
  Future<LibraryContractResponse> open(LibraryContractRequest request);
}

abstract class LibrarySpeechContract extends LibraryCapsuleLineContract {
  Future<LibraryContractResponse> speak(LibraryContractRequest request);
  Future<void> stop();
}

abstract class LibraryContentContract extends LibraryCapsuleLineContract {
  Future<LibraryContractResponse> loadContent(LibraryContractRequest request);
}
