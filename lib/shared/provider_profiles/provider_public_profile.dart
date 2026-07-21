import 'package:mental_smile_os/shared/provider_profiles/provider_profile_categories.dart';

class PublicProviderProfile {
  const PublicProviderProfile({
    required this.providerId,
    required this.profileType,
    required this.displayName,
    required this.categoryId,
    required this.categoryLabel,
    required this.librarySectionId,
    required this.status,
    this.otherSpecialties,
    this.otherServices,
    this.shortBio,
    this.imageUrl,
    this.email,
    this.phone,
    this.showEmailPublicly = false,
    this.showPhonePublicly = false,
  });

  final String providerId;
  final ProviderProfileType profileType;
  final String displayName;
  final String categoryId;
  final String categoryLabel;
  final String librarySectionId;
  final String status;
  final String? otherSpecialties;
  final String? otherServices;
  final String? shortBio;
  final String? imageUrl;
  final String? email;
  final String? phone;
  final bool showEmailPublicly;
  final bool showPhonePublicly;

  bool get isPublished => status == 'published';

  Map<String, Object?> toFirestorePublishedMinimal() {
    return <String, Object?>{
      'providerId': providerId,
      'profileType': profileType.name,
      'displayName': displayName,
      'categoryId': categoryId,
      'categoryLabel': categoryLabel,
      'librarySectionId': librarySectionId,
      'imageUrl': imageUrl?.trim() ?? '',
      if (_notBlank(otherSpecialties))
        'otherSpecialties': otherSpecialties!.trim(),
      if (_notBlank(shortBio)) 'shortBio': shortBio!.trim(),
      'showEmailPublicly': showEmailPublicly,
      'showPhonePublicly': showPhonePublicly,
      if (showEmailPublicly && _notBlank(email)) 'email': email!.trim(),
      if (showPhonePublicly && _notBlank(phone)) 'phone': phone!.trim(),
      'status': 'published',
    };
  }

  Map<String, Object?> toFirestoreCenterPublishedMinimal() {
    return <String, Object?>{
      'providerId': providerId,
      'profileType': profileType.name,
      'displayName': displayName,
      'categoryId': categoryId,
      'categoryLabel': categoryLabel,
      'librarySectionId': librarySectionId,
      'imageUrl': imageUrl?.trim() ?? '',
      if (_notBlank(otherServices)) 'otherServices': otherServices!.trim(),
      if (_notBlank(shortBio)) 'shortBio': shortBio!.trim(),
      'showEmailPublicly': showEmailPublicly,
      'showPhonePublicly': showPhonePublicly,
      if (showEmailPublicly && _notBlank(email)) 'email': email!.trim(),
      if (showPhonePublicly && _notBlank(phone)) 'phone': phone!.trim(),
      'status': 'published',
    };
  }

  static PublicProviderProfile? fromFirestore(
    Map<String, Object?> data,
  ) {
    final profileType = switch (data['profileType']) {
      'specialist' => ProviderProfileType.specialist,
      'center' => ProviderProfileType.center,
      _ => null,
    };
    if (profileType == null) return null;
    final status = _string(data['status']);
    if (status != 'published') return null;
    final providerId = _string(data['providerId']);
    final displayName = _string(data['displayName']);
    final categoryId = _string(data['categoryId']);
    final categoryLabel = _string(data['categoryLabel']);
    final librarySectionId = _string(data['librarySectionId']);
    if (providerId.isEmpty ||
        displayName.isEmpty ||
        categoryId.isEmpty ||
        categoryLabel.isEmpty ||
        librarySectionId.isEmpty) {
      return null;
    }
    return PublicProviderProfile(
      providerId: providerId,
      profileType: profileType,
      displayName: displayName,
      categoryId: categoryId,
      categoryLabel: categoryLabel,
      librarySectionId: librarySectionId,
      status: status,
      otherSpecialties: _nullableString(data['otherSpecialties']),
      otherServices: _nullableString(data['otherServices']),
      shortBio: _nullableString(data['shortBio']),
      imageUrl: _nullableString(data['imageUrl']),
      email: _nullableString(data['email']),
      phone: _nullableString(data['phone']),
      showEmailPublicly: data['showEmailPublicly'] == true,
      showPhonePublicly: data['showPhonePublicly'] == true,
    );
  }

  static List<PublicProviderProfile> visibleProfilesForSection({
    required Iterable<Map<String, Object?>> documents,
    required ProviderProfileType type,
    required String librarySectionId,
    String query = '',
  }) {
    final normalizedQuery = query.trim().toLowerCase();
    return documents
        .map(PublicProviderProfile.fromFirestore)
        .whereType<PublicProviderProfile>()
        .where((profile) =>
            profile.profileType == type &&
            profile.librarySectionId == librarySectionId)
        .where((profile) {
      if (normalizedQuery.isEmpty) return true;
      final commonMatch =
          profile.displayName.toLowerCase().contains(normalizedQuery) ||
              profile.categoryLabel.toLowerCase().contains(normalizedQuery);
      if (profile.profileType == ProviderProfileType.specialist) {
        return commonMatch ||
            (profile.otherSpecialties ?? '')
                .toLowerCase()
                .contains(normalizedQuery) ||
            (profile.shortBio ?? '').toLowerCase().contains(normalizedQuery);
      }
      return commonMatch ||
          (profile.otherServices ?? '')
              .toLowerCase()
              .contains(normalizedQuery) ||
          (profile.shortBio ?? '').toLowerCase().contains(normalizedQuery);
    }).toList(growable: false);
  }

  static bool _notBlank(String? value) =>
      value != null && value.trim().isNotEmpty;

  static String _string(Object? value) => value?.toString().trim() ?? '';

  static String? _nullableString(Object? value) {
    final text = _string(value);
    return text.isEmpty ? null : text;
  }
}

class ProviderPublicProfileProjection {
  const ProviderPublicProfileProjection._();

  static PublicProviderProfile specialistPublishedMinimal({
    required String providerId,
    required Map<String, Object?> profile,
  }) {
    final categoryId = _string(profile['specialty']);
    final category = ProviderProfileCategoryRegistry.specialistById(categoryId);
    final categoryLabel = category?.label ?? _string(profile['specialtyLabel']);
    return PublicProviderProfile(
      providerId: providerId,
      profileType: ProviderProfileType.specialist,
      displayName: _string(profile['fullName']),
      categoryId: category?.id ?? categoryId,
      categoryLabel: categoryLabel,
      librarySectionId: category?.librarySectionId ?? 'unknown_specialist',
      status: 'published',
      otherSpecialties: _nullableString(profile['otherSpecialties']),
      shortBio: _nullableString(profile['shortBio']),
      imageUrl: _nullableString(profile['profileImageUrl']),
      email: _nullableString(profile['email']),
      phone: _nullableString(profile['phone']),
      showEmailPublicly: profile['showEmailPublicly'] == true,
      showPhonePublicly: profile['showPhonePublicly'] == true,
    );
  }

  static PublicProviderProfile centerPublishedMinimal({
    required String providerId,
    required Map<String, Object?> profile,
  }) {
    final categoryId = _string(profile['category']);
    final category = ProviderProfileCategoryRegistry.centerById(categoryId);
    final categoryLabel = category?.label ?? _string(profile['categoryLabel']);
    return PublicProviderProfile(
      providerId: providerId,
      profileType: ProviderProfileType.center,
      displayName: _string(profile['centerName']),
      categoryId: category?.id ?? categoryId,
      categoryLabel: categoryLabel,
      librarySectionId: category?.librarySectionId ?? 'unknown_center',
      status: 'published',
      otherServices: _nullableString(profile['otherServices']),
      shortBio: _nullableString(profile['shortBio']),
      imageUrl: _nullableString(profile['identityImageUrl']),
      email: _nullableString(profile['email']),
      phone: _nullableString(profile['phone']),
      showEmailPublicly: profile['showEmailPublicly'] == true,
      showPhonePublicly: profile['showPhonePublicly'] == true,
    );
  }

  static String _string(Object? value) => value?.toString().trim() ?? '';

  static String? _nullableString(Object? value) {
    final text = _string(value);
    return text.isEmpty ? null : text;
  }
}
