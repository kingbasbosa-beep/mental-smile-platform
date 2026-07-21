import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/application/commercial_auth_service.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class SpecialistLoginPage extends StatefulWidget {
  const SpecialistLoginPage({super.key});

  @override
  State<SpecialistLoginPage> createState() => _SpecialistLoginPageState();
}

class _SpecialistLoginPageState extends State<SpecialistLoginPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = CommercialAuthService();
  bool _obscurePassword = true;
  bool _loading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final successRoute = _successRoute(Routes.commercialRoom);
    return CommercialLoginScaffold(
      title: 'دخول الأخصائي',
      fields: [
        CommercialLoginField(
          controller: _phoneController,
          label: 'Email or Phone Number',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          showGuideIcon: true,
        ),
        CommercialLoginField(
          controller: _passwordController,
          label: 'Password',
          icon: Icons.lock_outline,
          obscureText: _obscurePassword,
          showGuideIcon: true,
          suffix: IconButton(
            onPressed: () {
              setState(() => _obscurePassword = !_obscurePassword);
            },
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xFFE0C174),
            ),
          ),
        ),
      ],
      primaryLabel: _loading ? 'Loading...' : 'Login',
      onPrimaryPressed: _loading ? null : _login,
      secondaryLabel: 'Register',
      showBackButton: true,
      onSecondaryPressed: () => Navigator.of(context).pushNamed(
        Routes.commercialSpecialistRegister,
        arguments: <String, Object>{'successRoute': successRoute},
      ),
      daleelAssistant: const DaleelAssistant(
        guideAssetPath:
            'assets/branding/guides/specialist_desktop_login_guide.png',
        surveyTitle: 'رأيك يهمنا',
        surveyIntro: 'ساعدنا في تحسين تجربة تسجيل الدخول للأخصائيين.\n\n'
            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
        suggestionsPlaceholder:
            'اكتب أي اقتراح يساعدنا في تحسين شاشة تسجيل الدخول...',
        sections: DaleelAssistantSurvey.specialistLoginSections,
      ),
    );
  }

  Future<void> _login() async {
    final identity = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    if (identity.isEmpty || password.isEmpty) {
      _showMessage('Please enter email/phone and password.');
      return;
    }

    setState(() => _loading = true);
    final result = await _authService.loginClinician(
      emailOrPhone: identity,
      password: password,
    );
    if (!mounted) return;
    setState(() => _loading = false);

    if (!result.success) {
      _showMessage(result.message);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      _successRoute(Routes.commercialRoom),
      (route) => false,
    );
  }

  String _successRoute(String fallback) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map && args['successRoute'] is String) {
      return args['successRoute'] as String;
    }
    return fallback;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class CommercialLoginScaffold extends StatelessWidget {
  const CommercialLoginScaffold({
    super.key,
    required this.title,
    required this.fields,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.secondaryLabel,
    this.onSecondaryPressed,
    this.daleelAssistant,
    this.showBackButton = false,
  });

  final String title;
  final List<Widget> fields;
  final String primaryLabel;
  final VoidCallback? onPrimaryPressed;
  final String? secondaryLabel;
  final VoidCallback? onSecondaryPressed;
  final Widget? daleelAssistant;
  final bool showBackButton;

  void _handleBack(BuildContext context) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }

    navigator.pushReplacementNamed(Routes.commercialAccess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final showDaleel = daleelAssistant != null &&
                constraints.maxWidth >= 900 &&
                constraints.maxWidth > constraints.maxHeight;

            return Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/branding/logo_primary.png',
                            width: 160,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 36),
                          Text(
                            title,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              color: Color(0xFFFFE8A3),
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 28),
                          ...fields.expand(
                            (field) => [field, const SizedBox(height: 16)],
                          ),
                          const SizedBox(height: 8),
                          CommercialGoldButton(
                            label: primaryLabel,
                            onPressed: onPrimaryPressed,
                          ),
                          if (secondaryLabel != null) ...[
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: onSecondaryPressed,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    secondaryLabel!,
                                    style: const TextStyle(
                                      color: Color(0xFFE0C174),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const AccessibilityGuideIcon(
                                    size: 18,
                                    tooltipIconSize: 72,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                if (showDaleel)
                  Positioned(
                    top: 18,
                    left: 24,
                    child: daleelAssistant!,
                  ),
                if (showBackButton)
                  Positioned(
                    top: 18,
                    right: 24,
                    child: _CommercialLoginBackButton(
                      onPressed: () => _handleBack(context),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CommercialLoginBackButton extends StatefulWidget {
  const _CommercialLoginBackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_CommercialLoginBackButton> createState() =>
      _CommercialLoginBackButtonState();
}

class _CommercialLoginBackButtonState
    extends State<_CommercialLoginBackButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Back',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: _hovered ? 0.38 : 0.22),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE0C174).withValues(
                  alpha: _hovered ? 0.82 : 0.55,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE0C174).withValues(
                    alpha: _hovered ? 0.28 : 0.14,
                  ),
                  blurRadius: _hovered ? 18 : 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Color(0xFFFFE8A3),
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class CommercialLoginField extends StatelessWidget {
  const CommercialLoginField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
    this.showGuideIcon = false,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final bool showGuideIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      enabled: enabled,
      style: TextStyle(
        color: enabled ? const Color(0xFFFFE8A3) : Colors.grey,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: enabled ? const Color(0xFFE0C174) : Colors.grey,
        ),
        prefixIcon: Icon(
          icon,
          color: enabled ? const Color(0xFFE0C174) : Colors.grey,
        ),
        suffixIcon: showGuideIcon || suffix != null
            ? _LoginFieldSuffix(
                suffix: suffix,
                showGuideIcon: showGuideIcon,
              )
            : null,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.04),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF9B6A19)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFFE8A3), width: 1.4),
        ),
      ),
    );
  }
}

class _LoginFieldSuffix extends StatelessWidget {
  const _LoginFieldSuffix({
    required this.showGuideIcon,
    this.suffix,
  });

  final bool showGuideIcon;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showGuideIcon)
          const AccessibilityGuideIcon(
            size: 18,
            tooltipIconSize: 72,
          ),
        if (suffix != null) suffix!,
        if (suffix == null) const SizedBox(width: 10),
      ],
    );
  }
}

class CommercialGoldButton extends StatelessWidget {
  const CommercialGoldButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
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
            fontWeight: FontWeight.w800,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            const SizedBox(width: 8),
            const AccessibilityGuideIcon(
              size: 18,
              tooltipIconSize: 72,
            ),
          ],
        ),
      ),
    );
  }
}
