import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/commercial/platform_core/commercial_section_adapter.dart';
import 'package:mental_smile_os/features/library/platform_core/library_section_adapter.dart';
import 'package:mental_smile_os/features/residential/platform_core/residential_section_adapter.dart';
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
    RealSignalGroupProbeApp(
      firebaseReady: firebaseReady,
      firebaseMessage: firebaseMessage,
    ),
  );
}

class RealSignalGroupProbeApp extends StatelessWidget {
  const RealSignalGroupProbeApp({
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
      title: 'Platform Real Signal Group Probe',
      home: RealSignalGroupProbePage(
        firebaseReady: firebaseReady,
        firebaseMessage: firebaseMessage,
      ),
    );
  }
}

class RealSignalGroupProbePage extends StatefulWidget {
  RealSignalGroupProbePage({
    required this.firebaseReady,
    this.firebaseMessage,
    FirebaseAuth? auth,
    super.key,
  }) : auth = auth ?? FirebaseAuth.instance;

  final bool firebaseReady;
  final String? firebaseMessage;
  final FirebaseAuth auth;

  @override
  State<RealSignalGroupProbePage> createState() =>
      _RealSignalGroupProbePageState();
}

class _RealSignalGroupProbePageState extends State<RealSignalGroupProbePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Map<String, CoreEmitResult> _results = <String, CoreEmitResult>{};
  final Set<String> _sendingCodes = <String>{};

  bool _signingIn = false;
  String? _authMessage;

  static const List<_RealSignalProbeAction> _actions = <_RealSignalProbeAction>[
    _RealSignalProbeAction(
      label: 'Residential check-in submit',
      sectionId: ResidentialSectionAdapter.sectionId,
      code: 'cl012sb',
      context: <String, Object?>{
        'surface': 'client_checkin',
        'formType': 'checkin',
        'status': 'submitted',
      },
    ),
    _RealSignalProbeAction(
      label: 'Residential suggestion submit',
      sectionId: ResidentialSectionAdapter.sectionId,
      code: 'cl014sb',
      context: <String, Object?>{
        'surface': 'client_suggestion',
        'formType': 'suggestion',
        'status': 'submitted',
      },
    ),
    _RealSignalProbeAction(
      label: 'Specialist login success',
      sectionId: CommercialSectionAdapter.sectionId,
      code: 'sp010bt',
      context: <String, Object?>{
        'surface': 'specialist_login',
        'actorType': 'specialist',
        'status': 'success',
      },
    ),
    _RealSignalProbeAction(
      label: 'Specialist application submit',
      sectionId: CommercialSectionAdapter.sectionId,
      code: 'sp014sb',
      context: <String, Object?>{
        'surface': 'specialist_application',
        'actorType': 'specialist',
        'formType': 'application',
        'status': 'submitted',
      },
    ),
    _RealSignalProbeAction(
      label: 'Center login success',
      sectionId: CommercialSectionAdapter.sectionId,
      code: 'ct010bt',
      context: <String, Object?>{
        'surface': 'center_login',
        'actorType': 'center',
        'status': 'success',
      },
    ),
    _RealSignalProbeAction(
      label: 'Center application submit',
      sectionId: CommercialSectionAdapter.sectionId,
      code: 'ct014sb',
      context: <String, Object?>{
        'surface': 'center_application',
        'actorType': 'center',
        'formType': 'application',
        'status': 'submitted',
      },
    ),
  ];

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
      if (mounted) setState(() => _signingIn = false);
    }
  }

  Future<void> _sendOne(_RealSignalProbeAction action) async {
    if (_sendingCodes.contains(action.code) ||
        !widget.firebaseReady ||
        _currentUser == null) {
      return;
    }

    setState(() {
      _sendingCodes.add(action.code);
      _results.remove(action.code);
    });

    try {
      final core = PlatformCore(
        outputGateway: FirebaseCoreOutputGateway(
          writer: FirebaseCoreFirestoreWriter(),
        ),
      )
        ..connectSection(const ResidentialSectionAdapter().createSocket())
        ..connectSection(const CommercialSectionAdapter().createSocket())
        ..connectSection(const LibrarySectionAdapter().createSocket());

      final result = await core.emit(
        CoreSignalRequest(
          sectionId: action.sectionId,
          code: action.code,
          context: action.context,
        ),
      );
      if (!mounted) return;
      setState(() => _results[action.code] = result);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _results[action.code] = CoreEmitResult.rejected(
          CoreEmitReason.gatewayFailure,
        );
      });
    } finally {
      if (mounted) setState(() => _sendingCodes.remove(action.code));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authenticated = _currentUser != null;

    return Scaffold(
      appBar: AppBar(title: const Text('Platform Real Signal Group Probe')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: <Widget>[
              _ProbeLine(
                label: 'Firebase Status',
                value: widget.firebaseReady ? 'Ready' : 'Unavailable',
                detail: widget.firebaseMessage,
              ),
              _ProbeLine(
                label: 'Authentication Status',
                value: authenticated ? 'Signed in' : 'Not signed in',
                detail: _authMessage,
              ),
              if (!authenticated) ...<Widget>[
                const SizedBox(height: 12),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
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
              const SizedBox(height: 20),
              for (final action in _actions)
                _ActionPanel(
                  action: action,
                  result: _results[action.code],
                  sending: _sendingCodes.contains(action.code),
                  enabled: widget.firebaseReady && authenticated,
                  onSend: () => _sendOne(action),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RealSignalProbeAction {
  const _RealSignalProbeAction({
    required this.label,
    required this.sectionId,
    required this.code,
    required this.context,
  });

  final String label;
  final String sectionId;
  final String code;
  final Map<String, Object?> context;
}

class _ActionPanel extends StatelessWidget {
  const _ActionPanel({
    required this.action,
    required this.result,
    required this.sending,
    required this.enabled,
    required this.onSend,
  });

  final _RealSignalProbeAction action;
  final CoreEmitResult? result;
  final bool sending;
  final bool enabled;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(action.label,
                  style: Theme.of(context).textTheme.titleMedium),
              _ProbeLine(label: 'Code', value: action.code),
              _ProbeLine(label: 'Section', value: action.sectionId),
              FilledButton(
                onPressed: enabled && !sending ? onSend : null,
                child: Text(sending ? 'Sending...' : 'Send One Signal'),
              ),
              if (result != null) ...<Widget>[
                _ProbeLine(label: 'accepted', value: '${result!.accepted}'),
                _ProbeLine(
                  label: 'outputDelivered',
                  value: '${result!.outputDelivered}',
                ),
                _ProbeLine(label: 'reason', value: result!.reason.name),
                _ProbeLine(
                  label: 'Signal ID',
                  value: result!.envelope?.signalId ?? 'none',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ProbeLine extends StatelessWidget {
  const _ProbeLine({
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          Text(value),
          if (detail != null)
            Text(detail!, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
