class CommercialCapsuleCanonicalLine {
  const CommercialCapsuleCanonicalLine._();

  static const lifecycle = 'MS-LINE-LIFECYCLE-01';
  static const route = 'MS-LINE-ROUTE-01';
  static const auth = 'MS-LINE-AUTH-01';
  static const dataRead = 'MS-LINE-DATA-READ-01';
  static const dataWrite = 'MS-LINE-DATA-WRITE-01';
  static const storage = 'MS-LINE-STORAGE-01';
  static const signal = 'MS-LINE-SIGNAL-01';
  static const localization = 'MS-LINE-LOCALIZATION-01';
  static const asset = 'MS-LINE-ASSET-01';
  static const externalAction = 'MS-LINE-EXTERNAL-ACTION-01';
  static const error = 'MS-LINE-ERROR-01';

  static const used = <String>[
    lifecycle,
    route,
    auth,
    dataRead,
    dataWrite,
    storage,
    signal,
    localization,
    asset,
    externalAction,
    error,
  ];
}

class CommercialCapsuleReservedExtensionLine {
  const CommercialCapsuleReservedExtensionLine._();

  static const extension01 = 'MS-LINE-EXT-01';
  static const extension02 = 'MS-LINE-EXT-02';
  static const extension03 = 'MS-LINE-EXT-03';

  static const reserved = <String>[extension01, extension02, extension03];
}

class CommercialContractRequest {
  const CommercialContractRequest({
    required this.operation,
    this.payload = const <String, Object?>{},
  });

  final String operation;
  final Map<String, Object?> payload;
}

class CommercialContractResponse {
  const CommercialContractResponse({
    required this.accepted,
    required this.code,
    this.payload = const <String, Object?>{},
  });

  final bool accepted;
  final String code;
  final Map<String, Object?> payload;
}

abstract class CommercialCapsuleLineContract {
  String get contractId;
  String get lineCode;
  int get version;
  String get direction;
  Set<String> get failureCodes;
}

abstract class CommercialAuthContract extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> currentSession();
  Future<CommercialContractResponse> signIn(CommercialContractRequest request);
  Future<CommercialContractResponse> createAccount(
    CommercialContractRequest request,
  );
  Future<CommercialContractResponse> signOut();
}

abstract class CommercialDataReadContract
    extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> read(CommercialContractRequest request);
}

abstract class CommercialDataWriteContract
    extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> write(CommercialContractRequest request);
}

abstract class CommercialStorageContract extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> upload(CommercialContractRequest request);
  Future<CommercialContractResponse> delete(CommercialContractRequest request);
}

abstract class CommercialSignalContract extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> emit(CommercialContractRequest request);
}

abstract class CommercialLocalizationContract
    extends CommercialCapsuleLineContract {
  String resolve(String key, String localeCode);
}

abstract class CommercialAssetContract extends CommercialCapsuleLineContract {
  String resolvePackageAsset(String assetPath);
  String resolveCentralAsset(String assetPath);
}

abstract class CommercialExternalActionContract
    extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> open(CommercialContractRequest request);
}

abstract class CommercialErrorContract extends CommercialCapsuleLineContract {
  void report(Object error, StackTrace? stackTrace);
}

abstract class CommercialSpeechContract extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> speak(CommercialContractRequest request);
  Future<void> stop();
}

abstract class CommercialProviderProfileHostContract
    extends CommercialCapsuleLineContract {
  Future<CommercialContractResponse> readProfile(
    CommercialContractRequest request,
  );
}
