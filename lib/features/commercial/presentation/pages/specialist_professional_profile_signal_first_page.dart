import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SpecialistProfessionalProfileSignalFirstPage extends StatefulWidget {
  const SpecialistProfessionalProfileSignalFirstPage({super.key});

  @override
  State<SpecialistProfessionalProfileSignalFirstPage> createState() =>
      _SpecialistProfessionalProfileSignalFirstPageState();
}

class _SpecialistProfessionalProfileSignalFirstPageState
    extends State<SpecialistProfessionalProfileSignalFirstPage> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _subSpecialty = TextEditingController();
  final _about = TextEditingController();
  final _additionalInfo = TextEditingController();
  final _marketingNotes = TextEditingController();

  String _specialty = 'psychologist';
  String _cardLanguage = 'ar';
  String _appearanceStyle = 'choose';
  String _background = 'choose';
  Uint8List? _photoBytes;
  String? _photoName;

  final Set<String> _visibilityStyle = <String>{};
  final Set<String> _publishingTargets = <String>{};
  final Set<String> _presentationFormats = <String>{};

  static const _specialties = [
    _Option('psychologist', 'أخصائي نفسي', 'Psychologist'),
    _Option('social_worker', 'أخصائي اجتماعي', 'Social Worker'),
    _Option('clinical', 'أخصائي إكلينيكي', 'Clinical Specialist'),
    _Option('family_counseling', 'أخصائي مشورة أسرية', 'Family Counseling'),
    _Option('addiction_behavior', 'مرشد علاج سلوكيات إدمانية',
        'Addiction Behavior'),
    _Option('coaching', 'أخصائي كوتشينج', 'Coaching'),
    _Option('support_supervisor', 'مشرف برامج دعم', 'Support Programs'),
    _Option('behavior_autism', 'أخصائي تعديل سلوك وتوحد', 'Behavior & Autism'),
    _Option('speech', 'أخصائي تخاطب', 'Speech Specialist'),
    _Option(
        'addiction_recovery', 'علاج السلوكيات الإدمانية', 'Addiction Recovery'),
  ];

  static const _appearanceStyles = [
    _Option('calm_reassuring', 'هادي ومطمئن', 'Calm & reassuring'),
    _Option('professional_trusted', 'رسمي وموثوق', 'Professional & trusted'),
    _Option('warm_friendly', 'دافئ وقريب', 'Warm & friendly'),
    _Option('modern_clear', 'عصري وواضح', 'Modern & clear'),
    _Option('simple_direct', 'بسيط ومباشر', 'Simple & direct'),
    _Option('choose', 'اتركوا الاختيار لنا', 'Let Mental Smile choose'),
  ];

  static const _visibilityOptions = [
    _Option('calm', 'هادي', 'Calm'),
    _Option('formal', 'رسمي', 'Formal'),
    _Option('people_friendly', 'قريب من الناس', 'People friendly'),
    _Option('educational', 'تعليمي', 'Educational'),
    _Option('brief', 'مختصر', 'Brief'),
    _Option('detailed', 'تفصيلي', 'Detailed'),
  ];

  static const _publishingOptions = [
    _Option('website', 'الموقع الإلكتروني', 'Website'),
    _Option('facebook', 'فيسبوك', 'Facebook'),
    _Option('instagram', 'إنستجرام', 'Instagram'),
    _Option('x', 'منصة إكس', 'X'),
    _Option('linkedin', 'لينكدإن', 'LinkedIn'),
    _Option('telegram', 'تيليجرام', 'Telegram'),
    _Option('tiktok', 'تيك توك', 'TikTok'),
    _Option('youtube', 'يوتيوب', 'YouTube'),
    _Option('whatsapp_channel', 'قناة واتساب', 'WhatsApp Channel'),
    _Option('public_library', 'المكتبة العامة', 'Public Library'),
    _Option('specialist_directory', 'دليل الأخصائيين', 'Specialist Directory'),
    _Option('printable_cv', 'سيرة ذاتية للطباعة', 'Printable CV'),
    _Option('business_card', 'بطاقة عمل', 'Business Card'),
    _Option('qr_profile', 'ملف رمز الاستجابة السريعة', 'QR Profile'),
  ];

  static const _presentationOptions = [
    _Option('short_card', 'بطاقة مختصرة', 'Short Card'),
    _Option('professional_profile', 'ملف مهني', 'Professional Profile'),
    _Option('cv', 'سيرة ذاتية', 'CV'),
    _Option('intro_post', 'بوست تعريفي', 'Intro Post'),
    _Option('qr_profile', 'ملف رمز الاستجابة السريعة', 'QR Profile'),
    _Option('all_available', 'كل المتاح', 'All Available'),
  ];

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _email.dispose();
    _subSpecialty.dispose();
    _about.dispose();
    _additionalInfo.dispose();
    _marketingNotes.dispose();
    _photoBytes = null;
    _photoName = null;
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
                _section(
                  'بيانات بطاقة العمل',
                  'Business Card Identity',
                  Icons.badge_outlined,
                  [
                    _two(
                        _field(_fullName, 'الاسم الكامل', 'Full Name',
                            Icons.person_outline,
                            required: true),
                        _specialtyDropdown()),
                    _two(
                        _field(_phone, 'رقم الهاتف', 'Phone Number',
                            Icons.phone_outlined,
                            required: true, keyboardType: TextInputType.phone),
                        _field(_email, 'البريد الإلكتروني', 'Email',
                            Icons.email_outlined,
                            required: true,
                            keyboardType: TextInputType.emailAddress)),
                    _two(_languageDropdown(), _appearanceDropdown()),
                    _backgroundDropdown(),
                  ],
                ),
                _section(
                  'الصورة الاختيارية',
                  'Optional Personal Photo',
                  Icons.add_photo_alternate_outlined,
                  [_photoPicker()],
                ),
                _section(
                  'الملف المهني',
                  'Professional Profile',
                  Icons.person_outline,
                  [
                    _field(_about, 'نبذة مختصرة', 'Short About',
                        Icons.info_outline,
                        maxLines: 5),
                    _field(_subSpecialty, 'تخصص فرعي إضافي',
                        'Additional Sub-specialty', Icons.category_outlined),
                    _choiceGroup(
                        'تحب ظهورك يكون أقرب لإيه؟',
                        'Preferred presence',
                        Icons.tune_outlined,
                        _visibilityOptions,
                        _visibilityStyle),
                    _choiceGroup(
                        'تفضل طريقة عرضك تكون:',
                        'Preferred format',
                        Icons.view_quilt_outlined,
                        _presentationOptions,
                        _presentationFormats),
                    _field(_additionalInfo, 'معلومات إضافية',
                        'Additional Information', Icons.edit_note_outlined,
                        maxLines: 5),
                  ],
                ),
                _section(
                  'أماكن النشر',
                  'Publishing Targets',
                  Icons.campaign_outlined,
                  [
                    _choiceGroup(
                        'تحب المحتوى يظهر فين؟',
                        'Where should content appear?',
                        Icons.share_outlined,
                        _publishingOptions,
                        _publishingTargets)
                  ],
                ),
                _section(
                  'ملاحظات إضافية',
                  'Additional Notes',
                  Icons.notes_outlined,
                  [
                    _field(_marketingNotes, 'ملاحظات تساعد فريق التسويق',
                        'Notes for Marketing team', Icons.notes_outlined,
                        maxLines: 6)
                  ],
                ),
                const SizedBox(height: 6),
                _saveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _two(Widget a, Widget b) {
    return LayoutBuilder(builder: (context, c) {
      if (c.maxWidth < 620) return Column(children: [a, b]);
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: a),
        const SizedBox(width: 12),
        Expanded(child: b),
      ]);
    });
  }

  Widget _section(String ar, String en, IconData icon, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: _panelDecoration(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(icon, color: const Color(0xFFFFE8A3)),
          const SizedBox(width: 8),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(_localizedTitle(ar, en),
                    style: const TextStyle(
                        color: Color(0xFFFFE8A3),
                        fontSize: 18,
                        fontWeight: FontWeight.w900)),
              ])),
          const Icon(Icons.headphones_outlined, color: Color(0xFFFFE8A3)),
        ]),
        const SizedBox(height: 14),
        ...children,
      ]),
    );
  }

  Widget _field(
      TextEditingController controller, String ar, String en, IconData icon,
      {bool required = false, int maxLines = 1, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        validator: required
            ? (v) => (v == null || v.trim().isEmpty) ? 'هذا الحقل مطلوب' : null
            : null,
        decoration: _decor(ar, en, icon),
      ),
    );
  }

  Widget _specialtyDropdown() => _dropdown(
      'التخصص الرئيسي',
      'Main Specialty',
      Icons.psychology_outlined,
      _specialty,
      _specialties,
      (v) => setState(() => _specialty = v));
  Widget _languageDropdown() => _dropdown(
      'لغة الكارت',
      'Card Language',
      Icons.translate_outlined,
      _cardLanguage,
      const [
        _Option('ar', 'عربي', 'Arabic'),
        _Option('en', 'إنجليزي', 'English'),
        _Option('ar_en', 'عربي / إنجليزي', 'Arabic / English'),
        _Option('en_ar', 'إنجليزي / عربي', 'English / Arabic'),
      ],
      (v) => setState(() => _cardLanguage = v));
  Widget _appearanceDropdown() => _dropdown(
      'أسلوب الظهور',
      'Appearance Style',
      Icons.auto_awesome_outlined,
      _appearanceStyle,
      _appearanceStyles,
      (v) => setState(() => _appearanceStyle = v));
  Widget _backgroundDropdown() => _dropdown(
      'الخلفية',
      'Background',
      Icons.image_outlined,
      _background,
      const [
        _Option('yes', 'نعم', 'Yes'),
        _Option('no', 'لا', 'No'),
        _Option('choose', 'اتركوا الاختيار لنا', 'Let Mental Smile choose'),
      ],
      (v) => setState(() => _background = v));

  Widget _dropdown(String ar, String en, IconData icon, String value,
      List<_Option> options, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        dropdownColor: const Color(0xFF15100A),
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        decoration: _decor(ar, en, icon),
        items: options
            .map((o) => DropdownMenuItem(value: o.key, child: Text(o.ar)))
            .toList(),
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }

  InputDecoration _decor(String ar, String en, IconData icon) {
    return InputDecoration(
      label: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: const Color(0xFFE0C174), size: 16),
        const SizedBox(width: 6),
        Flexible(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
              Text(_localizedTitle(ar, en)),
            ])),
        const SizedBox(width: 6),
        const Icon(Icons.headphones_outlined,
            color: Color(0xFFE0C174), size: 15),
      ]),
      labelStyle: const TextStyle(color: Color(0xFFE0C174)),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.045),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF8A621D))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFFE8A3), width: 1.4)),
    );
  }

  Widget _photoPicker() {
    final hasImage = _photoBytes != null;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF8A621D))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 96,
          height: 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: const Color(0xFF070604),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE0C174), width: 1.4)),
          child: hasImage
              ? Image.memory(_photoBytes!, fit: BoxFit.cover)
              : const Icon(Icons.add_photo_alternate_outlined,
                  color: Color(0xFFFFE8A3), size: 34),
        ),
        const SizedBox(width: 12),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _miniTitle('رفع صورة اختيارية', 'Optional personal photo',
              Icons.image_outlined),
          const SizedBox(height: 8),
          const Text('تستخدم كمدخل مؤقت فقط وليست صورة ملف دائمة.',
              style: TextStyle(color: Color(0xFFD6BD7A), fontSize: 12)),
          if (_photoName != null)
            Text(_photoName!,
                textDirection: TextDirection.ltr,
                style: const TextStyle(color: Color(0xFFFFE8A3), fontSize: 12)),
          const SizedBox(height: 10),
          Wrap(spacing: 8, children: [
            OutlinedButton.icon(
                onPressed: _pickPhoto,
                icon: const Icon(Icons.upload_file_outlined),
                label: const Text('رفع صورة اختيارية')),
            if (hasImage)
              IconButton(
                  onPressed: () => setState(() {
                        _photoBytes = null;
                        _photoName = null;
                      }),
                  icon: const Icon(Icons.close, color: Color(0xFFFFE8A3))),
          ]),
        ])),
      ]),
    );
  }

  Widget _choiceGroup(String ar, String en, IconData icon,
      List<_Option> options, Set<String> selected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.045),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF8A621D)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            iconColor: const Color(0xFFFFE8A3),
            collapsedIconColor: const Color(0xFFE0C174),
            tilePadding: const EdgeInsets.symmetric(horizontal: 14),
            childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            title: _miniTitle(ar, en, icon),
            subtitle: selected.isEmpty
                ? null
                : Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(_selectedSummary(options, selected),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Color(0xFFD6BD7A), fontSize: 12)),
                  ),
            children: options.map((o) {
              final active = selected.contains(o.key);
              return CheckboxListTile(
                value: active,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFFE0C174),
                checkColor: Colors.black,
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Row(children: [
                  Icon(_chipIconFor(o.key),
                      color: const Color(0xFFFFE8A3), size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(o.ar,
                        style: const TextStyle(
                            color: Color(0xFFFFE8A3),
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.headphones_outlined,
                      color: Color(0xFFE0C174), size: 16),
                ]),
                onChanged: (v) => setState(() {
                  if (v == true) {
                    selected.add(o.key);
                  } else {
                    selected.remove(o.key);
                  }
                }),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  IconData _chipIconFor(String key) {
    switch (key) {
      case 'website':
        return Icons.language;
      case 'facebook':
        return Icons.groups_outlined;
      case 'instagram':
        return Icons.photo_camera_outlined;
      case 'x':
        return Icons.alternate_email;
      case 'linkedin':
        return Icons.business_center_outlined;
      case 'telegram':
        return Icons.send_outlined;
      case 'tiktok':
        return Icons.music_note_outlined;
      case 'youtube':
        return Icons.play_circle_outline;
      case 'whatsapp_channel':
        return Icons.chat_outlined;
      case 'public_library':
        return Icons.menu_book_outlined;
      case 'specialist_directory':
        return Icons.person_search_outlined;
      case 'printable_cv':
        return Icons.description_outlined;
      case 'business_card':
        return Icons.badge_outlined;
      case 'qr_profile':
        return Icons.qr_code_2_outlined;
      default:
        return Icons.label_outline;
    }
  }

  Widget _miniTitle(String ar, String en, IconData icon) {
    return Row(children: [
      Icon(icon, color: const Color(0xFFFFE8A3), size: 18),
      const SizedBox(width: 6),
      Expanded(
          child: Text(_localizedTitle(ar, en),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  color: Color(0xFFFFE8A3), fontWeight: FontWeight.w800))),
      const Icon(Icons.headphones_outlined, color: Color(0xFFFFE8A3), size: 16),
    ]);
  }

  Widget _saveButton() {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: _saveRawProfile,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE0C174),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite, color: Colors.black, size: 18),
              SizedBox(width: 8),
              Text('💛 معاكم يا شباب 😊',
                  style: TextStyle(fontWeight: FontWeight.w900)),
              SizedBox(width: 8),
              Icon(Icons.headphones_outlined, color: Colors.black, size: 18),
            ]),
      ),
    );
  }

  Future<void> _pickPhoto() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    if (!mounted || bytes.isEmpty) return;
    setState(() {
      _photoBytes = bytes;
      _photoName = picked.name;
    });
  }

  void _saveRawProfile() {
    if (!_formKey.currentState!.validate()) return;
    final rawProfile = {
      'specialty': _specialty,
      'subSpecialty': _subSpecialty.text.trim(),
      'appearanceStyle': _appearanceStyle,
      'visibilityStyle': _visibilityStyle.toList(growable: false),
      'publishingTargets': _publishingTargets.toList(growable: false),
      'presentationFormats': _presentationFormats.toList(growable: false),
      'personalPhotoSelected': _photoBytes != null,
      'productsGeneratedInsideSpecialistRoom': false,
    };
    debugPrint(
        'Signal-friendly raw profile prepared locally: ${rawProfile.keys.join(', ')}');
    setState(() {
      _photoBytes = null;
      _photoName = null;
    });
  }

  String _localizedTitle(String ar, String en) {
    switch (en) {
      case 'Business Card Identity':
        return 'خلينا نعرفك بشكل بسيط';
      case 'Optional Personal Photo':
        return 'تحب تضيف صورة تساعدنا؟';
      case 'Professional Profile':
        return 'احكيلنا عن خبرتك';
      case 'Publishing Targets':
      case 'Where should content appear?':
        return 'تحب نجهز ظهورك فين؟';
      case 'Additional Notes':
        return 'في حاجة تحب تضيفها؟';
      case 'Appearance Style':
      case 'Preferred presence':
        return 'تحب ظهورك يكون أقرب لإيه؟';
      case 'Preferred format':
        return 'تحب نجهزلك إيه؟';
      default:
        return ar;
    }
  }

  String _selectedSummary(List<_Option> options, Set<String> selected) {
    final selectedLabels = options
        .where((option) => selected.contains(option.key))
        .map((option) => option.ar)
        .toList(growable: false);
    if (selectedLabels.isEmpty) return '';
    return selectedLabels.join('، ');
  }
}

class _Option {
  const _Option(this.key, this.ar, this.en);
  final String key;
  final String ar;
  final String en;
}

BoxDecoration _panelDecoration() {
  return BoxDecoration(
    color: Colors.black.withValues(alpha: 0.72),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: const Color(0xFF8A621D)),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withValues(alpha: 0.35),
          blurRadius: 18,
          offset: const Offset(0, 10))
    ],
  );
}
