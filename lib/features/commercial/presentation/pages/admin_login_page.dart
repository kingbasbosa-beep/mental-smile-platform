import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_login_page.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(Routes.commercialAdminRoom);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      String message = 'Login failed';
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        message = 'Invalid email or password';
      } else if (e.code == 'user-disabled') {
        message = 'This account has been disabled';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommercialLoginScaffold(
      title: 'دخول الإدارة',
      fields: [
        CommercialLoginField(
          controller: _emailController,
          label: 'Email',
          icon: Icons.alternate_email,
          keyboardType: TextInputType.emailAddress,
          enabled: !_loading,
        ),
        CommercialLoginField(
          controller: _passwordController,
          label: 'Password',
          icon: Icons.lock_outline,
          obscureText: _obscurePassword,
          enabled: !_loading,
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
      primaryLabel: _loading ? 'Logging in...' : 'Login',
      onPrimaryPressed: _loading ? null : () => _handleLogin(),
      showBackButton: true,
    );
  }
}
