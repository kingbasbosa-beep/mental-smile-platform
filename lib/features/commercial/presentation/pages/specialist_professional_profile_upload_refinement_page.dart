import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SpecialistProfessionalProfileUploadRefinementPage extends StatefulWidget {
  const SpecialistProfessionalProfileUploadRefinementPage({super.key});

  @override
  State<SpecialistProfessionalProfileUploadRefinementPage> createState() =>
      _SpecialistProfessionalProfileUploadRefinementPageState();
}

class _SpecialistProfessionalProfileUploadRefinementPageState
    extends State<SpecialistProfessionalProfileUploadRefinementPage> {
  final _formKey = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();

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
  final _subSpecialty = TextEditingController();
  final _additionalNotes = TextEditingController();
  final _marketingNotes = TextEditingController();

  final Set<String> _publishingTargets = <String>{};

  String _cardLanguage = 'ar';
  String _backgroundPreference = 'choose';
  Uint8List? _personalPhotoBytes;
  String? _personalPhotoName;
  Uint8List? _logoBytes;
  String? _logoName;

  static const List<_PublishingTarget> _publishingTargetOptions = [
    _PublishingTarget('website', 'الموقع الإلكتروني', 'Website'),
    _PublishingTarget('facebook', 'فيسبوك', 'Facebook'),
    _PublishingTarget('instagram', 'إنستجرام', 'Instagram'),
    _PublishingTarget('x', 'منصة X', 'X'),
    _PublishingTarget('linkedin', 'لينكدإن', 'LinkedIn'),
    _PublishingTarget('telegram', 'تيليجرام', 'Telegram'),
    _PublishingTarget('tiktok', 'تيك توك', 'TikTok'),
    _PublishingTarget('youtube', 'يوتيوب', 'YouTube'),
    _PublishingTarget('whatsapp_channel', 'قناة واتساب', 'WhatsApp Channel'),
    _PublishingTarget('public_library', 'المكتبة العامة', 'Public Library'),
    _PublishingTarget(
      'specialist_directory',
      'دليل الأخصائيين',
      'Specialist Directory',
    ),
    _PublishingTarget('printable_cv', 'سيرة ذاتية للطباعة', 'Printable CV'),
    _PublishingTarget('business_card', 'بطاقة عمل', 'Business Card'),
    _PublishingTarget('qr_profile', 'ملف QR', 'QR Profile'),
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
      _subSpecialty,
      _additionalNotes,
      _marketingNotes,
    ]) {
      controller.dispose();
    }
    _clearLocalImages();
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
                _SectionBlock(
                  titleAr: 'بيانات بطاقة العمل',
                  titleEn: 'Business Card Identity',
                  icon: Icons.badge_outlined,
                  children: [
                    _twoColumn(
                      _field(
                        controller: _fullName,
                        labelAr: 'الاسم الكامل',
                        labelEn: 'Full Name',
                        required: true,
                      ),
                      _field(
                        controller: _mainSpecialty,
                        labelAr: 'التخصص الرئيسي',
                        labelEn: 'Main Specialty',
                        required: true,
                      ),
                    ),
                    _twoColumn(
                      _field(
                        controller: _phone,
                        labelAr: 'رقم الهاتف',
                        labelEn: 'Phone Number',
                        required: true,
                        keyboardType: TextInputType.phone,
                      ),
                      _field(
                        controller: _email,
                        labelAr: 'البريد الإلكتروني',
                        labelEn: 'Email',
                        required: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    _twoColumn(
                      _cardLanguageSelector(),
                      _field(
                        controller: _preferredColor,
                        labelAr: 'اللون المفضل',
                        labelEn: 'Preferred Color',
                      ),
                    ),
                    _backgroundSelector(),
                  ],
                ),
                _SectionBlock(
                  titleAr: 'الصورة الاختيارية',
                  titleEn: 'Optional Image Inputs',
                  icon: Icons.add_photo_alternate_outlined,
                  children: [
                    _LocalImagePickerBox(
                      titleAr: 'رفع صورة اختيارية',
                      titleEn: 'Optional Personal Photo',
                      noteAr:
                          'تستخدم كمدخل مؤقت للتوليد فقط وليست صورة ملف دائمة.',
                      bytes: _personalPhotoBytes,
                      fileName: _personalPhotoName,
                      onPick: () => _pickImage(_ImageSlot.personalPhoto),
                      onClear: () => _clearImage(_ImageSlot.personalPhoto),
                    ),
                    const SizedBox(height: 12),
                    _LocalImagePickerBox(
                      titleAr: 'رفع شعار اختياري',
                      titleEn: 'Optional Logo',
                      noteAr:
                          'يستخدم داخل المنتجات النهائية مثل CV والمواد التسويقية.',
                      bytes: _logoBytes,
                      fileName: _logoName,
                      onPick: () => _pickImage(_ImageSlot.logo),
                      onClear: () => _clearImage(_ImageSlot.logo),
                    ),
                  ],
                ),
                _SectionBlock(
                  titleAr: 'الملف المهني',
                  titleEn: 'Professional Profile',
                  icon: Icons.person_outline,
                  children: [
                    _field(
                      controller: _about,
                      labelAr: 'نبذة',
                      labelEn: 'About',
                      maxLines: 5,
                    ),
                    _twoColumn(
                      _field(
                        controller: _qualifications,
                        labelAr: 'المؤهلات',
                        labelEn: 'Qualifications',
                        maxLines: 2,
                      ),
                      _field(
                        controller: _certificates,
                        labelAr: 'الشهادات',
                        labelEn: 'Certificates',
                        maxLines: 2,
                      ),
                    ),
                    _twoColumn(
                      _field(
                        controller: _diplomas,
                        labelAr: 'الدبلومات',
                        labelEn: 'Diplomas',
                        maxLines: 2,
                      ),
                      _field(
                        controller: _experience,
                        labelAr: 'الخبرات',
                        labelEn: 'Experience',
                        maxLines: 2,
                      ),
                    ),
                    _twoColumn(
                      _field(
                        controller: _services,
                        labelAr: 'الخدمات',
                        labelEn: 'Services',
                        maxLines: 2,
                      ),
                      _field(
                        controller: _city,
                        labelAr: 'المدينة',
                        labelEn: 'City',
                      ),
                    ),
                    _field(
                      controller: _additionalNotes,
                      labelAr: 'ملاحظات إضافية',
                      labelEn: 'Additional Notes',
                      maxLines: 5,
                    ),
                  ],
                ),
                _SectionBlock(
                  titleAr: 'أماكن النشر',
                  titleEn: 'Publishing Targets',
                  icon: Icons.campaign_outlined,
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
                  titleAr: 'ملاحظات إضافية',
                  titleEn: 'Additional Notes',
                  icon: Icons.edit_note_outlined,
                  children: [
                    _field(
                      controller: _marketingNotes,
                      labelAr: 'ملاحظات تساعد فريق التسويق',
                      labelEn: 'Notes for Marketing team',
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

  Widget _field({
    required TextEditingController controller,
    required String labelAr,
    required String labelEn,
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
        decoration: _inputDecoration(labelAr: labelAr, labelEn: labelEn),
      ),
    );
  }

  Widget _cardLanguageSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: _cardLanguage,
        dropdownColor: const Color(0xFF15100A),
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        decoration: _inputDecoration(
          labelAr: 'لغة الكارت',
          labelEn: 'Preferred Card Language',
        ),
        items: const [
          DropdownMenuItem(value: 'ar', child: Text('عربي')),
          DropdownMenuItem(value: 'en', child: Text('English')),
          DropdownMenuItem(value: 'ar_en', child: Text('عربي / English')),
          DropdownMenuItem(value: 'en_ar', child: Text('English / عربي')),
        ],
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
        decoration: _inputDecoration(
          labelAr: 'الخلفية',
          labelEn: 'Background',
        ),
        items: const [
          DropdownMenuItem(value: 'yes', child: Text('نعم / Yes')),
          DropdownMenuItem(value: 'no', child: Text('لا / No')),
          DropdownMenuItem(
            value: 'choose',
            child: Text('Mental Smile يختار / Let Mental Smile choose'),
          ),
        ],
        onChanged: (value) {
          if (value == null) return;
          setState(() => _backgroundPreference = value);
        },
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String labelAr,
    required String labelEn,
  }) {
    return InputDecoration(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _fieldIconFor(labelEn),
            color: const Color(0xFFE0C174),
            size: 16,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(labelAr),
                Text(
                  labelEn,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.headphones_outlined,
            color: Color(0xFFE0C174),
            size: 15,
          ),
        ],
      ),
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

  IconData _fieldIconFor(String labelEn) {
    switch (labelEn) {
      case 'Full Name':
        return Icons.person_outline;
      case 'Main Specialty':
        return Icons.psychology_outlined;
      case 'Phone Number':
        return Icons.phone_outlined;
      case 'Email':
        return Icons.email_outlined;
      case 'Preferred Card Language':
        return Icons.translate_outlined;
      case 'Preferred Color':
        return Icons.palette_outlined;
      case 'Background':
        return Icons.image_outlined;
      case 'About':
        return Icons.info_outline;
      case 'Qualifications':
        return Icons.school_outlined;
      case 'Certificates':
        return Icons.workspace_premium_outlined;
      case 'Diplomas':
        return Icons.card_membership_outlined;
      case 'Experience':
        return Icons.work_outline;
      case 'Services':
        return Icons.volunteer_activism_outlined;
      case 'City':
        return Icons.location_city_outlined;
      case 'Additional Notes':
        return Icons.edit_note_outlined;
      case 'Notes for Marketing team':
        return Icons.notes_outlined;
      default:
        return Icons.label_outline;
    }
  }

  Future<void> _pickImage(_ImageSlot slot) async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final bytes = await image.readAsBytes();
    if (!mounted || bytes.isEmpty) return;

    setState(() {
      switch (slot) {
        case _ImageSlot.personalPhoto:
          _personalPhotoBytes = bytes;
          _personalPhotoName = image.name;
        case _ImageSlot.logo:
          _logoBytes = bytes;
          _logoName = image.name;
      }
    });
  }

  void _clearImage(_ImageSlot slot) {
    setState(() {
      switch (slot) {
        case _ImageSlot.personalPhoto:
          _personalPhotoBytes = null;
          _personalPhotoName = null;
        case _ImageSlot.logo:
          _logoBytes = null;
          _logoName = null;
      }
    });
  }

  void _clearLocalImages() {
    _personalPhotoBytes = null;
    _personalPhotoName = null;
    _logoBytes = null;
    _logoName = null;
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
        'personalPhotoSelected': _personalPhotoBytes != null,
        'personalPhotoFileName': _personalPhotoName,
        'personalPhotoPermanentProfileImage': false,
        'logoSelected': _logoBytes != null,
        'logoFileName': _logoName,
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
      'marketingNotes': _marketingNotes.text.trim(),
      'targetDepartment': 'Marketing Department',
      'productsGeneratedInsideSpecialistRoom': false,
    };

    debugPrint(
      'Raw Professional Profile prepared locally: '
      '${rawProfessionalProfile.keys.join(', ')}',
    );

    setState(_clearLocalImages);
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({
    required this.titleAr,
    required this.titleEn,
    required this.icon,
    required this.children,
  });

  final String titleAr;
  final String titleEn;
  final IconData icon;
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
          Row(
            children: [
              Icon(icon, color: const Color(0xFFFFE8A3), size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleAr,
                      style: const TextStyle(
                        color: Color(0xFFFFE8A3),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      titleEn,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        color: Color(0xFFD6BD7A),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.headphones_outlined,
                color: Color(0xFFFFE8A3),
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}

class _LocalImagePickerBox extends StatelessWidget {
  const _LocalImagePickerBox({
    required this.titleAr,
    required this.titleEn,
    required this.noteAr,
    required this.bytes,
    required this.fileName,
    required this.onPick,
    required this.onClear,
  });

  final String titleAr;
  final String titleEn;
  final String noteAr;
  final Uint8List? bytes;
  final String? fileName;
  final VoidCallback onPick;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final hasImage = bytes != null && bytes!.isNotEmpty;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8A621D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.image_outlined,
                color: Color(0xFFFFE8A3),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleAr,
                      style: const TextStyle(
                        color: Color(0xFFFFE8A3),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      titleEn,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        color: Color(0xFFD6BD7A),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.headphones_outlined,
                color: Color(0xFFFFE8A3),
                size: 18,
              ),
              if (hasImage)
                IconButton(
                  tooltip: 'Remove',
                  onPressed: onClear,
                  icon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.close,
                        color: Color(0xFFFFE8A3),
                        size: 18,
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.headphones_outlined,
                        color: Color(0xFFFFE8A3),
                        size: 14,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            noteAr,
            style: const TextStyle(
              color: Color(0xFFD6BD7A),
              fontSize: 12,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          if (!hasImage) ...[
            Container(
              width: 96,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF070604),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFE0C174),
                  width: 1.4,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Color(0xFFFFE8A3),
                  size: 34,
                ),
              ),
            ),
          ] else ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 96,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF070604),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFE0C174),
                    width: 1.4,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.memory(
                  bytes!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              fileName ?? 'Image selected',
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                color: Color(0xFFFFE8A3),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onPick,
            icon: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.upload_file_outlined),
                SizedBox(width: 4),
                Icon(Icons.headphones_outlined, size: 16),
              ],
            ),
            label: Text(hasImage ? 'تغيير الصورة' : 'رفع صورة اختيارية'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFFFE8A3),
              side: const BorderSide(color: Color(0xFFE0C174)),
            ),
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

  final List<_PublishingTarget> options;
  final Set<String> selected;
  final void Function(String target, bool selected) onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: options.map((target) {
        final isSelected = selected.contains(target.key);
        return FilterChip(
          avatar: SizedBox(
            width: 34,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected ? Icons.check_circle : Icons.add_circle_outline,
                  color: Colors.black,
                  size: 15,
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.headphones_outlined,
                  color: Colors.black,
                  size: 13,
                ),
              ],
            ),
          ),
          label: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(target.labelAr),
              Text(
                target.labelEn,
                textDirection: TextDirection.ltr,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
          selected: isSelected,
          selectedColor: const Color(0xFFE0C174),
          checkmarkColor: Colors.black,
          backgroundColor: const Color(0xFFC8952D),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          side: BorderSide(
            color: isSelected ? Colors.black : const Color(0xFFFFE8A3),
            width: isSelected ? 1.4 : 1,
          ),
          onSelected: (value) => onChanged(target.key, value),
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite, color: Colors.black, size: 18),
            SizedBox(width: 8),
            Text('💛 معاكم يا شباب 😊'),
            SizedBox(width: 8),
            Icon(Icons.headphones_outlined, color: Colors.black, size: 18),
          ],
        ),
      ),
    );
  }
}

class _PublishingTarget {
  const _PublishingTarget(this.key, this.labelAr, this.labelEn);

  final String key;
  final String labelAr;
  final String labelEn;
}

enum _ImageSlot { personalPhoto, logo }

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
