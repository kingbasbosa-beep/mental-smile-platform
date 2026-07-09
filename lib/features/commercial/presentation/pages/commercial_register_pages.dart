import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/application/commercial_auth_service.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_login_page.dart';

class SpecialistRegisterPage extends StatefulWidget {
  const SpecialistRegisterPage({super.key});

  @override
  State<SpecialistRegisterPage> createState() => _SpecialistRegisterPageState();
}

class _SpecialistRegisterPageState extends State<SpecialistRegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = CommercialAuthService();
  bool _obscurePassword = true;
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommercialLoginScaffold(
      title: 'تسجيل الأخصائي',
      fields: [
        CommercialLoginField(
          controller: _nameController,
          label: 'Specialist Name',
          icon: Icons.badge_outlined,
          showGuideIcon: true,
        ),
        CommercialLoginField(
          controller: _emailController,
          label: 'Email',
          icon: Icons.alternate_email,
          keyboardType: TextInputType.emailAddress,
          showGuideIcon: true,
        ),
        CommercialLoginField(
          controller: _phoneController,
          label: 'Phone Number',
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
          suffix: _visibilityButton(),
        ),
        CommercialLoginField(
          controller: _confirmPasswordController,
          label: 'Confirm Password',
          icon: Icons.lock_reset_outlined,
          obscureText: _obscurePassword,
          showGuideIcon: true,
        ),
      ],
      primaryLabel: _loading ? 'Creating...' : 'Create Account',
      onPrimaryPressed: _loading ? null : _register,
      secondaryLabel: 'Back to Login',
      onSecondaryPressed: () => Navigator.of(context).pushReplacementNamed(
        Routes.commercialSpecialistLogin,
      ),
    );
  }

  Widget _visibilityButton() {
    return IconButton(
      onPressed: () {
        setState(() => _obscurePassword = !_obscurePassword);
      },
      icon: Icon(
        _obscurePassword ? Icons.visibility : Icons.visibility_off,
        color: const Color(0xFFE0C174),
      ),
    );
  }

  Future<void> _register() async {
    if (!_validate()) return;

    setState(() => _loading = true);
    final result = await _authService.registerClinician(
      displayName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      password: _passwordController.text.trim(),
    );
    if (!mounted) return;
    setState(() => _loading = false);

    if (!result.success) {
      _showMessage(result.message);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.commercialRoom,
      (route) => false,
    );
  }

  bool _validate() {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      _showMessage('Please complete all fields.');
      return false;
    }
    if (_passwordController.text.trim().length < 6) {
      _showMessage('Password must be at least 6 characters.');
      return false;
    }
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      _showMessage('Passwords do not match.');
      return false;
    }
    return true;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class CenterRegisterPage extends StatefulWidget {
  const CenterRegisterPage({super.key});

  @override
  State<CenterRegisterPage> createState() => _CenterRegisterPageState();
}

class _CenterRegisterPageState extends State<CenterRegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = CommercialAuthService();
  bool _obscurePassword = true;
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommercialLoginScaffold(
      title: 'تسجيل المركز',
      fields: [
        CommercialLoginField(
          controller: _nameController,
          label: 'Center Name',
          icon: Icons.apartment_rounded,
          showGuideIcon: true,
        ),
        CommercialLoginField(
          controller: _emailController,
          label: 'Email',
          icon: Icons.alternate_email,
          keyboardType: TextInputType.emailAddress,
          showGuideIcon: true,
        ),
        CommercialLoginField(
          controller: _phoneController,
          label: 'Phone Number',
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
          suffix: _visibilityButton(),
        ),
        CommercialLoginField(
          controller: _confirmPasswordController,
          label: 'Confirm Password',
          icon: Icons.lock_reset_outlined,
          obscureText: _obscurePassword,
          showGuideIcon: true,
        ),
      ],
      primaryLabel: _loading ? 'Creating...' : 'Create Account',
      onPrimaryPressed: _loading ? null : _register,
      secondaryLabel: 'Back to Login',
      onSecondaryPressed: () => Navigator.of(context).pushReplacementNamed(
        Routes.commercialCenterLogin,
      ),
    );
  }

  Widget _visibilityButton() {
    return IconButton(
      onPressed: () {
        setState(() => _obscurePassword = !_obscurePassword);
      },
      icon: Icon(
        _obscurePassword ? Icons.visibility : Icons.visibility_off,
        color: const Color(0xFFE0C174),
      ),
    );
  }

  Future<void> _register() async {
    if (!_validate()) return;

    setState(() => _loading = true);
    final result = await _authService.registerCenter(
      centerName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      password: _passwordController.text.trim(),
    );
    if (!mounted) return;
    setState(() => _loading = false);

    if (!result.success) {
      _showMessage(result.message);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.commercialCenterRoom,
      (route) => false,
    );
  }

  bool _validate() {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      _showMessage('Please complete all fields.');
      return false;
    }
    if (_passwordController.text.trim().length < 6) {
      _showMessage('Password must be at least 6 characters.');
      return false;
    }
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      _showMessage('Passwords do not match.');
      return false;
    }
    return true;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
