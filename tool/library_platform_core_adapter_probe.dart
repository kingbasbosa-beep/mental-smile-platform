import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/library/platform_core/library_section_adapter.dart';
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
    LibraryPlatformCoreAdapterProbeApp(
      firebaseReady: firebaseReady,
      firebaseMessage: firebaseMessage,
    ),
  );
}

class LibraryPlatformCoreAdapterProbeApp extends StatelessWidget {
  const LibraryPlatformCoreAdapterProbeApp({
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
      title: 'Library Platform Core Adapter Probe',
      home: LibraryPlatformCoreAdapterProbePage(
        firebaseReady: firebaseReady,
        firebaseMessage: firebaseMessage,
      ),
    );
  }
}

class LibraryPlatformCoreAdapterProbePage extends StatefulWidget {
  LibraryPlatformCoreAdapterProbePage({
    required this.firebaseReady,
    this.firebaseMessage,
    FirebaseAuth? auth,
    super.key,
  }) : auth = auth ?? FirebaseAuth.instance;

  final bool firebaseReady;
  final String? firebaseMessage;
  final FirebaseAuth auth;

  @override
  State<LibraryPlatformCoreAdapterProbePage> createState() {
    return _LibraryPlatformCoreAdapterProbePageState();
  }
}

class _LibraryPlatformCoreAdapterProbePageState
    extends State<LibraryPlatformCoreAdapterProbePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _signingIn = false;
  bool _sending = false;
  String? _authMessage;
  LibraryAdapterProbeResultData? _result;

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

  Future<void> _sendOneLibrarySignal() async {
    if (_sending || !widget.firebaseReady || _currentUser == null) return;

    setState(() {
      _sending = true;
      _result = null;
    });

    try {
      const adapter = LibrarySectionAdapter();
      final core = PlatformCore(
        outputGateway: FirebaseCoreOutputGateway(
          writer: FirebaseCoreFirestoreWriter(),
        ),
      )..connectSection(adapter.createSocket());

      final result = await core.emit(
        const CoreSignalRequest(
          sectionId: LibrarySectionAdapter.sectionId,
          code: LibrarySectionAdapter.testCode,
          context: <String, Object?>{
            'surface': 'library_phase_4a_adapter_probe',
          },
        ),
      );

      if (!mounted) return;
      setState(
          () => _result = LibraryAdapterProbeResultData.fromCoreResult(result));
    } catch (_) {
      if (!mounted) return;
      setState(
        () => _result = const LibraryAdapterProbeResultData(
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
      appBar: AppBar(title: const Text('Library Platform Core Adapter Probe')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: <Widget>[
              _ProbeStatusTile(
                label: 'Firebase Status',
                value: widget.firebaseReady ? 'Ready' : 'Unavailable',
                detail: widget.firebaseMessage,
              ),
              _ProbeStatusTile(
                label: 'Authentication Status',
                value: authenticated ? 'Signed in' : 'Not signed in',
                detail: _authMessage,
              ),
              const _ProbeStatusTile(
                label: 'Library Adapter',
                value: 'MS-SECTION-LIBRARY / LIB / SOCKET_03 / test',
              ),
              const _ProbeStatusTile(
                label: 'Test Code',
                value: 'lb001bt / library_test_entry_tap',
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
                    ? _sendOneLibrarySignal
                    : null,
                child:
                    Text(_sending ? 'Sending...' : 'Send One Library Signal'),
              ),
              const SizedBox(height: 24),
              LibraryAdapterProbeResultPanel(result: _result),
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryAdapterProbeResultData {
  const LibraryAdapterProbeResultData({
    required this.accepted,
    required this.outputDelivered,
    required this.reason,
    this.signalId,
  });

  factory LibraryAdapterProbeResultData.fromCoreResult(CoreEmitResult result) {
    return LibraryAdapterProbeResultData(
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

class LibraryAdapterProbeResultPanel extends StatelessWidget {
  const LibraryAdapterProbeResultPanel({required this.result, super.key});

  final LibraryAdapterProbeResultData? result;

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return const _ProbeStatusTile(
          label: 'Result', value: 'No signal sent yet');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _ProbeStatusTile(label: 'Result', value: _summary),
        _ProbeStatusTile(label: 'accepted', value: '${result!.accepted}'),
        _ProbeStatusTile(
          label: 'outputDelivered',
          value: '${result!.outputDelivered}',
        ),
        _ProbeStatusTile(label: 'reason', value: result!.reason),
        _ProbeStatusTile(label: 'Signal ID', value: result!.signalId ?? 'none'),
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

class _ProbeStatusTile extends StatelessWidget {
  const _ProbeStatusTile({
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
                Text(detail!, style: Theme.of(context).textTheme.bodySmall),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
