import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mental_smile_os/features/library/presentation/widgets/center_public_white_card.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_profile_categories.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_public_profile.dart';

void main() {
  testWidgets('white Center card renders required fields', (tester) async {
    await _pumpCard(
        tester, _profile(imageUrl: 'https://example.test/logo.png'));

    expect(_key('public-center-card-center-1'), findsOneWidget);
    expect(_key('public-center-image-center-1'), findsOneWidget);
    expect(_key('public-center-name-center-1'), findsOneWidget);
    expect(_key('public-center-main-category-center-1'), findsOneWidget);
  });

  testWidgets('other services appear when non-empty', (tester) async {
    await _pumpCard(tester, _profile(otherServices: 'Family support'));

    expect(_key('public-center-other-services-center-1'), findsOneWidget);
  });

  testWidgets('other services are absent when empty', (tester) async {
    await _pumpCard(tester, _profile(otherServices: ''));

    expect(_key('public-center-other-services-center-1'), findsNothing);
  });

  testWidgets('short bio appears when non-empty', (tester) async {
    await _pumpCard(tester, _profile(shortBio: 'Short public bio'));

    expect(_key('public-center-short-bio-center-1'), findsOneWidget);
  });

  testWidgets('short bio is absent when empty', (tester) async {
    await _pumpCard(tester, _profile(shortBio: ''));

    expect(_key('public-center-short-bio-center-1'), findsNothing);
  });

  testWidgets('email appears only when public', (tester) async {
    await _pumpCard(
      tester,
      _profile(email: 'center@example.test', showEmailPublicly: true),
    );

    expect(_key('public-center-email-center-1'), findsOneWidget);
  });

  testWidgets('email is absent when hidden', (tester) async {
    await _pumpCard(
      tester,
      _profile(email: 'center@example.test', showEmailPublicly: false),
    );

    expect(_key('public-center-email-center-1'), findsNothing);
  });

  testWidgets('phone appears only when public', (tester) async {
    await _pumpCard(
      tester,
      _profile(phone: '01000000000', showPhonePublicly: true),
    );

    expect(_key('public-center-phone-center-1'), findsOneWidget);
  });

  testWidgets('phone is absent when hidden', (tester) async {
    await _pumpCard(
      tester,
      _profile(phone: '01000000000', showPhonePublicly: false),
    );

    expect(_key('public-center-phone-center-1'), findsNothing);
  });

  testWidgets('desktop card renders without exceptions', (tester) async {
    await _pumpCard(tester, _longProfile(), width: 900);

    expect(tester.takeException(), isNull);
  });

  testWidgets('narrow card renders without exceptions', (tester) async {
    await _pumpCard(tester, _longProfile(), width: 280);

    expect(tester.takeException(), isNull);
  });

  test('Specialist white card file remains present and separate', () {
    final source = File(
      'lib/features/library/presentation/widgets/specialist_public_white_card.dart',
    ).readAsStringSync();

    expect(source, contains('class SpecialistPublicWhiteCard'));
    expect(source, contains('public-specialist-card-'));
    expect(source, isNot(contains('public-center-card-')));
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
              child: CenterPublicWhiteCard(profile: profile),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

PublicProviderProfile _longProfile() {
  return _profile(
    displayName:
        'A very long center public display name that should not overflow the white card',
    categoryLabel:
        'A very long center main category label that should stay contained',
    otherServices:
        'Very long optional other services text that stays secondary and compact',
    shortBio:
        'This is a longer public center bio that should remain readable without breaking layout or clipping content in desktop and narrow card widths.',
    email: 'center-public-contact@example.test',
    phone: '01000000000',
    showEmailPublicly: true,
    showPhonePublicly: true,
  );
}

PublicProviderProfile _profile({
  String providerId = 'center-1',
  String displayName = 'Hope Center',
  String categoryLabel = 'Mental health center',
  String? imageUrl,
  String? otherServices,
  String? shortBio,
  String? email,
  String? phone,
  bool showEmailPublicly = false,
  bool showPhonePublicly = false,
}) {
  return PublicProviderProfile(
    providerId: providerId,
    profileType: ProviderProfileType.center,
    displayName: displayName,
    categoryId: 'mental_health',
    categoryLabel: categoryLabel,
    librarySectionId: 'center_mental_health',
    status: 'published',
    imageUrl: imageUrl,
    otherServices: otherServices,
    shortBio: shortBio,
    email: email,
    phone: phone,
    showEmailPublicly: showEmailPublicly,
    showPhonePublicly: showPhonePublicly,
  );
}
