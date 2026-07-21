import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../domain/provider_profile_storage.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_public_profile.dart';

class ProviderProfileRepository {
  ProviderProfileRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  Future<Map<String, Object?>?> loadSpecialistProfile(String uid) {
    return _loadProfile('clinicians', uid);
  }

  Future<Map<String, Object?>?> loadCenterProfile(String uid) {
    return _loadProfile('centers', uid);
  }

  Future<String> uploadSpecialistOfficialImage({
    required String uid,
    required Uint8List bytes,
    required String contentType,
  }) {
    return _uploadOfficialImage(
      path: ProviderProfileStoragePaths.specialistOfficialImage(uid),
      bytes: bytes,
      contentType: contentType,
    );
  }

  Future<String> uploadCenterIdentityImage({
    required String uid,
    required Uint8List bytes,
    required String contentType,
  }) {
    return _uploadOfficialImage(
      path: ProviderProfileStoragePaths.centerIdentityImage(uid),
      bytes: bytes,
      contentType: contentType,
    );
  }

  Future<void> saveSpecialistProfile({
    required String uid,
    required Map<String, Object?> profile,
  }) async {
    final doc = _firestore
        .collection('clinicians')
        .doc(uid)
        .collection('profile')
        .doc('current');
    final snapshot = await doc.get();
    final profileImageUrl = _string(profile['profileImageUrl']);
    final minimalProfile = <String, Object?>{
      'fullName': _string(profile['fullName']),
      'specialty': _string(profile['specialty']),
      'specialtyLabel': _string(profile['specialtyLabel']),
      'otherSpecialties': _limited(profile['otherSpecialties'], 160),
      'shortBio': _limited(profile['shortBio'], 300),
      'email': _string(profile['email']),
      'phone': _string(profile['phone']),
      'showEmailPublicly': profile['showEmailPublicly'] == true,
      'showPhonePublicly': profile['showPhonePublicly'] == true,
      'profileImageUrl': profileImageUrl,
    };
    await doc.set({
      ...minimalProfile,
      'ownerUid': uid,
      'profileType': 'specialist',
      'status': 'published',
      'createdAt': snapshot.exists
          ? (snapshot.data()?['createdAt'] ?? FieldValue.serverTimestamp())
          : FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'source': 'specialist_professional_profile_clean_layout_v1',
    });
    await _firestore.collection('public_specialist_profiles').doc(uid).set({
      ...ProviderPublicProfileProjection.specialistPublishedMinimal(
        providerId: uid,
        profile: minimalProfile,
      ).toFirestorePublishedMinimal(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> saveCenterProfile({
    required String uid,
    required Map<String, Object?> profile,
  }) async {
    final doc = _firestore
        .collection('centers')
        .doc(uid)
        .collection('profile')
        .doc('current');
    final snapshot = await doc.get();
    final identityImageUrl = _string(profile['identityImageUrl']);
    final minimalProfile = <String, Object?>{
      'centerName': _string(profile['centerName']),
      'category': _string(profile['category']),
      'categoryLabel': _string(profile['categoryLabel']),
      'otherServices': _limited(profile['otherServices'], 160),
      'shortBio': _limited(profile['shortBio'], 300),
      'email': _string(profile['email']),
      'phone': _string(profile['phone']),
      'showEmailPublicly': profile['showEmailPublicly'] == true,
      'showPhonePublicly': profile['showPhonePublicly'] == true,
      'identityImageUrl': identityImageUrl,
    };
    await doc.set({
      ...minimalProfile,
      'ownerUid': uid,
      'profileType': 'center',
      'status': 'published',
      'createdAt': snapshot.exists
          ? (snapshot.data()?['createdAt'] ?? FieldValue.serverTimestamp())
          : FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'source': 'center_professional_profile_clean_layout_v1',
    });
    await _firestore.collection('public_center_profiles').doc(uid).set({
      ...ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: uid,
        profile: minimalProfile,
      ).toFirestoreCenterPublishedMinimal(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<Map<String, Object?>?> _loadProfile(
    String collection,
    String uid,
  ) async {
    final snapshot = await _firestore
        .collection(collection)
        .doc(uid)
        .collection('profile')
        .doc('current')
        .get();
    return snapshot.data();
  }

  Future<String> _uploadOfficialImage({
    required String path,
    required Uint8List bytes,
    required String contentType,
  }) async {
    if (!ProviderImageValidation.isValidImage(
      sizeBytes: bytes.length,
      contentType: contentType,
    )) {
      throw ArgumentError.value(
          contentType, 'contentType', 'Invalid image upload');
    }
    final ref = _storage.ref(path);
    await ref.putData(
      bytes,
      SettableMetadata(
        contentType: contentType,
        cacheControl: 'public,max-age=3600',
      ),
    );
    return ref.getDownloadURL();
  }

  String _string(Object? value) => value?.toString().trim() ?? '';

  String _limited(Object? value, int maxLength) {
    final text = _string(value);
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength);
  }
}
