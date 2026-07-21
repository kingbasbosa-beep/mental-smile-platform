import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_os/features/commercial/data/provider_profile_repository.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_profile_categories.dart';
import 'package:mental_smile_os/features/commercial/domain/provider_profile_storage.dart';
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
  final _profileRepository = ProviderProfileRepository();
  final _centerName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _otherServices = TextEditingController();
  final _shortBio = TextEditingController();

  String _category = ProviderProfileCategoryRegistry.centerCategories.first.id;
  Uint8List? _identityImageBytes;
  String? _identityImageContentType;
  String? _identityImageUrl;
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
    _centerName.dispose();
    _email.dispose();
    _phone.dispose();
    _otherServices.dispose();
    _shortBio.dispose();
    _identityImageBytes = null;
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
                        children: <Widget>[
                          _centeredHero(_heroSection()),
                          const SizedBox(height: 30),
                          _subtleDivider(),
                          _sectionTitle(
                            'بيانات المركز الأساسية',
                            Icons.badge_outlined,
                          ),
                          _two(
                            _field(
                              _centerName,
                              'اسم المركز',
                              Icons.business_outlined,
                              required: true,
                            ),
                            _categoryDropdown(),
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
                          _visibilitySwitches(),
                          _subtleDivider(),
                          _sectionTitle(
                            'تفاصيل اختيارية للعرض العام',
                            Icons.notes_outlined,
                          ),
                          _field(
                            _otherServices,
                            'خدمات أو تخصصات أخرى',
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
      child: Builder(
        builder: (context) {
          return Container(
            height: 56 + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Colors.black,
            child: Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
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
        },
      ),
    );
  }

  Widget _heroSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 700;
        final logoHeight = constraints.maxWidth < 520 ? 118.0 : 142.0;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.66),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFFE0C174).withValues(alpha: 0.35),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(compact ? 18 : 24),
            child: compact
                ? Column(
                    children: <Widget>[
                      _identityImageBox(logoHeight),
                      const SizedBox(height: 18),
                      _heroText(),
                    ],
                  )
                : Row(
                    children: <Widget>[
                      _identityImageBox(logoHeight),
                      const SizedBox(width: 22),
                      Expanded(child: _heroText()),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget _identityImageBox(double size) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox.square(
            dimension: size,
            child: _identityImageBytes != null
                ? Image.memory(_identityImageBytes!, fit: BoxFit.cover)
                : _identityImageUrl != null && _identityImageUrl!.isNotEmpty
                    ? Image.network(_identityImageUrl!, fit: BoxFit.cover)
                    : const ColoredBox(
                        color: Color(0xFF16110A),
                        child: Icon(
                          Icons.apartment_outlined,
                          color: Color(0xFFE0C174),
                          size: 48,
                        ),
                      ),
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: _pickIdentityImage,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFFFE8A3),
            side: const BorderSide(color: Color(0xFFE0C174)),
          ),
          icon: const Icon(Icons.image_outlined),
          label: const Text('صورة المركز'),
        ),
      ],
    );
  }

  Widget _heroText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MentalSmileLogo(size: MentalSmileLogoSize.small),
        SizedBox(height: 14),
        Text(
          'ملف المركز المهني',
          style: TextStyle(
            color: Color(0xFFFFE8A3),
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'بيانات بسيطة للنشر المباشر في دليل المراكز العام.',
          style: TextStyle(color: Color(0xFFD6BD7A), height: 1.45),
        ),
      ],
    );
  }

  Widget _visibilitySwitches() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.42),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.28),
        ),
      ),
      child: Column(
        children: <Widget>[
          SwitchListTile(
            value: _showEmailPublicly,
            onChanged: (value) => setState(() => _showEmailPublicly = value),
            activeThumbColor: const Color(0xFFE0C174),
            title: const Text(
              'إظهار البريد الإلكتروني للعامة',
              style: TextStyle(color: Color(0xFFFFE8A3)),
            ),
          ),
          SwitchListTile(
            value: _showPhonePublicly,
            onChanged: (value) => setState(() => _showPhonePublicly = value),
            activeThumbColor: const Color(0xFFE0C174),
            title: const Text(
              'إظهار رقم الهاتف للعامة',
              style: TextStyle(color: Color(0xFFFFE8A3)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _previewStep() {
    return _centeredContent(
      ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 26),
        children: <Widget>[
          _sectionTitle(
              'راجع بيانات المركز قبل النشر', Icons.fact_check_outlined),
          _previewCard(),
          const SizedBox(height: 18),
          _previewActions(),
        ],
      ),
    );
  }

  Widget _previewCard() {
    final category = _selectedCategory;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.70),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE0C174)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox.square(
                    dimension: 76,
                    child: _identityImageBytes != null
                        ? Image.memory(_identityImageBytes!, fit: BoxFit.cover)
                        : _identityImageUrl != null &&
                                _identityImageUrl!.isNotEmpty
                            ? Image.network(_identityImageUrl!,
                                fit: BoxFit.cover)
                            : const ColoredBox(
                                color: Color(0xFF16110A),
                                child: Icon(
                                  Icons.apartment_outlined,
                                  color: Color(0xFFE0C174),
                                ),
                              ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _centerName.text.trim(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFFFE8A3),
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        category.label,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Color(0xFFD6BD7A)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_otherServices.text.trim().isNotEmpty) ...<Widget>[
              const SizedBox(height: 14),
              _previewLine('خدمات أخرى', _otherServices.text.trim()),
            ],
            if (_shortBio.text.trim().isNotEmpty) ...<Widget>[
              const SizedBox(height: 10),
              _previewLine('نبذة قصيرة', _shortBio.text.trim()),
            ],
            const SizedBox(height: 14),
            _previewLine(
                'البريد العام', _showEmailPublicly ? _email.text : 'مخفي'),
            _previewLine(
                'الهاتف العام', _showPhonePublicly ? _phone.text : 'مخفي'),
          ],
        ),
      ),
    );
  }

  Widget _previewLine(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        '$title: $value',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Color(0xFFD6BD7A), height: 1.35),
      ),
    );
  }

  Widget _previewActions() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: <Widget>[
        OutlinedButton.icon(
          onPressed: _savingProfile
              ? null
              : () => setState(() => _showPreview = false),
          icon: const Icon(Icons.edit_outlined),
          label: const Text('تعديل'),
        ),
        ElevatedButton.icon(
          onPressed: _savingProfile ? null : _completeDirectPublish,
          icon: _savingProfile
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.public_outlined),
          label: Text(_savingProfile ? 'جار النشر' : 'نشر مباشر'),
        ),
      ],
    );
  }

  Widget _categoryDropdown() {
    return DropdownButtonFormField<String>(
      initialValue: _category,
      decoration: _inputDecoration('نوع المركز', Icons.apartment_outlined),
      dropdownColor: const Color(0xFF17110A),
      style: const TextStyle(color: Color(0xFFFFE8A3)),
      items: ProviderProfileCategoryRegistry.centerCategories
          .map(
            (category) => DropdownMenuItem<String>(
              value: category.id,
              child: Text(category.label),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null ||
            !ProviderProfileCategoryRegistry.isCenterCategory(value)) {
          return 'اختار نوع المركز';
        }
        return null;
      },
      onChanged: (value) {
        if (value == null) return;
        setState(() => _category = value);
      },
    );
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
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: _inputDecoration(label, icon),
      validator: (value) {
        final text = value?.trim() ?? '';
        if (required && text.isEmpty) return 'هذا الحقل مطلوب';
        if (maxLength != null && text.length > maxLength) {
          return 'الحد الأقصى $maxLength حرف';
        }
        return null;
      },
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFFD6BD7A)),
      prefixIcon: Icon(icon, color: const Color(0xFFE0C174)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: const Color(0xFFE0C174).withValues(alpha: 0.35),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE0C174)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      filled: true,
      fillColor: Colors.black.withValues(alpha: 0.44),
    );
  }

  Widget _saveButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: _openPreview,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE0C174),
          foregroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        icon: const Icon(Icons.fact_check_outlined),
        label: const Text(
          'مراجعة ونشر',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
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

  Widget _two(Widget first, Widget second) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 620) {
          return Column(
            children: <Widget>[
              first,
              const SizedBox(height: 12),
              second,
              const SizedBox(height: 12),
            ],
          );
        }
        return Row(
          children: <Widget>[
            Expanded(child: first),
            const SizedBox(width: 12),
            Expanded(child: second),
          ],
        );
      },
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: <Widget>[
          Icon(icon, color: const Color(0xFFE0C174)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFFFE8A3),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
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

  Future<void> _pickIdentityImage() async {
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
        const SnackBar(
            content: Text('اختار صورة بصيغة JPG أو PNG أو WEBP حتى 5 MB.')),
      );
      return;
    }
    setState(() {
      _identityImageBytes = bytes;
      _identityImageContentType = contentType;
    });
  }

  void _openPreview() {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _showPreview = true);
  }

  Future<void> _completeDirectPublish() async {
    if (_savingProfile) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.isAnonymous) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('سجل الدخول بحساب مركز قبل النشر.')),
      );
      return;
    }

    setState(() => _savingProfile = true);
    try {
      var identityImageUrl = _identityImageUrl;
      if (_identityImageBytes != null) {
        identityImageUrl = await _profileRepository.uploadCenterIdentityImage(
          uid: user.uid,
          bytes: _identityImageBytes!,
          contentType: _identityImageContentType ?? 'image/jpeg',
        );
      }

      final category = _selectedCategory;
      final profile = <String, Object?>{
        'centerName': _centerName.text.trim(),
        'category': category.id,
        'categoryLabel': category.label,
        'otherServices': _otherServices.text.trim(),
        'shortBio': _shortBio.text.trim(),
        'email': _email.text.trim(),
        'phone': _phone.text.trim(),
        'showEmailPublicly': _showEmailPublicly,
        'showPhonePublicly': _showPhonePublicly,
        'identityImageUrl': identityImageUrl,
      };

      await _profileRepository.saveCenterProfile(
          uid: user.uid, profile: profile);
      if (!mounted) return;
      setState(() {
        _showPreview = false;
        _identityImageBytes = null;
        _identityImageContentType = null;
        _identityImageUrl = identityImageUrl;
      });
      _showSuccessDialog();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذر نشر ملف المركز. حاول مرة أخرى.')),
      );
    } finally {
      if (mounted) setState(() => _savingProfile = false);
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
          'تم نشر ملف المركز',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFE8A3),
            fontWeight: FontWeight.w900,
          ),
        ),
        content: const Text(
          'سيظهر المركز في قسم العرض العام المطابق للفئة المختارة.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFFD6BD7A), height: 1.5),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0C174),
              foregroundColor: Colors.black,
            ),
            child: const Text('تم'),
          ),
        ],
      ),
    );
  }

  Future<void> _hydrateExistingProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.isAnonymous) return;
    try {
      final profile = await _profileRepository.loadCenterProfile(user.uid);
      if (!mounted || profile == null) return;
      setState(() {
        _centerName.text = _string(profile['centerName']);
        _email.text = _string(profile['email']);
        _phone.text = _string(profile['phone']);
        _otherServices.text = _limitedString(profile['otherServices'], 160);
        _shortBio.text = _limitedString(profile['shortBio'], 300);
        _category = _categoryOrDefault(_string(profile['category']));
        _showEmailPublicly = profile['showEmailPublicly'] == true;
        _showPhonePublicly = profile['showPhonePublicly'] == true;
        _identityImageUrl = _nullableString(profile['identityImageUrl']);
      });
    } catch (_) {
      return;
    }
  }

  ProviderCategory get _selectedCategory {
    return ProviderProfileCategoryRegistry.centerById(_category) ??
        ProviderProfileCategoryRegistry.centerCategories.first;
  }

  String _categoryOrDefault(String value) {
    return ProviderProfileCategoryRegistry.isCenterCategory(value)
        ? value
        : ProviderProfileCategoryRegistry.centerCategories.first.id;
  }

  String _string(Object? value) => value?.toString().trim() ?? '';

  String _limitedString(Object? value, int maxLength) {
    final text = _string(value);
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength);
  }

  String? _nullableString(Object? value) {
    final text = _string(value);
    return text.isEmpty ? null : text;
  }
}
