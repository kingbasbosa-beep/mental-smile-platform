import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/features/commercial/domain/provider_profile_storage.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_profile_categories.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_public_profile.dart';

void main() {
  group('Provider category parity', () {
    test('specialist categories have unique ids and display sections', () {
      _expectUnique(
        ProviderProfileCategoryRegistry.specialistCategories
            .map((item) => item.id),
      );
      _expectUnique(
        ProviderProfileCategoryRegistry.specialistCategories
            .map((item) => item.librarySectionId),
      );

      for (final category
          in ProviderProfileCategoryRegistry.specialistCategories) {
        expect(
          ProviderProfileCategoryRegistry.specialistById(category.id),
          same(category),
        );
        final projection =
            ProviderPublicProfileProjection.specialistPublishedMinimal(
          providerId: 'provider-1',
          profile: <String, Object?>{
            'fullName': 'Dr Profile',
            'specialty': category.id,
            'specialtyLabel': 'Ignored label',
          },
        );
        expect(projection.categoryId, category.id);
        expect(projection.categoryLabel, category.label);
        expect(projection.librarySectionId, category.librarySectionId);
      }
    });

    test('center categories have unique ids and display sections', () {
      _expectUnique(
        ProviderProfileCategoryRegistry.centerCategories.map((item) => item.id),
      );
      _expectUnique(
        ProviderProfileCategoryRegistry.centerCategories
            .map((item) => item.librarySectionId),
      );

      for (final category in ProviderProfileCategoryRegistry.centerCategories) {
        expect(ProviderProfileCategoryRegistry.centerById(category.id),
            same(category));
        final projection =
            ProviderPublicProfileProjection.centerPublishedMinimal(
          providerId: 'center-1',
          profile: <String, Object?>{
            'centerName': 'Hope Center',
            'category': category.id,
            'categoryLabel': 'Ignored label',
          },
        );
        expect(projection.categoryId, category.id);
        expect(projection.categoryLabel, category.label);
        expect(projection.librarySectionId, category.librarySectionId);
      }
    });

    test('free text details never alter routing', () {
      final specialist =
          ProviderPublicProfileProjection.specialistPublishedMinimal(
        providerId: 'provider-1',
        profile: const <String, Object?>{
          'fullName': 'Dr Profile',
          'specialty': 'psychologist',
          'otherSpecialties': 'Anything free text',
          'shortBio': 'Anything else',
        },
      );
      final center = ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: 'center-1',
        profile: const <String, Object?>{
          'centerName': 'Hope Center',
          'category': 'mental_health',
          'otherServices': 'Anything free text',
          'shortBio': 'Anything else',
        },
      );

      expect(specialist.librarySectionId, 'specialist_psychologists');
      expect(center.librarySectionId, 'center_mental_health');
    });

    test('Library display branches use canonical registry only', () {
      final source = File(
        'lib/features/library/presentation/pages/library_provider_content_pages.dart',
      ).readAsStringSync();

      expect(source,
          contains('ProviderProfileCategoryRegistry.specialistCategories'));
      expect(
          source, contains('ProviderProfileCategoryRegistry.centerCategories'));
      expect(source, isNot(contains('_specialistBranches')));
      expect(source, isNot(contains('_centerBranches')));
    });
  });

  group('Provider final contracts', () {
    test('specialist public projection contains exact approved fields', () {
      final publicData =
          ProviderPublicProfileProjection.specialistPublishedMinimal(
        providerId: 'provider-1',
        profile: const <String, Object?>{
          'fullName': 'Dr Profile',
          'specialty': 'psychologist',
          'otherSpecialties': 'Trauma',
          'shortBio': 'Short bio',
          'email': 'doctor@example.test',
          'phone': '01000000000',
          'showEmailPublicly': true,
          'showPhonePublicly': false,
          'profileImageUrl': 'https://example.test/profile.png',
        },
      ).toFirestorePublishedMinimal();

      expect(publicData.keys.toSet(), <String>{
        'providerId',
        'profileType',
        'displayName',
        'categoryId',
        'categoryLabel',
        'librarySectionId',
        'otherSpecialties',
        'shortBio',
        'imageUrl',
        'email',
        'showEmailPublicly',
        'showPhonePublicly',
        'status',
      });
      expect(publicData.keys, isNot(contains('phone')));
    });

    test('center public projection contains exact approved fields', () {
      final publicData = ProviderPublicProfileProjection.centerPublishedMinimal(
        providerId: 'center-1',
        profile: const <String, Object?>{
          'centerName': 'Hope Center',
          'category': 'mental_health',
          'otherServices': 'Family support',
          'shortBio': 'Short bio',
          'email': 'center@example.test',
          'phone': '01000000000',
          'showEmailPublicly': false,
          'showPhonePublicly': true,
          'identityImageUrl': 'https://example.test/center.png',
        },
      ).toFirestoreCenterPublishedMinimal();

      expect(publicData.keys.toSet(), <String>{
        'providerId',
        'profileType',
        'displayName',
        'categoryId',
        'categoryLabel',
        'librarySectionId',
        'otherServices',
        'shortBio',
        'imageUrl',
        'phone',
        'showEmailPublicly',
        'showPhonePublicly',
        'status',
      });
      expect(publicData.keys, isNot(contains('email')));
    });

    test('official image paths are the only provider profile storage paths',
        () {
      expect(
        ProviderProfileStoragePaths.specialistOfficialImage('uid-1'),
        'clinicians/uid-1/official/profile_image',
      );
      expect(
        ProviderProfileStoragePaths.centerIdentityImage('uid-1'),
        'centers/uid-1/official/identity_image',
      );

      final rules = File('storage.rules').readAsStringSync();
      expect(rules, contains('match /clinicians/{uid}/official/profile_image'));
      expect(rules, contains('match /centers/{uid}/official/identity_image'));
      expect(rules, isNot(contains('match /clinicians/{uid}/{allPaths=**}')));
      expect(rules, isNot(contains('match /centers/{uid}/{allPaths=**}')));
    });

    test('provider profile approval request rules are absent', () {
      final rules = File('firestore.rules').readAsStringSync();

      expect(rules, isNot(contains('clinician_profile_change_requests')));
      expect(rules, isNot(contains('center_profile_change_requests')));
      expect(rules, contains('function specialistProfileWriteValid'));
      expect(rules, contains('function centerProfileWriteValid'));
    });

    test('cleanup package is dry-run first and write-confirm protected', () {
      final script =
          File('tools/provider_profile_final_cleanup.js').readAsStringSync();

      expect(script,
          contains("const CONFIRMATION = 'PROVIDER_PROFILE_FINAL_PURGE'"));
      expect(script,
          contains("const mode = args.has('--write') ? 'write' : 'dry-run'"));
      expect(script, contains('Write mode requires --confirm='));
      expect(script, contains('obsoleteStorageObjects'));
    });
  });
}

void _expectUnique(Iterable<String> values) {
  final list = values.toList();
  expect(list.toSet(), hasLength(list.length));
}
