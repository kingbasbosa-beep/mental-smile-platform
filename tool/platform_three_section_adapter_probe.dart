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
    ThreeSectionAdapterProbeApp(
      firebaseReady: firebaseReady,
      firebaseMessage: firebaseMessage,
    ),
  );
}

class ThreeSectionAdapterProbeApp extends StatelessWidget {
  const ThreeSectionAdapterProbeApp({
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
      title: 'Central Platform Core Three Section Adapter Probe',
      home: ThreeSectionAdapterProbePage(
        firebaseReady: firebaseReady,
        firebaseMessage: firebaseMessage,
      ),
    );
  }
}

class ThreeSectionAdapterProbePage extends StatefulWidget {
  ThreeSectionAdapterProbePage({
    required this.firebaseReady,
    this.firebaseMessage,
    FirebaseAuth? auth,
    super.key,
  }) : auth = auth ?? FirebaseAuth.instance;

  final bool firebaseReady;
  final String? firebaseMessage;
  final FirebaseAuth auth;

  @override
  State<ThreeSectionAdapterProbePage> createState() {
    return _ThreeSectionAdapterProbePageState();
  }
}

class _ThreeSectionAdapterProbePageState
    extends State<ThreeSectionAdapterProbePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Map<String, AdapterProbeResultData> _results =
      <String, AdapterProbeResultData>{};
  final Set<String> _sendingSections = <String>{};

  bool _signingIn = false;
  String? _authMessage;

  static final List<_ProbeSection> _sections = <_ProbeSection>[
    const _ProbeSection(
      label: 'Residential',
      sectionId: ResidentialSectionAdapter.sectionId,
      sectionCode: ResidentialSectionAdapter.sectionCode,
      socketId: ResidentialSectionAdapter.defaultSocketId,
      testCode: ResidentialSectionAdapter.testCode,
      contextSurface: 'residential_adapter_probe',
    ),
    const _ProbeSection(
      label: 'Commercial',
      sectionId: CommercialSectionAdapter.sectionId,
      sectionCode: CommercialSectionAdapter.sectionCode,
      socketId: CommercialSectionAdapter.defaultSocketId,
      testCode: CommercialSectionAdapter.testCode,
      contextSurface: 'commercial_adapter_probe',
    ),
    const _ProbeSection(
      label: 'Library',
      sectionId: LibrarySectionAdapter.sectionId,
      sectionCode: LibrarySectionAdapter.sectionCode,
      socketId: LibrarySectionAdapter.defaultSocketId,
      testCode: LibrarySectionAdapter.testCode,
      contextSurface: 'library_adapter_probe',
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
      if (mounted) {
        setState(() => _signingIn = false);
      }
    }
  }

  Future<void> _sendOneSignal(_ProbeSection section) async {
    if (_sendingSections.contains(section.sectionId) ||
        !widget.firebaseReady ||
        _currentUser == null) {
      return;
    }

    setState(() {
      _sendingSections.add(section.sectionId);
      _results.remove(section.sectionId);
    });

    try {
      final adapterRegistry = PlatformAdapterRegistry()
        ..register(const ResidentialSectionAdapter())
        ..register(const CommercialSectionAdapter())
        ..register(const LibrarySectionAdapter());

      final core = PlatformCore(
        outputGateway: FirebaseCoreOutputGateway(
          writer: FirebaseCoreFirestoreWriter(),
        ),
      );
      for (final socket in adapterRegistry.createSockets()) {
        core.connectSection(socket);
      }

      final result = await core.emit(
        CoreSignalRequest(
          sectionId: section.sectionId,
          code: section.testCode,
          context: <String, Object?>{'surface': section.contextSurface},
        ),
      );

      if (!mounted) return;
      setState(() {
        _results[section.sectionId] = AdapterProbeResultData.fromCoreResult(
          result,
        );
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _results[section.sectionId] = const AdapterProbeResultData(
          accepted: true,
          outputDelivered: false,
          reason: 'gatewayFailure',
        );
      });
    } finally {
      if (mounted) {
        setState(() => _sendingSections.remove(section.sectionId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authenticated = _currentUser != null;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Central Platform Core - Three Section Adapter Probe'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: <Widget>[
              _ProbeTile(
                label: 'Firebase Status',
                value: widget.firebaseReady ? 'Ready' : 'Unavailable',
                detail: widget.firebaseMessage,
              ),
              _ProbeTile(
                label: 'Authentication Status',
                value: authenticated ? 'Signed in' : 'Not signed in',
                detail: _authMessage,
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
              for (final section in _sections)
                _SectionProbePanel(
                  section: section,
                  result: _results[section.sectionId],
                  sending: _sendingSections.contains(section.sectionId),
                  enabled: widget.firebaseReady && authenticated,
                  onSend: () => _sendOneSignal(section),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdapterProbeResultData {
  const AdapterProbeResultData({
    required this.accepted,
    required this.outputDelivered,
    required this.reason,
    this.signalId,
  });

  factory AdapterProbeResultData.fromCoreResult(CoreEmitResult result) {
    return AdapterProbeResultData(
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

class _ProbeSection {
  const _ProbeSection({
    required this.label,
    required this.sectionId,
    required this.sectionCode,
    required this.socketId,
    required this.testCode,
    required this.contextSurface,
  });

  final String label;
  final String sectionId;
  final String sectionCode;
  final String socketId;
  final String testCode;
  final String contextSurface;
}

class _SectionProbePanel extends StatelessWidget {
  const _SectionProbePanel({
    required this.section,
    required this.result,
    required this.sending,
    required this.enabled,
    required this.onSend,
  });

  final _ProbeSection section;
  final AdapterProbeResultData? result;
  final bool sending;
  final bool enabled;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(section.label,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              _ProbeTile(
                label: 'Identity',
                value:
                    '${section.sectionId} / ${section.sectionCode} / ${section.socketId}',
              ),
              _ProbeTile(label: 'Test Code', value: section.testCode),
              FilledButton(
                onPressed: enabled && !sending ? onSend : null,
                child: Text(
                  sending ? 'Sending...' : 'Send ${section.label} Test Signal',
                ),
              ),
              const SizedBox(height: 10),
              _ProbeResultPanel(result: result),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProbeResultPanel extends StatelessWidget {
  const _ProbeResultPanel({required this.result});

  final AdapterProbeResultData? result;

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return const _ProbeTile(label: 'Result', value: 'No signal sent yet');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _ProbeTile(label: 'Result', value: _summary),
        _ProbeTile(label: 'accepted', value: '${result!.accepted}'),
        _ProbeTile(
          label: 'outputDelivered',
          value: '${result!.outputDelivered}',
        ),
        _ProbeTile(label: 'reason', value: result!.reason),
        _ProbeTile(label: 'Signal ID', value: result!.signalId ?? 'none'),
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

class _ProbeTile extends StatelessWidget {
  const _ProbeTile({
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 3),
          Text(value),
          if (detail != null) ...<Widget>[
            const SizedBox(height: 3),
            Text(detail!, style: Theme.of(context).textTheme.bodySmall),
          ],
        ],
      ),
    );
  }
}
