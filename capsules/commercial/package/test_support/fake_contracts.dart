// ignore_for_file: avoid_relative_lib_imports

import '../lib/mental_smile_commercial_capsule.dart';

class FakeCommercialAuthContract implements CommercialAuthContract {
  bool mutationBlocked = true;

  @override
  String get contractId => 'fake_commercial_auth';

  @override
  String get direction => 'central_to_capsule';

  @override
  Set<String> get failureCodes => const {'AUTH_MUTATION_BLOCKED'};

  @override
  String get lineCode => CommercialCapsuleCanonicalLine.auth;

  @override
  int get version => 1;

  @override
  Future<CommercialContractResponse> createAccount(
    CommercialContractRequest request,
  ) async {
    return const CommercialContractResponse(
      accepted: false,
      code: 'AUTH_MUTATION_BLOCKED',
    );
  }

  @override
  Future<CommercialContractResponse> currentSession() async {
    return const CommercialContractResponse(accepted: true, code: 'TEST_ONLY');
  }

  @override
  Future<CommercialContractResponse> signIn(
    CommercialContractRequest request,
  ) async {
    return const CommercialContractResponse(
      accepted: false,
      code: 'AUTH_MUTATION_BLOCKED',
    );
  }

  @override
  Future<CommercialContractResponse> signOut() async {
    return const CommercialContractResponse(accepted: true, code: 'TEST_ONLY');
  }
}
