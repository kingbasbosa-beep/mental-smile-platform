import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/features/commercial/domain/provider_profile_storage.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_profile_categories.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_public_profile.dart';

void main() {
  group('Provider profile category registry', () {
    test('specialist form keys exist in the shared category registry', () {
      for (final key in <String>[
        'psychologist',
        'social_worker',
        'clinical',
        'family_counseling',
        'addiction_behavior',
        'coaching',
        'support_supervisor',
        'behavior_autism',
        'speech',
        'addiction_recovery',
      ]) {
        expect(
          ProviderProfileCategoryRegistry.isSpecialistCategory(key),
          isTrue,
          reason: key,
        );
      }
    });

    test('center form keys exist in the shared category registry', () {
      for (final key in <String>[
        'addiction_treatment',
        'mental_health',
        'rehabilitation',
        'consulting',
        'clinic',
        'community_center',
      ]) {
        expect(
          ProviderProfileCategoryRegistry.isCenterCategory(key),
          isTrue,
          reason: key,
        );
      }
    });

    test('labels are not used as identifiers', () {
      final category =
          ProviderProfileCategoryRegistry.specialistById('psychologist')!;

      expect(category.id, 'psychologist');
      expect(category.librarySectionId, 'specialist_psychologists');
      expect(category.label, isNot(category.id));
      expect(category.libraryLabel, isNot(category.librarySectionId));
    });
  });

  group('Provider public projection', () {
    test('specialist projection publishes optional public details safely', () {
      final projection =
          ProviderPublicProfileProjection.specialistPublishedMinimal(
        providerId: 'provider-1',
        profile: const {
          'fullName': 'Dr Profile',
          'specialty': 'psychologist',
          'specialtyLabel': 'Psychologist',
          'phone': '01000000000',
          'email': 'private@example.test',
          'showEmailPublicly': true,
          'showPhonePublicly': false,
          'otherSpecialties': 'Trauma support',
          'shortBio': 'Public-facing short bio',
          'profileImageUrl': 'https://example.test/profile.png',
        },
      );
      final publicData = projection.toFirestorePublishedMinimal();

      expect(projection.categoryId, 'psychologist');
      expect(projection.librarySectionId, 'specialist_psychologists');
      expect(projection.status, 'published');
      expect(publicData, {
        'providerId': 'provider-1',
        'profileType': 'specialist',
        'displayName': 'Dr Profile',
        'categoryId': 'psychologist',
        'categoryLabel':
            ProviderProfileCategoryRegistry.specialistById('psychologist')!
                .label,
        'librarySectionId': 'specialist_psychologists',
        'otherSpecialties': 'Trauma support',
        'shortBio': 'Public-facing short bio',
        'imageUrl': 'https://example.test/profile.png',
        'showEmailPublicly': true,
        'showPhonePublicly': false,
        'email': 'private@example.test',
        'status': 'published',
      });
      expect(publicData.keys, isNot(contains('phone')));
      expect(publicData.keys, isNot(contains('freeSpecialization')));
      expect(publicData.keys, isNot(contains('description')));
      expect(publicData.keys, isNot(contains('serviceNote')));
    });

    test('hidden specialist contact is omitted from public projection', () {
      final projection =
          ProviderPublicProfileProjection.specialistPublishedMinimal(
        providerId: 'provider-1',
        profile: const {
          'fullName': 'Dr Profile',
          'specialty': 'psychologist',
          'specialtyLabel': 'Psychologist',
          'phone': '01000000000',
          'email': 'private@example.test',
          'showEmailPublicly': false,
          'showPhonePublicly': false,
          'profileImageUrl': 'https://example.test/profile.png',
        },
      );

      final publicData = projection.toFirestorePublishedMinimal();

      expect(publicData['showEmailPublicly'], isFalse);
      expect(publicData['showPhonePublicly'], isFalse);
      expect(publicData.keys, isNot(contains('email')));
      expect(publicData.keys, isNot(contains('phone')));
    });

    test('center other services does not change category', () {
      final projection = ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: 'center-1',
        profile: const {
          'centerName': 'Hope Center',
          'category': 'rehabilitation',
          'categoryLabel': 'Rehabilitation',
          'otherServices': 'Weekend family orientation',
          'shortBio': 'Short public center bio',
          'email': 'center@example.test',
          'phone': '01000000000',
          'showEmailPublicly': false,
          'showPhonePublicly': true,
          'identityImageUrl': 'https://example.test/center.webp',
        },
      );
      final publicData = projection.toFirestoreCenterPublishedMinimal();

      expect(projection.categoryId, 'rehabilitation');
      expect(projection.librarySectionId, 'center_rehabilitation_recovery');
      expect(projection.otherServices, 'Weekend family orientation');
      expect(projection.shortBio, 'Short public center bio');
      expect(projection.imageUrl, 'https://example.test/center.webp');
      expect(publicData['status'], 'published');
      expect(publicData['otherServices'], 'Weekend family orientation');
      expect(publicData['shortBio'], 'Short public center bio');
      expect(publicData['showEmailPublicly'], isFalse);
      expect(publicData['showPhonePublicly'], isTrue);
      expect(publicData.keys, isNot(contains('email')));
      expect(publicData['phone'], '01000000000');
    });

    test('unknown category is handled safely', () {
      final specialist =
          ProviderPublicProfileProjection.specialistPublishedMinimal(
        providerId: 'provider-1',
        profile: const {
          'fullName': 'Unknown Specialist',
          'specialty': 'new_future_specialty',
          'specialtyLabel': 'Future specialty',
        },
      );
      final center = ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: 'center-1',
        profile: const {
          'centerName': 'Unknown Center',
          'category': 'new_future_center',
          'categoryLabel': 'Future center',
        },
      );

      expect(specialist.librarySectionId, 'unknown_specialist');
      expect(center.librarySectionId, 'unknown_center');
    });

    test('published specialist appears in matching Library section', () {
      final documents = [
        const {
          'providerId': 'provider-1',
          'profileType': 'specialist',
          'displayName': 'Dr Profile',
          'categoryId': 'psychologist',
          'categoryLabel': 'Psychologist',
          'librarySectionId': 'specialist_psychologists',
          'status': 'published',
          'imageUrl': 'https://example.test/profile.png',
        },
        const {
          'providerId': 'provider-2',
          'profileType': 'specialist',
          'displayName': 'Other Profile',
          'categoryId': 'clinical',
          'categoryLabel': 'Clinical',
          'librarySectionId': 'specialist_clinical',
          'status': 'published',
        },
      ];

      final visible = PublicProviderProfile.visibleProfilesForSection(
        documents: documents,
        type: ProviderProfileType.specialist,
        librarySectionId: 'specialist_psychologists',
      );

      expect(visible, hasLength(1));
      expect(visible.single.displayName, 'Dr Profile');
      expect(visible.single.categoryLabel, 'Psychologist');
      expect(visible.single.imageUrl, 'https://example.test/profile.png');
    });

    test('published center appears in matching Library section', () {
      final visible = PublicProviderProfile.visibleProfilesForSection(
        documents: const [
          {
            'providerId': 'center-1',
            'profileType': 'center',
            'displayName': 'Hope Center',
            'categoryId': 'rehabilitation',
            'categoryLabel': 'Rehabilitation',
            'librarySectionId': 'center_rehabilitation_recovery',
            'status': 'published',
            'otherServices': 'Weekend family orientation',
            'shortBio': 'Family recovery programs',
            'showEmailPublicly': false,
            'showPhonePublicly': false,
          },
        ],
        type: ProviderProfileType.center,
        librarySectionId: 'center_rehabilitation_recovery',
      );

      expect(visible, hasLength(1));
      expect(visible.single.otherServices, 'Weekend family orientation');
      expect(visible.single.shortBio, 'Family recovery programs');
    });

    test('center hidden public contact values are omitted', () {
      final projection = ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: 'center-1',
        profile: const {
          'centerName': 'Hope Center',
          'category': 'mental_health',
          'categoryLabel': 'Mental health',
          'email': 'center@example.test',
          'phone': '01000000000',
          'showEmailPublicly': false,
          'showPhonePublicly': false,
        },
      );

      final publicData = projection.toFirestoreCenterPublishedMinimal();

      expect(publicData['showEmailPublicly'], isFalse);
      expect(publicData['showPhonePublicly'], isFalse);
      expect(publicData.keys, isNot(contains('email')));
      expect(publicData.keys, isNot(contains('phone')));
    });

    test('center visible public contact values are projected', () {
      final projection = ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: 'center-1',
        profile: const {
          'centerName': 'Hope Center',
          'category': 'mental_health',
          'categoryLabel': 'Mental health',
          'email': 'center@example.test',
          'phone': '01000000000',
          'showEmailPublicly': true,
          'showPhonePublicly': true,
        },
      );

      final publicData = projection.toFirestoreCenterPublishedMinimal();

      expect(publicData['email'], 'center@example.test');
      expect(publicData['phone'], '01000000000');
    });

    test('switching center visibility off removes stale public values', () {
      final projection = ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: 'center-1',
        profile: const {
          'centerName': 'Hope Center',
          'category': 'mental_health',
          'categoryLabel': 'Mental health',
          'email': 'center@example.test',
          'phone': '01000000000',
          'showEmailPublicly': false,
          'showPhonePublicly': false,
        },
      );

      final replacement = projection.toFirestoreCenterPublishedMinimal();

      expect(replacement.keys, isNot(contains('email')));
      expect(replacement.keys, isNot(contains('phone')));
      expect(replacement['status'], 'published');
    });

    test('specialist search uses approved public specialist details', () {
      final visible = PublicProviderProfile.visibleProfilesForSection(
        documents: const [
          {
            'providerId': 'provider-1',
            'profileType': 'specialist',
            'displayName': 'Dr Profile',
            'categoryId': 'psychologist',
            'categoryLabel': 'Psychologist',
            'librarySectionId': 'specialist_psychologists',
            'otherSpecialties': 'Trauma support',
            'shortBio': 'Child and family sessions',
            'showEmailPublicly': false,
            'showPhonePublicly': false,
            'status': 'published',
          },
        ],
        type: ProviderProfileType.specialist,
        librarySectionId: 'specialist_psychologists',
        query: 'trauma',
      );
      final privateOnlySearch = PublicProviderProfile.visibleProfilesForSection(
        documents: const [
          {
            'providerId': 'provider-1',
            'profileType': 'specialist',
            'displayName': 'Dr Profile',
            'categoryId': 'psychologist',
            'categoryLabel': 'Psychologist',
            'librarySectionId': 'specialist_psychologists',
            'showEmailPublicly': false,
            'showPhonePublicly': false,
            'status': 'published',
          },
        ],
        type: ProviderProfileType.specialist,
        librarySectionId: 'specialist_psychologists',
        query: 'private@example.test',
      );

      expect(visible, hasLength(1));
      expect(privateOnlySearch, isEmpty);
    });

    test('empty section renders as an empty public profile list', () {
      final visible = PublicProviderProfile.visibleProfilesForSection(
        documents: const [],
        type: ProviderProfileType.specialist,
        librarySectionId: 'specialist_psychologists',
      );

      expect(visible, isEmpty);
    });
  });

  group('Provider image validation and storage paths', () {
    test('official image upload paths are owner scoped', () {
      expect(
        ProviderProfileStoragePaths.specialistOfficialImage('uid-1'),
        'clinicians/uid-1/official/profile_image',
      );
      expect(
        ProviderProfileStoragePaths.centerIdentityImage('uid-1'),
        'centers/uid-1/official/identity_image',
      );
      expect(
        ProviderProfileStoragePaths.isOwnerScopedSpecialistPath(
          uid: 'uid-1',
          path: 'clinicians/uid-1/official/profile_image',
        ),
        isTrue,
      );
      expect(
        ProviderProfileStoragePaths.isOwnerScopedSpecialistPath(
          uid: 'uid-1',
          path: 'clinicians/uid-2/official/profile_image',
        ),
        isFalse,
      );
    });

    test('non-image MIME and oversized image are rejected', () {
      expect(
        ProviderImageValidation.isValidImage(
          sizeBytes: 128,
          contentType: 'application/pdf',
        ),
        isFalse,
      );
      expect(
        ProviderImageValidation.isValidImage(
          sizeBytes: ProviderImageValidation.maxOfficialImageBytes + 1,
          contentType: 'image/png',
        ),
        isFalse,
      );
      expect(
        ProviderImageValidation.isValidImage(
          sizeBytes: ProviderImageValidation.maxOfficialImageBytes,
          contentType: 'image/webp',
        ),
        isTrue,
      );
    });

    test('image content type inference preserves supported image formats', () {
      expect(
        ProviderImageValidation.inferContentType(null, 'photo.png'),
        'image/png',
      );
      expect(
        ProviderImageValidation.inferContentType(null, 'photo.webp'),
        'image/webp',
      );
      expect(
        ProviderImageValidation.inferContentType('image/jpeg', 'photo.bin'),
        'image/jpeg',
      );
    });
  });

  group('Specialist Firebase contract text checks', () {
    test('Firestore rules require optional specialist visibility contract', () {
      final rules = File('firestore.rules').readAsStringSync();

      expect(rules, contains('function specialistPrivateProfileFields()'));
      expect(rules, contains("request.resource.data.status == 'published'"));
      expect(
          rules, contains("request.resource.data.profileType == 'specialist'"));
      expect(rules, contains("'otherSpecialties'"));
      expect(rules, contains("'shortBio'"));
      expect(rules, contains("'showEmailPublicly'"));
      expect(rules, contains("'showPhonePublicly'"));
      expect(
          rules,
          contains(
              'request.resource.data.keys().hasOnly(publicSpecialistProfileFields())'));
      expect(
        rules,
        contains(
          'request.resource.data.showEmailPublicly == true\n'
          "          || !request.resource.data.keys().hasAny(['email'])",
        ),
      );
      expect(
        rules,
        contains(
          'request.resource.data.showPhonePublicly == true\n'
          "          || !request.resource.data.keys().hasAny(['phone'])",
        ),
      );
      expect(
          rules,
          isNot(contains(
              "'freeSpecialization',\n        'description',\n        'imageUrl',")));
    });

    test('Storage rules restrict specialist image MIME types', () {
      final rules = File('storage.rules').readAsStringSync();

      expect(rules, contains('function isOfficialSpecialistImageUpload()'));
      expect(rules, contains("'image/jpeg'"));
      expect(rules, contains("'image/png'"));
      expect(rules, contains("'image/webp'"));
      expect(rules, contains('match /clinicians/{uid}/official/profile_image'));
    });
  });

  group('Center Firebase contract text checks', () {
    test('active Center page omits legacy profile wiring', () {
      final source = File(
        'lib/features/commercial/presentation/pages/center_professional_profile_clean_layout_page.dart',
      ).readAsStringSync();

      for (final legacy in <String>[
        'cardLanguage',
        'appearanceStyle',
        'publishingTargets',
        'presentationFormats',
        'yearsInOperation',
        'hasAccommodation',
        'hasClinics',
        'workingDays',
        'customerServicePhone',
        'officialEmail',
        'serviceNote',
        'centerType',
      ]) {
        expect(source, isNot(contains(legacy)), reason: legacy);
      }

      for (final retained in <String>[
        'centerName',
        'category',
        'otherServices',
        'shortBio',
        'email',
        'phone',
        'showEmailPublicly',
        'showPhonePublicly',
        'identityImageUrl',
      ]) {
        expect(source, contains(retained), reason: retained);
      }
    });

    test('Firestore rules require minimal published center profile contract',
        () {
      final rules = File('firestore.rules').readAsStringSync();

      expect(rules, contains('function centerPrivateProfileFields()'));
      expect(rules, contains('function centerProfileWriteValid'));
      expect(rules, contains("request.resource.data.profileType == 'center'"));
      expect(rules, contains("request.resource.data.status == 'published'"));
      expect(rules, contains("'otherServices'"));
      expect(rules, contains("'shortBio'"));
      expect(rules, contains("'showEmailPublicly'"));
      expect(rules, contains("'showPhonePublicly'"));
      expect(rules, contains("'identityImageUrl'"));
      expect(
        rules,
        contains(
          'request.resource.data.keys().hasOnly(centerPrivateProfileFields())',
        ),
      );
      expect(
        rules,
        contains(
          'request.resource.data.keys().hasOnly(publicCenterProfileFields())',
        ),
      );
      expect(
        rules,
        contains(
          'request.resource.data.showEmailPublicly == true\n'
          "          || !request.resource.data.keys().hasAny(['email'])",
        ),
      );
      expect(
        rules,
        contains(
          'request.resource.data.showPhonePublicly == true\n'
          "          || !request.resource.data.keys().hasAny(['phone'])",
        ),
      );
    });

    test('Storage rules restrict center identity image MIME types', () {
      final rules = File('storage.rules').readAsStringSync();

      expect(rules, contains('function isOfficialCenterImageUpload()'));
      expect(rules, contains('match /centers/{uid}/official/identity_image'));
      expect(rules, contains("'image/jpeg'"));
      expect(rules, contains("'image/png'"));
      expect(rules, contains("'image/webp'"));
      expect(rules, contains('&& isOfficialCenterImageUpload()'));
    });
  });
}
