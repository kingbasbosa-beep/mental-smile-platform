import 'dart:typed_data';

class ProviderImageUpload {
  const ProviderImageUpload({
    required this.bytes,
    required this.contentType,
    required this.storagePath,
  });

  final Uint8List bytes;
  final String contentType;
  final String storagePath;
}

class ProviderImageValidation {
  const ProviderImageValidation._();

  static const int maxOfficialImageBytes = 5 * 1024 * 1024;
  static const Set<String> allowedImageMimeTypes = {
    'image/jpeg',
    'image/png',
    'image/webp',
  };

  static bool isValidImage({
    required int sizeBytes,
    required String contentType,
  }) {
    return sizeBytes > 0 &&
        sizeBytes <= maxOfficialImageBytes &&
        allowedImageMimeTypes.contains(contentType);
  }

  static String inferContentType(String? mimeType, String fileName) {
    if (mimeType != null && allowedImageMimeTypes.contains(mimeType)) {
      return mimeType;
    }
    final lowerName = fileName.toLowerCase();
    if (lowerName.endsWith('.png')) return 'image/png';
    if (lowerName.endsWith('.webp')) return 'image/webp';
    return 'image/jpeg';
  }
}

class ProviderProfileStoragePaths {
  const ProviderProfileStoragePaths._();

  static String specialistOfficialImage(String uid) {
    return 'clinicians/$uid/official/profile_image';
  }

  static String centerIdentityImage(String uid) {
    return 'centers/$uid/official/identity_image';
  }

  static bool isOwnerScopedSpecialistPath({
    required String uid,
    required String path,
  }) {
    return path == specialistOfficialImage(uid);
  }

  static bool isOwnerScopedCenterPath({
    required String uid,
    required String path,
  }) {
    return path == centerIdentityImage(uid);
  }
}
