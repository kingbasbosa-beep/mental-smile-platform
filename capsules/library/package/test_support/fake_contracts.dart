// ignore_for_file: avoid_relative_lib_imports

import '../lib/mental_smile_library_capsule.dart';

class FakeLibraryDataReadContract implements LibraryDataReadContract {
  int productionReads = 0;

  @override
  String get contractId => 'fake_library_data_read';

  @override
  String get direction => 'central_to_capsule';

  @override
  Set<String> get failureCodes => const {'PRODUCTION_READ_BLOCKED'};

  @override
  String get lineCode => LibraryCapsuleCanonicalLine.dataRead;

  @override
  int get version => 1;

  @override
  Future<LibraryContractResponse> read(LibraryContractRequest request) async {
    return const LibraryContractResponse(
      accepted: false,
      code: 'PRODUCTION_READ_BLOCKED',
    );
  }
}
