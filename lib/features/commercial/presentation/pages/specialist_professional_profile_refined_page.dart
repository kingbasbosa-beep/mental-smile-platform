import 'package:flutter/material.dart';

class SpecialistProfessionalProfileRefinedPage extends StatefulWidget {
  const SpecialistProfessionalProfileRefinedPage({super.key});

  @override
  State<SpecialistProfessionalProfileRefinedPage> createState() =>
      _SpecialistProfessionalProfileRefinedPageState();
}

class _SpecialistProfessionalProfileRefinedPageState
    extends State<SpecialistProfessionalProfileRefinedPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _mainSpecialty = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _preferredColor = TextEditingController();
  final _about = TextEditingController();
  final _qualifications = TextEditingController();
  final _certificates = TextEditingController();
  final _diplomas = TextEditingController();
  final _experience = TextEditingController();
  final _services = TextEditingController();
  final _city = TextEditingController();
  final _additionalNotes = TextEditingController();
  final _generationNotes = TextEditingController();

  final Set<String> _publishingTargets = <String>{};

  String _cardLanguage = 'عربي';
  String _backgroundPreference = 'Let Mental Smile choose';
  bool _personalPhotoAttached = false;
  bool _logoAttached = false;

  static const List<String> _publishingTargetOptions = [
    'Website',
    'Facebook',
    'Instagram',
    'X',
    'LinkedIn',
    'Telegram',
    'TikTok',
    'YouTube',
    'WhatsApp Channel',
    'Public Library',
    'Specialist Directory',
    'Printable CV',
    'Business Card',
    'QR Profile',
  ];

  @override
  void dispose() {
    for (final controller in [
      _fullName,
      _mainSpecialty,
      _phone,
      _email,
      _preferredColor,
      _about,
      _qualifications,
      _certificates,
      _diplomas,
      _experience,
      _services,
      _city,
      _additionalNotes,
      _generationNotes,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF090704),
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: const Color(0xFFFFE8A3),
          title: const Text('الملف المهني'),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
              children: [
                const _HeaderBlock(),
                const SizedBox(height: 18),
                _SectionBlock(
                  title: 'Business Card Identity',
                  children: [
                    _twoColumn(
                      _field(_fullName, 'Full Name', required: true),
                      _field(
                        _mainSpecialty,
                        'Main Specialty',
                        required: true,
                      ),
                    ),
                    _twoColumn(
                      _field(
                        _phone,
                        'Phone Number',
                        required: true,
                        keyboardType: TextInputType.phone,
                      ),
                      _field(
                        _email,
                        'Email',
                        required: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    _twoColumn(
                      _languageSelector(),
                      _field(_preferredColor, 'Preferred Color'),
                    ),
                    _backgroundSelector(),
                  ],
                ),
                _SectionBlock(
                  title: 'Temporary Generation Inputs',
                  children: [
                    _TemporaryAssetPicker(
                      title: 'Personal Photo',
                      subtitle:
                          'Optional temporary input for generation. It is not a permanent profile photo.',
                      attached: _personalPhotoAttached,
                      onChanged: (value) {
                        setState(() => _personalPhotoAttached = value);
                      },
                    ),
                    const SizedBox(height: 12),
                    _TemporaryAssetPicker(
                      title: 'Logo Upload',
                      subtitle:
                          'Optional input for generated CV and marketing materials.',
                      attached: _logoAttached,
                      onChanged: (value) {
                        setState(() => _logoAttached = value);
                      },
                    ),
                  ],
                ),
                _SectionBlock(
                  title: 'Professional Profile',
                  children: [
                    _field(_about, 'About', maxLines: 5),
                    _twoColumn(
                      _field(_qualifications, 'Qualifications', maxLines: 2),
                      _field(_certificates, 'Certificates', maxLines: 2),
                    ),
                    _twoColumn(
                      _field(_diplomas, 'Diplomas', maxLines: 2),
                      _field(_experience, 'Experience', maxLines: 2),
                    ),
                    _twoColumn(
                      _field(_services, 'Services', maxLines: 2),
                      _field(_city, 'City'),
                    ),
                    _field(
                      _additionalNotes,
                      'Additional Notes',
                      maxLines: 5,
                    ),
                  ],
                ),
                _SectionBlock(
                  title:
                      'Where would you like Mental Smile to publish your content?',
                  children: [
                    _PublishingTargetsSelector(
                      options: _publishingTargetOptions,
                      selected: _publishingTargets,
                      onChanged: (target, selected) {
                        setState(() {
                          if (selected) {
                            _publishingTargets.add(target);
                          } else {
                            _publishingTargets.remove(target);
                          }
                        });
                      },
                    ),
                  ],
                ),
                _SectionBlock(
                  title: 'Additional Notes',
                  children: [
                    _field(
                      _generationNotes,
                      'Notes for Marketing team',
                      maxLines: 6,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                _SaveButton(onPressed: _saveRawProfessionalProfile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _twoColumn(Widget first, Widget second) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 620) {
          return Column(children: [first, second]);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: first),
            const SizedBox(width: 12),
            Expanded(child: second),
          ],
        );
      },
    );
  }

  Widget _languageSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: _cardLanguage,
        dropdownColor: const Color(0xFF15100A),
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        decoration: _inputDecoration('Preferred Card Language'),
        items: const [
          'عربي',
          'English',
          'عربي / English',
          'English / عربي',
        ].map((value) {
          return DropdownMenuItem(value: value, child: Text(value));
        }).toList(),
        onChanged: (value) {
          if (value == null) return;
          setState(() => _cardLanguage = value);
        },
      ),
    );
  }

  Widget _backgroundSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: _backgroundPreference,
        dropdownColor: const Color(0xFF15100A),
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        decoration: _inputDecoration('Background'),
        items: const [
          'Yes',
          'No',
          'Let Mental Smile choose',
        ].map((value) {
          return DropdownMenuItem(value: value, child: Text(value));
        }).toList(),
        onChanged: (value) {
          if (value == null) return;
          setState(() => _backgroundPreference = value);
        },
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    bool required = false,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        validator: required
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Required';
                }
                return null;
              }
            : null,
        decoration: _inputDecoration(label),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFFE0C174)),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.045),
      errorStyle: const TextStyle(color: Color(0xFFFFA3A3)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF8A621D)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFFE8A3), width: 1.4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFFA3A3)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFFA3A3), width: 1.4),
      ),
    );
  }

  void _saveRawProfessionalProfile() {
    if (!_formKey.currentState!.validate()) return;

    final rawProfessionalProfile = <String, Object?>{
      'businessCardIdentity': {
        'fullName': _fullName.text.trim(),
        'mainSpecialty': _mainSpecialty.text.trim(),
        'phone': _phone.text.trim(),
        'email': _email.text.trim(),
        'preferredCardLanguage': _cardLanguage,
        'preferredColor': _preferredColor.text.trim(),
        'background': _backgroundPreference,
      },
      'temporaryGenerationInputs': {
        'personalPhotoAttached': _personalPhotoAttached,
        'personalPhotoPermanentProfileImage': false,
        'logoAttached': _logoAttached,
      },
      'professionalProfile': {
        'about': _about.text.trim(),
        'qualifications': _qualifications.text.trim(),
        'certificates': _certificates.text.trim(),
        'diplomas': _diplomas.text.trim(),
        'experience': _experience.text.trim(),
        'services': _services.text.trim(),
        'city': _city.text.trim(),
        'additionalNotes': _additionalNotes.text.trim(),
      },
      'publishingTargets': _publishingTargets.toList(growable: false),
      'generationNotes': _generationNotes.text.trim(),
      'targetDepartment': 'Marketing Department',
      'productsGeneratedInsideSpecialistRoom': false,
    };

    debugPrint(
      'Raw Professional Profile refined locally: '
      '${rawProfessionalProfile.keys.join(', ')}',
    );
  }
}

class _HeaderBlock extends StatelessWidget {
  const _HeaderBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _goldPanelDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Raw Professional Profile',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Color(0xFFFFE8A3),
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'غرفة الأخصائي تجمع المعلومات الخام فقط، ثم تجهزها لقسم التسويق.',
            style: TextStyle(
              color: Color(0xFFD6BD7A),
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: _goldPanelDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              color: Color(0xFFFFE8A3),
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}

class _TemporaryAssetPicker extends StatelessWidget {
  const _TemporaryAssetPicker({
    required this.title,
    required this.subtitle,
    required this.attached,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool attached;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8A621D)),
      ),
      child: Row(
        children: [
          Icon(
            attached ? Icons.check_circle_outline : Icons.add_photo_alternate,
            color: const Color(0xFFFFE8A3),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    color: Color(0xFFD6BD7A),
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => onChanged(!attached),
            child: Text(attached ? 'Remove' : 'Add'),
          ),
        ],
      ),
    );
  }
}

class _PublishingTargetsSelector extends StatelessWidget {
  const _PublishingTargetsSelector({
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<String> options;
  final Set<String> selected;
  final void Function(String target, bool selected) onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: options.map((target) {
        final isSelected = selected.contains(target);
        return FilterChip(
          label: Text(target),
          selected: isSelected,
          selectedColor: const Color(0xFFE0C174),
          checkmarkColor: Colors.black,
          backgroundColor: Colors.white.withValues(alpha: 0.06),
          labelStyle: TextStyle(
            color: isSelected ? Colors.black : const Color(0xFFFFE8A3),
            fontWeight: FontWeight.w700,
          ),
          side: const BorderSide(color: Color(0xFF8A621D)),
          onSelected: (value) => onChanged(target, value),
        );
      }).toList(),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE0C174),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        child: const Text('💛 معاكم يا شباب 😊'),
      ),
    );
  }
}

BoxDecoration _goldPanelDecoration() {
  return BoxDecoration(
    color: Colors.black.withValues(alpha: 0.72),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: const Color(0xFF8A621D)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.35),
        blurRadius: 18,
        offset: const Offset(0, 10),
      ),
    ],
  );
}
