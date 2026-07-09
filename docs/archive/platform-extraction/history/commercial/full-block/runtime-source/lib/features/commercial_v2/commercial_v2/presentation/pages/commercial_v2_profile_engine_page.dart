import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mental_smile_os/app/router/routes.dart';

const List<String> _commercialV2MainCategories = [
  'Specialist',
  'Center',
  'Educational',
  'Organization',
  'Initiative / NGO',
  'Wellness / Yoga / Meditation',
  'Accessibility Support',
  'Mental Health Tool',
  'Other',
];

const Map<String, List<String>> _commercialV2Subcategories = {
  'Specialist': [
    'Psychologist',
    'Psychiatrist',
    'Speech Therapist',
    'Addiction Counselor',
    'Behavior Specialist',
    'Special Education Specialist',
    'Social Worker',
    'Other',
  ],
  'Center': [
    'Addiction Center',
    'Autism Center',
    'Behavior Center',
    'Mental Health Center',
    'Speech Center',
    'Rehabilitation Center',
    'Educational Center',
    'Other',
  ],
  'Educational': [
    'Course Provider',
    'Diploma Provider',
    'Training Academy',
    'Workshop Provider',
    'Other',
  ],
  'Organization': [
    'NGO',
    'Charity',
    'Foundation',
    'Community Initiative',
    'Other',
  ],
};

const _commercialV2CategoryPricingMetadata = {
  'Specialist': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.accommodationProgramOptions,
  ),
  'Educational': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.programsFees,
  ),
  'Organization': _PricingMetadata(),
  'Initiative / NGO': _PricingMetadata(),
  'Wellness / Yoga / Meditation': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Accessibility Support': _PricingMetadata(),
  'Mental Health Tool': _PricingMetadata(),
  'Other': _PricingMetadata(),
};

const _commercialV2SubcategoryPricingMetadata = {
  'Psychologist': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Psychiatrist': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Speech Therapist': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Addiction Counselor': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Behavior Specialist': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Special Education Specialist': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Social Worker': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.sessionOptions,
  ),
  'Addiction Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.accommodationProgramOptions,
  ),
  'Mental Health Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.accommodationProgramOptions,
  ),
  'Autism Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.dayCareServiceOptions,
  ),
  'Behavior Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.dayCareServiceOptions,
  ),
  'Speech Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.dayCareServiceOptions,
  ),
  'Rehabilitation Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.dayCareServiceOptions,
  ),
  'Educational Center': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.programsFees,
  ),
  'Course Provider': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.programsFees,
  ),
  'Diploma Provider': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.programsFees,
  ),
  'Training Academy': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.programsFees,
  ),
  'Workshop Provider': _PricingMetadata(
    hasPricingBlock: true,
    pricingBlockType: _PricingBlockType.programsFees,
  ),
  'NGO': _PricingMetadata(),
  'Charity': _PricingMetadata(),
  'Foundation': _PricingMetadata(),
  'Community Initiative': _PricingMetadata(),
  'Other': _PricingMetadata(),
};

const _commercialBlack = Color(0xFF050505);
const _commercialObsidian = Color(0xFF10100E);
const _commercialGlass = Color(0xD90C0C0B);
const _commercialGold = Color(0xFFE0C174);
const _commercialGoldMuted = Color(0xFFA98335);
const _commercialSilver = Color(0xFFE8E3D6);
const _commercialSilverMuted = Color(0xFFBDB5A5);
const _commercialError = Color(0xFFFF8E8E);
const _commercialPriceNotice =
    'Prices and services are published by the provider/entity. Please confirm details directly before agreement.';

const _accommodationPricingSpec = _ConditionalSectionSpec(
  id: 'accommodationPricing',
  titleEn: 'Accommodation / Program Options',
  titleAr:
      '\u062e\u064a\u0627\u0631\u0627\u062a \u0627\u0644\u0625\u0642\u0627\u0645\u0629 / \u0627\u0644\u0628\u0631\u0627\u0645\u062c',
  icon: Icons.hotel_outlined,
  repeatable: true,
  addButtonEn: '+ Add Room / Program Option',
  addButtonAr:
      '+ \u0625\u0636\u0627\u0641\u0629 \u062e\u064a\u0627\u0631 \u063a\u0631\u0641\u0629 / \u0628\u0631\u0646\u0627\u0645\u062c',
  fields: [
    _ConditionalFieldSpec('accommodation.optionName', 'Option Name',
        '\u0627\u0633\u0645 \u0627\u0644\u062e\u064a\u0627\u0631'),
    _ConditionalFieldSpec('accommodation.roomType', 'Room Type',
        '\u0646\u0648\u0639 \u0627\u0644\u063a\u0631\u0641\u0629'),
    _ConditionalFieldSpec('accommodation.dailyPrice', 'Daily Price',
        '\u0627\u0644\u0633\u0639\u0631 \u0627\u0644\u064a\u0648\u0645\u064a'),
    _ConditionalFieldSpec('accommodation.monthlyPrice', 'Monthly Price',
        '\u0627\u0644\u0633\u0639\u0631 \u0627\u0644\u0634\u0647\u0631\u064a'),
    _ConditionalFieldSpec('accommodation.programDuration', 'Program Duration',
        '\u0645\u062f\u0629 \u0627\u0644\u0628\u0631\u0646\u0627\u0645\u062c'),
    _ConditionalFieldSpec(
      'accommodation.notes',
      'Notes',
      '\u0645\u0644\u0627\u062d\u0638\u0627\u062a',
      maxLines: 3,
    ),
  ],
);

const _serviceDeliveryOptionsSpec = _ConditionalSectionSpec(
  id: 'serviceDeliveryOptions',
  titleEn: 'Service Delivery Options',
  titleAr:
      '\u062e\u064a\u0627\u0631\u0627\u062a \u062a\u0642\u062f\u064a\u0645 \u0627\u0644\u062e\u062f\u0645\u0629',
  icon: Icons.room_service_outlined,
  repeatable: true,
  addButtonEn: '+ Add Service / Hosting Option',
  addButtonAr:
      '+ \u0625\u0636\u0627\u0641\u0629 \u062e\u064a\u0627\u0631 \u062e\u062f\u0645\u0629 / \u0627\u0633\u062a\u0636\u0627\u0641\u0629',
  fields: [
    _ConditionalFieldSpec('delivery.optionName', 'Option Name',
        '\u0627\u0633\u0645 \u0627\u0644\u062e\u064a\u0627\u0631'),
    _ConditionalFieldSpec(
        'delivery.dailyHostingAvailable',
        'Daily Hosting Available',
        '\u0627\u0633\u062a\u0636\u0627\u0641\u0629 \u064a\u0648\u0645\u064a\u0629 \u0645\u062a\u0627\u062d\u0629',
        yesNo: true),
    _ConditionalFieldSpec(
        'delivery.homeSessionsAvailable',
        'Home Sessions Available',
        '\u062c\u0644\u0633\u0627\u062a \u0645\u0646\u0632\u0644\u064a\u0629 \u0645\u062a\u0627\u062d\u0629',
        yesNo: true),
    _ConditionalFieldSpec(
        'delivery.centerSessionsAvailable',
        'Center Sessions Available',
        '\u062c\u0644\u0633\u0627\u062a \u0628\u0627\u0644\u0645\u0631\u0643\u0632 \u0645\u062a\u0627\u062d\u0629',
        yesNo: true),
    _ConditionalFieldSpec('delivery.sessionPrice', 'Session Price',
        '\u0633\u0639\u0631 \u0627\u0644\u062c\u0644\u0633\u0629'),
    _ConditionalFieldSpec('delivery.dailyHostingPrice', 'Daily Hosting Price',
        '\u0633\u0639\u0631 \u0627\u0644\u0627\u0633\u062a\u0636\u0627\u0641\u0629 \u0627\u0644\u064a\u0648\u0645\u064a\u0629'),
    _ConditionalFieldSpec(
      'delivery.notes',
      'Notes',
      '\u0645\u0644\u0627\u062d\u0638\u0627\u062a',
      maxLines: 3,
    ),
  ],
);

const _programsFeesSpec = _ConditionalSectionSpec(
  id: 'programsFees',
  titleEn: 'Programs & Fees',
  titleAr:
      '\u0627\u0644\u0628\u0631\u0627\u0645\u062c \u0648\u0627\u0644\u0631\u0633\u0648\u0645',
  icon: Icons.school_outlined,
  repeatable: true,
  addButtonEn: '+ Add Program Option',
  addButtonAr:
      '+ \u0625\u0636\u0627\u0641\u0629 \u062e\u064a\u0627\u0631 \u0628\u0631\u0646\u0627\u0645\u062c',
  fields: [
    _ConditionalFieldSpec('programs.programName', 'Program Name',
        '\u0627\u0633\u0645 \u0627\u0644\u0628\u0631\u0646\u0627\u0645\u062c'),
    _ConditionalFieldSpec('programs.programType', 'Program Type',
        '\u0646\u0648\u0639 \u0627\u0644\u0628\u0631\u0646\u0627\u0645\u062c',
        options: ['Course', 'Diploma', 'Workshop', 'Training']),
    _ConditionalFieldSpec(
        'programs.duration', 'Duration', '\u0627\u0644\u0645\u062f\u0629'),
    _ConditionalFieldSpec(
        'programs.price', 'Price', '\u0627\u0644\u0633\u0639\u0631'),
    _ConditionalFieldSpec(
        'programs.certificateAvailable',
        'Certificate Available',
        '\u0634\u0647\u0627\u062f\u0629 \u0645\u062a\u0627\u062d\u0629',
        yesNo: true),
    _ConditionalFieldSpec(
      'programs.notes',
      'Notes',
      '\u0645\u0644\u0627\u062d\u0638\u0627\u062a',
      maxLines: 3,
    ),
  ],
);

const _sessionOptionsSpec = _ConditionalSectionSpec(
  id: 'sessionOptions',
  titleEn: 'Session Options',
  titleAr:
      '\u062e\u064a\u0627\u0631\u0627\u062a \u0627\u0644\u062c\u0644\u0633\u0627\u062a',
  icon: Icons.event_available_outlined,
  repeatable: true,
  addButtonEn: '+ Add Session / Service Option',
  addButtonAr:
      '+ \u0625\u0636\u0627\u0641\u0629 \u062e\u064a\u0627\u0631 \u062c\u0644\u0633\u0629 / \u062e\u062f\u0645\u0629',
  fields: [
    _ConditionalFieldSpec('sessions.optionName', 'Option Name',
        '\u0627\u0633\u0645 \u0627\u0644\u062e\u064a\u0627\u0631'),
    _ConditionalFieldSpec(
        'sessions.onlineAvailable',
        'Online Sessions Available',
        '\u062c\u0644\u0633\u0627\u062a \u0623\u0648\u0646\u0644\u0627\u064a\u0646 \u0645\u062a\u0627\u062d\u0629',
        yesNo: true),
    _ConditionalFieldSpec(
        'sessions.inPersonAvailable',
        'In-person Sessions Available',
        '\u062c\u0644\u0633\u0627\u062a \u062d\u0636\u0648\u0631\u064a\u0629 \u0645\u062a\u0627\u062d\u0629',
        yesNo: true),
    _ConditionalFieldSpec(
        'sessions.homeVisitsAvailable',
        'Home Visits Available',
        '\u0632\u064a\u0627\u0631\u0627\u062a \u0645\u0646\u0632\u0644\u064a\u0629 \u0645\u062a\u0627\u062d\u0629',
        yesNo: true),
    _ConditionalFieldSpec('sessions.sessionPrice', 'Session Price',
        '\u0633\u0639\u0631 \u0627\u0644\u062c\u0644\u0633\u0629'),
    _ConditionalFieldSpec(
      'sessions.notes',
      'Notes',
      '\u0645\u0644\u0627\u062d\u0638\u0627\u062a',
      maxLines: 3,
    ),
  ],
);

const _conditionalSectionSpecs = [
  _accommodationPricingSpec,
  _serviceDeliveryOptionsSpec,
  _programsFeesSpec,
  _sessionOptionsSpec,
];

final _conditionalFieldKeys = [
  for (final spec in _conditionalSectionSpecs)
    for (final field in spec.fields) field.key,
];

String _commercialV2GeneratedCvTemplate(String styleInstruction) {
  final style = styleInstruction.trim().toLowerCase();
  if (style.isEmpty) return 'medical_white_default';
  final pharaonicGoldHints = [
    'pharaonic',
    'pharaoh',
    'gold',
    'black',
    '\u0641\u0631\u0639\u0648\u0646\u064a',
    '\u0641\u0631\u0639\u0648\u0646\u064a\u0629',
    '\u0630\u0647\u0628\u064a',
    '\u0630\u0647\u0628\u064a\u0629',
    '\u0623\u0633\u0648\u062f',
    '\u0627\u0633\u0648\u062f',
  ];
  if (pharaonicGoldHints.any((hint) => style.contains(hint))) {
    return 'pharaonic_gold_documented_pending_template';
  }
  final medicalWhiteHints = [
    'medical',
    'clinical',
    'white',
    'clean',
    'doctor',
    'clinic',
    '\u0637\u0628\u064a',
    '\u0637\u0628\u064a\u0629',
    '\u0623\u0628\u064a\u0636',
    '\u0627\u0628\u064a\u0636',
    '\u0639\u064a\u0627\u062f\u0629',
    '\u0627\u062d\u062a\u0631\u0627\u0641\u064a \u0628\u062e\u0644\u0641\u064a\u0629 \u0628\u064a\u0636\u0627\u0621 \u0637\u0628\u064a\u0629',
  ];
  if (medicalWhiteHints.any((hint) => style.contains(hint))) {
    return 'medical_white';
  }
  return 'style_instruction_documented_pending_template';
}

enum _PricingBlockType {
  none,
  sessionOptions,
  accommodationProgramOptions,
  dayCareServiceOptions,
  programsFees,
}

class _PricingMetadata {
  const _PricingMetadata({
    this.hasPricingBlock = false,
    this.pricingBlockType = _PricingBlockType.none,
  });

  final bool hasPricingBlock;
  final _PricingBlockType pricingBlockType;
}

class CommercialV2StartPage extends StatefulWidget {
  const CommercialV2StartPage({super.key});

  @override
  State<CommercialV2StartPage> createState() => _CommercialV2StartPageState();
}

class _CommercialV2StartPageState extends State<CommercialV2StartPage> {
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _loading = false;
  bool _arabic = true;
  String? _error;
  String? _notice;

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  Future<void> _createAccount() async {
    await _authFlow(create: true);
  }

  Future<void> _login() async {
    await _authFlow(create: false);
  }

  Future<void> _authFlow({required bool create}) async {
    setState(() {
      _loading = true;
      _error = null;
      _notice = null;
    });

    try {
      final auth = FirebaseAuth.instance;
      final phone = _phone.text.trim();
      final password = _password.text;
      final confirmPassword = _confirmPassword.text;
      final authEmail = _commercialV2AuthEmailForPhone(phone);
      UserCredential credential;

      if (authEmail == null) {
        throw FirebaseAuthException(code: 'missing-phone');
      }
      if (password.length < 6) {
        throw FirebaseAuthException(code: 'weak-password');
      }
      if (create) {
        if (confirmPassword != password) {
          throw FirebaseAuthException(code: 'password-mismatch');
        }
        credential = await auth.createUserWithEmailAndPassword(
          email: authEmail,
          password: password,
        );
        await _CommercialV2Store.ensureProfileShell(
          ownerUid: credential.user!.uid,
          phone: phone,
        );
      } else {
        credential = await auth.signInWithEmailAndPassword(
          email: authEmail,
          password: password,
        );
        await _CommercialV2Store.ensureProfileShell(
          ownerUid: credential.user!.uid,
          phone: phone,
        );
      }

      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(Routes.commercialV2Owner);
    } on FirebaseAuthException catch (e) {
      setState(() => _error = _authErrorMessage(e));
    } on FirebaseException catch (e) {
      setState(() => _error = _firebaseErrorMessage(e));
    } catch (e) {
      setState(() => _error = 'Unexpected error: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _authErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'missing-phone':
        return 'Phone is required for Commercial V2 access.';
      case 'weak-password':
        return 'Password must be at least 6 characters.';
      case 'password-mismatch':
        return 'Password and Confirm Password must match.';
      case 'email-already-in-use':
        return 'This phone already has an account. Use Login instead of Create Account.';
      case 'user-not-found':
        return 'No account found for this phone. Create an account first.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Phone or password is incorrect.';
      case 'network-request-failed':
        return 'Network error. Check the connection and try again.';
      case 'operation-not-allowed':
        return 'Phone-first Commercial V2 access uses Firebase email/password compatibility. Enable Email/Password sign-in in Firebase Authentication.';
      case 'configuration-not-found':
        return 'Firebase Auth is not configured for this project. Enable Email/Password sign-in in Firebase Authentication, then restart the app.';
      default:
        return 'Auth error (${e.code}): ${e.message ?? 'No details'}';
    }
  }

  String _firebaseErrorMessage(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return 'Firebase rules blocked Commercial V2 profile creation. Allow commercial_v2_profiles writes, then try again.';
      case 'unavailable':
        return 'Auth is enabled, but Firestore profile creation is unavailable. Check that Firestore Database is created/enabled for this Firebase project, then try Login again.';
      default:
        return 'Firebase error (${e.plugin}/${e.code}): ${e.message ?? 'No details'}';
    }
  }

  String _startText(String en, String ar) => _arabic ? ar : en;

  void _cancel() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }
    navigator.pushReplacementNamed(Routes.splash);
  }

  @override
  Widget build(BuildContext context) {
    final direction = _arabic ? TextDirection.rtl : TextDirection.ltr;
    return _CommercialV2Shell(
      title: '',
      subtitle: '',
      showAppBar: false,
      showHeader: false,
      maxContentWidth: 1180,
      child: Directionality(
        textDirection: direction,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 72,
          ),
          child: Stack(
            children: [
              Positioned(
                top: -8,
                left: 78,
                child: const _StartLogo(),
              ),
              Positioned(
                top: 24,
                right: 78,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _StartLanguageToggle(
                        arabic: _arabic,
                        onChanged: (value) => setState(() => _arabic = value),
                      ),
                      const SizedBox(width: 22),
                      _StartCancelButton(
                        label: _startText(
                          'Cancel',
                          '\u0625\u0644\u063a\u0627\u0621',
                        ),
                        onPressed: _cancel,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 118),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _GuidedField(
                          controller: _phone,
                          label: _startText(
                            'Phone',
                            '\u0631\u0642\u0645 \u0627\u0644\u0647\u0627\u062a\u0641',
                          ),
                          icon: Icons.phone_outlined,
                          hint: _startText('+20...', '01014116531'),
                          example: _startText(
                            'Example: +201000000000',
                            '\u0645\u062b\u0627\u0644: 01014116531',
                          ),
                          keyboardType: TextInputType.phone,
                          semanticsLabel: 'Commercial V2 account phone',
                          textDirection: direction,
                        ),
                        _GuidedField(
                          controller: _password,
                          label: _startText(
                            'Password',
                            '\u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631',
                          ),
                          icon: Icons.lock_outline,
                          hint: _startText(
                            'Use a strong private password',
                            '\u0627\u0633\u062a\u062e\u062f\u0645 \u0643\u0644\u0645\u0629 \u0645\u0631\u0648\u0631 \u0642\u0648\u064a\u0629 \u0648\u062e\u0627\u0635\u0629',
                          ),
                          example: _startText(
                            'Use a strong private password',
                            '\u0627\u0633\u062a\u062e\u062f\u0645 \u0643\u0644\u0645\u0629 \u0645\u0631\u0648\u0631 \u0642\u0648\u064a\u0629 \u0648\u062e\u0627\u0635\u0629',
                          ),
                          obscureText: true,
                          semanticsLabel: 'Commercial V2 account password',
                          textDirection: direction,
                        ),
                        _GuidedField(
                          controller: _confirmPassword,
                          label: _startText(
                            'Confirm Password',
                            '\u062a\u0623\u0643\u064a\u062f \u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631',
                          ),
                          icon: Icons.lock_reset_outlined,
                          hint: _startText(
                            'Repeat password when creating an account',
                            '\u0623\u0639\u062f \u0643\u062a\u0627\u0628\u0629 \u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631 \u0639\u0646\u062f \u0625\u0646\u0634\u0627\u0621 \u062d\u0633\u0627\u0628',
                          ),
                          example: _startText(
                            'Required for Create Account',
                            '\u0645\u0637\u0644\u0648\u0628 \u0639\u0646\u062f \u0625\u0646\u0634\u0627\u0621 \u062d\u0633\u0627\u0628',
                          ),
                          obscureText: true,
                          semanticsLabel:
                              'Commercial V2 account confirm password',
                          textDirection: direction,
                        ),
                        const SizedBox(height: 16),
                        _Notice(
                          text: _startText(
                            'Image/logo is not required now. It can be added later during design or publication.',
                            'الصورة أو الشعار غير مطلوبين الآن. يمكن إضافتهم لاحقا أثناء التصميم أو النشر.',
                          ),
                        ),
                        if (_error != null) ...[
                          const SizedBox(height: 12),
                          _ErrorNotice(text: _error!),
                        ],
                        if (_notice != null) ...[
                          const SizedBox(height: 12),
                          _Notice(text: _notice!),
                        ],
                        const SizedBox(height: 28),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton.icon(
                                onPressed: _loading ? null : _login,
                                icon: const Icon(Icons.login),
                                label: Text(
                                  _startText(
                                    'Login',
                                    '\u062a\u0633\u062c\u064a\u0644 \u0627\u0644\u062f\u062e\u0648\u0644',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              FilledButton.icon(
                                onPressed: _loading ? null : _createAccount,
                                icon: const Icon(Icons.person_add_alt_1),
                                label: Text(
                                  _startText(
                                    'Create Account',
                                    '\u0625\u0646\u0634\u0627\u0621 \u062d\u0633\u0627\u0628',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegistrationIdentityPicker extends StatelessWidget {
  const _RegistrationIdentityPicker({
    required this.arabic,
    required this.target,
    required this.bytes,
    required this.onTargetChanged,
    required this.onSelect,
  });

  final bool arabic;
  final String target;
  final Uint8List? bytes;
  final ValueChanged<String> onTargetChanged;
  final VoidCallback? onSelect;

  @override
  Widget build(BuildContext context) {
    final selectedBytes = bytes;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0x66000000),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _commercialGoldMuted),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.image_outlined, color: _commercialGold),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    arabic
                        ? 'صورة الهوية / الشعار (اختياري)'
                        : 'Identity Image / Logo (optional)',
                    style: const TextStyle(
                      color: _commercialGold,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: onSelect,
                  icon: const Icon(Icons.add_photo_alternate_outlined),
                  label: Text(arabic ? 'اختيار صورة' : 'Select Image'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SegmentedButton<String>(
              segments: [
                ButtonSegment(
                  value: 'profileImageUrl',
                  icon: const Icon(Icons.person_outline),
                  label: Text(arabic ? 'صورة شخصية' : 'Profile Photo'),
                ),
                ButtonSegment(
                  value: 'logoImageUrl',
                  icon: const Icon(Icons.business_outlined),
                  label: Text(arabic ? 'شعار' : 'Logo'),
                ),
              ],
              selected: {target},
              onSelectionChanged: (values) => onTargetChanged(values.first),
            ),
            if (selectedBytes != null && selectedBytes.isNotEmpty) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                  selectedBytes,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    debugPrint(
                      'Commercial V2 registration identity image: local preview failed | exceptionType=${error.runtimeType} | exceptionMessage=$error | stack=$stackTrace',
                    );
                    return const SizedBox(
                      height: 140,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: _commercialGold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 10),
            Text(
              arabic
                  ? 'اختياري ولا يمنع إنشاء الحساب أو الملف.'
                  : 'Optional. Account and profile creation continue if upload fails.',
              style: const TextStyle(
                color: _commercialSilverMuted,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StartLanguageToggle extends StatelessWidget {
  const _StartLanguageToggle({
    required this.arabic,
    required this.onChanged,
  });

  final bool arabic;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0x99000000),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _commercialGoldMuted),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StartToggleSegment(
            label: 'EN',
            selected: !arabic,
            onPressed: () => onChanged(false),
          ),
          _StartToggleSegment(
            label: '\u0639\u0631\u0628\u064a',
            selected: arabic,
            onPressed: () => onChanged(true),
          ),
        ],
      ),
    );
  }
}

class _StartLogo extends StatelessWidget {
  const _StartLogo();

  static const silverLogoPath =
      'assets/branding/commercial_v2/ms_logo_silver.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 178,
      height: 178,
      child: Image.asset(
        silverLogoPath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const SizedBox.expand(),
      ),
    );
  }
}

class _StartToggleSegment extends StatelessWidget {
  const _StartToggleSegment({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor:
            selected ? const Color(0x332C2108) : Colors.transparent,
        foregroundColor: selected ? _commercialGold : _commercialSilver,
        minimumSize: const Size(72, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w900),
      ),
    );
  }
}

class _StartCancelButton extends StatelessWidget {
  const _StartCancelButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.close),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(128, 52),
        foregroundColor: _commercialSilver,
        side: const BorderSide(color: _commercialGoldMuted),
      ),
    );
  }
}

class _OwnerBackButton extends StatelessWidget {
  const _OwnerBackButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(128, 52),
        foregroundColor: _commercialGold,
        side: const BorderSide(color: _commercialGoldMuted),
      ),
    );
  }
}

class CommercialV2OwnerProfilePage extends StatefulWidget {
  const CommercialV2OwnerProfilePage({super.key});

  @override
  State<CommercialV2OwnerProfilePage> createState() =>
      _CommercialV2OwnerProfilePageState();
}

class _CommercialV2OwnerProfilePageState
    extends State<CommercialV2OwnerProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _services = TextEditingController();
  final _audiences = TextEditingController();
  final _location = TextEditingController();
  final _phone = TextEditingController();
  final _whatsApp = TextEditingController();
  final _links = TextEditingController();
  final _profileImageUrl = TextEditingController();
  final _logoImageUrl = TextEditingController();
  final _facebookMediaLink = TextEditingController();
  final _youtubeMediaLink = TextEditingController();
  final _instagramLink = TextEditingController();
  final _websiteGalleryLink = TextEditingController();
  final _styleInstruction = TextEditingController();
  final List<_CustomSectionControllers> _sections = [];
  final Map<String, TextEditingController> _conditionalFields = {};
  final Map<String, List<Map<String, TextEditingController>>>
      _repeatableConditionalFields = {};
  _ProfilePayload? _generatedCvPayload;
  _ProfilePayload? _businessCardPayload;
  _ProfilePayload? _promoPostPayload;
  _CommercialAssetPackage? _assetPackage;
  String _generatedCvStyle = '';
  bool _loading = true;
  bool _saving = false;
  String? _message;
  String? _ownerError;
  String _category = '';
  String _subcategory = '';
  bool _arabic = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final controller in [
      _name,
      _description,
      _services,
      _audiences,
      _location,
      _phone,
      _whatsApp,
      _links,
      _profileImageUrl,
      _logoImageUrl,
      _facebookMediaLink,
      _youtubeMediaLink,
      _instagramLink,
      _websiteGalleryLink,
      _styleInstruction,
    ]) {
      controller.dispose();
    }
    for (final section in _sections) {
      section.dispose();
    }
    for (final controller in _conditionalFields.values) {
      controller.dispose();
    }
    for (final blocks in _repeatableConditionalFields.values) {
      for (final block in blocks) {
        for (final controller in block.values) {
          controller.dispose();
        }
      }
    }
    super.dispose();
  }

  Future<void> _load() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(Routes.commercialV2Start);
      }
      return;
    }

    final doc = await _CommercialV2Store.profileDoc(uid).get();
    if (!doc.exists) {
      await _CommercialV2Store.ensureProfileShell(ownerUid: uid);
    }
    final fresh = await _CommercialV2Store.profileDoc(uid).get();
    final data = fresh.data() ?? <String, dynamic>{};
    final draft = _ProfilePayload.fromMap(
      _profileMapWithIdentityFallback(_mapValue(data['draftProfile']), data),
      fallbackPhone: (data['accountPhone'] ?? '').toString(),
    );
    _apply(draft);
    if (mounted) setState(() => _loading = false);
  }

  void _apply(_ProfilePayload payload) {
    _name.text = payload.name;
    _category = payload.category;
    _subcategory = payload.subcategory;
    _description.text = payload.description;
    _services.text = payload.services.join('\n');
    _audiences.text = payload.audiences.join('\n');
    _location.text = payload.location;
    _phone.text = payload.phone;
    _whatsApp.text = payload.whatsApp;
    _links.text = payload.links.join('\n');
    _profileImageUrl.text = payload.profileImageUrl;
    _logoImageUrl.text = payload.logoImageUrl;
    _facebookMediaLink.text = payload.facebookMediaLink;
    _youtubeMediaLink.text = payload.youtubeMediaLink;
    _instagramLink.text = payload.instagramLink;
    _websiteGalleryLink.text = payload.websiteGalleryLink;
    _styleInstruction.text = payload.styleInstruction;
    for (final field in _conditionalFieldKeys) {
      _conditionalController(field).text = payload.conditionalValueFor(field);
    }
    _applyRepeatableConditionalSections(payload);
    for (final section in _sections) {
      section.dispose();
    }
    _sections
      ..clear()
      ..addAll(
        payload.customSections.map(
          (section) => _CustomSectionControllers(
            title: section.title,
            content: section.content,
          ),
        ),
      );
  }

  _ProfilePayload _payload() {
    return _ProfilePayload(
      name: _name.text.trim(),
      category: _category.trim(),
      subcategory: _subcategory.trim(),
      description: _description.text.trim(),
      services: _lines(_services.text),
      audiences: _lines(_audiences.text),
      location: _location.text.trim(),
      phone: _phone.text.trim(),
      whatsApp: _whatsApp.text.trim(),
      links: _lines(_links.text),
      profileImageUrl: _normalizeImageUrl(_profileImageUrl.text),
      logoImageUrl: _normalizeImageUrl(_logoImageUrl.text),
      facebookMediaLink: _facebookMediaLink.text.trim(),
      youtubeMediaLink: _youtubeMediaLink.text.trim(),
      instagramLink: _instagramLink.text.trim(),
      websiteGalleryLink: _websiteGalleryLink.text.trim(),
      styleInstruction: _styleInstruction.text.trim(),
      conditionalSections: _visibleConditionalSections(),
      repeatableConditionalSections: _visibleRepeatableConditionalSections(),
      customSections: _sections
          .map(
            (section) => _CustomSection(
              title: section.title.text.trim(),
              content: section.content.text.trim(),
            ),
          )
          .where((section) =>
              section.title.isNotEmpty || section.content.isNotEmpty)
          .toList(growable: false),
    );
  }

  TextEditingController _conditionalController(String key) {
    return _conditionalFields.putIfAbsent(key, () => TextEditingController());
  }

  Map<String, Map<String, String>> _visibleConditionalSections() {
    final sections = <String, Map<String, String>>{};
    for (final spec in _visibleConditionalSpecs) {
      if (spec.repeatable) continue;
      final values = <String, String>{};
      for (final field in spec.fields) {
        final value = _conditionalController(field.key).text.trim();
        if (value.isNotEmpty) values[field.key] = value;
      }
      if (values.isNotEmpty) sections[spec.id] = values;
    }
    return sections;
  }

  List<Map<String, TextEditingController>> _repeatableBlocks(String sectionId) {
    return _repeatableConditionalFields.putIfAbsent(sectionId, () => []);
  }

  TextEditingController _repeatableController(
    String sectionId,
    int index,
    String fieldKey,
  ) {
    final blocks = _repeatableBlocks(sectionId);
    while (blocks.length <= index) {
      blocks.add(<String, TextEditingController>{});
    }
    return blocks[index].putIfAbsent(fieldKey, () => TextEditingController());
  }

  void _addRepeatableBlock(_ConditionalSectionSpec spec) {
    setState(() {
      _repeatableBlocks(spec.id).add(<String, TextEditingController>{});
    });
  }

  void _removeRepeatableBlock(String sectionId, int index) {
    setState(() {
      final blocks = _repeatableBlocks(sectionId);
      if (index < 0 || index >= blocks.length) return;
      final removed = blocks.removeAt(index);
      for (final controller in removed.values) {
        controller.dispose();
      }
    });
  }

  Map<String, List<Map<String, String>>>
      _visibleRepeatableConditionalSections() {
    final sections = <String, List<Map<String, String>>>{};
    for (final spec
        in _visibleConditionalSpecs.where((spec) => spec.repeatable)) {
      final blocks = _repeatableBlocks(spec.id);
      final publishedBlocks = <Map<String, String>>[];
      for (final block in blocks) {
        final values = <String, String>{};
        for (final field in spec.fields) {
          final value = block[field.key]?.text.trim() ?? '';
          if (value.isNotEmpty) values[field.key] = value;
        }
        if (values.isNotEmpty) publishedBlocks.add(values);
      }
      if (publishedBlocks.isNotEmpty) sections[spec.id] = publishedBlocks;
    }
    return sections;
  }

  void _applyRepeatableConditionalSections(_ProfilePayload payload) {
    for (final blocks in _repeatableConditionalFields.values) {
      for (final block in blocks) {
        for (final controller in block.values) {
          controller.dispose();
        }
      }
    }
    _repeatableConditionalFields.clear();
    for (final spec
        in _conditionalSectionSpecs.where((spec) => spec.repeatable)) {
      final sourceBlocks = payload.repeatableConditionalSections[spec.id];
      final fallback = payload.conditionalSections[spec.id];
      final blocks = sourceBlocks ??
          (fallback == null || fallback.isEmpty
              ? const <Map<String, String>>[]
              : [fallback]);
      _repeatableConditionalFields[spec.id] = [
        for (final source in blocks)
          {
            for (final field in spec.fields)
              field.key: TextEditingController(text: source[field.key] ?? ''),
          },
      ];
    }
  }

  List<_ConditionalSectionSpec> get _visibleConditionalSpecs {
    final metadata = _pricingMetadataFor(_category, _subcategory);
    if (!metadata.hasPricingBlock) return const [];
    switch (metadata.pricingBlockType) {
      case _PricingBlockType.sessionOptions:
        return [_sessionOptionsSpec];
      case _PricingBlockType.accommodationProgramOptions:
        return [_accommodationPricingSpec];
      case _PricingBlockType.dayCareServiceOptions:
        return [_serviceDeliveryOptionsSpec];
      case _PricingBlockType.programsFees:
        return [_programsFeesSpec];
      case _PricingBlockType.none:
        return const [];
    }
  }

  String? _publishRequirementError() {
    if (_name.text.trim().isEmpty) {
      return 'Name is required before publishing.';
    }
    if (_category.trim().isEmpty) {
      return 'Main Category is required before publishing.';
    }
    if (_phone.text.trim().isEmpty && _whatsApp.text.trim().isEmpty) {
      return 'Add at least one contact method before publishing: Phone or WhatsApp.';
    }
    return null;
  }

  Future<bool> _saveDraft({String message = 'Draft saved.'}) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return false;
    if (!_formKey.currentState!.validate()) return false;
    setState(() {
      _saving = true;
      _message = null;
      _ownerError = null;
    });
    await _CommercialV2Store.saveDraft(uid, _payload());
    if (mounted) {
      setState(() {
        _saving = false;
        _message = message;
      });
    }
    return true;
  }

  Future<void> _preview() async {
    final saved = await _saveDraft(message: 'Draft saved for preview.');
    if (!mounted) return;
    if (!saved) return;
    Navigator.of(context).pushNamed(Routes.commercialV2Preview);
  }

  Future<void> _publish() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    if (!_formKey.currentState!.validate()) return;
    final publishError = _publishRequirementError();
    if (publishError != null) {
      setState(() => _ownerError = publishError);
      return;
    }
    setState(() {
      _saving = true;
      _message = null;
      _ownerError = null;
    });
    await _CommercialV2Store.publish(uid, _payload());
    if (mounted) {
      setState(() {
        _saving = false;
        _message =
            'Creation completed successfully. Your profile has been prepared and will be processed for publication shortly.';
      });
    }
  }

  Future<void> _hide() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    setState(() => _saving = true);
    await _CommercialV2Store.hide(uid);
    if (mounted) {
      setState(() {
        _saving = false;
        _message = 'Profile hidden. Public URL is unavailable.';
      });
    }
  }

  Future<void> _newVersion() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    setState(() => _saving = true);
    final payload = await _CommercialV2Store.createNewVersionDraft(uid);
    _apply(payload);
    if (mounted) {
      setState(() {
        _saving = false;
        _message = 'New draft version created from the live profile.';
      });
    }
  }

  Future<void> _generatePdfProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final snapshot = await _CommercialV2Store.profileDoc(uid).get();
    final data = snapshot.data() ?? <String, dynamic>{};
    final canGenerate = data['isPublished'] == true &&
        data['isHidden'] != true &&
        data['liveProfile'] is Map;
    if (!canGenerate) {
      if (!mounted) return;
      setState(() {
        _ownerError =
            'Submit for Distribution first. PDF generation uses prepared profile data only.';
      });
      return;
    }
    final payload = _ProfilePayload.fromMap(
      _profileMapWithIdentityFallback(_mapValue(data['liveProfile']), data),
    );
    final safeName = _filterKey(payload.name);
    await Printing.layoutPdf(
      name: 'mental_smile_profile_${safeName.isEmpty ? 'live' : safeName}.pdf',
      onLayout: (_) => _CommercialV2PdfBuilder.build(
        payload,
      ),
    );
  }

  Future<void> _generateProfessionalCvPreview() async {
    await _runOutputGeneration(
      outputType: 'cv',
      message: 'Generated CV preview created from draft data.',
      onGenerated: (payload) {
        _generatedCvPayload = payload;
        _generatedCvStyle = _styleInstruction.text.trim();
      },
      recordBuilder: _CommercialOutputRecord.cv,
    );
  }

  Future<void> _generateBusinessCardPreview() async {
    await _runOutputGeneration(
      outputType: 'businessCard',
      message: 'Business card preview generated and registered.',
      onGenerated: (payload) => _businessCardPayload = payload,
      recordBuilder: _CommercialOutputRecord.businessCard,
    );
  }

  Future<void> _exportBusinessCardPdf() async {
    final payload = _businessCardPayload ?? _payload();
    final safeName = _filterKey(payload.name);
    await Printing.layoutPdf(
      name:
          'mental_smile_business_card_${safeName.isEmpty ? 'draft' : safeName}.pdf',
      onLayout: (_) => _CommercialV2BusinessCardPdfBuilder.build(payload),
    );
    await _emitCommercialSignal(
      'commercial_generated',
      details: {'assetType': 'businessCard', 'action': 'export_pdf'},
    );
  }

  Future<void> _generatePromoPostPreview() async {
    await _runOutputGeneration(
      outputType: 'promoPost',
      message: 'Promo post preview generated and registered.',
      onGenerated: (payload) => _promoPostPayload = payload,
      recordBuilder: _CommercialOutputRecord.promoPost,
    );
  }

  Future<void> _exportPromoPostPdf() async {
    final payload = _promoPostPayload ?? _payload();
    final safeName = _filterKey(payload.name);
    await Printing.layoutPdf(
      name:
          'mental_smile_promo_post_${safeName.isEmpty ? 'draft' : safeName}.pdf',
      onLayout: (_) => _CommercialV2PromoPostPdfBuilder.build(payload),
    );
    await _emitCommercialSignal(
      'commercial_generated',
      details: {'assetType': 'promoPost', 'action': 'export_pdf'},
    );
  }

  Future<void> _buildCommercialAssetPackage() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _saving = true;
      _message = null;
      _ownerError = null;
    });
    try {
      final payload = _payload();
      await _CommercialV2Store.saveDraft(uid, payload);
      final package = _CommercialAssetPackage.fromPayload(
        uid: uid,
        payload: payload,
        hasGeneratedCv: _generatedCvPayload != null,
        hasBusinessCard: _businessCardPayload != null,
        hasPromoPost: _promoPostPayload != null,
      );
      await _CommercialV2Store.saveAssetPackage(uid, package);
      await _CommercialV2Store.emitSignal(
        uid,
        _CommercialSignal.created(
          'commercial_generated',
          details: {
            'assetType': 'assetPackage',
            'packageId': package.packageId,
          },
        ),
      );
      if (!mounted) return;
      setState(() {
        _assetPackage = package;
        _saving = false;
        _message = 'Commercial asset package built and registered.';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _ownerError = 'Commercial asset package generation failed: $error';
      });
    }
  }

  Future<void> _runOutputGeneration({
    required String outputType,
    required String message,
    required void Function(_ProfilePayload payload) onGenerated,
    required _CommercialOutputRecord Function(_ProfilePayload payload)
        recordBuilder,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _saving = true;
      _message = null;
      _ownerError = null;
    });
    try {
      final payload = _payload();
      await _CommercialV2Store.saveDraft(uid, payload);
      await _CommercialV2Store.recordOutput(
        uid,
        outputType,
        recordBuilder(payload),
      );
      await _CommercialV2Store.emitSignal(
        uid,
        _CommercialSignal.created(
          'commercial_generated',
          details: {'assetType': outputType, 'action': 'preview_generated'},
        ),
      );
      if (!mounted) return;
      setState(() {
        onGenerated(payload);
        _saving = false;
        _message = message;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _ownerError = 'Commercial output generation failed: $error';
      });
    }
  }

  Future<void> _emitCommercialSignal(
    String type, {
    Map<String, String> details = const {},
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    await _CommercialV2Store.emitSignal(
      uid,
      _CommercialSignal.created(type, details: details),
    );
  }

  Future<void> _downloadGeneratedCvPreviewPdf() async {
    final payload = _generatedCvPayload ?? _payload();
    final safeName = _filterKey(payload.name);
    await Printing.layoutPdf(
      name:
          'mental_smile_preview_cv_${safeName.isEmpty ? 'draft' : safeName}.pdf',
      onLayout: (_) => _CommercialV2MedicalWhitePdfBuilder.build(
        payload,
        previewLabel: 'Preview PDF - not published',
      ),
    );
  }

  void _addSection() {
    setState(() => _sections.add(_CustomSectionControllers()));
  }

  String _ownerText(String en, String ar) => _arabic ? ar : en;

  void _back() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }
    navigator.pushReplacementNamed(Routes.commercialV2Start);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const _CommercialV2Shell(
        title: '',
        subtitle: '',
        showAppBar: false,
        showHeader: false,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    final publicUrl = '${Routes.commercialV2PublicProfilePrefix}/$uid';
    final direction = _arabic ? TextDirection.rtl : TextDirection.ltr;

    return _CommercialV2Shell(
      title: '',
      subtitle: '',
      showAppBar: false,
      showHeader: false,
      maxContentWidth: 1180,
      child: Directionality(
        textDirection: direction,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 72,
          ),
          child: Stack(
            children: [
              const Positioned(
                top: -8,
                left: 78,
                child: _StartLogo(),
              ),
              Positioned(
                top: 24,
                right: 78,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _StartLanguageToggle(
                        arabic: _arabic,
                        onChanged: (value) => setState(() => _arabic = value),
                      ),
                      const SizedBox(width: 22),
                      _OwnerBackButton(
                        label: _ownerText(
                          'Back',
                          '\u0631\u062c\u0648\u0639',
                        ),
                        onPressed: _back,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 190),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 820),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _OwnerActions(
                            saving: _saving,
                            onSave: _saveDraft,
                            onPreview: _preview,
                            onPublish: _publish,
                            onHide: _hide,
                            onNewVersion: _newVersion,
                            onGeneratePdf: _generatePdfProfile,
                            onGenerateCvPreview: _generateProfessionalCvPreview,
                            onGenerateBusinessCard:
                                _generateBusinessCardPreview,
                            onExportBusinessCard: _exportBusinessCardPdf,
                            onGeneratePromoPost: _generatePromoPostPreview,
                            onExportPromoPost: _exportPromoPostPdf,
                            onBuildAssetPackage: _buildCommercialAssetPackage,
                            onOpenPublicUrl: () =>
                                Navigator.of(context).pushNamed(publicUrl),
                            saveLabel: _ownerText(
                              'Edit Profile / Save Draft',
                              '\u062a\u0639\u062f\u064a\u0644 \u0627\u0644\u0645\u0644\u0641 / \u062d\u0641\u0638 \u0645\u0633\u0648\u062f\u0629',
                            ),
                            previewLabel: _ownerText(
                              'Preview Profile',
                              '\u0645\u0639\u0627\u064a\u0646\u0629 \u0627\u0644\u0645\u0644\u0641',
                            ),
                            publishLabel: _ownerText(
                              'Submit For Distribution',
                              '\u0625\u0631\u0633\u0627\u0644 \u0644\u0644\u062a\u0648\u0632\u064a\u0639',
                            ),
                            hideLabel: _ownerText(
                              'Hide Profile',
                              '\u0625\u062e\u0641\u0627\u0621 \u0627\u0644\u0645\u0644\u0641',
                            ),
                            newVersionLabel: _ownerText(
                              'Create New Version',
                              '\u0625\u0646\u0634\u0627\u0621 \u0646\u0633\u062e\u0629 \u062c\u062f\u064a\u062f\u0629',
                            ),
                            generatePdfLabel: _ownerText(
                              'Generate PDF Profile',
                              '\u0625\u0646\u0634\u0627\u0621 PDF \u0644\u0644\u0645\u0644\u0641',
                            ),
                            generateCvPreviewLabel: _ownerText(
                              'Generate Professional CV Preview',
                              '\u0625\u0646\u0634\u0627\u0621 \u0645\u0639\u0627\u064a\u0646\u0629 CV \u0627\u062d\u062a\u0631\u0627\u0641\u064a',
                            ),
                            generateBusinessCardLabel: _ownerText(
                              'Generate Business Card',
                              '\u0625\u0646\u0634\u0627\u0621 \u0643\u0627\u0631\u062a \u0623\u0639\u0645\u0627\u0644',
                            ),
                            exportBusinessCardLabel: _ownerText(
                              'Export Business Card',
                              '\u062a\u0635\u062f\u064a\u0631 \u0643\u0627\u0631\u062a \u0623\u0639\u0645\u0627\u0644',
                            ),
                            generatePromoPostLabel: _ownerText(
                              'Generate Promo Post',
                              '\u0625\u0646\u0634\u0627\u0621 \u0645\u0646\u0634\u0648\u0631 \u062a\u0631\u0648\u064a\u062c\u064a',
                            ),
                            exportPromoPostLabel: _ownerText(
                              'Export Promo Post',
                              '\u062a\u0635\u062f\u064a\u0631 \u0645\u0646\u0634\u0648\u0631 \u062a\u0631\u0648\u064a\u062c\u064a',
                            ),
                            buildAssetPackageLabel: _ownerText(
                              'Build Asset Package',
                              '\u0628\u0646\u0627\u0621 \u062d\u0632\u0645\u0629 \u0627\u0644\u0623\u0635\u0648\u0644',
                            ),
                            openPublicUrlLabel: _ownerText(
                              'Open Public URL',
                              '\u0641\u062a\u062d \u0627\u0644\u0631\u0627\u0628\u0637 \u0627\u0644\u0639\u0627\u0645',
                            ),
                          ),
                          if (_message != null) ...[
                            const SizedBox(height: 12),
                            _Notice(text: _message!),
                          ],
                          if (_ownerError != null) ...[
                            const SizedBox(height: 12),
                            _ErrorNotice(text: _ownerError!),
                          ],
                          const SizedBox(height: 18),
                          _Panel(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _GuidedField(
                                  controller: _name,
                                  label: _ownerText(
                                    'Name',
                                    '\u0627\u0644\u0627\u0633\u0645',
                                  ),
                                  icon: Icons.drive_file_rename_outline,
                                  hint: 'Public profile name',
                                  example:
                                      'Example: Dr. Sara Ahmed or Hope Center',
                                  semanticsLabel: 'Commercial profile name',
                                  textDirection: direction,
                                ),
                                _GuidedDropdownField(
                                  value: _category.isEmpty ? null : _category,
                                  label: _ownerText(
                                    'Main Category',
                                    '\u0627\u0644\u062a\u0635\u0646\u064a\u0641 \u0627\u0644\u0631\u0626\u064a\u0633\u064a',
                                  ),
                                  icon: Icons.category_outlined,
                                  hint:
                                      'Specialist, Center, Educational, Organization',
                                  example: 'Example: Speech Therapist',
                                  options: _dropdownOptions(
                                    _commercialV2MainCategories,
                                    _category,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _category = value ?? '';
                                      final options =
                                          _commercialV2Subcategories[
                                                  _category] ??
                                              const <String>[];
                                      if (!options.contains(_subcategory)) {
                                        _subcategory = '';
                                      }
                                    });
                                  },
                                  semanticsLabel: 'Commercial profile category',
                                  textDirection: direction,
                                ),
                                _GuidedDropdownField(
                                  value: _subcategory.isEmpty
                                      ? null
                                      : _subcategory,
                                  label: _ownerText(
                                    'Subcategory',
                                    '\u0627\u0644\u062a\u0635\u0646\u064a\u0641 \u0627\u0644\u0641\u0631\u0639\u064a',
                                  ),
                                  icon: Icons.account_tree_outlined,
                                  hint: 'Optional filter detail',
                                  example:
                                      'Example: Psychologist or Addiction Center',
                                  options: _dropdownOptions(
                                    _commercialV2Subcategories[_category] ??
                                        const <String>[],
                                    _subcategory,
                                  ),
                                  onChanged: (value) => setState(
                                      () => _subcategory = value ?? ''),
                                  enabled:
                                      (_commercialV2Subcategories[_category]
                                                  ?.isNotEmpty ??
                                              false) ||
                                          _subcategory.isNotEmpty,
                                  semanticsLabel:
                                      'Commercial profile subcategory',
                                  textDirection: direction,
                                ),
                                _GuidedField(
                                  controller: _description,
                                  label: _ownerText(
                                    'Description',
                                    '\u0627\u0644\u0648\u0635\u0641',
                                  ),
                                  icon: Icons.short_text,
                                  hint: 'Short public description',
                                  example:
                                      'Example: I provide speech support for children and families.',
                                  maxLines: 3,
                                  semanticsLabel:
                                      'Commercial profile description',
                                  textDirection: direction,
                                ),
                                _GuidedField(
                                  controller: _location,
                                  label: _ownerText(
                                    'Location',
                                    '\u0627\u0644\u0645\u0648\u0642\u0639',
                                  ),
                                  icon: Icons.place_outlined,
                                  hint: 'City, country, or service area',
                                  example: 'Example: Cairo, Egypt or Online',
                                  semanticsLabel: 'Commercial profile location',
                                  textDirection: direction,
                                ),
                                _GuidedField(
                                  controller: _phone,
                                  label: _ownerText(
                                    'Phone',
                                    '\u0631\u0642\u0645 \u0627\u0644\u0647\u0627\u062a\u0641',
                                  ),
                                  icon: Icons.phone_outlined,
                                  hint: 'Public phone number',
                                  example: 'Example: +201000000000',
                                  keyboardType: TextInputType.phone,
                                  semanticsLabel:
                                      'Commercial profile public phone',
                                  textDirection: direction,
                                ),
                                _GuidedField(
                                  controller: _whatsApp,
                                  label: _ownerText('WhatsApp',
                                      '\u0648\u0627\u062a\u0633\u0627\u0628'),
                                  icon: Icons.chat_outlined,
                                  hint: 'Public WhatsApp number',
                                  example: 'Example: +201000000000',
                                  keyboardType: TextInputType.phone,
                                  semanticsLabel: 'Commercial profile WhatsApp',
                                  textDirection: direction,
                                ),
                                const SizedBox(height: 16),
                                _ExpandableProfilePanel(
                                  icon: Icons.design_services_outlined,
                                  title: _ownerText(
                                    'Services',
                                    '\u0627\u0644\u062e\u062f\u0645\u0627\u062a',
                                  ),
                                  subtitle: '',
                                  child: _GuidedField(
                                    controller: _services,
                                    label: _ownerText(
                                      'Services',
                                      '\u0627\u0644\u062e\u062f\u0645\u0627\u062a',
                                    ),
                                    icon: Icons.design_services_outlined,
                                    hint: 'One service per line',
                                    example:
                                        'Example:\nSpeech assessment\nParent guidance',
                                    maxLines: 5,
                                    semanticsLabel:
                                        'Commercial profile services',
                                    textDirection: direction,
                                  ),
                                ),
                                _ExpandableProfilePanel(
                                  icon: Icons.groups_outlined,
                                  title: _ownerText(
                                    'Audiences',
                                    '\u0627\u0644\u0641\u0626\u0627\u062a \u0627\u0644\u0645\u0633\u062a\u0647\u062f\u0641\u0629',
                                  ),
                                  subtitle: '',
                                  child: _GuidedField(
                                    controller: _audiences,
                                    label: _ownerText(
                                      'Audiences',
                                      '\u0627\u0644\u0641\u0626\u0627\u062a \u0627\u0644\u0645\u0633\u062a\u0647\u062f\u0641\u0629',
                                    ),
                                    icon: Icons.groups_outlined,
                                    hint: 'One audience per line',
                                    example:
                                        'Example:\nChildren\nFamilies\nSchools',
                                    maxLines: 4,
                                    semanticsLabel:
                                        'Commercial profile audiences',
                                    textDirection: direction,
                                  ),
                                ),
                                _ExpandableProfilePanel(
                                  icon: Icons.link,
                                  title: _ownerText(
                                    'Links',
                                    '\u0627\u0644\u0631\u0648\u0627\u0628\u0637',
                                  ),
                                  subtitle: '',
                                  child: _GuidedField(
                                    controller: _links,
                                    label: _ownerText(
                                      'Links',
                                      '\u0627\u0644\u0631\u0648\u0627\u0628\u0637',
                                    ),
                                    icon: Icons.link,
                                    hint: 'One public link per line',
                                    example: 'Example:\nhttps://example.com',
                                    maxLines: 4,
                                    semanticsLabel: 'Commercial profile links',
                                    textDirection: direction,
                                  ),
                                ),
                                _ExpandableProfilePanel(
                                  icon: Icons.photo_library_outlined,
                                  title: _ownerText(
                                    'Identity Image',
                                    '\u0635\u0648\u0631\u0629 \u0627\u0644\u0647\u0648\u064a\u0629',
                                  ),
                                  subtitle: _ownerText(
                                    'Optional later during design/publication',
                                    '\u0627\u062e\u062a\u064a\u0627\u0631\u064a\u0629 \u0644\u0627\u062d\u0642\u0627 \u0623\u062b\u0646\u0627\u0621 \u0627\u0644\u062a\u0635\u0645\u064a\u0645 \u0623\u0648 \u0627\u0644\u0646\u0634\u0631',
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      _Notice(
                                        text: _ownerText(
                                          'Image/logo is not required now. Commercial V2 prepares a text profile package; visual assets can be added later during design or publication.',
                                          '\u0627\u0644\u0635\u0648\u0631\u0629 \u0623\u0648 \u0627\u0644\u0634\u0639\u0627\u0631 \u063a\u064a\u0631 \u0645\u0637\u0644\u0648\u0628\u064a\u0646 \u0627\u0644\u0622\u0646. Commercial V2 \u064a\u062c\u0647\u0632 \u062d\u0632\u0645\u0629 \u0628\u064a\u0627\u0646\u0627\u062a \u0646\u0635\u064a\u0629\u060c \u0648\u064a\u0645\u0643\u0646 \u0625\u0636\u0627\u0641\u0629 \u0627\u0644\u0623\u0635\u0648\u0644 \u0627\u0644\u0628\u0635\u0631\u064a\u0629 \u0644\u0627\u062d\u0642\u0627 \u0623\u062b\u0646\u0627\u0621 \u0627\u0644\u062a\u0635\u0645\u064a\u0645 \u0623\u0648 \u0627\u0644\u0646\u0634\u0631.',
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Divider(
                                          color: _commercialGoldMuted),
                                      _GuidedField(
                                        controller: _facebookMediaLink,
                                        label: 'Facebook photos/post link',
                                        icon: Icons.facebook,
                                        hint: 'External media link only',
                                        example:
                                            'Example: https://facebook.com/...',
                                        semanticsLabel:
                                            'Facebook photos or post link',
                                        textDirection: direction,
                                      ),
                                      _GuidedField(
                                        controller: _youtubeMediaLink,
                                        label: 'YouTube video link',
                                        icon: Icons.play_circle_outline,
                                        hint: 'External video link only',
                                        example:
                                            'Example: https://youtube.com/...',
                                        semanticsLabel: 'YouTube video link',
                                        textDirection: direction,
                                      ),
                                      _GuidedField(
                                        controller: _instagramLink,
                                        label: 'Instagram link',
                                        icon: Icons.camera_alt_outlined,
                                        hint: 'External media link only',
                                        example:
                                            'Example: https://instagram.com/...',
                                        semanticsLabel: 'Instagram link',
                                        textDirection: direction,
                                      ),
                                      _GuidedField(
                                        controller: _websiteGalleryLink,
                                        label: 'Website gallery link',
                                        icon: Icons.collections_outlined,
                                        hint: 'External gallery link only',
                                        example:
                                            'Example: https://example.com/gallery',
                                        semanticsLabel: 'Website gallery link',
                                        textDirection: direction,
                                      ),
                                    ],
                                  ),
                                ),
                                _ExpandableProfilePanel(
                                  icon: Icons.auto_awesome_outlined,
                                  title: _ownerText(
                                    'Generated CV / Profile',
                                    '\u0645\u0639\u0627\u064a\u0646\u0629 CV / \u0645\u0644\u0641 \u0627\u062d\u062a\u0631\u0627\u0641\u064a',
                                  ),
                                  subtitle: _ownerText(
                                    'Real draft-based generated layout',
                                    '\u062a\u0635\u0645\u064a\u0645 \u0641\u0639\u0644\u064a \u0645\u0646 \u0628\u064a\u0627\u0646\u0627\u062a \u0627\u0644\u0645\u0633\u0648\u062f\u0629',
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      _GuidedField(
                                        controller: _styleInstruction,
                                        label: _ownerText(
                                          'Describe the style you want',
                                          '\u0627\u0643\u062a\u0628 \u0634\u0643\u0644 \u0623\u0648 \u0633\u062a\u0627\u064a\u0644 \u0627\u0644\u0635\u0641\u062d\u0629 \u0627\u0644\u062a\u064a \u062a\u0631\u064a\u062f\u0647\u0627',
                                        ),
                                        icon: Icons.palette_outlined,
                                        hint: 'Template selector',
                                        example:
                                            'Example: professional medical white background',
                                        maxLines: 3,
                                        semanticsLabel:
                                            'Commercial generated CV style instruction',
                                        textDirection: direction,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        _ownerText(
                                          'Selected template: Medical White',
                                          '\u0627\u0644\u0642\u0627\u0644\u0628 \u0627\u0644\u0645\u062e\u062a\u0627\u0631: \u0637\u0628\u064a \u0623\u0628\u064a\u0636',
                                        ),
                                        style: const TextStyle(
                                          color: _commercialSilverMuted,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                for (final spec in _visibleConditionalSpecs)
                                  _ConditionalProfilePanel(
                                    spec: spec,
                                    arabic: _arabic,
                                    textDirection: direction,
                                    controllerFor: _conditionalController,
                                    repeatableBlocks: _repeatableBlocks,
                                    repeatableController: _repeatableController,
                                    onAddRepeatableBlock: _addRepeatableBlock,
                                    onRemoveRepeatableBlock:
                                        _removeRepeatableBlock,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          _ExpandableProfilePanel(
                            icon: Icons.view_agenda_outlined,
                            title: _ownerText(
                              'Custom Sections',
                              '\u0627\u0644\u0623\u0642\u0633\u0627\u0645 \u0627\u0644\u0625\u0636\u0627\u0641\u064a\u0629',
                            ),
                            subtitle: '',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                for (var i = 0; i < _sections.length; i++)
                                  _CustomSectionEditor(
                                    index: i,
                                    controllers: _sections[i],
                                    onRemove: () {
                                      final removed = _sections.removeAt(i);
                                      removed.dispose();
                                      setState(() {});
                                    },
                                  ),
                                OutlinedButton.icon(
                                  onPressed: _addSection,
                                  icon: const Icon(Icons.add),
                                  label: Text(
                                    _ownerText(
                                      'Add Section',
                                      '\u0625\u0636\u0627\u0641\u0629 \u0642\u0633\u0645',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          _OfficialNetworkSection(
                            title: _ownerText(
                              'Official Network',
                              '\u0627\u0644\u0634\u0628\u0643\u0629 \u0627\u0644\u0631\u0633\u0645\u064a\u0629',
                            ),
                            professionalsLabel: _ownerText(
                              'Professionals Community',
                              '\u0645\u062c\u062a\u0645\u0639 \u0627\u0644\u0623\u062e\u0635\u0627\u0626\u064a\u064a\u0646',
                            ),
                            centersLabel: _ownerText(
                              'Centers Community',
                              '\u0645\u062c\u062a\u0645\u0639 \u0627\u0644\u0645\u0631\u0627\u0643\u0632',
                            ),
                            clientsLabel: _ownerText(
                              'Clients Community',
                              '\u0645\u062c\u062a\u0645\u0639 \u0627\u0644\u0639\u0645\u0644\u0627\u0621',
                            ),
                            supportLabel: _ownerText(
                              'Complaints & Support',
                              '\u0627\u0644\u0634\u0643\u0627\u0648\u0649 \u0648\u0627\u0644\u062f\u0639\u0645',
                            ),
                          ),
                          if (_generatedCvPayload != null) ...[
                            const SizedBox(height: 18),
                            _GeneratedCvPreview(
                              payload: _generatedCvPayload!,
                              localImageBytes: null,
                              styleInstruction: _generatedCvStyle,
                              onPrintPdf: _downloadGeneratedCvPreviewPdf,
                              pdfLabel: _ownerText(
                                'Download / Print PDF',
                                '\u062a\u0646\u0632\u064a\u0644 / \u0637\u0628\u0627\u0639\u0629 PDF',
                              ),
                            ),
                          ],
                          if (_businessCardPayload != null) ...[
                            const SizedBox(height: 18),
                            _BusinessCardPreview(
                              payload: _businessCardPayload!,
                              onExport: _exportBusinessCardPdf,
                              exportLabel: _ownerText(
                                'Export PDF',
                                '\u062a\u0635\u062f\u064a\u0631 PDF',
                              ),
                            ),
                          ],
                          if (_promoPostPayload != null) ...[
                            const SizedBox(height: 18),
                            _PromoPostPreview(
                              payload: _promoPostPayload!,
                              onExport: _exportPromoPostPdf,
                              exportLabel: _ownerText(
                                'Export PDF',
                                '\u062a\u0635\u062f\u064a\u0631 PDF',
                              ),
                            ),
                          ],
                          if (_assetPackage != null) ...[
                            const SizedBox(height: 18),
                            _AssetPackagePreview(package: _assetPackage!),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommercialV2PreviewPage extends StatelessWidget {
  const CommercialV2PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return const CommercialV2StartPage();
    }
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: _CommercialV2Store.profileDoc(uid).snapshots(),
      builder: (context, snapshot) {
        final data = snapshot.data?.data() ?? <String, dynamic>{};
        final payload = _ProfilePayload.fromMap(
          _profileMapWithIdentityFallback(
              _mapValue(data['draftProfile']), data),
        );
        debugPrint(
          'Commercial V2 identity image: preview rendering from draft URL | url=${_resolveIdentityImageUrl(payload)}',
        );
        debugPrint(
          'Commercial V2 public identity preview URL | url=${_resolveIdentityImageUrl(payload)}',
        );
        return _CommercialV2Shell(
          title: 'Preview Profile',
          subtitle: 'Read-only preview of the draft before publishing.',
          actions: [
            TextButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.edit_outlined),
              label: const Text('Back to Edit'),
            ),
          ],
          child: _PublicProfileView(
            payload: payload,
            isPreview: true,
            isPublished: data['isPublished'] == true,
          ),
        );
      },
    );
  }
}

class CommercialV2PublicProfilePage extends StatelessWidget {
  const CommercialV2PublicProfilePage({
    super.key,
    required this.profileId,
  });

  final String profileId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: _CommercialV2Store.profileDoc(profileId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _CommercialV2Shell(
            title: '',
            subtitle: '',
            showHeader: false,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final data = snapshot.data?.data();
        final visible = data != null &&
            data['isPublished'] == true &&
            data['isHidden'] != true &&
            data['liveProfile'] is Map;
        if (!visible) {
          return const _CommercialV2Shell(
            title: '',
            subtitle: '',
            showHeader: false,
            child: _Panel(
              child: Text(
                'Profile unavailable. This public profile is hidden or not published yet.',
              ),
            ),
          );
        }

        final payload = _ProfilePayload.fromMap(
          _profileMapWithIdentityFallback(_mapValue(data['liveProfile']), data),
        );
        return _CommercialV2Shell(
          title: '',
          subtitle: '',
          showHeader: false,
          child: _PublicProfileView(payload: payload),
        );
      },
    );
  }
}

class _PublicProfileView extends StatelessWidget {
  const _PublicProfileView({
    required this.payload,
    this.isPreview = false,
    this.isPublished = false,
  });

  final _ProfilePayload payload;
  final bool isPreview;
  final bool isPublished;

  String _previewNotice(BuildContext context) {
    final isAr =
        Localizations.localeOf(context).languageCode.toLowerCase() == 'ar';
    if (isPublished) {
      return isAr
          ? 'وضع المعاينة: هذا الملف منشور بالفعل والرابط العام يعمل.'
          : 'Preview mode: this profile is already published. Public URL is live.';
    }
    return isAr
        ? 'وضع المعاينة: هذه المسودة غير منشورة حتى يتم النشر.'
        : 'Preview mode: this draft is not public until published.';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              constraints: const BoxConstraints(minHeight: 210),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: _commercialGlass,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _commercialGoldMuted),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _CommercialV2IdentityImage(
                    payload: payload,
                    sourceBranch: isPreview
                        ? 'preview rendering from draft URL'
                        : 'public profile rendering from live URL',
                    width: 76,
                    height: 76,
                    circular: true,
                    backgroundColor: const Color(0xFFE0C174),
                    borderColor: const Color(0xFFE0C174),
                    showInitialFallback: true,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    payload.name.isEmpty ? 'Untitled Profile' : payload.name,
                    style: const TextStyle(
                      color: _commercialSilver,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    payload.categoryLabel,
                    style: const TextStyle(
                      color: _commercialGold,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            if (isPreview) ...[
              const SizedBox(height: 12),
              _Notice(
                text: _previewNotice(context),
              ),
            ],
            const SizedBox(height: 18),
            _Panel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (payload.hasExternalMediaLinks)
                    _ProfileSection(
                      icon: Icons.photo_library_outlined,
                      title: 'Media & Identity',
                      child: _ProfileMediaBlock(
                        payload: payload,
                        sourceBranch: isPreview
                            ? 'preview rendering from draft URL'
                            : 'public profile rendering from live URL',
                      ),
                    ),
                  if (payload.description.isNotEmpty)
                    _ProfileSection(
                      icon: Icons.info_outline,
                      title: 'About',
                      child: Text(payload.description),
                    ),
                  if (payload.services.isNotEmpty)
                    _ProfileSection(
                      icon: Icons.design_services_outlined,
                      title: 'Services',
                      child: _BulletList(items: payload.services),
                    ),
                  if (payload.audiences.isNotEmpty)
                    _ProfileSection(
                      icon: Icons.groups_outlined,
                      title: 'Audiences',
                      child: _BulletList(items: payload.audiences),
                    ),
                  if (payload.hasContactInfo)
                    _ProfileSection(
                      icon: Icons.contact_phone_outlined,
                      title: 'Contacts',
                      child: _ContactBlock(payload: payload),
                    ),
                  if (payload.links.isNotEmpty)
                    _ProfileSection(
                      icon: Icons.link,
                      title: 'Links',
                      child: _LinkList(items: payload.links),
                    ),
                  for (final section in payload.publishedConditionalSections)
                    _ProfileSection(
                      icon: Icons.info_outline,
                      title: section.title,
                      child: Text(section.content),
                    ),
                  for (final section in payload.customSections)
                    if (section.title.isNotEmpty || section.content.isNotEmpty)
                      _ProfileSection(
                        icon: Icons.article_outlined,
                        title: section.title.isEmpty
                            ? 'Additional Information'
                            : section.title,
                        child: Text(section.content),
                      ),
                  const _ProfileSection(
                    icon: Icons.policy_outlined,
                    title: 'Notices',
                    child: Text(
                      'Mental Smile provides publishing and discovery only. Mental Smile does not verify, rank, recommend, book, or manage payments.',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GeneratedCvPreview extends StatelessWidget {
  const _GeneratedCvPreview({
    required this.payload,
    required this.localImageBytes,
    required this.styleInstruction,
    required this.onPrintPdf,
    required this.pdfLabel,
  });

  final _ProfilePayload payload;
  final Uint8List? localImageBytes;
  final String styleInstruction;
  final VoidCallback onPrintPdf;
  final String pdfLabel;

  @override
  Widget build(BuildContext context) {
    final sections = payload.publishedConditionalSections;
    final selectedTemplate = _commercialV2GeneratedCvTemplate(styleInstruction);

    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome_outlined, color: _commercialGold),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Generated CV / Profile Preview',
                  style: TextStyle(
                    color: _commercialGold,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: onPrintPdf,
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: Text(pdfLabel),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const _Notice(
            text:
                'Selected template: Medical White. Preview PDF - not published.',
          ),
          if (styleInstruction.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              'Style request mapped to $selectedTemplate: $styleInstruction',
              style: const TextStyle(
                color: _commercialSilverMuted,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          const SizedBox(height: 18),
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFF7FAFA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFB9D6D2)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x66000000),
                  blurRadius: 22,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF4F2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF8EBDB5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CommercialV2IdentityImage(
                            payload: payload,
                            localImageBytes: localImageBytes,
                            sourceBranch: 'generated CV preview',
                            width: 128,
                            height: 128,
                            borderRadius: 8,
                            backgroundColor: Colors.white,
                            borderColor: const Color(0xFF8EBDB5),
                            fallbackIcon: Icons.medical_information_outlined,
                            fallbackIconColor: const Color(0xFF28766F),
                            fallbackIconSize: 46,
                          ),
                          const SizedBox(width: 22),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  payload.name.isEmpty
                                      ? 'Untitled Profile'
                                      : payload.name,
                                  style: const TextStyle(
                                    color: Color(0xFF163A43),
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  payload.categoryLabel,
                                  style: const TextStyle(
                                    color: Color(0xFF28766F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                if (payload.location.isNotEmpty) ...[
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xFF427B86),
                                        size: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          payload.location,
                                          style: const TextStyle(
                                            color: Color(0xFF44535A),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (payload.description.isNotEmpty)
                    _GeneratedCvSection(
                      title: 'About',
                      child: Text(payload.description),
                    ),
                  if (payload.services.isNotEmpty)
                    _GeneratedCvSection(
                      title: 'Services',
                      child: _BulletList(items: payload.services),
                    ),
                  if (payload.audiences.isNotEmpty)
                    _GeneratedCvSection(
                      title: 'Audiences',
                      child: _BulletList(items: payload.audiences),
                    ),
                  if (payload.hasContactInfo)
                    _GeneratedCvSection(
                      title: 'Contact',
                      child: _GeneratedCvContact(payload: payload),
                    ),
                  if (payload.links.isNotEmpty)
                    _GeneratedCvSection(
                      title: 'Links',
                      child: _GeneratedCvLinkList(items: payload.links),
                    ),
                  for (final section in sections)
                    _GeneratedCvSection(
                      title: section.title,
                      child: Text(section.content),
                    ),
                  for (final section in payload.customSections)
                    if (section.title.isNotEmpty || section.content.isNotEmpty)
                      _GeneratedCvSection(
                        title: section.title.isEmpty
                            ? 'Additional Information'
                            : section.title,
                        child: Text(section.content),
                      ),
                  const SizedBox(height: 12),
                  const Text(
                    'Mental Smile provides publishing and discovery only. It does not verify, rank, recommend, book, or manage payments.',
                    style: TextStyle(
                      color: Color(0xFF5D6B70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BusinessCardPreview extends StatelessWidget {
  const _BusinessCardPreview({
    required this.payload,
    required this.onExport,
    required this.exportLabel,
  });

  final _ProfilePayload payload;
  final VoidCallback onExport;
  final String exportLabel;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(Icons.badge_outlined, color: _commercialGold),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Business Card Preview',
                  style: TextStyle(
                    color: _commercialGold,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: onExport,
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: Text(exportLabel),
              ),
            ],
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 1.75,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFE0C174),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _commercialGoldMuted),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Row(
                  children: [
                    _CommercialV2IdentityImage(
                      payload: payload,
                      width: 86,
                      height: 86,
                      circular: true,
                      backgroundColor: _commercialBlack,
                      borderColor: _commercialBlack,
                      fallbackIconColor: _commercialGold,
                      showInitialFallback: true,
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            payload.name.isEmpty
                                ? 'Untitled Commercial Profile'
                                : payload.name,
                            style: const TextStyle(
                              color: _commercialBlack,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            payload.categoryLabel,
                            style: const TextStyle(
                              color: _commercialObsidian,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (payload.phone.isNotEmpty)
                            Text(
                              payload.phone,
                              style: const TextStyle(
                                color: _commercialObsidian,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          if (payload.location.isNotEmpty)
                            Text(
                              payload.location,
                              style: const TextStyle(
                                color: _commercialObsidian,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoPostPreview extends StatelessWidget {
  const _PromoPostPreview({
    required this.payload,
    required this.onExport,
    required this.exportLabel,
  });

  final _ProfilePayload payload;
  final VoidCallback onExport;
  final String exportLabel;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(Icons.campaign_outlined, color: _commercialGold),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Promo Post Preview',
                  style: TextStyle(
                    color: _commercialGold,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: onExport,
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: Text(exportLabel),
              ),
            ],
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: _commercialObsidian,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _commercialGoldMuted),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _CommercialV2IdentityImage(
                          payload: payload,
                          width: 72,
                          height: 72,
                          circular: true,
                          backgroundColor: _commercialGold,
                          borderColor: _commercialGold,
                          showInitialFallback: true,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            payload.categoryLabel,
                            style: const TextStyle(
                              color: _commercialGold,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      payload.name.isEmpty
                          ? 'New Mental Smile Commercial Profile'
                          : payload.name,
                      style: const TextStyle(
                        color: _commercialSilver,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      payload.description.isEmpty
                          ? 'Commercial profile prepared for future Marketing distribution.'
                          : payload.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: _commercialSilverMuted,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Prepared by Mental Smile',
                      style: TextStyle(
                        color: _commercialGold,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AssetPackagePreview extends StatelessWidget {
  const _AssetPackagePreview({required this.package});

  final _CommercialAssetPackage package;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.inventory_2_outlined, color: _commercialGold),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Commercial Asset Package',
                  style: TextStyle(
                    color: _commercialGold,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('Package ID: ${package.packageId}'),
          Text('Version: ${package.version}'),
          Text('Classification: ${package.classification}'),
          const SizedBox(height: 12),
          _BulletList(items: package.contents),
        ],
      ),
    );
  }
}

class _GeneratedCvSection extends StatelessWidget {
  const _GeneratedCvSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1F6972),
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Container(height: 2, width: 54, color: const Color(0xFF9BCBC3)),
          const SizedBox(height: 9),
          DefaultTextStyle(
            style: const TextStyle(
              color: Color(0xFF26383E),
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _GeneratedCvContact extends StatelessWidget {
  const _GeneratedCvContact({required this.payload});

  final _ProfilePayload payload;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        if (payload.phone.isNotEmpty)
          _GeneratedCvPill(icon: Icons.phone_outlined, text: payload.phone),
        if (payload.whatsApp.isNotEmpty)
          _GeneratedCvPill(icon: Icons.chat_outlined, text: payload.whatsApp),
        if (payload.location.isNotEmpty)
          _GeneratedCvPill(
            icon: Icons.location_on_outlined,
            text: payload.location,
          ),
      ],
    );
  }
}

class _GeneratedCvLinkList extends StatelessWidget {
  const _GeneratedCvLinkList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final item in items)
          _GeneratedCvPill(icon: Icons.link_outlined, text: item),
      ],
    );
  }
}

class _GeneratedCvPill extends StatelessWidget {
  const _GeneratedCvPill({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4F2),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFB9D6D2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 17, color: const Color(0xFF28766F)),
            const SizedBox(width: 7),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF26383E),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommercialV2Store {
  const _CommercialV2Store._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const collectionName = 'commercial_v2_profiles';

  static DocumentReference<Map<String, dynamic>> profileDoc(String uid) {
    return _firestore.collection(collectionName).doc(uid);
  }

  static Future<void> ensureProfileShell({
    required String ownerUid,
    String email = '',
    String phone = '',
  }) async {
    final ref = profileDoc(ownerUid);
    final snapshot = await ref.get();
    if (snapshot.exists) {
      final updates = <String, dynamic>{
        'updatedAt': FieldValue.serverTimestamp(),
      };
      if (email.isNotEmpty) updates['accountEmail'] = email;
      if (phone.isNotEmpty) updates['accountPhone'] = phone;
      await ref.set(updates, SetOptions(merge: true));
      return;
    }

    final draft = _ProfilePayload(phone: phone).toMap();
    await ref.set({
      'ownerUid': ownerUid,
      'accountEmail': email,
      'accountPhone': phone,
      'draftProfile': draft,
      'liveProfile': null,
      'isPublished': false,
      'isHidden': true,
      'publicProfileId': ownerUid,
      'version': 0,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    await emitSignal(
      ownerUid,
      _CommercialSignal.created('commercial_created'),
    );
  }

  static Future<void> saveDraft(String uid, _ProfilePayload payload) async {
    final snapshot = await profileDoc(uid).get();
    final data = snapshot.data() ?? <String, dynamic>{};
    final existingDraft = _profileMapWithIdentityFallback(
      _mapValue(data['draftProfile']),
      data,
    );
    final draftMap = payload.toMap();
    for (final key in ['profileImageUrl', 'logoImageUrl']) {
      final incomingValue = _normalizeImageUrl(draftMap[key]);
      if (incomingValue.isEmpty) {
        draftMap[key] = _normalizeImageUrl(existingDraft[key]);
      }
    }
    await profileDoc(uid).set({
      'draftProfile': draftMap,
      if (_normalizeImageUrl(payload.profileImageUrl).isNotEmpty)
        'profileImageUrl': payload.profileImageUrl,
      if (_normalizeImageUrl(payload.logoImageUrl).isNotEmpty)
        'logoImageUrl': payload.logoImageUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
    await emitSignal(
      uid,
      _CommercialSignal.created(
        'commercial_updated',
        details: {'action': 'draft_saved'},
      ),
    );
  }

  static Future<void> updateIdentityImageUrl(
    String uid, {
    required String profileImageUrl,
    required String logoImageUrl,
  }) async {
    final snapshot = await profileDoc(uid).get();
    final data = snapshot.data() ?? <String, dynamic>{};
    final draft = _ProfilePayload.fromMap(
      _profileMapWithIdentityFallback(_mapValue(data['draftProfile']), data),
      fallbackPhone: (data['accountPhone'] ?? '').toString(),
    );
    final updated = _ProfilePayload(
      name: draft.name,
      category: draft.category,
      subcategory: draft.subcategory,
      description: draft.description,
      services: draft.services,
      audiences: draft.audiences,
      location: draft.location,
      phone: draft.phone,
      whatsApp: draft.whatsApp,
      links: draft.links,
      profileImageUrl:
          profileImageUrl.isNotEmpty ? profileImageUrl : draft.profileImageUrl,
      logoImageUrl: logoImageUrl.isNotEmpty ? logoImageUrl : draft.logoImageUrl,
      facebookMediaLink: draft.facebookMediaLink,
      youtubeMediaLink: draft.youtubeMediaLink,
      instagramLink: draft.instagramLink,
      websiteGalleryLink: draft.websiteGalleryLink,
      styleInstruction: draft.styleInstruction,
      conditionalSections: draft.conditionalSections,
      repeatableConditionalSections: draft.repeatableConditionalSections,
      customSections: draft.customSections,
    );
    await profileDoc(uid).set({
      'draftProfile': updated.toMap(),
      if (profileImageUrl.isNotEmpty) 'profileImageUrl': profileImageUrl,
      if (logoImageUrl.isNotEmpty) 'logoImageUrl': logoImageUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<void> publish(String uid, _ProfilePayload payload) async {
    final ref = profileDoc(uid);
    final snapshot = await ref.get();
    final data = snapshot.data() ?? <String, dynamic>{};
    final currentLive = data['liveProfile'];
    final version = ((data['version'] as num?)?.toInt() ?? 0) + 1;

    if (currentLive is Map) {
      await ref.collection('versions').doc('v${version - 1}').set({
        'profile': Map<String, dynamic>.from(currentLive),
        'archivedAt': FieldValue.serverTimestamp(),
        'reason': 'publish_replaced_live_profile',
      });
      await emitSignal(
        uid,
        _CommercialSignal.created(
          'commercial_archived',
          details: {'archivedVersion': 'v${version - 1}'},
        ),
      );
    }

    await ref.set({
      'draftProfile': payload.toMap(),
      'liveProfile': payload.toMap(),
      'profileImageUrl': payload.profileImageUrl,
      'logoImageUrl': payload.logoImageUrl,
      'isPublished': true,
      'isHidden': false,
      'publicProfileId': uid,
      'version': version,
      'publishedAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
    await emitSignal(
      uid,
      _CommercialSignal.created(
        'commercial_submitted',
        details: {'profileVersion': version.toString()},
      ),
    );
  }

  static Future<void> recordOutput(
    String uid,
    String outputType,
    _CommercialOutputRecord record,
  ) async {
    await profileDoc(uid).set({
      'commercialOutputs': {outputType: record.toMap()},
      'commercialOutputRegistry': {
        outputType: {
          'status': 'GENERATED',
          'outputType': outputType,
          'updatedAt': FieldValue.serverTimestamp(),
          'storageContract':
              'Stored as Commercial V2 output metadata on the provider profile document; exported files are operator-download artifacts until Archive/Marketing automation exists.',
        },
      },
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<void> saveAssetPackage(
    String uid,
    _CommercialAssetPackage package,
  ) async {
    await profileDoc(uid).set({
      'commercialAssetPackage': package.toMap(),
      'commercialTextProfilePackage': package.textProfilePackage,
      'commercialAiGenerationHandoffPackage':
          package.aiGenerationHandoffPackage,
      'commercialOutputRegistry': {
        'assetPackage': {
          'status': 'GENERATED',
          'outputType': 'assetPackage',
          'packageId': package.packageId,
          'version': package.version,
          'classification': package.classification,
          'updatedAt': FieldValue.serverTimestamp(),
        },
      },
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<void> emitSignal(
    String uid,
    _CommercialSignal signal,
  ) async {
    await profileDoc(uid).set({
      'commercialSignals': FieldValue.arrayUnion([signal.toMap()]),
      'commercialSignalRegistry': {
        signal.type: {
          'status': 'EMITTED',
          'lastSignalId': signal.signalId,
          'lastUpdatedAt': FieldValue.serverTimestamp(),
        },
      },
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<void> hide(String uid) async {
    await profileDoc(uid).set({
      'isHidden': true,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
    await emitSignal(
      uid,
      _CommercialSignal.created('commercial_updated',
          details: {'action': 'profile_hidden'}),
    );
  }

  static Future<_ProfilePayload> createNewVersionDraft(String uid) async {
    final snapshot = await profileDoc(uid).get();
    final data = snapshot.data() ?? <String, dynamic>{};
    final live = _mapValue(data['liveProfile']);
    final draft = live.isEmpty ? _mapValue(data['draftProfile']) : live;
    final payload = _ProfilePayload.fromMap(draft);
    await saveDraft(uid, payload);
    return payload;
  }
}

class _CommercialV2BusinessCardPdfBuilder {
  const _CommercialV2BusinessCardPdfBuilder._();

  static Future<Uint8List> build(_ProfilePayload payload) async {
    final pdf = pw.Document(
      title: 'Mental Smile Business Card',
      author: 'Mental Smile',
      creator: 'Mental Smile Commercial V2',
    );
    final identityImage = await _pdfIdentityImage(payload);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a6.landscape,
        margin: const pw.EdgeInsets.all(18),
        build: (context) => pw.Container(
          padding: const pw.EdgeInsets.all(18),
          decoration: pw.BoxDecoration(
            color: PdfColors.amber100,
            border: pw.Border.all(color: PdfColors.amber800, width: 1.2),
          ),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Container(
                width: 62,
                height: 62,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1),
                  shape: pw.BoxShape.circle,
                  color: PdfColors.white,
                ),
                child: identityImage == null
                    ? pw.Center(
                        child: pw.Text(
                          _pdfInitials(payload),
                          style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      )
                    : pw.Image(identityImage, fit: pw.BoxFit.cover),
              ),
              pw.SizedBox(width: 16),
              pw.Expanded(
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      payload.name.isEmpty
                          ? 'Untitled Commercial Profile'
                          : payload.name,
                      style: pw.TextStyle(
                        fontSize: 19,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      payload.categoryLabel,
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                    pw.SizedBox(height: 10),
                    if (payload.phone.isNotEmpty)
                      pw.Text('Phone: ${payload.phone}'),
                    if (payload.whatsApp.isNotEmpty)
                      pw.Text('WhatsApp: ${payload.whatsApp}'),
                    if (payload.location.isNotEmpty)
                      pw.Text('Location: ${payload.location}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return pdf.save();
  }
}

class _CommercialV2PromoPostPdfBuilder {
  const _CommercialV2PromoPostPdfBuilder._();

  static Future<Uint8List> build(_ProfilePayload payload) async {
    final pdf = pw.Document(
      title: 'Mental Smile Promo Post',
      author: 'Mental Smile',
      creator: 'Mental Smile Commercial V2',
    );
    final identityImage = await _pdfIdentityImage(payload);

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(720, 720),
        margin: pw.EdgeInsets.zero,
        build: (context) => pw.Container(
          padding: const pw.EdgeInsets.all(34),
          color: PdfColors.black,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                children: [
                  pw.Container(
                    width: 72,
                    height: 72,
                    decoration: const pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      color: PdfColors.amber100,
                    ),
                    child: identityImage == null
                        ? pw.Center(
                            child: pw.Text(
                              _pdfInitials(payload),
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 20,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          )
                        : pw.Image(identityImage, fit: pw.BoxFit.cover),
                  ),
                  pw.SizedBox(width: 16),
                  pw.Expanded(
                    child: pw.Text(
                      payload.categoryLabel,
                      style: pw.TextStyle(
                        color: PdfColors.amber600,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Spacer(),
              pw.Text(
                payload.name.isEmpty
                    ? 'New Mental Smile Commercial Profile'
                    : payload.name,
                style: pw.TextStyle(
                  color: PdfColors.white,
                  fontSize: 34,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Text(
                payload.description.isEmpty
                    ? 'Commercial profile prepared for future Marketing distribution.'
                    : payload.description,
                maxLines: 5,
                style: const pw.TextStyle(
                  color: PdfColors.grey300,
                  fontSize: 14,
                  lineSpacing: 4,
                ),
              ),
              pw.Spacer(),
              pw.Text(
                'Prepared by Mental Smile',
                style: pw.TextStyle(
                  color: PdfColors.amber600,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return pdf.save();
  }
}

class _CommercialV2PdfBuilder {
  const _CommercialV2PdfBuilder._();

  static Future<Uint8List> build(
    _ProfilePayload payload, {
    String? previewLabel,
    Uint8List? localImageBytes,
  }) async {
    final pdf = pw.Document(
      title: payload.name.isEmpty ? 'Mental Smile Profile' : payload.name,
      author: 'Mental Smile',
      creator: 'Mental Smile Commercial V2',
    );
    final identityImage = await _pdfIdentityImage(payload);

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          margin: const pw.EdgeInsets.all(34),
        ),
        build: (context) => [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                width: 76,
                height: 76,
                decoration: pw.BoxDecoration(
                  color: PdfColors.amber50,
                  border: pw.Border.all(color: PdfColors.amber800, width: 1),
                ),
                child: identityImage == null
                    ? pw.Center(
                        child: pw.Text(
                          _pdfInitials(payload),
                          style: pw.TextStyle(
                            color: PdfColors.amber900,
                            fontSize: 22,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      )
                    : pw.Image(identityImage, fit: pw.BoxFit.cover),
              ),
              pw.SizedBox(width: 16),
              pw.Expanded(
                child: pw.Container(
                  padding: const pw.EdgeInsets.only(bottom: 14),
                  decoration: const pw.BoxDecoration(
                    border: pw.Border(
                      bottom:
                          pw.BorderSide(color: PdfColors.amber800, width: 1.2),
                    ),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        payload.name.isEmpty
                            ? 'Untitled Profile'
                            : payload.name,
                        style: pw.TextStyle(
                          fontSize: 26,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 6),
                      pw.Text(
                        payload.categoryLabel,
                        style: const pw.TextStyle(
                          color: PdfColors.amber900,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 18),
          if (previewLabel != null && previewLabel.isNotEmpty) ...[
            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: PdfColors.amber50,
                border: pw.Border.all(color: PdfColors.amber800, width: 0.8),
              ),
              child: pw.Text(
                previewLabel,
                style: pw.TextStyle(
                  color: PdfColors.amber900,
                  fontSize: 11,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 14),
          ],
          if (payload.description.isNotEmpty)
            _section('Description', [pw.Text(payload.description)]),
          if (payload.services.isNotEmpty)
            _section('Services', [_bulletList(payload.services)]),
          if (payload.audiences.isNotEmpty)
            _section('Audiences', [_bulletList(payload.audiences)]),
          if (payload.hasContactInfo)
            _section('Contact', [
              if (payload.location.isNotEmpty)
                _line('Location', payload.location),
              if (payload.phone.isNotEmpty) _line('Phone', payload.phone),
              if (payload.whatsApp.isNotEmpty)
                _line('WhatsApp', payload.whatsApp),
            ]),
          if (payload.links.isNotEmpty)
            _section('Links', [_bulletList(payload.links)]),
          for (final section in payload.publishedConditionalSections)
            _section(section.title, [pw.Text(section.content)]),
          for (final section in payload.customSections)
            if (section.title.isNotEmpty || section.content.isNotEmpty)
              _section(
                section.title.isEmpty ? 'Custom Section' : section.title,
                [pw.Text(section.content)],
              ),
          pw.SizedBox(height: 18),
          pw.Container(
            padding: const pw.EdgeInsets.all(12),
            decoration: pw.BoxDecoration(
              color: PdfColors.grey100,
              border: pw.Border.all(color: PdfColors.grey500, width: 0.6),
            ),
            child: pw.Text(
              'Mental Smile provides publishing and discovery only. It does not verify, rank, recommend, book, or manage payments.',
              style: const pw.TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.Widget _section(String title, List<pw.Widget> children) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 16),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.amber900,
            ),
          ),
          pw.SizedBox(height: 6),
          ...children,
        ],
      ),
    );
  }

  static pw.Widget _line(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.RichText(
        text: pw.TextSpan(
          children: [
            pw.TextSpan(
              text: '$label: ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  static pw.Widget _bulletList(List<String> items) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        for (final item in items)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 3),
            child: pw.Text('- $item'),
          ),
      ],
    );
  }
}

class _CommercialV2MedicalWhitePdfBuilder {
  const _CommercialV2MedicalWhitePdfBuilder._();

  static const _medicalBlue = PdfColor(0.09, 0.23, 0.26);
  static const _medicalTeal = PdfColor(0.16, 0.46, 0.44);
  static const _medicalTealLight = PdfColor(0.73, 0.84, 0.82);
  static const _medicalBackground = PdfColor(0.92, 0.97, 0.96);

  static Future<Uint8List> build(
    _ProfilePayload payload, {
    required String previewLabel,
    Uint8List? localImageBytes,
  }) async {
    final pdf = pw.Document(
      title: payload.name.isEmpty
          ? 'Mental Smile Preview Profile'
          : '${payload.name} Preview Profile',
      author: 'Mental Smile',
      creator: 'Mental Smile Commercial V2 medical_white',
    );
    final identityImage = await _pdfIdentityImage(payload);

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          margin: const pw.EdgeInsets.all(30),
        ),
        build: (context) => [
          pw.Container(
            padding: const pw.EdgeInsets.all(18),
            decoration: pw.BoxDecoration(
              color: _medicalBackground,
              border: pw.Border.all(color: _medicalTealLight, width: 1),
              borderRadius: pw.BorderRadius.circular(8),
            ),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  width: 86,
                  height: 86,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.white,
                    border: pw.Border.all(color: _medicalTealLight, width: 1),
                    borderRadius: pw.BorderRadius.circular(6),
                  ),
                  child: identityImage == null
                      ? pw.Center(
                          child: pw.Text(
                            'MS',
                            style: pw.TextStyle(
                              color: _medicalTeal,
                              fontSize: 24,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        )
                      : pw.Image(identityImage, fit: pw.BoxFit.cover),
                ),
                pw.SizedBox(width: 18),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        payload.name.isEmpty
                            ? 'Untitled Profile'
                            : payload.name,
                        style: pw.TextStyle(
                          color: _medicalBlue,
                          fontSize: 28,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 6),
                      pw.Text(
                        payload.categoryLabel,
                        style: pw.TextStyle(
                          color: _medicalTeal,
                          fontSize: 13,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      if (payload.location.isNotEmpty) ...[
                        pw.SizedBox(height: 8),
                        pw.Text(
                          payload.location,
                          style: const pw.TextStyle(
                            color: PdfColors.grey700,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Container(
            padding: const pw.EdgeInsets.all(9),
            decoration: pw.BoxDecoration(
              color: PdfColors.amber50,
              border: pw.Border.all(color: PdfColors.amber800, width: 0.8),
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Text(
              previewLabel,
              style: pw.TextStyle(
                color: PdfColors.amber900,
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 18),
          if (payload.description.isNotEmpty)
            _section('About', [pw.Text(payload.description)]),
          if (payload.services.isNotEmpty)
            _section('Services', [_bulletList(payload.services)]),
          if (payload.audiences.isNotEmpty)
            _section('Audiences', [_bulletList(payload.audiences)]),
          if (payload.hasContactInfo)
            _section('Contact', [
              if (payload.location.isNotEmpty)
                _line('Location', payload.location),
              if (payload.phone.isNotEmpty) _line('Phone', payload.phone),
              if (payload.whatsApp.isNotEmpty)
                _line('WhatsApp', payload.whatsApp),
            ]),
          if (payload.links.isNotEmpty)
            _section('Links', [_bulletList(payload.links)]),
          for (final section in payload.publishedConditionalSections)
            _section(section.title, [pw.Text(section.content)]),
          for (final section in payload.customSections)
            if (section.title.isNotEmpty || section.content.isNotEmpty)
              _section(
                section.title.isEmpty
                    ? 'Additional Information'
                    : section.title,
                [pw.Text(section.content)],
              ),
          pw.SizedBox(height: 18),
          pw.Container(
            padding: const pw.EdgeInsets.all(12),
            decoration: pw.BoxDecoration(
              color: PdfColors.grey100,
              border: pw.Border.all(color: PdfColors.grey400, width: 0.6),
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Text(
              'Mental Smile provides publishing and discovery only. It does not verify, rank, recommend, book, or manage payments.',
              style: const pw.TextStyle(
                color: PdfColors.grey700,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.Widget _section(String title, List<pw.Widget> children) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 16),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              color: _medicalTeal,
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Container(height: 1.4, width: 48, color: _medicalTealLight),
          pw.SizedBox(height: 7),
          ...children,
        ],
      ),
    );
  }

  static pw.Widget _line(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.RichText(
        text: pw.TextSpan(
          children: [
            pw.TextSpan(
              text: '$label: ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  static pw.Widget _bulletList(List<String> items) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        for (final item in items)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 4),
            child: pw.Text('- $item'),
          ),
      ],
    );
  }
}

class _ProfilePayload {
  const _ProfilePayload({
    this.name = '',
    this.category = '',
    this.subcategory = '',
    this.description = '',
    this.services = const [],
    this.audiences = const [],
    this.location = '',
    this.phone = '',
    this.whatsApp = '',
    this.links = const [],
    this.profileImageUrl = '',
    this.logoImageUrl = '',
    this.facebookMediaLink = '',
    this.youtubeMediaLink = '',
    this.instagramLink = '',
    this.websiteGalleryLink = '',
    this.styleInstruction = '',
    this.conditionalSections = const {},
    this.repeatableConditionalSections = const {},
    this.customSections = const [],
  });

  final String name;
  final String category;
  final String subcategory;
  final String description;
  final List<String> services;
  final List<String> audiences;
  final String location;
  final String phone;
  final String whatsApp;
  final List<String> links;
  final String profileImageUrl;
  final String logoImageUrl;
  final String facebookMediaLink;
  final String youtubeMediaLink;
  final String instagramLink;
  final String websiteGalleryLink;
  final String styleInstruction;
  final Map<String, Map<String, String>> conditionalSections;
  final Map<String, List<Map<String, String>>> repeatableConditionalSections;
  final List<_CustomSection> customSections;

  factory _ProfilePayload.fromMap(
    Map<String, dynamic> map, {
    String fallbackPhone = '',
  }) {
    return _ProfilePayload(
      name: (map['name'] ?? '').toString(),
      category: (map['category'] ?? '').toString(),
      subcategory: (map['subcategory'] ?? '').toString(),
      description: (map['description'] ?? '').toString(),
      services: _stringList(map['services']),
      audiences: _stringList(map['audiences']),
      location: (map['location'] ?? '').toString(),
      phone: (map['phone'] ?? fallbackPhone).toString(),
      whatsApp: (map['whatsApp'] ?? '').toString(),
      links: _stringList(map['links']),
      profileImageUrl: _normalizeImageUrl(map['profileImageUrl']),
      logoImageUrl: _normalizeImageUrl(map['logoImageUrl']),
      facebookMediaLink: (map['facebookMediaLink'] ?? '').toString(),
      youtubeMediaLink: (map['youtubeMediaLink'] ?? '').toString(),
      instagramLink: (map['instagramLink'] ?? '').toString(),
      websiteGalleryLink: (map['websiteGalleryLink'] ?? '').toString(),
      styleInstruction: (map['styleInstruction'] ?? '').toString(),
      conditionalSections: _conditionalSectionMap(map['conditionalSections']),
      repeatableConditionalSections: _repeatableConditionalSectionMap(
          map['repeatableConditionalSections']),
      customSections: _customSectionList(map['customSections']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'subcategory': subcategory,
      'categoryKey': _filterKey(category),
      'subcategoryKey': _filterKey(subcategory),
      'categoryPath': [
        _filterKey(category),
        if (subcategory.isNotEmpty) _filterKey(subcategory),
      ],
      'description': description,
      'services': services,
      'audiences': audiences,
      'location': location,
      'phone': phone,
      'whatsApp': whatsApp,
      'links': links,
      'profileImageUrl': profileImageUrl,
      'logoImageUrl': logoImageUrl,
      'facebookMediaLink': facebookMediaLink,
      'youtubeMediaLink': youtubeMediaLink,
      'instagramLink': instagramLink,
      'websiteGalleryLink': websiteGalleryLink,
      'styleInstruction': styleInstruction,
      'conditionalSections': conditionalSections,
      'repeatableConditionalSections': repeatableConditionalSections,
      'customSections':
          customSections.map((section) => section.toMap()).toList(),
    };
  }

  String get categoryLabel {
    if (category.isEmpty) return 'Uncategorized';
    if (subcategory.isEmpty) return category;
    return '$category / $subcategory';
  }

  bool get hasContactInfo =>
      location.isNotEmpty || phone.isNotEmpty || whatsApp.isNotEmpty;

  bool get hasIdentityMedia =>
      profileImageUrl.isNotEmpty || logoImageUrl.isNotEmpty;

  bool get hasExternalMediaLinks => externalMediaLinks.isNotEmpty;

  List<String> get externalMediaLinks => [
        facebookMediaLink,
        youtubeMediaLink,
        instagramLink,
        websiteGalleryLink,
      ].where((link) => link.isNotEmpty).toList(growable: false);

  String conditionalValueFor(String key) {
    for (final section in conditionalSections.values) {
      final value = section[key];
      if (value != null) return value;
    }
    return '';
  }

  List<_CustomSection> get publishedConditionalSections {
    final sections = <_CustomSection>[];
    for (final spec in _conditionalSectionSpecs) {
      final repeatableBlocks = repeatableConditionalSections[spec.id];
      if (repeatableBlocks != null && repeatableBlocks.isNotEmpty) {
        final lines = <String>[];
        for (var index = 0; index < repeatableBlocks.length; index++) {
          final values = repeatableBlocks[index];
          final optionLines = <String>[];
          for (final field in spec.fields) {
            final value = values[field.key]?.trim();
            if (value == null || value.isEmpty) continue;
            optionLines.add('${field.labelEn}: $value');
          }
          if (optionLines.isEmpty) continue;
          lines
            ..add('Option ${index + 1}')
            ..addAll(optionLines);
        }
        if (lines.isNotEmpty) {
          lines.add(_commercialPriceNotice);
          sections.add(
            _CustomSection(
              title: spec.titleEn,
              content: lines.join('\n'),
            ),
          );
        }
        continue;
      }
      final values = conditionalSections[spec.id];
      if (values == null || values.isEmpty) continue;
      final lines = <String>[];
      for (final field in spec.fields) {
        final value = values[field.key]?.trim();
        if (value == null || value.isEmpty) continue;
        lines.add('${field.labelEn}: $value');
      }
      if (lines.isEmpty) continue;
      lines.add(_commercialPriceNotice);
      sections.add(
        _CustomSection(
          title: spec.titleEn,
          content: lines.join('\n'),
        ),
      );
    }
    return sections;
  }
}

class _CustomSection {
  const _CustomSection({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  Map<String, dynamic> toMap() => {
        'title': title,
        'content': content,
      };
}

class _CustomSectionControllers {
  _CustomSectionControllers({
    String title = '',
    String content = '',
  })  : title = TextEditingController(text: title),
        content = TextEditingController(text: content);

  final TextEditingController title;
  final TextEditingController content;

  void dispose() {
    title.dispose();
    content.dispose();
  }
}

class _CommercialOutputRecord {
  const _CommercialOutputRecord({
    required this.outputType,
    required this.templateId,
    required this.builderId,
    required this.previewId,
    required this.exportFormat,
    required this.storageContract,
    required this.metadata,
  });

  final String outputType;
  final String templateId;
  final String builderId;
  final String previewId;
  final String exportFormat;
  final String storageContract;
  final Map<String, String> metadata;

  factory _CommercialOutputRecord.businessCard(_ProfilePayload payload) {
    return _CommercialOutputRecord(
      outputType: 'businessCard',
      templateId: 'BUSINESS_CARD_TEMPLATE_CLASSIC_GOLD_V1',
      builderId: 'COMMERCIAL_BUSINESS_CARD_BUILDER_V1',
      previewId: 'COMMERCIAL_BUSINESS_CARD_PREVIEW_V1',
      exportFormat: 'PDF',
      storageContract: 'COMMERCIAL_BUSINESS_CARD_STORAGE_CONTRACT_V1',
      metadata: _outputMetadata(payload),
    );
  }

  factory _CommercialOutputRecord.cv(_ProfilePayload payload) {
    return _CommercialOutputRecord(
      outputType: 'cv',
      templateId: 'CV_TEMPLATE_MEDICAL_WHITE_V1',
      builderId: 'COMMERCIAL_CV_BUILDER_V1',
      previewId: 'COMMERCIAL_CV_PREVIEW_V1',
      exportFormat: 'PDF',
      storageContract: 'COMMERCIAL_CV_STORAGE_CONTRACT_V1',
      metadata: _outputMetadata(payload),
    );
  }

  factory _CommercialOutputRecord.promoPost(_ProfilePayload payload) {
    return _CommercialOutputRecord(
      outputType: 'promoPost',
      templateId: 'PROMO_POST_TEMPLATE_PROFILE_ANNOUNCEMENT_V1',
      builderId: 'COMMERCIAL_PROMO_POST_BUILDER_V1',
      previewId: 'COMMERCIAL_PROMO_POST_PREVIEW_V1',
      exportFormat: 'PDF',
      storageContract: 'COMMERCIAL_PROMO_POST_STORAGE_CONTRACT_V1',
      metadata: _outputMetadata(payload),
    );
  }

  Map<String, dynamic> toMap() => {
        'outputType': outputType,
        'templateId': templateId,
        'builderId': builderId,
        'previewId': previewId,
        'exportFormat': exportFormat,
        'storageContract': storageContract,
        'metadata': metadata,
        'generatedAt': _utcNow(),
      };
}

class _CommercialAssetPackage {
  const _CommercialAssetPackage({
    required this.packageId,
    required this.version,
    required this.classification,
    required this.contents,
    required this.metadata,
    required this.textProfilePackage,
    required this.aiGenerationHandoffPackage,
  });

  final String packageId;
  final int version;
  final String classification;
  final List<String> contents;
  final Map<String, String> metadata;
  final Map<String, dynamic> textProfilePackage;
  final Map<String, dynamic> aiGenerationHandoffPackage;

  factory _CommercialAssetPackage.fromPayload({
    required String uid,
    required _ProfilePayload payload,
    required bool hasGeneratedCv,
    required bool hasBusinessCard,
    required bool hasPromoPost,
  }) {
    final safeName = _filterKey(payload.name);
    final textProfilePackage =
        _CommercialTextProfilePackage.fromPayload(uid: uid, payload: payload);
    final aiGenerationHandoffPackage =
        _CommercialAiGenerationHandoffPackage.fromTextProfilePackage(
      textProfilePackage,
    );
    return _CommercialAssetPackage(
      packageId:
          'commercial_asset_package_${safeName.isEmpty ? uid : safeName}_v1',
      version: 1,
      classification: 'COMMERCIAL_MARKETING_READY_PENDING_REVIEW',
      contents: [
        'Commercial Text Profile Package',
        'AI Generation Handoff Package',
        if (hasGeneratedCv) 'CV',
        if (hasBusinessCard) 'Business Card',
        if (hasPromoPost) 'Promo Post',
        'Metadata',
        'Version Information',
      ],
      metadata: {
        ..._outputMetadata(payload),
        'ownerUid': uid,
        'archiveDestination': 'Provider Portfolio Vault',
        'futureMarketingInput': 'Marketing Content Library',
        'imageDependency': 'REMOVED_FROM_ACTIVE_COMMERCIAL_V2_RUNTIME',
        'visualAssetPolicy':
            'Optional externally supplied image/logo can be added later during AI generation, design, or publication.',
      },
      textProfilePackage: textProfilePackage.toMap(),
      aiGenerationHandoffPackage: aiGenerationHandoffPackage.toMap(),
    );
  }

  Map<String, dynamic> toMap() => {
        'packageId': packageId,
        'version': version,
        'classification': classification,
        'contents': contents,
        'metadata': metadata,
        'textProfilePackage': textProfilePackage,
        'aiGenerationHandoffPackage': aiGenerationHandoffPackage,
        'builtAt': _utcNow(),
      };
}

class _CommercialTextProfilePackage {
  const _CommercialTextProfilePackage({
    required this.ownerUid,
    required this.publicProfileId,
    required this.payload,
  });

  final String ownerUid;
  final String publicProfileId;
  final _ProfilePayload payload;

  factory _CommercialTextProfilePackage.fromPayload({
    required String uid,
    required _ProfilePayload payload,
  }) {
    return _CommercialTextProfilePackage(
      ownerUid: uid,
      publicProfileId:
          _filterKey(payload.name).isEmpty ? uid : _filterKey(payload.name),
      payload: payload,
    );
  }

  Map<String, dynamic> toMap() => {
        'ownerUid': ownerUid,
        'publicProfileId': publicProfileId,
        'name': payload.name,
        'category': payload.category,
        'subcategory': payload.subcategory,
        'description': payload.description,
        'services': payload.services,
        'audiences': payload.audiences,
        'location': payload.location,
        'phone': payload.phone,
        'whatsApp': payload.whatsApp,
        'links': payload.links,
        'customSections':
            payload.customSections.map((section) => section.toMap()).toList(),
        'conditionalSections': payload.conditionalSections,
        'repeatableConditionalSections': payload.repeatableConditionalSections,
        'styleInstruction': payload.styleInstruction,
        'generationNotes':
            'Text-only Commercial V2 package. Image/logo URL is not required and is not loaded from Firebase Storage by active Commercial V2.',
        'imageUrlRequired': false,
        'createdAt': _utcNow(),
      };
}

class _CommercialAiGenerationHandoffPackage {
  const _CommercialAiGenerationHandoffPackage({
    required this.textProfilePackage,
  });

  final _CommercialTextProfilePackage textProfilePackage;

  factory _CommercialAiGenerationHandoffPackage.fromTextProfilePackage(
    _CommercialTextProfilePackage textProfilePackage,
  ) {
    return _CommercialAiGenerationHandoffPackage(
      textProfilePackage: textProfilePackage,
    );
  }

  Map<String, dynamic> toMap() => {
        'handoffStatus': 'DOCUMENTED_FOR_FUTURE_AI_GENERATOR',
        'textProfilePackage': textProfilePackage.toMap(),
        'styleInstruction': textProfilePackage.payload.styleInstruction,
        'optionalExternalVisualInputs': [
          'externally uploaded image file',
          'externally uploaded logo file',
        ],
        'requestedOutputs': [
          'CV',
          'Business Card',
          'Promo Post',
          'Profile Visual',
        ],
        'activeFirebaseImageUpload': false,
        'activeAiIntegration': false,
        'activeApiCall': false,
        'notes':
            'Future generator may receive external visual files at design/publication time. Commercial V2 does not upload or require identity images in the active app flow.',
        'createdAt': _utcNow(),
      };
}

class _CommercialSignal {
  const _CommercialSignal({
    required this.signalId,
    required this.type,
    required this.details,
    required this.createdAt,
  });

  final String signalId;
  final String type;
  final Map<String, String> details;
  final String createdAt;

  factory _CommercialSignal.created(
    String type, {
    Map<String, String> details = const {},
  }) {
    final now = _utcNow();
    return _CommercialSignal(
      signalId: '${type}_${now.replaceAll(RegExp(r'[^0-9]'), '')}',
      type: type,
      details: details,
      createdAt: now,
    );
  }

  Map<String, dynamic> toMap() => {
        'signalId': signalId,
        'type': type,
        'details': details,
        'createdAt': createdAt,
      };
}

class _CommercialV2Shell extends StatelessWidget {
  const _CommercialV2Shell({
    required this.title,
    required this.subtitle,
    required this.child,
    this.actions = const [],
    this.showAppBar = true,
    this.showHeader = true,
    this.maxContentWidth = 920,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final List<Widget> actions;
  final bool showAppBar;
  final bool showHeader;
  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _commercialBlack,
      appBar: showAppBar
          ? AppBar(
              title: const Text('Mental Smile Commercial V2'),
              backgroundColor: _commercialBlack,
              foregroundColor: _commercialGold,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              actions: actions,
            )
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned.fill(child: _CommercialV2Background()),
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: _commercialGold,
                  secondary: _commercialGoldMuted,
                  surface: _commercialObsidian,
                  onSurface: _commercialSilver,
                ),
                textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: _commercialGold,
                  selectionColor: Color(0x554D3A16),
                ),
                filledButtonTheme: FilledButtonThemeData(
                  style: FilledButton.styleFrom(
                    backgroundColor: _commercialGold,
                    foregroundColor: _commercialBlack,
                    textStyle: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _commercialGold,
                    side: const BorderSide(color: _commercialGoldMuted),
                    textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: _commercialGold,
                    textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxContentWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (showHeader) ...[
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: _commercialGold,
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            subtitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: _commercialSilverMuted,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                        child,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommercialV2Background extends StatelessWidget {
  const _CommercialV2Background();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF020202),
            Color(0xFF10100E),
            Color(0xFF030303),
          ],
        ),
      ),
      child: Row(
        children: const [
          _PharaonicSideRail(isLeft: true),
          Spacer(),
          _PharaonicSideRail(isLeft: false),
        ],
      ),
    );
  }
}

class _PharaonicSideRail extends StatelessWidget {
  const _PharaonicSideRail({required this.isLeft});

  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 86,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: isLeft ? Alignment.centerLeft : Alignment.centerRight,
            end: isLeft ? Alignment.centerRight : Alignment.centerLeft,
            colors: const [
              Color(0xFF271801),
              Color(0xAA8A5C14),
              Color(0x00271801),
            ],
          ),
          border: Border(
            left: isLeft
                ? BorderSide.none
                : const BorderSide(color: _commercialGoldMuted, width: 1),
            right: isLeft
                ? const BorderSide(color: _commercialGoldMuted, width: 1)
                : BorderSide.none,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableHeight = constraints.maxHeight;
            final glyphHeight = availableHeight < 360 ? 44.0 : 64.0;
            final glyphCount = availableHeight < 180
                ? 1
                : availableHeight < 320
                    ? 3
                    : 5;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < glyphCount; i++)
                  _RailGlyph(height: glyphHeight),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _RailGlyph extends StatelessWidget {
  const _RailGlyph({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.55,
      child: Container(
        width: 28,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: _commercialGoldMuted),
          borderRadius: BorderRadius.circular(2),
        ),
        child: const Icon(
          Icons.auto_awesome,
          color: _commercialGoldMuted,
          size: 16,
        ),
      ),
    );
  }
}

class _ConditionalProfilePanel extends StatelessWidget {
  const _ConditionalProfilePanel({
    required this.spec,
    required this.arabic,
    required this.textDirection,
    required this.controllerFor,
    required this.repeatableBlocks,
    required this.repeatableController,
    required this.onAddRepeatableBlock,
    required this.onRemoveRepeatableBlock,
  });

  final _ConditionalSectionSpec spec;
  final bool arabic;
  final TextDirection textDirection;
  final TextEditingController Function(String key) controllerFor;
  final List<Map<String, TextEditingController>> Function(String sectionId)
      repeatableBlocks;
  final TextEditingController Function(
    String sectionId,
    int index,
    String fieldKey,
  ) repeatableController;
  final void Function(_ConditionalSectionSpec spec) onAddRepeatableBlock;
  final void Function(String sectionId, int index) onRemoveRepeatableBlock;

  @override
  Widget build(BuildContext context) {
    return _ExpandableProfilePanel(
      icon: spec.icon,
      title: arabic ? spec.titleAr : spec.titleEn,
      subtitle: arabic
          ? '\u0627\u062e\u062a\u064a\u0627\u0631\u064a - \u0644\u0644\u0646\u0634\u0631 \u0641\u0642\u0637'
          : 'Optional - publishing information only',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Notice(
            text: arabic
                ? '\u0627\u0644\u0623\u0633\u0639\u0627\u0631 \u0648\u0627\u0644\u062e\u062f\u0645\u0627\u062a \u0645\u0646\u0634\u0648\u0631\u0629 \u0628\u0645\u0639\u0631\u0641\u0629 \u0627\u0644\u0645\u0642\u062f\u0645 / \u0627\u0644\u062c\u0647\u0629. \u064a\u0631\u062c\u0649 \u062a\u0623\u0643\u064a\u062f \u0627\u0644\u062a\u0641\u0627\u0635\u064a\u0644 \u0645\u0628\u0627\u0634\u0631\u0629 \u0642\u0628\u0644 \u0623\u064a \u0627\u062a\u0641\u0627\u0642.'
                : _commercialPriceNotice,
          ),
          const SizedBox(height: 12),
          if (spec.repeatable)
            _RepeatableConditionalBlocks(
              spec: spec,
              arabic: arabic,
              textDirection: textDirection,
              blocks: repeatableBlocks(spec.id),
              controllerFor: repeatableController,
              onAdd: () => onAddRepeatableBlock(spec),
              onRemove: (index) => onRemoveRepeatableBlock(spec.id, index),
            )
          else
            for (final field in spec.fields)
              _ConditionalFieldInput(
                field: field,
                arabic: arabic,
                textDirection: textDirection,
                controller: controllerFor(field.key),
              ),
        ],
      ),
    );
  }
}

class _RepeatableConditionalBlocks extends StatelessWidget {
  const _RepeatableConditionalBlocks({
    required this.spec,
    required this.arabic,
    required this.textDirection,
    required this.blocks,
    required this.controllerFor,
    required this.onAdd,
    required this.onRemove,
  });

  final _ConditionalSectionSpec spec;
  final bool arabic;
  final TextDirection textDirection;
  final List<Map<String, TextEditingController>> blocks;
  final TextEditingController Function(
    String sectionId,
    int index,
    String fieldKey,
  ) controllerFor;
  final VoidCallback onAdd;
  final void Function(int index) onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var index = 0; index < blocks.length; index++) ...[
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0x66000000),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _commercialGoldMuted),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          arabic
                              ? '\u062e\u064a\u0627\u0631 ${index + 1}'
                              : 'Option ${index + 1}',
                          style: const TextStyle(
                            color: _commercialGold,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: arabic ? '\u062d\u0630\u0641' : 'Remove',
                        onPressed: () => onRemove(index),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: _commercialGoldMuted,
                        ),
                      ),
                    ],
                  ),
                  for (final field in spec.fields)
                    _ConditionalFieldInput(
                      field: field,
                      arabic: arabic,
                      textDirection: textDirection,
                      controller: controllerFor(spec.id, index, field.key),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        OutlinedButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
          label: Text(arabic ? spec.addButtonAr : spec.addButtonEn),
        ),
      ],
    );
  }
}

class _ConditionalFieldInput extends StatelessWidget {
  const _ConditionalFieldInput({
    required this.field,
    required this.arabic,
    required this.textDirection,
    required this.controller,
  });

  final _ConditionalFieldSpec field;
  final bool arabic;
  final TextDirection textDirection;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    if (field.options.isNotEmpty || field.yesNo) {
      return _GuidedDropdownField(
        value: controller.text.trim().isEmpty ? null : controller.text.trim(),
        label: arabic ? field.labelAr : field.labelEn,
        icon: field.icon,
        hint: arabic
            ? '\u062d\u0642\u0644 \u0627\u062e\u062a\u064a\u0627\u0631\u064a'
            : 'Optional field',
        example: field.example,
        options: _dropdownOptions(
          field.yesNo ? const ['Yes', 'No'] : field.options,
          controller.text.trim(),
        ),
        onChanged: (value) => controller.text = value ?? '',
        semanticsLabel: field.labelEn,
        textDirection: textDirection,
      );
    }
    return _GuidedField(
      controller: controller,
      label: arabic ? field.labelAr : field.labelEn,
      icon: field.icon,
      hint: arabic
          ? '\u062d\u0642\u0644 \u0627\u062e\u062a\u064a\u0627\u0631\u064a'
          : 'Optional field',
      example: field.example,
      maxLines: field.maxLines,
      keyboardType: field.keyboardType,
      semanticsLabel: field.labelEn,
      textDirection: textDirection,
    );
  }
}

class _ConditionalSectionSpec {
  const _ConditionalSectionSpec({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.icon,
    required this.fields,
    this.repeatable = false,
    this.addButtonEn = '+ Add Option',
    this.addButtonAr =
        '+ \u0625\u0636\u0627\u0641\u0629 \u062e\u064a\u0627\u0631',
  });

  final String id;
  final String titleEn;
  final String titleAr;
  final IconData icon;
  final List<_ConditionalFieldSpec> fields;
  final bool repeatable;
  final String addButtonEn;
  final String addButtonAr;
}

class _ConditionalFieldSpec {
  const _ConditionalFieldSpec(
    this.key,
    this.labelEn,
    this.labelAr, {
    this.icon = Icons.info_outline,
    this.maxLines = 1,
    this.keyboardType,
    this.options = const [],
    this.yesNo = false,
    this.example = 'Optional publishing detail',
  });

  final String key;
  final String labelEn;
  final String labelAr;
  final IconData icon;
  final int maxLines;
  final TextInputType? keyboardType;
  final List<String> options;
  final bool yesNo;
  final String example;
}

class _Panel extends StatelessWidget {
  const _Panel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _commercialGlass,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _commercialGoldMuted),
        boxShadow: const [
          BoxShadow(
            color: Color(0xAA000000),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}

class _ExpandableProfilePanel extends StatelessWidget {
  const _ExpandableProfilePanel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0x990A0A09),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xAA8A5C14)),
        ),
        child: ExpansionTile(
          maintainState: true,
          iconColor: _commercialGold,
          collapsedIconColor: _commercialGoldMuted,
          textColor: _commercialGold,
          collapsedTextColor: _commercialGold,
          leading: Icon(icon, color: _commercialGold),
          title: Text(
            title,
            style: const TextStyle(
              color: _commercialGold,
              fontWeight: FontWeight.w900,
            ),
          ),
          subtitle: subtitle.isEmpty
              ? null
              : Text(
                  subtitle,
                  style: const TextStyle(
                    color: _commercialSilverMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [child],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _commercialGold),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: _commercialGold,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: _commercialSilverMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Audio guidance placeholder',
            onPressed: () => _audioPlaceholder(context),
            icon: const Icon(Icons.volume_up_outlined, color: _commercialGold),
          ),
        ],
      ),
    );
  }
}

class _GuidedField extends StatefulWidget {
  const _GuidedField({
    required this.controller,
    required this.label,
    required this.icon,
    required this.hint,
    required this.example,
    required this.semanticsLabel,
    this.maxLines = 1,
    this.required = false,
    this.obscureText = false,
    this.keyboardType,
    this.textDirection,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String hint;
  final String example;
  final String semanticsLabel;
  final int maxLines;
  final bool required;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;

  @override
  State<_GuidedField> createState() => _GuidedFieldState();
}

class _GuidedFieldState extends State<_GuidedField> {
  bool _helpOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Semantics(
        label: widget.semanticsLabel,
        textField: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: widget.controller,
              maxLines: widget.obscureText ? 1 : widget.maxLines,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              textDirection: widget.textDirection,
              style: const TextStyle(
                color: _commercialSilver,
                fontWeight: FontWeight.w700,
              ),
              cursorColor: _commercialGold,
              validator: widget.required
                  ? (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '${widget.label} is required.';
                      }
                      return null;
                    }
                  : null,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0x66000000),
                prefixIcon: Icon(widget.icon, color: _commercialGoldMuted),
                suffixIcon: SizedBox(
                  width: 132,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'Audio guidance placeholder',
                        onPressed: () => _audioPlaceholder(context),
                        icon: const Icon(
                          Icons.volume_up_outlined,
                          color: _commercialGoldMuted,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Show visual hint',
                        onPressed: () => setState(() => _helpOpen = !_helpOpen),
                        icon: const Icon(
                          Icons.lightbulb_outline,
                          color: _commercialGoldMuted,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Show example',
                        onPressed: () => setState(() => _helpOpen = !_helpOpen),
                        icon: const Icon(
                          Icons.help_outline,
                          color: _commercialGoldMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(minWidth: 132),
                labelText: widget.label,
                hintText: widget.hint,
                labelStyle: const TextStyle(
                  color: _commercialGold,
                  fontWeight: FontWeight.w800,
                ),
                floatingLabelStyle: const TextStyle(
                  color: _commercialGold,
                  fontWeight: FontWeight.w900,
                ),
                hintStyle: const TextStyle(color: _commercialSilverMuted),
                errorStyle: const TextStyle(
                  color: _commercialError,
                  fontWeight: FontWeight.w800,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: _commercialGoldMuted),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: _commercialGold, width: 1.4),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x668A5C14)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: _commercialError),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: _commercialError, width: 1.4),
                ),
              ),
            ),
            if (_helpOpen)
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0x99000000),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xAA8A5C14)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.tips_and_updates_outlined,
                          size: 18,
                          color: _commercialGold,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${widget.example}\nSimple language: short and clear is best.',
                            style: const TextStyle(
                              color: _commercialSilverMuted,
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _GuidedDropdownField extends StatefulWidget {
  const _GuidedDropdownField({
    required this.value,
    required this.label,
    required this.icon,
    required this.hint,
    required this.example,
    required this.options,
    required this.onChanged,
    required this.semanticsLabel,
    this.enabled = true,
    this.textDirection,
  });

  final String? value;
  final String label;
  final IconData icon;
  final String hint;
  final String example;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String semanticsLabel;
  final bool enabled;
  final TextDirection? textDirection;

  @override
  State<_GuidedDropdownField> createState() => _GuidedDropdownFieldState();
}

class _GuidedDropdownFieldState extends State<_GuidedDropdownField> {
  bool _helpOpen = false;

  @override
  Widget build(BuildContext context) {
    final currentValue =
        widget.options.contains(widget.value) ? widget.value : null;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Semantics(
        label: widget.semanticsLabel,
        textField: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: currentValue,
              isExpanded: true,
              alignment: widget.textDirection == TextDirection.rtl
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.centerStart,
              dropdownColor: _commercialObsidian,
              style: const TextStyle(
                color: _commercialSilver,
                fontWeight: FontWeight.w700,
              ),
              items: widget.options
                  .map(
                    (option) => DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    ),
                  )
                  .toList(growable: false),
              onChanged: widget.enabled ? widget.onChanged : null,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0x66000000),
                prefixIcon: Icon(widget.icon, color: _commercialGoldMuted),
                suffixIcon: SizedBox(
                  width: 132,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'Audio guidance placeholder',
                        onPressed: () => _audioPlaceholder(context),
                        icon: const Icon(
                          Icons.volume_up_outlined,
                          color: _commercialGoldMuted,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Show visual hint',
                        onPressed: () => setState(() => _helpOpen = !_helpOpen),
                        icon: const Icon(
                          Icons.lightbulb_outline,
                          color: _commercialGoldMuted,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Show example',
                        onPressed: () => setState(() => _helpOpen = !_helpOpen),
                        icon: const Icon(
                          Icons.help_outline,
                          color: _commercialGoldMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(minWidth: 132),
                labelText: widget.label,
                hintText:
                    widget.enabled ? widget.hint : 'Select category first',
                labelStyle: const TextStyle(
                  color: _commercialGold,
                  fontWeight: FontWeight.w800,
                ),
                floatingLabelStyle: const TextStyle(
                  color: _commercialGold,
                  fontWeight: FontWeight.w900,
                ),
                hintStyle: const TextStyle(color: _commercialSilverMuted),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: _commercialGoldMuted),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: _commercialGold, width: 1.4),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x668A5C14)),
                ),
              ),
            ),
            if (_helpOpen)
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0x99000000),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xAA8A5C14)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.tips_and_updates_outlined,
                          size: 18,
                          color: _commercialGold,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${widget.example}\nSelect the closest option. Use Other when no option fits.',
                            style: const TextStyle(
                              color: _commercialSilverMuted,
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomSectionEditor extends StatelessWidget {
  const _CustomSectionEditor({
    required this.index,
    required this.controllers,
    required this.onRemove,
  });

  final int index;
  final _CustomSectionControllers controllers;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0x99000000),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xAA8A5C14)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Custom Section ${index + 1}',
                      style: const TextStyle(
                        color: _commercialGold,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Remove section',
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: _commercialGoldMuted,
                    ),
                  ),
                ],
              ),
              _GuidedField(
                controller: controllers.title,
                label: 'Section Title',
                icon: Icons.title,
                hint: 'You define the meaning',
                example: 'Example: Certificates, Research, Special Notes',
                semanticsLabel: 'Custom section title',
              ),
              _GuidedField(
                controller: controllers.content,
                label: 'Section Content',
                icon: Icons.notes_outlined,
                hint: 'Write the content of this section',
                example: 'Example: Add a short paragraph or list.',
                maxLines: 5,
                semanticsLabel: 'Custom section content',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OwnerActions extends StatelessWidget {
  const _OwnerActions({
    required this.saving,
    required this.onSave,
    required this.onPreview,
    required this.onPublish,
    required this.onHide,
    required this.onNewVersion,
    required this.onGeneratePdf,
    required this.onGenerateCvPreview,
    required this.onGenerateBusinessCard,
    required this.onExportBusinessCard,
    required this.onGeneratePromoPost,
    required this.onExportPromoPost,
    required this.onBuildAssetPackage,
    required this.onOpenPublicUrl,
    required this.saveLabel,
    required this.previewLabel,
    required this.publishLabel,
    required this.hideLabel,
    required this.newVersionLabel,
    required this.generatePdfLabel,
    required this.generateCvPreviewLabel,
    required this.generateBusinessCardLabel,
    required this.exportBusinessCardLabel,
    required this.generatePromoPostLabel,
    required this.exportPromoPostLabel,
    required this.buildAssetPackageLabel,
    required this.openPublicUrlLabel,
  });

  final bool saving;
  final Future<bool> Function() onSave;
  final VoidCallback onPreview;
  final VoidCallback onPublish;
  final VoidCallback onHide;
  final VoidCallback onNewVersion;
  final VoidCallback onGeneratePdf;
  final VoidCallback onGenerateCvPreview;
  final VoidCallback onGenerateBusinessCard;
  final VoidCallback onExportBusinessCard;
  final VoidCallback onGeneratePromoPost;
  final VoidCallback onExportPromoPost;
  final VoidCallback onBuildAssetPackage;
  final VoidCallback onOpenPublicUrl;
  final String saveLabel;
  final String previewLabel;
  final String publishLabel;
  final String hideLabel;
  final String newVersionLabel;
  final String generatePdfLabel;
  final String generateCvPreviewLabel;
  final String generateBusinessCardLabel;
  final String exportBusinessCardLabel;
  final String generatePromoPostLabel;
  final String exportPromoPostLabel;
  final String buildAssetPackageLabel;
  final String openPublicUrlLabel;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton.icon(
                onPressed: saving ? null : () => onSave(),
                icon: const Icon(Icons.save_outlined),
                label: Text(saveLabel),
              ),
              OutlinedButton.icon(
                onPressed: saving ? null : onPreview,
                icon: const Icon(Icons.visibility_outlined),
                label: Text(previewLabel),
              ),
              FilledButton.icon(
                onPressed: saving ? null : onPublish,
                icon: const Icon(Icons.publish_outlined),
                label: Text(publishLabel),
              ),
              OutlinedButton.icon(
                onPressed: saving ? null : onHide,
                icon: const Icon(Icons.visibility_off_outlined),
                label: Text(hideLabel),
              ),
              OutlinedButton.icon(
                onPressed: saving ? null : onNewVersion,
                icon: const Icon(Icons.copy_all_outlined),
                label: Text(newVersionLabel),
              ),
              FilledButton.icon(
                onPressed: saving ? null : onGeneratePdf,
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: Text(generatePdfLabel),
              ),
              FilledButton.icon(
                onPressed: saving ? null : onGenerateCvPreview,
                icon: const Icon(Icons.auto_awesome_outlined),
                label: Text(generateCvPreviewLabel),
              ),
              FilledButton.icon(
                onPressed: saving ? null : onGenerateBusinessCard,
                icon: const Icon(Icons.badge_outlined),
                label: Text(generateBusinessCardLabel),
              ),
              OutlinedButton.icon(
                onPressed: saving ? null : onExportBusinessCard,
                icon: const Icon(Icons.download_outlined),
                label: Text(exportBusinessCardLabel),
              ),
              FilledButton.icon(
                onPressed: saving ? null : onGeneratePromoPost,
                icon: const Icon(Icons.campaign_outlined),
                label: Text(generatePromoPostLabel),
              ),
              OutlinedButton.icon(
                onPressed: saving ? null : onExportPromoPost,
                icon: const Icon(Icons.ios_share_outlined),
                label: Text(exportPromoPostLabel),
              ),
              FilledButton.icon(
                onPressed: saving ? null : onBuildAssetPackage,
                icon: const Icon(Icons.inventory_2_outlined),
                label: Text(buildAssetPackageLabel),
              ),
              OutlinedButton.icon(
                onPressed: saving ? null : onOpenPublicUrl,
                icon: const Icon(Icons.public),
                label: Text(openPublicUrlLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OfficialNetworkSection extends StatelessWidget {
  const _OfficialNetworkSection({
    required this.title,
    required this.professionalsLabel,
    required this.centersLabel,
    required this.clientsLabel,
    required this.supportLabel,
  });

  final String title;
  final String professionalsLabel;
  final String centersLabel;
  final String clientsLabel;
  final String supportLabel;

  @override
  Widget build(BuildContext context) {
    final links = [
      _NetworkLink(professionalsLabel, 'https://wa.me/'),
      _NetworkLink(centersLabel, 'https://wa.me/'),
      _NetworkLink(clientsLabel, 'https://wa.me/'),
      _NetworkLink(supportLabel, 'https://wa.me/'),
    ];

    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.hub_outlined, color: _commercialGold),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: _commercialGold,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Audio guidance placeholder',
                onPressed: () => _audioPlaceholder(context),
                icon: const Icon(
                  Icons.volume_up_outlined,
                  color: _commercialGoldMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final link in links)
                OutlinedButton.icon(
                  onPressed: () => launchUrl(Uri.parse(link.url)),
                  icon: const Icon(Icons.open_in_new),
                  label: Text(link.label),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NetworkLink {
  const _NetworkLink(this.label, this.url);

  final String label;
  final String url;
}

class _Notice extends StatelessWidget {
  const _Notice({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xCC2C2108),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _commercialGoldMuted),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: _commercialGold,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _ErrorNotice extends StatelessWidget {
  const _ErrorNotice({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xCC2A0707),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _commercialError),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.error_outline, color: _commercialError),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: _commercialError,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: _commercialGold),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: _commercialGold,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Audio guidance placeholder',
                onPressed: () => _audioPlaceholder(context),
                icon: const Icon(
                  Icons.volume_up_outlined,
                  color: _commercialGoldMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const Text('No items published yet.');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text('- $item'),
          ),
      ],
    );
  }
}

class _ProfileMediaBlock extends StatelessWidget {
  const _ProfileMediaBlock({
    required this.payload,
    required this.sourceBranch,
  });

  final _ProfilePayload payload;
  final String sourceBranch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (payload.hasExternalMediaLinks)
          _LinkList(items: payload.externalMediaLinks),
      ],
    );
  }
}

class _CommercialV2IdentityImage extends StatelessWidget {
  const _CommercialV2IdentityImage({
    required this.payload,
    required this.width,
    required this.height,
    this.localImageBytes,
    this.sourceBranch = 'profile',
    this.borderRadius = 8,
    this.circular = false,
    this.fit = BoxFit.cover,
    this.backgroundColor = const Color(0x66000000),
    this.borderColor = _commercialGoldMuted,
    this.fallbackIcon = Icons.image_outlined,
    this.fallbackIconColor = _commercialGold,
    this.fallbackIconSize = 34,
    this.showInitialFallback = false,
  });

  final _ProfilePayload payload;
  final double width;
  final double height;
  final Uint8List? localImageBytes;
  final String sourceBranch;
  final double borderRadius;
  final bool circular;
  final BoxFit fit;
  final Color backgroundColor;
  final Color borderColor;
  final IconData fallbackIcon;
  final Color fallbackIconColor;
  final double fallbackIconSize;
  final bool showInitialFallback;

  @override
  Widget build(BuildContext context) {
    final imageUrl = _resolveIdentityImageUrl(payload);
    if (imageUrl.isNotEmpty) {
      debugPrint(
        'Commercial V2 identity image ignored by text-only handoff | sourceBranch=$sourceBranch | url=$imageUrl',
      );
    }
    debugPrint(
      'Commercial V2 identity image fallback active | sourceBranch=$sourceBranch | localBytes=${localImageBytes?.length ?? 0} | requestedFit=$fit',
    );

    Widget fallback() {
      if (showInitialFallback) {
        return Center(
          child: Text(
            payload.name.isEmpty ? '?' : payload.name[0].toUpperCase(),
            style: const TextStyle(
              color: _commercialBlack,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        );
      }
      return Center(
        child: Icon(
          fallbackIcon,
          color: fallbackIconColor,
          size: fallbackIconSize,
        ),
      );
    }

    final content = Builder(
      builder: (context) {
        debugPrint(
          'Commercial V2 identity image: fallback used | sourceBranch=$sourceBranch | exceptionType=none | exceptionMessage=image/logo is no longer an active Commercial V2 dependency',
        );
        return fallback();
      },
    );

    final decorated = DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: circular ? null : BorderRadius.circular(borderRadius),
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: circular
              ? BorderRadius.circular(width)
              : BorderRadius.circular(borderRadius),
          child: content,
        ),
      ),
    );

    return circular ? ClipOval(child: decorated) : decorated;
  }
}

class _IdentityImageControl extends StatelessWidget {
  const _IdentityImageControl({
    required this.payload,
    required this.localImageBytes,
    required this.label,
    required this.uploadLabel,
    required this.onUpload,
  });

  final _ProfilePayload payload;
  final Uint8List? localImageBytes;
  final String label;
  final String uploadLabel;
  final VoidCallback? onUpload;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0x66000000),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _commercialGoldMuted),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.image_outlined, color: _commercialGold),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: _commercialGold,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: onUpload,
                  icon: const Icon(Icons.upload_file),
                  label: Text(uploadLabel),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _CommercialV2IdentityImage(
              payload: payload,
              localImageBytes: localImageBytes,
              sourceBranch: localImageBytes == null
                  ? 'owner rendering from draft URL'
                  : 'owner rendering from local selected image bytes',
              width: 180,
              height: 120,
              borderRadius: 8,
              fallbackIcon: Icons.image_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactBlock extends StatelessWidget {
  const _ContactBlock({required this.payload});

  final _ProfilePayload payload;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        if (payload.phone.isNotEmpty)
          OutlinedButton.icon(
            onPressed: () => launchUrl(Uri.parse('tel:${payload.phone}')),
            icon: const Icon(Icons.phone),
            label: Text(payload.phone),
          ),
        if (payload.whatsApp.isNotEmpty)
          OutlinedButton.icon(
            onPressed: () => launchUrl(
              Uri.parse('https://wa.me/${_phoneDigits(payload.whatsApp)}'),
            ),
            icon: const Icon(Icons.chat_outlined),
            label: const Text('WhatsApp'),
          ),
      ],
    );
  }
}

class _LinkList extends StatelessWidget {
  const _LinkList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const Text('No links published yet.');
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final item in items)
          OutlinedButton.icon(
            onPressed: () => launchUrl(Uri.parse(item)),
            icon: const Icon(Icons.open_in_new),
            label: Text(item),
          ),
      ],
    );
  }
}

void _audioPlaceholder(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Audio guidance coming soon.')),
  );
}

List<String> _lines(String value) {
  return value
      .split('\n')
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .toList(growable: false);
}

List<String> _stringList(Object? value) {
  if (value is Iterable) {
    return value
        .map((item) => item.toString().trim())
        .where((item) => item.isNotEmpty)
        .toList(growable: false);
  }
  return const [];
}

List<String> _dropdownOptions(List<String> baseOptions, String currentValue) {
  final value = currentValue.trim();
  if (value.isEmpty || baseOptions.contains(value)) return baseOptions;
  return [...baseOptions, value];
}

Map<String, String> _outputMetadata(_ProfilePayload payload) {
  return {
    'profileName': payload.name,
    'category': payload.category,
    'subcategory': payload.subcategory,
    'categoryLabel': payload.categoryLabel,
    'hasIdentityImage': 'false',
    'hasLogo': 'false',
    'imageDependency': 'REMOVED_FROM_ACTIVE_COMMERCIAL_V2_RUNTIME',
    'generatedAt': _utcNow(),
  };
}

String _utcNow() => DateTime.now().toUtc().toIso8601String();

_PricingMetadata _pricingMetadataFor(String category, String subcategory) {
  final subcategoryMetadata =
      _commercialV2SubcategoryPricingMetadata[subcategory.trim()];
  if (subcategoryMetadata != null) return subcategoryMetadata;
  return _commercialV2CategoryPricingMetadata[category.trim()] ??
      const _PricingMetadata();
}

List<_CustomSection> _customSectionList(Object? value) {
  if (value is Iterable) {
    return value
        .whereType<Map>()
        .map((item) {
          final map = Map<String, dynamic>.from(item);
          return _CustomSection(
            title: (map['title'] ?? '').toString(),
            content: (map['content'] ?? '').toString(),
          );
        })
        .where(
            (section) => section.title.isNotEmpty || section.content.isNotEmpty)
        .toList(growable: false);
  }
  return const [];
}

Map<String, Map<String, String>> _conditionalSectionMap(Object? value) {
  if (value is! Map) return const {};
  final result = <String, Map<String, String>>{};
  for (final entry in value.entries) {
    final sectionId = entry.key.toString();
    final sectionValue = entry.value;
    if (sectionValue is! Map) continue;
    final fields = <String, String>{};
    for (final field in sectionValue.entries) {
      final fieldValue = field.value?.toString().trim() ?? '';
      if (fieldValue.isNotEmpty) fields[field.key.toString()] = fieldValue;
    }
    if (fields.isNotEmpty) result[sectionId] = fields;
  }
  return result;
}

Map<String, List<Map<String, String>>> _repeatableConditionalSectionMap(
  Object? value,
) {
  if (value is! Map) return const {};
  final result = <String, List<Map<String, String>>>{};
  for (final entry in value.entries) {
    final sectionId = entry.key.toString();
    final sectionValue = entry.value;
    if (sectionValue is! Iterable) continue;
    final blocks = <Map<String, String>>[];
    for (final blockValue in sectionValue) {
      if (blockValue is! Map) continue;
      final block = <String, String>{};
      for (final field in blockValue.entries) {
        final fieldValue = field.value?.toString().trim() ?? '';
        if (fieldValue.isNotEmpty) block[field.key.toString()] = fieldValue;
      }
      if (block.isNotEmpty) blocks.add(block);
    }
    if (blocks.isNotEmpty) result[sectionId] = blocks;
  }
  return result;
}

Map<String, dynamic> _mapValue(Object? value) {
  if (value is Map) return Map<String, dynamic>.from(value);
  return <String, dynamic>{};
}

Map<String, dynamic> _profileMapWithIdentityFallback(
  Map<String, dynamic> profile,
  Map<String, dynamic> root,
) {
  final merged = Map<String, dynamic>.from(profile);
  final live = _mapValue(root['liveProfile']);
  for (final key in ['profileImageUrl', 'logoImageUrl']) {
    final profileValue = _normalizeImageUrl(merged[key]);
    final rootValue = _normalizeImageUrl(root[key]);
    final liveValue = _normalizeImageUrl(live[key]);

    if (profileValue.isNotEmpty) {
      merged[key] = profileValue;
    } else if (rootValue.isNotEmpty) {
      merged[key] = rootValue;
    } else if (liveValue.isNotEmpty) {
      merged[key] = liveValue;
    } else {
      merged[key] = '';
    }
  }
  return merged;
}

String _resolveIdentityImageUrl(_ProfilePayload payload) {
  final candidates = [
    payload.profileImageUrl,
    payload.logoImageUrl,
  ];
  for (final candidate in candidates) {
    final normalized = _normalizeImageUrl(candidate);
    if (normalized.isNotEmpty) return normalized;
  }
  return '';
}

Future<pw.ImageProvider?> _pdfIdentityImage(
  _ProfilePayload payload, {
  Uint8List? localImageBytes,
}) async {
  final url = _resolveIdentityImageUrl(payload);
  debugPrint(
    'Commercial V2 PDF image loader disabled by text-only handoff | url=$url | localBytes=${localImageBytes?.length ?? 0}',
  );
  debugPrint(
    'Commercial V2 identity image: fallback used | sourceBranch=PDF | exceptionType=none | exceptionMessage=image dependency removed from active Commercial V2 runtime',
  );
  return null;
}

String _pdfInitials(_ProfilePayload payload) {
  final name = payload.name.trim();
  if (name.isEmpty) return 'MS';
  final parts = name.split(RegExp(r'\s+')).where((part) => part.isNotEmpty);
  final initials = parts.take(2).map((part) => part[0].toUpperCase()).join();
  return initials.isEmpty ? 'MS' : initials;
}

String _normalizeImageUrl(Object? value) {
  return (value ?? '').toString().replaceAll(RegExp(r'\s+'), '').trim();
}

String? _commercialV2AuthEmailForPhone(String phone) {
  final digits = _phoneDigits(phone);
  if (digits.length < 6) return null;
  return 'commercial_v2_$digits@phone-auth.mental-smile.local';
}

String _filterKey(String value) {
  final normalized = value
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
      .replaceAll(RegExp(r'_+'), '_');
  return normalized.replaceAll(RegExp(r'^_|_$'), '');
}

String _phoneDigits(String value) {
  return value.replaceAll(RegExp(r'[^0-9]'), '');
}
