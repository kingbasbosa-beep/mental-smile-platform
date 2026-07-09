import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_smile_os/core/auth/account_access_service.dart';
import 'package:mental_smile_os/core/visibility/visibility_readiness.dart';
import 'package:mental_smile_os/shared/contracts/role_names.dart';

class CommercialAuthResult {
  const CommercialAuthResult({
    required this.success,
    this.message = '',
  });

  final bool success;
  final String message;
}

class CommercialAuthService {
  CommercialAuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    AccountAccessService? accessService,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _accessService =
            accessService ?? AccountAccessService(firestore: firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final AccountAccessService _accessService;

  Future<CommercialAuthResult> loginClinician({
    required String emailOrPhone,
    required String password,
  }) async {
    return _login(
      emailOrPhone: emailOrPhone,
      password: password,
      expectedRole: RoleNames.clinician,
      fallbackCollection: 'clinicians',
      successRoleLabel: 'specialist',
    );
  }

  Future<CommercialAuthResult> loginCenter({
    required String email,
    required String password,
  }) async {
    return _login(
      emailOrPhone: email,
      password: password,
      expectedRole: RoleNames.center,
      fallbackCollection: 'centers',
      successRoleLabel: 'center',
    );
  }

  Future<CommercialAuthResult> registerClinician({
    required String displayName,
    required String email,
    required String phone,
    required String password,
  }) async {
    return _register(
      collection: 'clinicians',
      role: RoleNames.clinician,
      displayName: displayName,
      email: email,
      phone: phone,
      password: password,
      extraProfileFields: {
        'name': displayName.trim(),
        'displayName': displayName.trim(),
      },
    );
  }

  Future<CommercialAuthResult> registerCenter({
    required String centerName,
    required String email,
    required String phone,
    required String password,
  }) async {
    return _register(
      collection: 'centers',
      role: RoleNames.center,
      displayName: centerName,
      email: email,
      phone: phone,
      password: password,
      extraProfileFields: {
        'name': centerName.trim(),
        'centerName': centerName.trim(),
      },
    );
  }

  Future<CommercialAuthResult> _login({
    required String emailOrPhone,
    required String password,
    required String expectedRole,
    required String fallbackCollection,
    required String successRoleLabel,
  }) async {
    final identity = emailOrPhone.trim();
    final resolvedEmail = await _resolveEmail(
      identity: identity,
      collection: fallbackCollection,
    );
    if (resolvedEmail.isEmpty) {
      return const CommercialAuthResult(
        success: false,
        message: 'Enter a valid email or registered phone number.',
      );
    }

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: resolvedEmail,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        return const CommercialAuthResult(
          success: false,
          message: 'Login failed. Please try again.',
        );
      }

      final access = await _accessService.resolve(user);
      if (access.role != expectedRole) {
        await _auth.signOut();
        return CommercialAuthResult(
          success: false,
          message: 'This account is not registered as $successRoleLabel.',
        );
      }

      if (access.isBlocked) {
        await _auth.signOut();
        return CommercialAuthResult(
          success: false,
          message: access.blockReason.isEmpty
              ? 'This account is currently blocked.'
              : access.blockReason,
        );
      }

      return const CommercialAuthResult(success: true);
    } on FirebaseAuthException catch (error) {
      return CommercialAuthResult(
        success: false,
        message: _authErrorMessage(error),
      );
    } on FirebaseException catch (error) {
      return CommercialAuthResult(
        success: false,
        message: error.message ?? 'Firebase request failed.',
      );
    } catch (_) {
      return const CommercialAuthResult(
        success: false,
        message: 'Something went wrong. Please try again.',
      );
    }
  }

  Future<CommercialAuthResult> _register({
    required String collection,
    required String role,
    required String displayName,
    required String email,
    required String phone,
    required String password,
    required Map<String, Object?> extraProfileFields,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: normalizedEmail,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        return const CommercialAuthResult(
          success: false,
          message: 'Account creation failed. Please try again.',
        );
      }

      await user.updateDisplayName(displayName.trim());
      await _firestore.collection(collection).doc(user.uid).set({
        ...extraProfileFields,
        'uid': user.uid,
        'role': role,
        'email': normalizedEmail,
        'phone': phone.trim(),
        'phoneNumber': phone.trim(),
        'isBlocked': false,
        'visibilityReadiness': VisibilityReadiness.incomplete,
        'testingMode': true,
        'source': 'real_auth_testing_activation_v1',
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      await _firestore.collection(collection).doc(user.uid).update({
        'visibilityReadiness': VisibilityReadiness.ready,
        'readinessUpdatedAt': FieldValue.serverTimestamp(),
        'readinessSource': 'real_auth_testing_activation_v1',
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return const CommercialAuthResult(success: true);
    } on FirebaseAuthException catch (error) {
      return CommercialAuthResult(
        success: false,
        message: _authErrorMessage(error),
      );
    } on FirebaseException catch (error) {
      return CommercialAuthResult(
        success: false,
        message: error.message ?? 'Firebase request failed.',
      );
    } catch (_) {
      return const CommercialAuthResult(
        success: false,
        message: 'Something went wrong. Please try again.',
      );
    }
  }

  Future<String> _resolveEmail({
    required String identity,
    required String collection,
  }) async {
    final normalizedIdentity = identity.trim().toLowerCase();
    if (normalizedIdentity.contains('@')) return normalizedIdentity;
    if (normalizedIdentity.isEmpty) return '';

    final byPhone = await _firestore
        .collection(collection)
        .where('phone', isEqualTo: identity.trim())
        .where('visibilityReadiness', isEqualTo: VisibilityReadiness.ready)
        .where('isBlocked', isEqualTo: false)
        .limit(1)
        .get();
    if (byPhone.docs.isNotEmpty) {
      return (byPhone.docs.first.data()['email'] ?? '')
          .toString()
          .trim()
          .toLowerCase();
    }

    final byPhoneNumber = await _firestore
        .collection(collection)
        .where('phoneNumber', isEqualTo: identity.trim())
        .where('visibilityReadiness', isEqualTo: VisibilityReadiness.ready)
        .where('isBlocked', isEqualTo: false)
        .limit(1)
        .get();
    if (byPhoneNumber.docs.isEmpty) return '';
    return (byPhoneNumber.docs.first.data()['email'] ?? '')
        .toString()
        .trim()
        .toLowerCase();
  }

  String _authErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'invalid-email':
        return 'Enter a valid email address.';
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'Invalid email/phone or password.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'network-request-failed':
        return 'Network connection failed.';
      default:
        return error.message ?? 'Authentication failed.';
    }
  }
}
