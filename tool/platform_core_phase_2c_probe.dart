import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var firebaseReady = false;
  String? firebaseMessage;

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    firebaseReady = true;
    firebaseMessage = 'Firebase initialized';
  } catch (error) {
    firebaseMessage = 'Firebase initialization failed: $error';
  }

  runApp(
    Phase2CProbeApp(
      firebaseReady: firebaseReady,
      firebaseMessage: firebaseMessage,
    ),
  );
}

class Phase2CProbeApp extends StatelessWidget {
  const Phase2CProbeApp({
    required this.firebaseReady,
    this.firebaseMessage,
    super.key,
  });

  final bool firebaseReady;
  final String? firebaseMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Central Platform Core Firebase Probe',
      home: Phase2CProbePage(
        firebaseReady: firebaseReady,
        firebaseMessage: firebaseMessage,
      ),
    );
  }
}

class Phase2CProbePage extends StatefulWidget {
  Phase2CProbePage({
    required this.firebaseReady,
    this.firebaseMessage,
    FirebaseAuth? auth,
    super.key,
  }) : auth = auth ?? FirebaseAuth.instance;

  final bool firebaseReady;
  final String? firebaseMessage;
  final FirebaseAuth auth;

  @override
  State<Phase2CProbePage> createState() => _Phase2CProbePageState();
}

class _Phase2CProbePageState extends State<Phase2CProbePage> {
  static const String _sectionId = 'test_residential';
  static const String _sectionCode = 'RES_TEST';
  static const String _testCode = 'cl001bt';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _signingIn = false;
  bool _sending = false;
  String? _authMessage;
  Phase2CProbeResultData? _result;

  User? get _currentUser => widget.auth.currentUser;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInForTest() async {
    if (_signingIn) return;

    setState(() {
      _signingIn = true;
      _authMessage = 'Signing in...';
    });

    try {
      await widget.auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      setState(() => _authMessage = 'Authenticated test session ready');
    } on FirebaseAuthException catch (error) {
      if (!mounted) return;
      setState(() => _authMessage = 'Authentication failed: ${error.code}');
    } catch (_) {
      if (!mounted) return;
      setState(() => _authMessage = 'Authentication failed');
    } finally {
      if (mounted) {
        setState(() => _signingIn = false);
      }
    }
  }

  Future<void> _sendOneTestSignal() async {
    if (_sending || !widget.firebaseReady || _currentUser == null) return;

    setState(() {
      _sending = true;
      _result = null;
    });

    try {
      final core = PlatformCore(
        outputGateway: FirebaseCoreOutputGateway(
          writer: FirebaseCoreFirestoreWriter(),
        ),
      )..connectSection(
          const SectionSocket(
            sectionId: _sectionId,
            sectionCode: _sectionCode,
            contractVersion: 1,
            environment: 'test',
            allowedGates: <String>{'login'},
            allowedCodePrefixes: <String>{'cl'},
          ),
        );

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: _sectionId,
          code: _testCode,
          context: <String, Object?>{'surface': 'phase_2c_manual_probe'},
        ),
      );

      if (!mounted) return;
      setState(() => _result = Phase2CProbeResultData.fromCoreResult(result));
    } catch (_) {
      if (!mounted) return;
      setState(
        () => _result = const Phase2CProbeResultData(
          accepted: true,
          outputDelivered: false,
          reason: 'gatewayFailure',
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _sending = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authenticated = _currentUser != null;

    return Scaffold(
      appBar:
          AppBar(title: const Text('Central Platform Core - Firebase Probe')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: <Widget>[
              _StatusTile(
                label: 'Firebase Status',
                value: widget.firebaseReady ? 'Ready' : 'Unavailable',
                detail: widget.firebaseMessage,
              ),
              _StatusTile(
                label: 'Authentication Status',
                value: authenticated ? 'Signed in' : 'Not signed in',
                detail: _authMessage,
              ),
              const _StatusTile(
                label: 'Fake Section Status',
                value: 'test_residential / RES_TEST / test',
              ),
              const _StatusTile(
                label: 'Test Code',
                value: 'cl001bt / client_login_entry_tap',
              ),
              if (!authenticated) ...<Widget>[
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: widget.firebaseReady && !_signingIn
                      ? _signInForTest
                      : null,
                  child:
                      Text(_signingIn ? 'Signing in...' : 'Sign in for test'),
                ),
              ],
              const SizedBox(height: 24),
              FilledButton(
                onPressed: widget.firebaseReady && authenticated && !_sending
                    ? _sendOneTestSignal
                    : null,
                child: Text(
                  _sending ? 'Sending...' : 'Send One Test Signal',
                ),
              ),
              const SizedBox(height: 24),
              Phase2CProbeResultPanel(result: _result),
            ],
          ),
        ),
      ),
    );
  }
}

class Phase2CProbeResultData {
  const Phase2CProbeResultData({
    required this.accepted,
    required this.outputDelivered,
    required this.reason,
    this.signalId,
  });

  factory Phase2CProbeResultData.fromCoreResult(CoreEmitResult result) {
    return Phase2CProbeResultData(
      accepted: result.accepted,
      outputDelivered: result.outputDelivered,
      reason: result.reason.name,
      signalId: result.envelope?.signalId,
    );
  }

  final bool accepted;
  final bool outputDelivered;
  final String reason;
  final String? signalId;
}

class Phase2CProbeResultPanel extends StatelessWidget {
  const Phase2CProbeResultPanel({required this.result, super.key});

  final Phase2CProbeResultData? result;

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return const _StatusTile(label: 'Result', value: 'No signal sent yet');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _StatusTile(label: 'Result', value: _summary),
        _StatusTile(label: 'accepted', value: '${result!.accepted}'),
        _StatusTile(
          label: 'outputDelivered',
          value: '${result!.outputDelivered}',
        ),
        _StatusTile(label: 'reason', value: result!.reason),
        _StatusTile(label: 'Signal ID', value: result!.signalId ?? 'none'),
      ],
    );
  }

  String get _summary {
    if (result!.accepted && result!.outputDelivered) {
      return 'Full success';
    }
    if (result!.accepted && !result!.outputDelivered) {
      return 'Core accepted; Firebase delivery failed';
    }
    return 'Core rejected before Firebase';
  }
}

class _StatusTile extends StatelessWidget {
  const _StatusTile({
    required this.label,
    required this.value,
    this.detail,
  });

  final String label;
  final String value;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(label, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 4),
              Text(value),
              if (detail != null) ...<Widget>[
                const SizedBox(height: 4),
                Text(
                  detail!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
