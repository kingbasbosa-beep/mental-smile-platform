import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_sub_page_background.dart';
import 'package:mental_smile_os/shared/branding/mental_smile_logo.dart';

class SpecialistProfessionalProfileCleanLayoutPage extends StatefulWidget {
  const SpecialistProfessionalProfileCleanLayoutPage({super.key});

  @override
  State<SpecialistProfessionalProfileCleanLayoutPage> createState() =>
      _SpecialistProfessionalProfileCleanLayoutPageState();
}

class _SpecialistProfessionalProfileCleanLayoutPageState
    extends State<SpecialistProfessionalProfileCleanLayoutPage> {
  static const double _contentMaxWidth = 760;
  static const double _heroMaxWidth = 980;

  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _subSpecialty = TextEditingController();
  final _about = TextEditingController();
  final _notes = TextEditingController();

  String _specialty = 'psychologist';
  String _cardLanguage = 'ar';
  String _appearanceStyle = 'choose';
  String _background = 'choose';
  Uint8List? _photoBytes;
  bool _showPreview = false;
  bool _savingProfile = false;

  final Set<String> _publishingTargets = <String>{};
  final Set<String> _presentationFormats = <String>{};

  static const _specialties = [
    _Option('psychologist', 'أخصائي نفسي'),
    _Option('social_worker', 'أخصائي اجتماعي'),
    _Option('clinical', 'أخصائي إكلينيكي'),
    _Option('family_counseling', 'أخصائي مشورة أسرية'),
    _Option('addiction_behavior', 'مرشد علاج سلوكيات إدمانية'),
    _Option('coaching', 'أخصائي كوتشينج'),
    _Option('support_supervisor', 'مشرف برامج دعم'),
    _Option('behavior_autism', 'أخصائي تعديل سلوك وتوحد'),
    _Option('speech', 'أخصائي تخاطب'),
    _Option('addiction_recovery', 'علاج السلوكيات الإدمانية'),
  ];

  static const _appearanceStyles = [
    _Option('calm_reassuring', 'هادي ومطمئن'),
    _Option('professional_trusted', 'رسمي وموثوق'),
    _Option('warm_friendly', 'دافئ وقريب'),
    _Option('modern_clear', 'عصري وواضح'),
    _Option('simple_direct', 'بسيط ومباشر'),
    _Option('choose', 'اتركوا الاختيار لنا'),
  ];

  static const _cardLanguages = [
    _Option('ar', 'عربي'),
    _Option('en', 'إنجليزي'),
    _Option('ar_en', 'عربي / إنجليزي'),
    _Option('en_ar', 'إنجليزي / عربي'),
  ];

  static const _backgroundOptions = [
    _Option('no', 'بدون خلفية'),
    _Option('yes', 'بخلفية'),
    _Option('choose', 'اتركوا الاختيار لنا'),
  ];

  static const _publishingOptions = [
    _Option('website', 'الموقع الإلكتروني'),
    _Option('facebook', 'فيسبوك'),
    _Option('instagram', 'إنستجرام'),
    _Option('x', 'منصة إكس'),
    _Option('linkedin', 'لينكدإن'),
    _Option('telegram', 'تيليجرام'),
    _Option('tiktok', 'تيك توك'),
    _Option('youtube', 'يوتيوب'),
    _Option('whatsapp_channel', 'قناة واتساب'),
    _Option('public_library', 'المكتبة العامة'),
    _Option('specialist_directory', 'دليل الأخصائيين'),
    _Option('printable_cv', 'سيرة ذاتية للطباعة'),
    _Option('business_card', 'بطاقة عمل'),
    _Option('qr_profile', 'ملف رمز الاستجابة السريعة'),
  ];

  static const _presentationOptions = [
    _Option('short_card', 'بطاقة مختصرة'),
    _Option('professional_profile', 'ملف مهني'),
    _Option('cv', 'سيرة ذاتية'),
    _Option('intro_post', 'بوست تعريفي'),
    _Option('qr_profile', 'ملف رمز الاستجابة السريعة'),
    _Option('all_available', 'كل المتاح'),
  ];

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _email.dispose();
    _subSpecialty.dispose();
    _about.dispose();
    _notes.dispose();
    _photoBytes = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _brandedHeader(),
        body: CommercialSubPageBackground(
          child: SafeArea(
            child: _showPreview
                ? _previewStep()
                : Form(
                    key: _formKey,
                    child: _centeredContent(
                      ListView(
                        padding: const EdgeInsets.fromLTRB(20, 18, 20, 26),
                        children: [
                          _centeredHero(_heroSection()),
                          const SizedBox(height: 30),
                          _subtleDivider(),
                          _sectionTitle(
                              'خلينا نعرفك بشكل بسيط', Icons.badge_outlined),
                          _two(
                            _field(
                                _fullName, 'الاسم الكامل', Icons.person_outline,
                                required: true),
                            _dropdown(
                              'التخصص الرئيسي',
                              Icons.psychology_outlined,
                              _specialty,
                              _specialties,
                              (value) => setState(() => _specialty = value),
                            ),
                          ),
                          _two(
                            _field(_phone, 'رقم الهاتف', Icons.phone_outlined,
                                required: true,
                                keyboardType: TextInputType.phone),
                            _field(_email, 'البريد الإلكتروني',
                                Icons.email_outlined,
                                required: true,
                                keyboardType: TextInputType.emailAddress),
                          ),
                          _two(
                            _dropdown(
                              'لغة الكارت',
                              Icons.translate_outlined,
                              _cardLanguage,
                              _cardLanguages,
                              (value) => setState(() => _cardLanguage = value),
                            ),
                            _dropdown(
                              'الخلفية',
                              Icons.image_outlined,
                              _background,
                              _backgroundOptions,
                              (value) => setState(() => _background = value),
                            ),
                          ),
                          _dropdown(
                            'تحب ظهورك يكون أقرب لإيه؟',
                            Icons.auto_awesome_outlined,
                            _appearanceStyle,
                            _appearanceStyles,
                            (value) => setState(() => _appearanceStyle = value),
                          ),
                          _subtleDivider(),
                          _sectionTitle(
                              'احكيلنا عن خبرتك', Icons.person_outline),
                          _field(_about, 'نبذة مختصرة', Icons.info_outline,
                              maxLines: 4),
                          _field(
                            _subSpecialty,
                            'تخصص فرعي إضافي',
                            Icons.category_outlined,
                          ),
                          _multiSelectDropdown(
                            'تحب نجهزلك إيه؟',
                            Icons.view_quilt_outlined,
                            _presentationOptions,
                            _presentationFormats,
                          ),
                          _subtleDivider(),
                          _sectionTitle(
                              'تحب نجهز ظهورك فين؟', Icons.campaign_outlined),
                          _multiSelectDropdown(
                            'تحب نجهز ظهورك فين؟',
                            Icons.share_outlined,
                            _publishingOptions,
                            _publishingTargets,
                          ),
                          _subtleDivider(),
                          _sectionTitle(
                              'في حاجة تحب تضيفها؟', Icons.notes_outlined),
                          _field(
                            _notes,
                            'اكتب ملاحظاتك هنا اختياريًا',
                            Icons.notes_outlined,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 8),
                          _saveButton(),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _brandedHeader() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: LayoutBuilder(builder: (context, constraints) {
        const headerHeight = 56.0;

        return Container(
          height: headerHeight + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: Colors.black,
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              const SizedBox(width: 8),
              IconButton(
                tooltip: 'رجوع',
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  textDirection: TextDirection.ltr,
                  color: Color(0xFFFFE8A3),
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      }),
    );
  }

  Widget _heroSection() {
    return LayoutBuilder(builder: (context, constraints) {
      final compact = constraints.maxWidth < 700;
      final logoHeight = constraints.maxWidth < 520
          ? 118.0
          : constraints.maxWidth < 900
              ? 150.0
              : 188.0;
      final logo = Center(
        child: MentalSmileLogo(
          variant: MentalSmileLogoVariant.primary,
          size: MentalSmileLogoSize.large,
          height: logoHeight,
        ),
      );

      if (compact) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            logo,
            const SizedBox(height: 18),
            _photoPicker(),
          ],
        );
      }

      return Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: logo),
          const SizedBox(width: 28),
          Expanded(child: _photoPicker()),
        ],
      );
    });
  }

  Widget _centeredContent(Widget child) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
        child: child,
      ),
    );
  }

  Widget _centeredHero(Widget child) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _heroMaxWidth),
        child: child,
      ),
    );
  }

  Widget _photoPicker() {
    final hasImage = _photoBytes != null;
    final frame = Container(
      width: 132,
      height: 158,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF070604),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0C174), width: 1.3),
      ),
      child: hasImage
          ? Image.memory(_photoBytes!, fit: BoxFit.cover)
          : const Icon(Icons.add_photo_alternate_outlined,
              color: Color(0xFFFFE8A3), size: 42),
    );

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inlineTitle('تحب تضيف صورة؟', Icons.add_photo_alternate_outlined),
        const SizedBox(height: 8),
        Wrap(spacing: 8, runSpacing: 8, children: [
          OutlinedButton.icon(
            onPressed: _pickPhoto,
            icon: const Icon(Icons.upload_file_outlined),
            label: const Text('رفع صورة اختيارية'),
          ),
          if (hasImage)
            TextButton.icon(
              onPressed: () => setState(() {
                _photoBytes = null;
              }),
              icon: const Icon(Icons.close),
              label: const Text('إزالة الصورة'),
            ),
        ]),
      ],
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 620) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [frame, const SizedBox(height: 10), details],
        );
      }
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [frame, const SizedBox(width: 14), Expanded(child: details)],
      );
    });
  }

  Widget _previewStep() {
    return _centeredHero(
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
        child: _polishedPreviewStep(),
      ),
    );
  }

  Widget _previewRow(String title, String value) {
    final displayValue =
        value.trim().isEmpty ? 'لم يتم الاختيار' : value.trim();
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 9),
      decoration: _minimalBottomDivider(),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Icon(Icons.headphones_outlined,
            color: Color(0xFFE0C174), size: 16),
        const SizedBox(width: 8),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: const TextStyle(
                    color: Color(0xFFFFE8A3), fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(displayValue,
                style: const TextStyle(color: Color(0xFFD6BD7A), height: 1.35)),
          ]),
        ),
      ]),
    );
  }

  Widget _polishedPreviewStep() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
      children: [
        _sectionTitle('راجع بياناتك قبل ما تبعتها', Icons.fact_check_outlined),
        const SizedBox(height: 8),
        _previewHeroCard(),
        _previewRow('لغة الكارت', _optionLabel(_cardLanguages, _cardLanguage)),
        _previewRow('الخلفية', _optionLabel(_backgroundOptions, _background)),
        _previewRow(
            'أسلوب الظهور', _optionLabel(_appearanceStyles, _appearanceStyle)),
        if (_subSpecialty.text.trim().isNotEmpty)
          _previewRow('تخصص فرعي إضافي', _subSpecialty.text),
        _previewChipSection('تحب نجهزلك إيه؟', Icons.view_quilt_outlined,
            _presentationOptions, _presentationFormats),
        _previewChipSection('تحب نجهز ظهورك فين؟', Icons.share_outlined,
            _publishingOptions, _publishingTargets),
        if (_notes.text.trim().isNotEmpty) _previewRow('ملاحظاتك', _notes.text),
        const SizedBox(height: 18),
        _previewActions(),
      ],
    );
  }

  Widget _previewHeroCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        _previewAvatar(),
        const SizedBox(width: 14),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              _fullName.text.trim().isEmpty
                  ? 'الاسم الكامل'
                  : _fullName.text.trim(),
              style: const TextStyle(
                color: Color(0xFFFFE8A3),
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _optionLabel(_specialties, _specialty),
              style: const TextStyle(
                color: Color(0xFFD6BD7A),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            _previewContact(Icons.phone_outlined, _phone.text),
            const SizedBox(height: 4),
            _previewContact(Icons.email_outlined, _email.text),
          ]),
        ),
      ]),
    );
  }

  Widget _previewAvatar() {
    return Container(
      width: 86,
      height: 86,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF070604),
        border: Border.all(color: const Color(0xFFE0C174), width: 1.4),
      ),
      child: _photoBytes == null
          ? const Icon(Icons.person_outline, color: Color(0xFFFFE8A3), size: 38)
          : Image.memory(_photoBytes!, fit: BoxFit.cover),
    );
  }

  Widget _previewContact(IconData icon, String value) {
    return Row(children: [
      Icon(icon, color: const Color(0xFFE0C174), size: 15),
      const SizedBox(width: 6),
      Expanded(
        child: Text(
          value.trim().isEmpty ? 'لم يتم الإدخال' : value.trim(),
          style: const TextStyle(color: Color(0xFFBFA45F), fontSize: 13),
        ),
      ),
    ]);
  }

  Widget _previewChipSection(String title, IconData icon, List<_Option> options,
      Set<String> selected) {
    final selectedOptions =
        options.where((option) => selected.contains(option.key)).toList();
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _inlineTitle(title, icon),
        const SizedBox(height: 10),
        if (selectedOptions.isEmpty)
          const Text('لم يتم الاختيار',
              style: TextStyle(color: Color(0xFFD6BD7A), fontSize: 13))
        else
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: selectedOptions
                .map((option) =>
                    _previewChip(option.label, _optionIconFor(option.key)))
                .toList(),
          ),
      ]),
    );
  }

  Widget _previewChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE0C174),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: Colors.black, size: 16),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800)),
      ]),
    );
  }

  Widget _previewActions() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: () => setState(() => _showPreview = false),
          icon: const Icon(Icons.edit_outlined),
          label: const Text('تعديل البيانات'),
        ),
        ElevatedButton.icon(
          onPressed: () => _completeLocalSend(),
          icon: const Icon(Icons.favorite, color: Colors.black),
          label: const Text('تمام.. ابعتوها 💛'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE0C174),
            foregroundColor: Colors.black,
          ),
        ),
        TextButton.icon(
          onPressed: () => setState(() => _showPreview = false),
          icon: const Icon(Icons.close),
          label: const Text('إلغاء'),
        ),
      ],
    );
  }

  Widget _two(Widget a, Widget b) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 620) return Column(children: [a, b]);
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: a),
        const SizedBox(width: 18),
        Expanded(child: b),
      ]);
    });
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: _inlineTitle(title, icon),
    );
  }

  Widget _inlineTitle(String title, IconData icon) {
    return Row(children: [
      Icon(icon, color: const Color(0xFFFFE8A3), size: 20),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFFFE8A3),
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      const Icon(Icons.headphones_outlined, color: Color(0xFFFFE8A3), size: 18),
    ]);
  }

  Widget _field(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool required = false,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        validator: required
            ? (value) => (value == null || value.trim().isEmpty)
                ? 'هذا الحقل مطلوب'
                : null
            : null,
        decoration: _decor(label, icon),
      ),
    );
  }

  Widget _dropdown(
    String label,
    IconData icon,
    String value,
    List<_Option> options,
    ValueChanged<String> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        dropdownColor: const Color(0xFF15100A),
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        decoration: _decor(label, icon),
        items: options
            .map((option) =>
                DropdownMenuItem(value: option.key, child: Text(option.label)))
            .toList(),
        onChanged: (value) {
          if (value != null) onChanged(value);
        },
      ),
    );
  }

  Widget _multiSelectDropdown(
    String label,
    IconData icon,
    List<_Option> options,
    Set<String> selected,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: _minimalBottomDivider(),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            iconColor: const Color(0xFFFFE8A3),
            collapsedIconColor: const Color(0xFFE0C174),
            tilePadding: const EdgeInsets.symmetric(horizontal: 4),
            childrenPadding: const EdgeInsets.fromLTRB(4, 0, 4, 10),
            title: _compactLabel(label, icon),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                selected.isEmpty
                    ? 'اختر من القائمة'
                    : '${selected.length} اختيارات',
                style: const TextStyle(color: Color(0xFFD6BD7A), fontSize: 12),
              ),
            ),
            children: options.map((option) {
              final active = selected.contains(option.key);
              return CheckboxListTile(
                value: active,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFFE0C174),
                checkColor: Colors.black,
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Row(children: [
                  Icon(_optionIconFor(option.key),
                      color: const Color(0xFFFFE8A3), size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      option.label,
                      style: const TextStyle(
                        color: Color(0xFFFFE8A3),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.headphones_outlined,
                      color: Color(0xFFE0C174), size: 16),
                ]),
                onChanged: (checked) => setState(() {
                  if (checked == true) {
                    selected.add(option.key);
                  } else {
                    selected.remove(option.key);
                  }
                }),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  InputDecoration _decor(String label, IconData icon) {
    return InputDecoration(
      label: _compactLabel(label, icon),
      labelStyle: const TextStyle(color: Color(0xFFE0C174)),
      filled: true,
      fillColor: Colors.transparent,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0x667A5B1B), width: 0.8),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFFE8A3), width: 1.1),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFD27A66), width: 0.9),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFD27A66), width: 1.1),
      ),
    );
  }

  BoxDecoration _minimalBottomDivider() {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0x557A5B1B), width: 0.8),
      ),
    );
  }

  IconData _optionIconFor(String key) {
    switch (key) {
      case 'website':
        return Icons.language_outlined;
      case 'facebook':
        return Icons.groups_outlined;
      case 'instagram':
        return Icons.photo_camera_outlined;
      case 'x':
        return Icons.alternate_email_outlined;
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
        return Icons.qr_code_outlined;
      case 'short_card':
        return Icons.view_agenda_outlined;
      case 'professional_profile':
        return Icons.account_box_outlined;
      case 'cv':
        return Icons.article_outlined;
      case 'intro_post':
        return Icons.campaign_outlined;
      case 'all_available':
        return Icons.auto_awesome_outlined;
      default:
        return Icons.check_circle_outline;
    }
  }

  Widget _compactLabel(String label, IconData icon) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, color: const Color(0xFFE0C174), size: 16),
      const SizedBox(width: 6),
      Flexible(child: Text(label)),
      const SizedBox(width: 6),
      const Icon(Icons.headphones_outlined, color: Color(0xFFE0C174), size: 15),
    ]);
  }

  Widget _saveButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: _openPreview,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE0C174),
          foregroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
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
          ],
        ),
      ),
    );
  }

  Widget _subtleDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 20),
      color: const Color(0xFF8A621D).withValues(alpha: 0.55),
    );
  }

  Future<void> _pickPhoto() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    if (!mounted || bytes.isEmpty) return;
    setState(() {
      _photoBytes = bytes;
    });
  }

  void _openPreview() {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _showPreview = true);
  }

  Future<void> _completeLocalSend() async {
    if (_savingProfile) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.isAnonymous) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please sign in before saving your profile.'),
        ),
      );
      return;
    }

    final rawProfile = {
      'fullName': _fullName.text.trim(),
      'phone': _phone.text.trim(),
      'email': _email.text.trim(),
      'specialty': _specialty,
      'specialtyLabel': _optionLabel(_specialties, _specialty),
      'subSpecialty': _subSpecialty.text.trim(),
      'cardLanguage': _cardLanguage,
      'cardLanguageLabel': _optionLabel(_cardLanguages, _cardLanguage),
      'appearanceStyle': _appearanceStyle,
      'appearanceStyleLabel': _optionLabel(_appearanceStyles, _appearanceStyle),
      'background': _background,
      'backgroundLabel': _optionLabel(_backgroundOptions, _background),
      'about': _about.text.trim(),
      'notes': _notes.text.trim(),
      'publishingTargets': _publishingTargets.toList(growable: false),
      'presentationFormats': _presentationFormats.toList(growable: false),
      'personalPhotoSelected': _photoBytes != null,
      'productsGeneratedInsideSpecialistRoom': false,
    };

    setState(() => _savingProfile = true);
    try {
      final doc = FirebaseFirestore.instance
          .collection('clinicians')
          .doc(user.uid)
          .collection('profile')
          .doc('current');
      final snapshot = await doc.get();
      await doc.set({
        ...rawProfile,
        'ownerUid': user.uid,
        'profileType': 'specialist',
        'status': 'draft',
        'createdAt': snapshot.exists
            ? (snapshot.data()?['createdAt'] ?? FieldValue.serverTimestamp())
            : FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'source': 'specialist_professional_profile_clean_layout_v1',
      }, SetOptions(merge: true));
      if (!mounted) return;
      setState(() {
        _showPreview = false;
        _photoBytes = null;
      });
      _showSuccessDialog();
    } on FirebaseException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Profile save failed.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _savingProfile = false);
      }
    }
  }

  Future<void> _showSuccessDialog() async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF090704),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Color(0xFFE0C174), width: 1.2),
        ),
        title: const Text(
          '💛\nوصلتنا بياناتك',
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color(0xFFFFE8A3), fontWeight: FontWeight.w900),
        ),
        content: const Text(
          'هنراجع الملف الخام ونبدأ تجهيز المنتجات الخاصة بك.\n\nشكراً لانضمامك إلى Mental Smile.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFFD6BD7A), height: 1.5),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0C174),
              foregroundColor: Colors.black,
            ),
            child: const Text('رجوع'),
          ),
        ],
      ),
    );
  }

  String _optionLabel(List<_Option> options, String key) {
    return options
        .firstWhere((option) => option.key == key,
            orElse: () => const _Option('', 'لم يتم الاختيار'))
        .label;
  }
}

class _Option {
  const _Option(this.key, this.label);
  final String key;
  final String label;
}
