import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessibilityCheckinPage extends StatefulWidget {
  const AccessibilityCheckinPage({super.key});

  @override
  State<AccessibilityCheckinPage> createState() =>
      _AccessibilityCheckinPageState();
}

class _AccessibilityCheckinPageState extends State<AccessibilityCheckinPage> {
  static const String _background =
      'assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png';
  static const String _adminWhatsAppNumber = '201014116531';

  final List<TextEditingController> _questionControllers =
      List<TextEditingController>.generate(
    5,
    (_) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.accessibilityCheckinView,
      sourceScreen: 'Accessibility Check-in',
      sourceWidget: 'AccessibilityCheckinPage',
      action: 'view',
    );
  }

  @override
  void dispose() {
    for (final controller in _questionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Check-in',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }

  Future<void> _openWhatsApp(String message) async {
    final uri = Uri.https(
      'wa.me',
      '/$_adminWhatsAppNumber',
      <String, String>{'text': message},
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _sendCheckin(AppLocalizations l10n) async {
    await _openWhatsApp(l10n.applicationAccessibilityCheckinMessage);
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.checkinToolOpen,
      sourceScreen: 'Accessibility Check-in',
      sourceWidget: 'CheckinSubmitButton',
      action: 'open_checkin_whatsapp',
    );
    if (!mounted) return;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFFF1D0),
        title: Text(
          l10n.applicationAccessibilityCheckinWhatsappOpened,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Color(0xFF7A4A00),
            fontWeight: FontWeight.w800,
          ),
        ),
        content: Text(
          l10n.applicationAccessibilityCheckinWhatsappNote,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Color(0xFF3A2A18),
            fontSize: 16,
            height: 1.45,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.applicationClientDialogOk),
          ),
        ],
      ),
    );
  }

  Future<void> _openGeneralContact(AppLocalizations l10n) async {
    await _openWhatsApp(l10n.applicationAccessibilityCheckinWhatsappContact);
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.supportOpen,
      sourceScreen: 'Accessibility Check-in',
      sourceWidget: 'GeneralContactButton',
      action: 'open_general_contact',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF2B1B0D),
      body: SafeArea(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 960),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_background),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= 900;
                  final isTablet =
                      constraints.maxWidth >= 600 && constraints.maxWidth < 900;
                  final horizontalPadding = isDesktop
                      ? 96.0
                      : isTablet
                          ? 48.0
                          : 24.0;
                  final contentMaxWidth = isDesktop
                      ? 720.0
                      : isTablet
                          ? 640.0
                          : constraints.maxWidth;

                  return ListView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      34,
                      horizontalPadding,
                      40,
                    ),
                    children: [
                      Center(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: contentMaxWidth),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _CheckinSection(
                                icon: '🌿',
                                title: l10n.applicationClientCheckInTitle,
                                onSpeak: () => _showSpeechPlaceholder(context,
                                    l10n.applicationClientCheckInTitle),
                                children: [
                                  for (var index = 0; index < 5; index++) ...[
                                    _CheckinField(
                                      controller: _questionControllers[index],
                                      icon: '💬',
                                      label: _questionLabel(index, l10n),
                                      onSpeak: () => _showSpeechPlaceholder(
                                          context, _questionLabel(index, l10n)),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                  _SpeakableButton(
                                    icon: '📨',
                                    label: l10n
                                        .applicationAccessibilitySuggestionsSubmit,
                                    onPressed: () => _sendCheckin(l10n),
                                    onSpeak: () => _showSpeechPlaceholder(
                                        context,
                                        l10n.applicationAccessibilitySuggestionsSubmit),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 28),
                              _CheckinSection(
                                icon: '🤝',
                                title: l10n
                                    .applicationAccessibilityCheckinSectionGeneral,
                                onSpeak: () => _showSpeechPlaceholder(context,
                                    l10n.applicationAccessibilityCheckinSectionGeneral),
                                children: [
                                  _SpeakableButton(
                                    icon: '💬',
                                    label: l10n
                                        .applicationAccessibilityCheckinWhatsappContact,
                                    onPressed: () => _openGeneralContact(l10n),
                                    onSpeak: () => _showSpeechPlaceholder(
                                        context,
                                        l10n.applicationAccessibilityCheckinWhatsappContact),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 28),
                              _CheckinSection(
                                icon: '🧩',
                                title: l10n
                                    .applicationAccessibilityCheckinSectionSpecialist,
                                onSpeak: () => _showSpeechPlaceholder(context,
                                    l10n.applicationAccessibilityCheckinSectionSpecialist),
                                children: [
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      _NavigationButton(
                                        icon: '🧑‍⚕️',
                                        label: l10n.menuSpecialists,
                                        route:
                                            Routes.libraryProviderSpecialists,
                                        onSpeak: () => _showSpeechPlaceholder(
                                            context, l10n.menuSpecialists),
                                      ),
                                      _NavigationButton(
                                        icon: '🏥',
                                        label: l10n.menuCenters,
                                        route: Routes.libraryProviderCenters,
                                        onSpeak: () => _showSpeechPlaceholder(
                                            context, l10n.menuCenters),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _questionLabel(int index, AppLocalizations l10n) {
    switch (index) {
      case 0:
        return l10n.applicationAccessibilityCheckinQuestion1;
      case 1:
        return l10n.applicationAccessibilityCheckinQuestion2;
      case 2:
        return l10n.applicationAccessibilityCheckinQuestion3;
      case 3:
        return l10n.applicationAccessibilityCheckinQuestion4;
      default:
        return l10n.applicationAccessibilityCheckinQuestion5;
    }
  }
}

class _CheckinSection extends StatelessWidget {
  const _CheckinSection({
    required this.icon,
    required this.title,
    required this.onSpeak,
    required this.children,
  });

  final String icon;
  final String title;
  final VoidCallback onSpeak;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Semantics(
          header: true,
          label: title,
          child: _SpeakableLabel(
            icon: icon,
            label: title,
            onSpeak: onSpeak,
            style: const TextStyle(
              color: Color(0xFF7A4A00),
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(
          width: double.infinity,
          child: Divider(color: Color(0x99B6842F), thickness: 1.4),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class _CheckinField extends StatelessWidget {
  const _CheckinField({
    required this.controller,
    required this.icon,
    required this.label,
    required this.onSpeak,
  });

  final TextEditingController controller;
  final String icon;
  final String label;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _SpeakableLabel(
          icon: icon,
          label: label,
          onSpeak: onSpeak,
          style: const TextStyle(
            color: Color(0xFF8B5E34),
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Semantics(
          label: label,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0x33FFF1D0),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x668B5E34)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF8B5E34),
                  width: 1.4,
                ),
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF3A2A18),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _SpeakableButton extends StatelessWidget {
  const _SpeakableButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.onSpeak,
  });

  final String icon;
  final String label;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          button: true,
          label: label,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF1D5F63),
              side: const BorderSide(color: Color(0x881D5F63)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            ),
            child: Text(
              '$icon $label',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        AccessibilityGuideIcon(
          size: 24,
          onPressed: onSpeak,
        ),
      ],
    );
  }
}

class _NavigationButton extends StatelessWidget {
  const _NavigationButton({
    required this.icon,
    required this.label,
    required this.route,
    required this.onSpeak,
  });

  final String icon;
  final String label;
  final String route;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return _SpeakableButton(
      icon: icon,
      label: label,
      onPressed: () {
        ResidentialSignalEmitter.emit(
          signalCode: ResidentialSignalCode.linkOpen,
          sourceScreen: 'Accessibility Check-in',
          sourceWidget: 'SpecialistSupportNavigationButton',
          action: 'navigate_support_resource',
        );
        Navigator.of(context).pushNamed(route);
      },
      onSpeak: onSpeak,
    );
  }
}

class _SpeakableLabel extends StatelessWidget {
  const _SpeakableLabel({
    required this.icon,
    required this.label,
    required this.onSpeak,
    required this.style,
  });

  final String icon;
  final String label;
  final VoidCallback onSpeak;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            '$icon $label',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: style,
          ),
        ),
        const SizedBox(width: 8),
        AccessibilityGuideIcon(
          size: style.fontSize != null ? style.fontSize! + 4 : 26,
          onPressed: onSpeak,
        ),
      ],
    );
  }
}
