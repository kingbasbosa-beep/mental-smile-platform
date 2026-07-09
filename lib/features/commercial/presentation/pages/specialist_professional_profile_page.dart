import 'package:flutter/material.dart';

class SpecialistProfessionalProfilePage extends StatefulWidget {
  const SpecialistProfessionalProfilePage({super.key});

  @override
  State<SpecialistProfessionalProfilePage> createState() =>
      _SpecialistProfessionalProfilePageState();
}

class _SpecialistProfessionalProfilePageState
    extends State<SpecialistProfessionalProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _mainSpecialty = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _cardColor = TextEditingController();
  final _designerNotes = TextEditingController();
  final _about = TextEditingController();
  final _qualifications = TextEditingController();
  final _certificates = TextEditingController();
  final _diplomas = TextEditingController();
  final _experience = TextEditingController();
  final _services = TextEditingController();
  final _city = TextEditingController();
  final _address = TextEditingController();
  final _whatsApp = TextEditingController();
  final _facebook = TextEditingController();
  final _linkedIn = TextEditingController();
  final _website = TextEditingController();
  final _instagram = TextEditingController();
  final _telegram = TextEditingController();
  final _x = TextEditingController();
  final _additionalNotes = TextEditingController();
  final _aiNotes = TextEditingController();

  String _cardLanguage = 'عربي';
  bool _prefersBackground = false;
  bool _photoSelectedForGeneration = false;

  @override
  void dispose() {
    for (final controller in [
      _fullName,
      _mainSpecialty,
      _phone,
      _email,
      _cardColor,
      _designerNotes,
      _about,
      _qualifications,
      _certificates,
      _diplomas,
      _experience,
      _services,
      _city,
      _address,
      _whatsApp,
      _facebook,
      _linkedIn,
      _website,
      _instagram,
      _telegram,
      _x,
      _additionalNotes,
      _aiNotes,
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
                _HeaderBlock(),
                const SizedBox(height: 18),
                _SectionBlock(
                  title: 'Business Card Identity',
                  children: [
                    _field(_fullName, 'الاسم الكامل', required: true),
                    _field(_mainSpecialty, 'التخصص الرئيسي', required: true),
                    _field(
                      _phone,
                      'رقم الهاتف',
                      required: true,
                      keyboardType: TextInputType.phone,
                    ),
                    _field(
                      _email,
                      'البريد الإلكتروني',
                      required: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _languageSelector(),
                    _field(_cardColor, 'اللون المفضل للكارت'),
                    SwitchListTile.adaptive(
                      value: _prefersBackground,
                      activeThumbColor: const Color(0xFFE0C174),
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        'هل يفضل وجود خلفية؟',
                        style: TextStyle(color: Color(0xFFFFE8A3)),
                      ),
                      onChanged: (value) {
                        setState(() => _prefersBackground = value);
                      },
                    ),
                    _field(
                      _designerNotes,
                      'ملاحظات بسيطة للمصمم',
                      maxLines: 3,
                    ),
                    CheckboxListTile(
                      value: _photoSelectedForGeneration,
                      activeColor: const Color(0xFFE0C174),
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        'صورة اختيارية للتوليد فقط',
                        style: TextStyle(color: Color(0xFFFFE8A3)),
                      ),
                      subtitle: const Text(
                        'لا تعتبر صورة دائمة ولا تعرض داخل المكتبة مباشرة.',
                        style: TextStyle(color: Color(0xFFD6BD7A)),
                      ),
                      onChanged: (value) {
                        setState(
                          () => _photoSelectedForGeneration = value ?? false,
                        );
                      },
                    ),
                  ],
                ),
                _SectionBlock(
                  title: 'Professional Profile',
                  children: [
                    _field(_about, 'نبذة', maxLines: 4),
                    _field(_qualifications, 'المؤهلات', maxLines: 3),
                    _field(_certificates, 'الشهادات', maxLines: 3),
                    _field(_diplomas, 'الدبلومات', maxLines: 3),
                    _field(_experience, 'الخبرات', maxLines: 4),
                    _field(_services, 'الخدمات', maxLines: 4),
                    _field(_city, 'المدينة'),
                    _field(_address, 'العنوان', maxLines: 2),
                    _field(_whatsApp, 'WhatsApp'),
                    _field(_facebook, 'Facebook'),
                    _field(_linkedIn, 'LinkedIn'),
                    _field(_website, 'Website'),
                    _field(_instagram, 'Instagram'),
                    _field(_telegram, 'Telegram'),
                    _field(_x, 'X'),
                    _field(_additionalNotes, 'أي معلومات إضافية', maxLines: 4),
                  ],
                ),
                _SectionBlock(
                  title: 'AI Generation Notes',
                  children: [
                    _field(
                      _aiNotes,
                      'ملاحظات تساعد وحدة التوليد',
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

  Widget _languageSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: _cardLanguage,
        dropdownColor: const Color(0xFF15100A),
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        decoration: _inputDecoration('لغة الكارت'),
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
                  return 'هذا الحقل مطلوب';
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
        'cardLanguage': _cardLanguage,
        'preferredCardColor': _cardColor.text.trim(),
        'prefersBackground': _prefersBackground,
        'designerNotes': _designerNotes.text.trim(),
      },
      'personalPhoto': {
        'selectedForGenerationOnly': _photoSelectedForGeneration,
        'persistentProfilePhoto': false,
      },
      'professionalProfile': {
        'about': _about.text.trim(),
        'qualifications': _qualifications.text.trim(),
        'certificates': _certificates.text.trim(),
        'diplomas': _diplomas.text.trim(),
        'experience': _experience.text.trim(),
        'services': _services.text.trim(),
        'city': _city.text.trim(),
        'address': _address.text.trim(),
        'links': {
          'whatsApp': _whatsApp.text.trim(),
          'facebook': _facebook.text.trim(),
          'linkedIn': _linkedIn.text.trim(),
          'website': _website.text.trim(),
          'instagram': _instagram.text.trim(),
          'telegram': _telegram.text.trim(),
          'x': _x.text.trim(),
        },
        'additionalNotes': _additionalNotes.text.trim(),
      },
      'aiGenerationNotes': _aiNotes.text.trim(),
      'targetUnit': 'Marketing Generation Unit',
      'productsGeneratedInsideSpecialistRoom': false,
    };

    debugPrint(
      'Raw Professional Profile prepared locally: '
      '${rawProfessionalProfile.keys.join(', ')}',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم حفظ البيانات الخام محليا وتجهيزها لوحدة Marketing Generation.',
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}

class _HeaderBlock extends StatelessWidget {
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
            style: TextStyle(
              color: Color(0xFFFFE8A3),
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'هذه الصفحة تجمع البيانات الخام فقط. لا تقوم بأي توليد أو نشر أو إنشاء منتجات.',
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
        child: const Text('حفظ الملف الخام'),
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
