import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_sub_page_background.dart';
import 'package:mental_smile_os/shared/branding/mental_smile_logo.dart';

class CenterProfessionalProfileCleanLayoutPage extends StatefulWidget {
  const CenterProfessionalProfileCleanLayoutPage({super.key});

  @override
  State<CenterProfessionalProfileCleanLayoutPage> createState() =>
      _CenterProfessionalProfileCleanLayoutPageState();
}

class _CenterProfessionalProfileCleanLayoutPageState
    extends State<CenterProfessionalProfileCleanLayoutPage> {
  static const double _contentMaxWidth = 760;
  static const double _heroMaxWidth = 980;

  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  final _centerName = TextEditingController();
  final _customerServicePhone = TextEditingController();
  final _officialEmail = TextEditingController();
  final _centerServiceNote = TextEditingController();
  final _centerAbout = TextEditingController();
  final _centerNotes = TextEditingController();

  String _centerType = 'addiction_treatment';
  String _cardLanguage = 'ar';
  String _centerAppearanceStyle = 'choose';
  String _background = 'choose';
  String _yearsInOperation = 'choose';
  String _governorate = 'choose';
  String _hasAccommodation = 'choose';
  String _hasClinics = 'choose';
  String _hasExternalServices = 'choose';
  String _ageGroup = 'choose';
  String _serviceType = 'choose';
  String _workingDays = 'choose';
  Uint8List? _logoBytes;
  Uint8List? _coverBytes;
  bool _showPreview = false;
  bool _savingProfile = false;

  final Set<String> _publishingTargets = <String>{};
  final Set<String> _presentationFormats = <String>{};

  static const _centerTypes = [
    _Option('addiction_treatment', 'مركز علاج إدمان'),
    _Option('mental_health', 'مركز صحة نفسية'),
    _Option('rehabilitation', 'مركز تأهيل'),
    _Option('consulting', 'مركز استشارات'),
    _Option('clinic', 'عيادة'),
    _Option('community_center', 'مركز مجتمعي'),
  ];

  static const _centerAppearanceStyles = [
    _Option('safe_reassuring', 'آمن ومطمئن'),
    _Option('professional_trusted', 'رسمي وموثوق'),
    _Option('family_friendly', 'قريب من الأسرة'),
    _Option('modern_clear', 'عصري وواضح'),
    _Option('simple_direct', 'واضح ومباشر'),
    _Option('choose', 'اتركوا الاختيار لنا'),
  ];

  static const _yearsOptions = [
    _Option('choose', 'اختاروا الأنسب'),
    _Option('new', 'أقل من سنة'),
    _Option('one_three', 'من سنة إلى 3 سنوات'),
    _Option('three_seven', 'من 3 إلى 7 سنوات'),
    _Option('seven_plus', 'أكثر من 7 سنوات'),
  ];

  static const _governorateOptions = [
    _Option('choose', 'اختاروا المحافظة'),
    _Option('cairo', 'القاهرة'),
    _Option('giza', 'الجيزة'),
    _Option('alexandria', 'الإسكندرية'),
    _Option('delta', 'الدلتا'),
    _Option('upper_egypt', 'الصعيد'),
    _Option('other', 'محافظة أخرى'),
  ];

  static const _yesNoChooseOptions = [
    _Option('choose', 'اختاروا الأنسب'),
    _Option('yes', 'نعم'),
    _Option('no', 'لا'),
    _Option('limited', 'حسب الحالة'),
  ];

  static const _ageGroupOptions = [
    _Option('choose', 'اختاروا الفئة'),
    _Option('children', 'أطفال'),
    _Option('teens', 'مراهقين'),
    _Option('adults', 'بالغين'),
    _Option('families', 'أسر'),
    _Option('all', 'كل الفئات'),
  ];

  static const _serviceTypeOptions = [
    _Option('choose', 'اختاروا نوع الخدمات'),
    _Option('assessment', 'تقييم واستشارة'),
    _Option('therapy', 'جلسات علاجية'),
    _Option('rehabilitation', 'تأهيل وتعافي'),
    _Option('training', 'تدريب وتوعية'),
    _Option('integrated', 'خدمات متكاملة'),
  ];

  static const _workingDaysOptions = [
    _Option('choose', 'اختاروا أيام العمل'),
    _Option('weekdays', 'أيام العمل الرسمية'),
    _Option('all_week', 'طوال الأسبوع'),
    _Option('selected_days', 'أيام محددة'),
    _Option('appointments_only', 'بالحجز المسبق'),
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
    _Option('specialist_directory', 'دليل المراكز'),
    _Option('printable_center_profile_pdf', 'ملف تعريفي للطباعة'),
    _Option('business_card', 'بطاقة عمل'),
    _Option('qr_profile', 'ملف رمز الاستجابة السريعة'),
  ];

  static const _presentationOptions = [
    _Option('short_card', 'بطاقة مختصرة'),
    _Option('center_profile', 'ملف مهني'),
    _Option('center_profile_pdf', 'ملف تعريفي'),
    _Option('intro_post', 'بوست تعريفي'),
    _Option('qr_profile', 'ملف رمز الاستجابة السريعة'),
    _Option('all_available', 'كل المتاح'),
  ];

  @override
  void dispose() {
    _centerName.dispose();
    _customerServicePhone.dispose();
    _officialEmail.dispose();
    _centerServiceNote.dispose();
    _centerAbout.dispose();
    _centerNotes.dispose();
    _logoBytes = null;
    _coverBytes = null;
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
                            _field(_centerName, 'اسم المركز',
                                Icons.business_outlined,
                                required: true),
                            _dropdown(
                              'نوع المركز',
                              Icons.apartment_outlined,
                              _centerType,
                              _centerTypes,
                              (value) => setState(() => _centerType = value),
                            ),
                          ),
                          _two(
                            _field(_customerServicePhone, 'رقم خدمة العملاء',
                                Icons.phone_outlined,
                                required: true,
                                keyboardType: TextInputType.phone),
                            _field(_officialEmail, 'البريد الرسمي',
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
                            'كيف تحب الناس تتعرف على مركزك؟',
                            Icons.auto_awesome_outlined,
                            _centerAppearanceStyle,
                            _centerAppearanceStyles,
                            (value) =>
                                setState(() => _centerAppearanceStyle = value),
                          ),
                          _subtleDivider(),
                          _sectionTitle(
                              'احكيلنا عن المركز', Icons.apartment_outlined),
                          _field(_centerAbout, 'نبذة مختصرة عن المركز',
                              Icons.info_outline,
                              maxLines: 4),
                          _two(
                            _dropdown(
                              'سنوات العمل',
                              Icons.history_outlined,
                              _yearsInOperation,
                              _yearsOptions,
                              (value) =>
                                  setState(() => _yearsInOperation = value),
                            ),
                            _dropdown(
                              'المحافظة',
                              Icons.location_city_outlined,
                              _governorate,
                              _governorateOptions,
                              (value) => setState(() => _governorate = value),
                            ),
                          ),
                          _two(
                            _dropdown(
                              'هل يوجد إقامة؟',
                              Icons.hotel_outlined,
                              _hasAccommodation,
                              _yesNoChooseOptions,
                              (value) =>
                                  setState(() => _hasAccommodation = value),
                            ),
                            _dropdown(
                              'هل يوجد عيادات؟',
                              Icons.medical_services_outlined,
                              _hasClinics,
                              _yesNoChooseOptions,
                              (value) => setState(() => _hasClinics = value),
                            ),
                          ),
                          _two(
                            _dropdown(
                              'هل يوجد خدمات خارجية؟',
                              Icons.local_shipping_outlined,
                              _hasExternalServices,
                              _yesNoChooseOptions,
                              (value) =>
                                  setState(() => _hasExternalServices = value),
                            ),
                            _dropdown(
                              'الفئة العمرية',
                              Icons.groups_outlined,
                              _ageGroup,
                              _ageGroupOptions,
                              (value) => setState(() => _ageGroup = value),
                            ),
                          ),
                          _two(
                            _dropdown(
                              'نوع الخدمات',
                              Icons.design_services_outlined,
                              _serviceType,
                              _serviceTypeOptions,
                              (value) => setState(() => _serviceType = value),
                            ),
                            _dropdown(
                              'أيام العمل',
                              Icons.calendar_month_outlined,
                              _workingDays,
                              _workingDaysOptions,
                              (value) => setState(() => _workingDays = value),
                            ),
                          ),
                          _field(
                            _centerServiceNote,
                            'ملاحظة خدمة إضافية',
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
                            _centerNotes,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _imagePickerBlock(
          title: 'شعار المركز',
          buttonLabel: 'رفع شعار اختياري',
          removeLabel: 'إزالة الشعار',
          bytes: _logoBytes,
          onPick: _pickLogo,
          onRemove: () => setState(() => _logoBytes = null),
          icon: Icons.apartment_outlined,
        ),
        const SizedBox(height: 18),
        _imagePickerBlock(
          title: 'صورة غلاف للمركز',
          buttonLabel: 'رفع صورة غلاف اختيارية',
          removeLabel: 'إزالة الغلاف',
          bytes: _coverBytes,
          onPick: _pickCover,
          onRemove: () => setState(() => _coverBytes = null),
          icon: Icons.panorama_outlined,
        ),
      ],
    );
  }

  Widget _imagePickerBlock({
    required String title,
    required String buttonLabel,
    required String removeLabel,
    required Uint8List? bytes,
    required VoidCallback onPick,
    required VoidCallback onRemove,
    required IconData icon,
  }) {
    final frame = Container(
      width: 132,
      height: 158,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF070604),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0C174), width: 1.3),
      ),
      child: bytes != null
          ? Image.memory(bytes, fit: BoxFit.cover)
          : Icon(icon, color: const Color(0xFFFFE8A3), size: 42),
    );

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inlineTitle(title, icon),
        const SizedBox(height: 8),
        Wrap(spacing: 8, runSpacing: 8, children: [
          OutlinedButton.icon(
            onPressed: onPick,
            icon: const Icon(Icons.upload_file_outlined),
            label: Text(buttonLabel),
          ),
          if (bytes != null)
            TextButton.icon(
              onPressed: onRemove,
              icon: const Icon(Icons.close),
              label: Text(removeLabel),
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
        _previewRow('كيف تحب الناس تتعرف على مركزك؟',
            _optionLabel(_centerAppearanceStyles, _centerAppearanceStyle)),
        _previewRow(
            'سنوات العمل', _optionLabel(_yearsOptions, _yearsInOperation)),
        _previewRow(
            'المحافظة', _optionLabel(_governorateOptions, _governorate)),
        _previewRow('هل يوجد إقامة؟',
            _optionLabel(_yesNoChooseOptions, _hasAccommodation)),
        _previewRow(
            'هل يوجد عيادات؟', _optionLabel(_yesNoChooseOptions, _hasClinics)),
        _previewRow('هل يوجد خدمات خارجية؟',
            _optionLabel(_yesNoChooseOptions, _hasExternalServices)),
        _previewRow('الفئة العمرية', _optionLabel(_ageGroupOptions, _ageGroup)),
        _previewRow(
            'نوع الخدمات', _optionLabel(_serviceTypeOptions, _serviceType)),
        _previewRow(
            'أيام العمل', _optionLabel(_workingDaysOptions, _workingDays)),
        if (_centerServiceNote.text.trim().isNotEmpty)
          _previewRow('ملاحظة خدمة إضافية', _centerServiceNote.text),
        _previewChipSection('تحب نجهزلك إيه؟', Icons.view_quilt_outlined,
            _presentationOptions, _presentationFormats),
        _previewChipSection('تحب نجهز ظهورك فين؟', Icons.share_outlined,
            _publishingOptions, _publishingTargets),
        if (_centerNotes.text.trim().isNotEmpty)
          _previewRow('ملاحظات المركز', _centerNotes.text),
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
              _centerName.text.trim().isEmpty
                  ? 'اسم المركز'
                  : _centerName.text.trim(),
              style: const TextStyle(
                color: Color(0xFFFFE8A3),
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _optionLabel(_centerTypes, _centerType),
              style: const TextStyle(
                color: Color(0xFFD6BD7A),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            _previewContact(Icons.phone_outlined, _customerServicePhone.text),
            const SizedBox(height: 4),
            _previewContact(Icons.email_outlined, _officialEmail.text),
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
      child: _logoBytes == null
          ? const Icon(Icons.apartment_outlined,
              color: Color(0xFFFFE8A3), size: 38)
          : Image.memory(_logoBytes!, fit: BoxFit.cover),
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
      case 'printable_center_profile_pdf':
        return Icons.description_outlined;
      case 'business_card':
        return Icons.badge_outlined;
      case 'qr_profile':
        return Icons.qr_code_outlined;
      case 'short_card':
        return Icons.view_agenda_outlined;
      case 'center_profile':
        return Icons.account_box_outlined;
      case 'center_profile_pdf':
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

  Future<void> _pickLogo() async {
    final bytes = await _pickImageBytes();
    if (bytes == null) return;
    setState(() {
      _logoBytes = bytes;
    });
  }

  Future<void> _pickCover() async {
    final bytes = await _pickImageBytes();
    if (bytes == null) return;
    setState(() {
      _coverBytes = bytes;
    });
  }

  Future<Uint8List?> _pickImageBytes() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return null;
    final bytes = await picked.readAsBytes();
    if (!mounted || bytes.isEmpty) return null;
    return bytes;
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
      'centerName': _centerName.text.trim(),
      'customerServicePhone': _customerServicePhone.text.trim(),
      'officialEmail': _officialEmail.text.trim(),
      'centerType': _centerType,
      'centerTypeLabel': _optionLabel(_centerTypes, _centerType),
      'cardLanguage': _cardLanguage,
      'cardLanguageLabel': _optionLabel(_cardLanguages, _cardLanguage),
      'serviceNote': _centerServiceNote.text.trim(),
      'about': _centerAbout.text.trim(),
      'notes': _centerNotes.text.trim(),
      'appearanceStyle': _centerAppearanceStyle,
      'appearanceStyleLabel':
          _optionLabel(_centerAppearanceStyles, _centerAppearanceStyle),
      'background': _background,
      'backgroundLabel': _optionLabel(_backgroundOptions, _background),
      'yearsInOperation': _yearsInOperation,
      'yearsInOperationLabel': _optionLabel(_yearsOptions, _yearsInOperation),
      'governorate': _governorate,
      'governorateLabel': _optionLabel(_governorateOptions, _governorate),
      'hasAccommodation': _hasAccommodation,
      'hasAccommodationLabel':
          _optionLabel(_yesNoChooseOptions, _hasAccommodation),
      'hasClinics': _hasClinics,
      'hasClinicsLabel': _optionLabel(_yesNoChooseOptions, _hasClinics),
      'hasExternalServices': _hasExternalServices,
      'hasExternalServicesLabel':
          _optionLabel(_yesNoChooseOptions, _hasExternalServices),
      'ageGroup': _ageGroup,
      'ageGroupLabel': _optionLabel(_ageGroupOptions, _ageGroup),
      'serviceType': _serviceType,
      'serviceTypeLabel': _optionLabel(_serviceTypeOptions, _serviceType),
      'workingDays': _workingDays,
      'workingDaysLabel': _optionLabel(_workingDaysOptions, _workingDays),
      'publishingTargets': _publishingTargets.toList(growable: false),
      'presentationFormats': _presentationFormats.toList(growable: false),
      'centerLogoSelected': _logoBytes != null,
      'centerCoverSelected': _coverBytes != null,
      'productsGeneratedInsideCenterRoom': false,
    };

    setState(() => _savingProfile = true);
    try {
      final doc = FirebaseFirestore.instance
          .collection('centers')
          .doc(user.uid)
          .collection('profile')
          .doc('current');
      final snapshot = await doc.get();
      await doc.set({
        ...rawProfile,
        'ownerUid': user.uid,
        'profileType': 'center',
        'status': 'draft',
        'createdAt': snapshot.exists
            ? (snapshot.data()?['createdAt'] ?? FieldValue.serverTimestamp())
            : FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'source': 'center_professional_profile_clean_layout_v1',
      }, SetOptions(merge: true));
      if (!mounted) return;
      setState(() {
        _showPreview = false;
        _logoBytes = null;
        _coverBytes = null;
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
          'هنراجع بيانات المركز الخام ونبدأ تجهيز المنتجات الخاصة به.\n\nشكراً لانضمام مركزكم إلى Mental Smile.',
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
