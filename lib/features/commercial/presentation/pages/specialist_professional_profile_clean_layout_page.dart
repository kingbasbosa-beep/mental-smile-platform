import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_os/features/commercial/data/provider_profile_repository.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_profile_categories.dart';
import 'package:mental_smile_os/features/commercial/domain/provider_profile_storage.dart';
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
  final _profileRepository = ProviderProfileRepository();
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _otherSpecialties = TextEditingController();
  final _shortBio = TextEditingController();

  String _specialty = 'psychologist';
  Uint8List? _photoBytes;
  String? _photoContentType;
  String? _photoUrl;
  bool _showEmailPublicly = false;
  bool _showPhonePublicly = false;
  bool _showPreview = false;
  bool _savingProfile = false;

  @override
  void initState() {
    super.initState();
    _hydrateExistingProfile();
  }

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _email.dispose();
    _otherSpecialties.dispose();
    _shortBio.dispose();
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
                              'بيانات الكارت المهني', Icons.badge_outlined),
                          _two(
                            _field(
                              _fullName,
                              'الاسم الكامل',
                              Icons.person_outline,
                              required: true,
                            ),
                            _dropdown(
                              'التخصص الرئيسي',
                              Icons.psychology_outlined,
                              _specialty,
                              (value) => setState(() => _specialty = value),
                            ),
                          ),
                          _two(
                            _field(
                              _phone,
                              'رقم الهاتف',
                              Icons.phone_outlined,
                              required: true,
                              keyboardType: TextInputType.phone,
                            ),
                            _field(
                              _email,
                              'البريد الإلكتروني',
                              Icons.email_outlined,
                              required: true,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          _field(
                            _otherSpecialties,
                            'تخصصات أخرى',
                            Icons.category_outlined,
                            maxLength: 160,
                          ),
                          _field(
                            _shortBio,
                            'نبذة قصيرة',
                            Icons.info_outline,
                            maxLines: 4,
                            maxLength: 300,
                          ),
                          _visibilitySwitch(
                            title: 'إظهار البريد الإلكتروني للعامة',
                            value: _showEmailPublicly,
                            onChanged: (value) =>
                                setState(() => _showEmailPublicly = value),
                          ),
                          _visibilitySwitch(
                            title: 'إظهار رقم الهاتف للعامة',
                            value: _showPhonePublicly,
                            onChanged: (value) =>
                                setState(() => _showPhonePublicly = value),
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
      child: Container(
        height: 56 + MediaQuery.of(context).padding.top,
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
      ),
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
    final hasImage = _photoBytes != null || _photoUrl != null;
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
          ? _providerImage()
          : const Icon(
              Icons.add_photo_alternate_outlined,
              color: Color(0xFFFFE8A3),
              size: 42,
            ),
    );

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inlineTitle('الصورة الشخصية', Icons.add_photo_alternate_outlined),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlinedButton.icon(
              onPressed: _pickPhoto,
              icon: const Icon(Icons.upload_file_outlined),
              label: const Text('رفع صورة'),
            ),
            if (hasImage)
              TextButton.icon(
                onPressed: () => setState(() {
                  _photoBytes = null;
                  _photoContentType = null;
                  _photoUrl = null;
                }),
                icon: const Icon(Icons.close),
                label: const Text('إزالة الصورة'),
              ),
          ],
        ),
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

  Widget _providerImage() {
    final bytes = _photoBytes;
    if (bytes != null) return Image.memory(bytes, fit: BoxFit.cover);
    final url = _photoUrl;
    if (url != null && url.trim().isNotEmpty) {
      return Image.network(url, fit: BoxFit.cover);
    }
    return const Icon(
      Icons.add_photo_alternate_outlined,
      color: Color(0xFFFFE8A3),
      size: 42,
    );
  }

  Widget _previewStep() {
    return _centeredHero(
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
          children: [
            _sectionTitle('راجع بياناتك قبل النشر', Icons.fact_check_outlined),
            const SizedBox(height: 8),
            _previewHeroCard(),
            const SizedBox(height: 18),
            _previewActions(),
          ],
        ),
      ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _fullName.text.trim(),
                style: const TextStyle(
                  color: Color(0xFFFFE8A3),
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _specialtyLabel,
                style: const TextStyle(
                  color: Color(0xFFD6BD7A),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (_otherSpecialties.text.trim().isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  _otherSpecialties.text.trim(),
                  style: const TextStyle(
                    color: Color(0xFFD6BD7A),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              if (_shortBio.text.trim().isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  _shortBio.text.trim(),
                  style: const TextStyle(
                    color: Color(0xFFBFA45F),
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              if (_showPhonePublicly) ...[
                _previewContact(Icons.phone_outlined, _phone.text),
                const SizedBox(height: 6),
              ],
              if (_showEmailPublicly)
                _previewContact(Icons.email_outlined, _email.text),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _previewAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 104,
        height: 124,
        child: _photoBytes == null
            ? (_photoUrl == null
                ? const ColoredBox(
                    color: Color(0xFF070604),
                    child: Icon(
                      Icons.person_outline,
                      color: Color(0xFFFFE8A3),
                      size: 38,
                    ),
                  )
                : Image.network(_photoUrl!, fit: BoxFit.cover))
            : Image.memory(_photoBytes!, fit: BoxFit.cover),
      ),
    );
  }

  Widget _previewContact(IconData icon, String value) {
    return Row(children: [
      Icon(icon, color: const Color(0xFFE0C174), size: 15),
      const SizedBox(width: 6),
      Expanded(
        child: Text(
          value.trim(),
          style: const TextStyle(color: Color(0xFFBFA45F), fontSize: 13),
        ),
      ),
    ]);
  }

  Widget _previewActions() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: _savingProfile
              ? null
              : () => setState(() => _showPreview = false),
          icon: const Icon(Icons.edit_outlined),
          label: const Text('تعديل البيانات'),
        ),
        ElevatedButton.icon(
          onPressed: _savingProfile ? null : _completeLocalSend,
          icon: _savingProfile
              ? const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.public, color: Colors.black),
          label: const Text('نشر الملف'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE0C174),
            foregroundColor: Colors.black,
          ),
        ),
        TextButton.icon(
          onPressed: _savingProfile
              ? null
              : () => setState(() => _showPreview = false),
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
    int? maxLength,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        validator: (value) {
          final text = value?.trim() ?? '';
          if (required && text.isEmpty) return 'هذا الحقل مطلوب';
          if (maxLength != null && text.length > maxLength) {
            return 'الحد الأقصى $maxLength حرف';
          }
          return null;
        },
        decoration: _decor(label, icon),
      ),
    );
  }

  Widget _dropdown(
    String label,
    IconData icon,
    String value,
    ValueChanged<String> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        dropdownColor: const Color(0xFF15100A),
        style: const TextStyle(color: Color(0xFFFFE8A3)),
        decoration: _decor(label, icon),
        items: ProviderProfileCategoryRegistry.specialistCategories
            .map((category) => DropdownMenuItem(
                  value: category.id,
                  child: Text(category.label),
                ))
            .toList(),
        onChanged: (value) {
          if (value != null) onChanged(value);
        },
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

  Widget _visibilitySwitch({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      activeThumbColor: const Color(0xFFE0C174),
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFFFE8A3),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
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
            Icon(Icons.visibility_outlined, color: Colors.black, size: 18),
            SizedBox(width: 8),
            Text(
              'مراجعة ونشر',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
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
    final contentType =
        ProviderImageValidation.inferContentType(picked.mimeType, picked.name);
    if (!ProviderImageValidation.isValidImage(
      sizeBytes: bytes.length,
      contentType: contentType,
    )) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose an image up to 5 MB.')),
      );
      return;
    }
    setState(() {
      _photoBytes = bytes;
      _photoContentType = contentType;
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
          content: Text('Please sign in before publishing your profile.'),
        ),
      );
      return;
    }

    setState(() => _savingProfile = true);
    try {
      var profileImageUrl = _photoUrl ?? '';
      if (_photoBytes != null) {
        profileImageUrl =
            await _profileRepository.uploadSpecialistOfficialImage(
          uid: user.uid,
          bytes: _photoBytes!,
          contentType: _photoContentType ?? 'image/jpeg',
        );
      }

      final rawProfile = <String, Object?>{
        'fullName': _fullName.text.trim(),
        'specialty': _specialty,
        'specialtyLabel': _specialtyLabel,
        'otherSpecialties': _otherSpecialties.text.trim(),
        'shortBio': _shortBio.text.trim(),
        'email': _email.text.trim(),
        'phone': _phone.text.trim(),
        'showEmailPublicly': _showEmailPublicly,
        'showPhonePublicly': _showPhonePublicly,
        'profileImageUrl': profileImageUrl,
      };

      await _profileRepository.saveSpecialistProfile(
        uid: user.uid,
        profile: rawProfile,
      );
      if (!mounted) return;
      setState(() {
        _showPreview = false;
        _photoBytes = null;
        _photoContentType = null;
        _photoUrl = profileImageUrl;
      });
      _showSuccessDialog();
    } on FirebaseException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Profile publish failed.'),
        ),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile publish failed.')),
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
          'تم نشر الملف',
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color(0xFFFFE8A3), fontWeight: FontWeight.w900),
        ),
        content: const Text(
          'تم حفظ بياناتك ونشر الكارت في القسم المناسب.',
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

  Future<void> _hydrateExistingProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.isAnonymous) return;
    try {
      final profile = await _profileRepository.loadSpecialistProfile(user.uid);
      if (!mounted || profile == null) return;
      setState(() {
        _fullName.text = _string(profile['fullName']);
        _phone.text = _string(profile['phone']);
        _email.text = _string(profile['email']);
        _otherSpecialties.text = _string(profile['otherSpecialties']);
        _shortBio.text = _string(profile['shortBio']);
        _specialty = _categoryIdOrDefault(_string(profile['specialty']));
        _showEmailPublicly = profile['showEmailPublicly'] == true;
        _showPhonePublicly = profile['showPhonePublicly'] == true;
        _photoUrl = _nullableString(profile['profileImageUrl']);
      });
    } on FirebaseException {
      return;
    }
  }

  String get _specialtyLabel {
    return ProviderProfileCategoryRegistry.specialistById(_specialty)?.label ??
        _specialty;
  }

  String _categoryIdOrDefault(String value) {
    return ProviderProfileCategoryRegistry.isSpecialistCategory(value)
        ? value
        : 'psychologist';
  }

  String _string(Object? value) => value?.toString() ?? '';

  String? _nullableString(Object? value) {
    final text = _string(value).trim();
    return text.isEmpty ? null : text;
  }
}
