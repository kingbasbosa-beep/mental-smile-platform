import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/application/commercial_auth_service.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_login_page.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class CenterLoginPage extends StatefulWidget {
  const CenterLoginPage({super.key});

  @override
  State<CenterLoginPage> createState() => _CenterLoginPageState();
}

class _CenterLoginPageState extends State<CenterLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = CommercialAuthService();
  bool _obscurePassword = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final successRoute = _successRoute(Routes.commercialCenterRoom);
    return CommercialLoginScaffold(
      title: 'دخول المركز',
      fields: [
        CommercialLoginField(
          controller: _emailController,
          label: 'Email',
          icon: Icons.alternate_email,
          keyboardType: TextInputType.emailAddress,
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
        Routes.commercialCenterRegister,
        arguments: <String, Object>{'successRoute': successRoute},
      ),
      daleelAssistant: const DaleelAssistant(
        guideAssetPath: 'assets/branding/guides/center_desktop_login_guide.png',
        surveyTitle: 'رأيك يهمنا',
        surveyIntro: 'ساعدنا في تحسين تجربة تسجيل الدخول للمراكز.\n\n'
            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
        suggestionsPlaceholder:
            'اكتب أي اقتراح يساعدنا في تحسين شاشة دخول المركز...',
        sections: DaleelAssistantSurvey.centerLoginSections,
      ),
    );
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      _showMessage('Please enter email and password.');
      return;
    }

    setState(() => _loading = true);
    final result = await _authService.loginCenter(
      email: email,
      password: password,
    );
    if (!mounted) return;
    setState(() => _loading = false);

    if (!result.success) {
      _showMessage(result.message);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      _successRoute(Routes.commercialCenterRoom),
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
