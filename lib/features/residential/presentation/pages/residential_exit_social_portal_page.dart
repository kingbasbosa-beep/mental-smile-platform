import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/features/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_os/l10n/residential/residential_localizations.dart';
import 'package:mental_smile_os/l10n/shared/shared_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class ResidentialExitSocialPortalPage extends StatelessWidget {
  const ResidentialExitSocialPortalPage({super.key});

  static const String _background =
      'assets/backgrounds/residential_exit_social_portal.webp.png';

  @override
  Widget build(BuildContext context) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.residentialExitPortalView,
      sourceScreen: 'Residential Exit Portal',
      sourceWidget: 'ResidentialExitSocialPortalPage',
      action: 'view',
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 760;
            final canvasHeight = compact ? 980.0 : constraints.maxHeight;

            return SingleChildScrollView(
              child: SizedBox(
                height: canvasHeight,
                width: constraints.maxWidth,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: Transform.scale(
                        scale: compact ? 1.0 : 1.05,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: Image.asset(_background),
                        ),
                      ),
                    ),
                    if (compact)
                      _CompactPortalLayout(
                        onExit: () => _returnToSplash(context),
                      )
                    else
                      _DesktopPortalLayout(
                        onExit: () => _returnToSplash(context),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _returnToSplash(BuildContext context) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.exit,
      sourceScreen: 'Residential Exit Portal',
      sourceWidget: 'ExitButton',
      action: 'return_to_splash',
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.splash,
      (route) => false,
    );
  }
}

class _DesktopPortalLayout extends StatelessWidget {
  const _DesktopPortalLayout({required this.onExit});

  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 78,
          left: 0,
          right: 0,
          child: _PortalMessage(),
        ),
        Positioned(
          top: 222,
          left: 0,
          right: 0,
          child: Center(child: _ExitButton(onPressed: onExit)),
        ),
      ],
    );
  }
}

class _CompactPortalLayout extends StatelessWidget {
  const _CompactPortalLayout({required this.onExit});

  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 52, 18, 34),
      child: Column(
        children: [
          const _PortalMessage(compact: true),
          const SizedBox(height: 14),
          _ExitButton(onPressed: onExit),
        ],
      ),
    );
  }
}

class _PortalMessage extends StatelessWidget {
  const _PortalMessage({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = ResidentialLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          header: true,
          label: l10n.applicationExitJourneyTitle,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.favorite_rounded,
                color: Color(0xFFFFD77A),
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.applicationExitJourneyTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFFFD77A),
                  fontSize: compact ? 30 : 34,
                  fontWeight: FontWeight.w900,
                  shadows: const [
                    Shadow(color: Colors.black, blurRadius: 14),
                    Shadow(color: Color(0xCC8A5A16), blurRadius: 24),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AccessibilityGuideIcon(
                size: 22,
                tooltipIconSize: 96,
                onPressed: () => _speakResidentialText(
                  context,
                  localizationKey: 'applicationExitJourneyTitle',
                  localizedText: l10n.applicationExitJourneyTitle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          l10n.applicationExitJourneyMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFFFE8A3),
            fontSize: compact ? 16 : 17,
            height: 1.45,
            fontWeight: FontWeight.w800,
            shadows: const [Shadow(color: Colors.black, blurRadius: 12)],
          ),
        ),
      ],
    );
  }
}

class _ExitButton extends StatefulWidget {
  const _ExitButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_ExitButton> createState() => _ExitButtonState();
}

class _ExitButtonState extends State<_ExitButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = ResidentialLocalizations.of(context);

    return Semantics(
      button: true,
      label: l10n.applicationExitButton,
      hint:
          SharedLocalizations.of(context).applicationAccessibilityListenSupport,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: _hovered ? 0.30 : 0.18),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: const Color(0xFFFFD77A).withValues(
                  alpha: _hovered ? 0.92 : 0.62,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFB43A).withValues(
                    alpha: _hovered ? 0.38 : 0.22,
                  ),
                  blurRadius: _hovered ? 30 : 18,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.logout_rounded,
                  color: Color(0xFFFFD77A),
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  l10n.applicationExitButton,
                  style: const TextStyle(
                    color: Color(0xFFFFD77A),
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
                ),
                const SizedBox(width: 10),
                AccessibilityGuideIcon(
                  size: 22,
                  tooltipIconSize: 96,
                  onPressed: () => _speakResidentialText(
                    context,
                    localizationKey: 'applicationExitButton',
                    localizedText: l10n.applicationExitButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _speakResidentialText(
  BuildContext context, {
  required String localizationKey,
  required String localizedText,
}) {
  ResidentialSignalEmitter.emit(
    signalCode: ResidentialSignalCode.listenSupportPlay,
    sourceScreen: 'Residential Exit Portal',
    sourceWidget: 'AccessibilityGuideIcon',
    action: 'request_audio_support',
  );
  return ResidentialSpeechGenerator.instance.speak(
    context,
    ResidentialSpeechNode(
      sectionId: 'residential',
      localizationKey: localizationKey,
      localizedText: localizedText,
    ),
  );
}
