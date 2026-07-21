import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/features/library/presentation/widgets/specialist_public_white_card.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_profile_categories.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_public_profile.dart';

void main() {
  testWidgets('displays image, name, and main specialty', (tester) async {
    final profile = _profile(imageUrl: 'https://example.com/image.png');

    await _pumpCard(tester, profile);

    expect(_key('public-specialist-image-provider-1'), findsOneWidget);
    expect(_key('public-specialist-name-provider-1'), findsOneWidget);
    expect(_key('public-specialist-main-specialty-provider-1'), findsOneWidget);
  });

  testWidgets('other specialties appear when non-empty', (tester) async {
    await _pumpCard(
      tester,
      _profile(otherSpecialties: 'Family therapy, trauma support'),
    );

    expect(
      _key('public-specialist-other-specialties-provider-1'),
      findsOneWidget,
    );
  });

  testWidgets('other specialties are absent when empty', (tester) async {
    await _pumpCard(tester, _profile(otherSpecialties: ''));

    expect(
      _key('public-specialist-other-specialties-provider-1'),
      findsNothing,
    );
  });

  testWidgets('short bio appears when non-empty', (tester) async {
    await _pumpCard(tester, _profile(shortBio: 'Calm care for families.'));

    expect(_key('public-specialist-short-bio-provider-1'), findsOneWidget);
  });

  testWidgets('short bio is absent when empty', (tester) async {
    await _pumpCard(tester, _profile(shortBio: ''));

    expect(_key('public-specialist-short-bio-provider-1'), findsNothing);
  });

  testWidgets('email appears only when showEmailPublicly is true',
      (tester) async {
    await _pumpCard(
      tester,
      _profile(email: 'doctor@example.com', showEmailPublicly: true),
    );

    expect(_key('public-specialist-email-provider-1'), findsOneWidget);
  });

  testWidgets('email is absent when showEmailPublicly is false',
      (tester) async {
    await _pumpCard(
      tester,
      _profile(email: 'doctor@example.com', showEmailPublicly: false),
    );

    expect(_key('public-specialist-email-provider-1'), findsNothing);
  });

  testWidgets('phone appears only when showPhonePublicly is true',
      (tester) async {
    await _pumpCard(
      tester,
      _profile(phone: '+201000000000', showPhonePublicly: true),
    );

    expect(_key('public-specialist-phone-provider-1'), findsOneWidget);
  });

  testWidgets('phone is absent when showPhonePublicly is false',
      (tester) async {
    await _pumpCard(
      tester,
      _profile(phone: '+201000000000', showPhonePublicly: false),
    );

    expect(_key('public-specialist-phone-provider-1'), findsNothing);
  });

  testWidgets('long name does not overflow', (tester) async {
    await _pumpCard(
      tester,
      _profile(
        displayName:
            'A very long specialist public display name that should not overflow the public white card surface',
      ),
      width: 320,
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('long specialty text does not overflow', (tester) async {
    await _pumpCard(
      tester,
      _profile(
        categoryLabel:
            'A very long main specialty label for a specialist public listing card',
      ),
      width: 320,
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('long bio does not break the card', (tester) async {
    await _pumpCard(
      tester,
      _profile(
        shortBio:
            'This is a long compact public biography that should remain readable without clipping, overflow, or fixed-height pressure inside the white specialist card.',
      ),
      width: 320,
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('desktop layout renders without exceptions', (tester) async {
    await _pumpCard(tester, _profile(), width: 900);

    expect(tester.takeException(), isNull);
    expect(_key('public-specialist-card-provider-1'), findsOneWidget);
  });

  testWidgets('narrow layout renders without exceptions', (tester) async {
    await _pumpCard(tester, _profile(), width: 280);

    expect(tester.takeException(), isNull);
    expect(_key('public-specialist-card-provider-1'), findsOneWidget);
  });

  test('center card path remains separate from Specialist card renderer', () {
    final source = File(
      'lib/features/library/presentation/pages/library_provider_content_pages.dart',
    ).readAsStringSync();

    expect(
      source,
      contains('if (profile.profileType == ProviderProfileType.specialist)'),
    );
    expect(source,
        contains('return SpecialistPublicWhiteCard(profile: profile);'));
    expect(source,
        contains('if (profile.profileType == ProviderProfileType.center)'));
    expect(source, contains('return CenterPublicWhiteCard(profile: profile);'));
  });
}

Finder _key(String value) {
  return find.byKey(ValueKey<String>(value));
}

Future<void> _pumpCard(
  WidgetTester tester,
  PublicProviderProfile profile, {
  double width = 620,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: width,
              child: SpecialistPublicWhiteCard(profile: profile),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

PublicProviderProfile _profile({
  String providerId = 'provider-1',
  String displayName = 'Dr. Salma Hassan',
  String categoryLabel = 'Clinical psychology',
  String? imageUrl,
  String? otherSpecialties,
  String? shortBio,
  String? email,
  String? phone,
  bool showEmailPublicly = false,
  bool showPhonePublicly = false,
}) {
  return PublicProviderProfile(
    providerId: providerId,
    profileType: ProviderProfileType.specialist,
    displayName: displayName,
    categoryId: 'clinical_psychology',
    categoryLabel: categoryLabel,
    librarySectionId: 'clinical_psychology',
    status: 'published',
    imageUrl: imageUrl,
    otherSpecialties: otherSpecialties,
    shortBio: shortBio,
    email: email,
    phone: phone,
    showEmailPublicly: showEmailPublicly,
    showPhonePublicly: showPhonePublicly,
  );
}
