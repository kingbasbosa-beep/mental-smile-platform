import 'package:flutter/material.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_residential_capsule/src/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_residential_capsule/src/localization/accessibility/accessibility_localizations.dart';
import 'package:mental_smile_residential_capsule/src/localization/residential/residential_localizations.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';
import 'package:mental_smile_residential_capsule/src/capsule/residential_capsule_routes.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_actions.dart';

class AccessibilityCheckinPage extends StatefulWidget {
  const AccessibilityCheckinPage({super.key});

  @override
  State<AccessibilityCheckinPage> createState() =>
      _AccessibilityCheckinPageState();
}

class _AccessibilityCheckinPageState extends State<AccessibilityCheckinPage> {
  static const String _background =
      'packages/mental_smile_residential_capsule/assets/accessibility/accessibility_checkin/accessibility_checkin_papyrus_background.png';
  static const String _adminWhatsAppNumber = '201014116531';

  final List<TextEditingController> _questionControllers =
      List<TextEditingController>.generate(5, (_) => TextEditingController());

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

  Future<void> _speakLocalizedLabel(
    BuildContext context, {
    required String localizationKey,
    required String localizedText,
  }) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Check-in',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: 'accessibility',
        localizationKey: localizationKey,
        localizedText: localizedText,
      ),
    );
  }

  Future<bool> _openWhatsApp(String message) async {
    final uri = Uri.https('wa.me', '/$_adminWhatsAppNumber', <String, String>{
      'text': message,
    });
    return SafeExternalLinkLauncher.openUri(context, uri);
  }

  Future<void> _sendCheckin(AccessibilityLocalizations l10n) async {
    final opened = await _openWhatsApp(
      l10n.applicationAccessibilityCheckinMessage,
    );
    if (!opened) return;
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
            child: Text(
              ResidentialLocalizations.of(context).applicationClientDialogOk,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openGeneralContact(AccessibilityLocalizations l10n) async {
    final opened = await _openWhatsApp(
      l10n.applicationAccessibilityCheckinWhatsappContact,
    );
    if (!opened) return;
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.supportOpen,
      sourceScreen: 'Accessibility Check-in',
      sourceWidget: 'GeneralContactButton',
      action: 'open_general_contact',
    );
  }

  bool get _supportSpaceEnabled {
    final args = ModalRoute.of(context)?.settings.arguments;
    return args is Map && args['supportSpaceEnabled'] == true;
  }

  bool _isArabic(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar';
  }

  String _librarySpecialistsLabel(BuildContext context) {
    return _isArabic(context)
        ? 'Ã˜Â§Ã™â€žÃ˜Â£Ã˜Â®Ã˜ÂµÃ˜Â§Ã˜Â¦Ã™Å Ã™Ë†Ã™â€ '
        : 'Specialists';
  }

  String _libraryCentersLabel(BuildContext context) {
    return _isArabic(context) ? 'Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â±Ã˜Â§Ã™Æ’Ã˜Â²' : 'Centers';
  }

  String _libraryTitleLabel(BuildContext context) {
    return _isArabic(context) ? 'Ã˜Â§Ã™â€žÃ™â€¦Ã™Æ’Ã˜ÂªÃ˜Â¨Ã˜Â©' : 'Library';
  }

  void _openSupportSpace(_SupportSpaceMode mode) {
    debugPrint(
      'support_space_opened mode=${mode.name} source=AccessibilityCheckinPage',
    );
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        settings: const RouteSettings(name: 'g2_client_support_space_local'),
        builder: (context) => _ClientSupportSpacePage(initialMode: mode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _AccessibilityCardBackButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: contentMaxWidth,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _CheckinSection(
                                icon: 'Ã°Å¸Å’Â¿',
                                title: ResidentialLocalizations.of(
                                  context,
                                ).applicationClientCheckInTitle,
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationClientCheckInTitle',
                                  localizedText: ResidentialLocalizations.of(
                                    context,
                                  ).applicationClientCheckInTitle,
                                ),
                                children: [
                                  for (var index = 0; index < 5; index++) ...[
                                    _CheckinField(
                                      controller: _questionControllers[index],
                                      icon: 'Ã°Å¸â€™Â¬',
                                      label: _questionLabel(index, l10n),
                                      onSpeak: () => _speakLocalizedLabel(
                                        context,
                                        localizationKey: _questionKey(index),
                                        localizedText: _questionLabel(
                                          index,
                                          l10n,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                  _SpeakableButton(
                                    icon: 'Ã°Å¸â€œÂ¨',
                                    label: l10n
                                        .applicationAccessibilitySuggestionsSubmit,
                                    onPressed: () => _sendCheckin(l10n),
                                    onSpeak: () => _speakLocalizedLabel(
                                      context,
                                      localizationKey:
                                          'applicationAccessibilitySuggestionsSubmit',
                                      localizedText: l10n
                                          .applicationAccessibilitySuggestionsSubmit,
                                    ),
                                  ),
                                ],
                              ),
                              if (_supportSpaceEnabled) ...[
                                const SizedBox(height: 24),
                                _SharingEntrySection(
                                  onShare: () => _openSupportSpace(
                                    _SupportSpaceMode.write,
                                  ),
                                  onView: () =>
                                      _openSupportSpace(_SupportSpaceMode.view),
                                ),
                              ],
                              const SizedBox(height: 28),
                              _CheckinSection(
                                icon: 'Ã°Å¸Â¤Â',
                                title: l10n
                                    .applicationAccessibilityCheckinSectionGeneral,
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilityCheckinSectionGeneral',
                                  localizedText: l10n
                                      .applicationAccessibilityCheckinSectionGeneral,
                                ),
                                children: [
                                  _SpeakableButton(
                                    icon: 'Ã°Å¸â€™Â¬',
                                    label: l10n
                                        .applicationAccessibilityCheckinWhatsappContact,
                                    onPressed: () => _openGeneralContact(l10n),
                                    onSpeak: () => _speakLocalizedLabel(
                                      context,
                                      localizationKey:
                                          'applicationAccessibilityCheckinWhatsappContact',
                                      localizedText: l10n
                                          .applicationAccessibilityCheckinWhatsappContact,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 28),
                              _CheckinSection(
                                icon: 'Ã°Å¸Â§Â©',
                                title: l10n
                                    .applicationAccessibilityCheckinSectionSpecialist,
                                onSpeak: () => _speakLocalizedLabel(
                                  context,
                                  localizationKey:
                                      'applicationAccessibilityCheckinSectionSpecialist',
                                  localizedText: l10n
                                      .applicationAccessibilityCheckinSectionSpecialist,
                                ),
                                children: [
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      _NavigationButton(
                                        icon: 'Ã°Å¸Â§â€˜Ã¢â‚¬ÂÃ¢Å¡â€¢Ã¯Â¸Â',
                                        label: _librarySpecialistsLabel(
                                          context,
                                        ),
                                        route:
                                            Routes.libraryProviderSpecialists,
                                        onSpeak: () => _speakLocalizedLabel(
                                          context,
                                          localizationKey:
                                              'applicationAccessibilityCheckinSpecialists',
                                          localizedText: l10n
                                              .applicationAccessibilityCheckinSpecialists,
                                        ),
                                      ),
                                      _NavigationButton(
                                        icon: 'Ã°Å¸ÂÂ¥',
                                        label: _libraryCentersLabel(context),
                                        route: Routes.libraryProviderCenters,
                                        onSpeak: () => _speakLocalizedLabel(
                                          context,
                                          localizationKey:
                                              'applicationAccessibilityCheckinCenters',
                                          localizedText: l10n
                                              .applicationAccessibilityCheckinCenters,
                                        ),
                                      ),
                                      if (isDesktop)
                                        _NavigationButton(
                                          icon: 'Ã°Å¸â€œÅ¡',
                                          label: _libraryTitleLabel(context),
                                          route: Routes.webLibrary,
                                          onSpeak: () => _speakLocalizedLabel(
                                            context,
                                            localizationKey:
                                                'applicationAccessibilityCheckinLibrary',
                                            localizedText: l10n
                                                .applicationAccessibilityCheckinLibrary,
                                          ),
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

  String _questionLabel(int index, AccessibilityLocalizations l10n) {
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

  String _questionKey(int index) {
    switch (index) {
      case 0:
        return 'applicationAccessibilityCheckinQuestion1';
      case 1:
        return 'applicationAccessibilityCheckinQuestion2';
      case 2:
        return 'applicationAccessibilityCheckinQuestion3';
      case 3:
        return 'applicationAccessibilityCheckinQuestion4';
      default:
        return 'applicationAccessibilityCheckinQuestion5';
    }
  }
}

class _AccessibilityCardBackButton extends StatelessWidget {
  const _AccessibilityCardBackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    return IconButton(
      tooltip: l10n.applicationAccessibilityCommunityToolsBackToRoom,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xFF1B1007).withValues(alpha: 0.55),
        side: BorderSide(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.58),
        ),
        fixedSize: const Size.square(44),
      ),
      icon: const Icon(
        Icons.arrow_back_rounded,
        textDirection: TextDirection.ltr,
        color: Color(0xFFFFE7B2),
      ),
    );
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
        ),
        const SizedBox(width: 8),
        AccessibilityGuideIcon(size: 24, onPressed: onSpeak),
      ],
    );
  }
}

enum _SupportSpaceMode { write, view }

class _SharingEntrySection extends StatelessWidget {
  const _SharingEntrySection({required this.onShare, required this.onView});

  final VoidCallback onShare;
  final VoidCallback onView;

  @override
  Widget build(BuildContext context) {
    final l10n = AccessibilityLocalizations.of(context);
    return _CheckinSection(
      icon: '+',
      title: l10n.applicationAccessibilityCheckinSharingTitle,
      onSpeak: () => _speakSharingText(
        context,
        localizationKey: 'applicationAccessibilityCheckinSharingTitle',
        localizedText: l10n.applicationAccessibilityCheckinSharingTitle,
      ),
      children: [
        Text(
          l10n.applicationAccessibilityCheckinSharingBody,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Color(0xFF3A2A18),
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            _SpeakableButton(
              icon: '+',
              label: l10n.applicationAccessibilityCheckinSharingShare,
              onPressed: onShare,
              onSpeak: () => _speakSharingText(
                context,
                localizationKey: 'applicationAccessibilityCheckinSharingShare',
                localizedText: l10n.applicationAccessibilityCheckinSharingShare,
              ),
            ),
            _SpeakableButton(
              icon: '>',
              label: l10n.applicationAccessibilityCheckinSharingView,
              onPressed: onView,
              onSpeak: () => _speakSharingText(
                context,
                localizationKey: 'applicationAccessibilityCheckinSharingView',
                localizedText: l10n.applicationAccessibilityCheckinSharingView,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> _speakSharingText(
  BuildContext context, {
  required String localizationKey,
  required String localizedText,
}) {
  return ResidentialSpeechGenerator.instance.speak(
    context,
    ResidentialSpeechNode(
      sectionId: 'accessibility',
      localizationKey: localizationKey,
      localizedText: localizedText,
    ),
  );
}

class _ClientSupportSpacePage extends StatefulWidget {
  const _ClientSupportSpacePage({required this.initialMode});

  final _SupportSpaceMode initialMode;

  @override
  State<_ClientSupportSpacePage> createState() =>
      _ClientSupportSpacePageState();
}

class _ClientSupportSpacePageState extends State<_ClientSupportSpacePage> {
  static const String _safeSpaceError =
      'Ã™â€¦Ã˜Â­Ã˜ÂªÃ˜Â§Ã˜Â¬Ã™Å Ã™â€  Ã™â€ Ã˜Â­Ã˜Â§Ã™ÂÃ˜Â¸ Ã˜Â¹Ã™â€žÃ™â€° Ã™â€¦Ã˜Â³Ã˜Â§Ã˜Â­Ã˜Â© Ã˜Â¢Ã™â€¦Ã™â€ Ã˜Â© Ã™â€žÃ™â€žÃ˜Â¬Ã™â€¦Ã™Å Ã˜Â¹. Ã™â€¦Ã™â€  Ã™ÂÃ˜Â¶Ã™â€žÃ™Æ’ Ã˜Â¹Ã˜Â¯Ã™â€˜Ã™â€ž Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â© Ã™Ë†Ã˜Â­Ã˜Â§Ã™Ë†Ã™â€ž Ã™â€¦Ã˜Â±Ã˜Â© Ã˜Â£Ã˜Â®Ã˜Â±Ã™â€°.';
  static const List<String> _blockedWords = [
    'Ã˜Â´Ã˜ÂªÃ™Å Ã™â€¦Ã˜Â©',
    'Ã˜Â¥Ã™â€¡Ã˜Â§Ã™â€ Ã˜Â©',
    'Ã˜Â­Ã™â€šÃ™Å Ã˜Â±',
    'Ã˜ÂºÃ˜Â¨Ã™Å ',
    'stupid',
    'idiot',
    'hate',
  ];

  late _SupportSpaceMode _mode;
  final TextEditingController _messageController = TextEditingController();
  bool _acceptedRules = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _mode = widget.initialMode;
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _changeMode(_SupportSpaceMode mode) {
    setState(() {
      _mode = mode;
      _errorText = null;
    });
    if (mode == _SupportSpaceMode.view) {
      debugPrint('support_space_messages_viewed source=ClientSupportSpacePage');
    } else {
      debugPrint('support_space_write_clicked source=ClientSupportSpacePage');
    }
  }

  void _submitMessage() {
    final message = _messageController.text.trim();
    final validationMessage = _validateMessage(message);
    if (validationMessage != null) {
      setState(() => _errorText = validationMessage);
      final reason = validationMessage == _safeSpaceError
          ? 'denylist'
          : 'validation';
      debugPrint('support_space_message_blocked reason=$reason');
      return;
    }

    _ClientSupportSpaceStore.add(
      message,
      sourceScreen: 'AccessibilityCheckinPage',
    );
    debugPrint(
      'support_space_message_submitted chars=${message.length} isBeta=true status=visible',
    );
    setState(() {
      _messageController.clear();
      _acceptedRules = false;
      _errorText = null;
      _mode = _SupportSpaceMode.view;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Ã˜ÂªÃ™â€¦ Ã˜Â­Ã™ÂÃ˜Â¸ Ã™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜ÂªÃ™Æ’ Ã™â€¦Ã˜Â­Ã™â€žÃ™Å Ã™â€¹Ã˜Â§ Ã˜Â£Ã˜Â«Ã™â€ Ã˜Â§Ã˜Â¡ Ã™â€¦Ã˜Â±Ã˜Â­Ã™â€žÃ˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â®Ã˜ÂªÃ˜Â¨Ã˜Â§Ã˜Â±.',
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  String? _validateMessage(String message) {
    if (!_acceptedRules) {
      return 'Ã™â€¦Ã™â€  Ã™ÂÃ˜Â¶Ã™â€žÃ™Æ’ Ã˜Â§Ã™â€šÃ˜Â±Ã˜Â£ Ã˜Â§Ã™â€žÃ™â€šÃ™Ë†Ã˜Â§Ã˜Â¹Ã˜Â¯ Ã™Ë†Ã™Ë†Ã˜Â§Ã™ÂÃ™â€š Ã˜Â¹Ã™â€žÃ™Å Ã™â€¡Ã˜Â§ Ã™â€šÃ˜Â¨Ã™â€ž Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â©.';
    }
    if (message.isEmpty) {
      return 'Ã˜Â§Ã™Æ’Ã˜ÂªÃ˜Â¨ Ã˜Â±Ã˜Â³Ã˜Â§Ã™â€žÃ˜Â© Ã™â€šÃ˜ÂµÃ™Å Ã˜Â±Ã˜Â© Ã™â€šÃ˜Â¨Ã™â€ž Ã˜Â§Ã™â€žÃ™â€ Ã˜Â´Ã˜Â±.';
    }
    if (message.length > 500) {
      return 'Ã˜Â®Ã™â€žÃ™Å  Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â© 500 Ã˜Â­Ã˜Â±Ã™Â Ã˜Â£Ã™Ë† Ã˜Â£Ã™â€šÃ™â€ž.';
    }
    final lineCount = message.split(RegExp(r'\r\n|\r|\n')).length;
    if (lineCount > 5) {
      return 'Ã˜Â®Ã™â€žÃ™Å  Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â© Ã™ÂÃ™Å  5 Ã˜Â³Ã˜Â·Ã™Ë†Ã˜Â± Ã™Æ’Ã˜Â­Ã˜Â¯ Ã˜Â£Ã™â€šÃ˜ÂµÃ™â€°.';
    }
    final normalized = message.toLowerCase();
    for (final word in _blockedWords) {
      if (normalized.contains(word.toLowerCase())) {
        return _safeSpaceError;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final messages = _ClientSupportSpaceStore.latestMessages();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF120C06),
        appBar: AppBar(
          backgroundColor: const Color(0xFF120C06),
          foregroundColor: const Color(0xFFFFE7B2),
          centerTitle: true,
          title: const Text(
            'Ã™â€¦Ã˜Â³Ã˜Â§Ã˜Â­Ã˜Â© Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â©',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 32),
            children: [
              const Text(
                'Ã™â€¦Ã˜Â³Ã˜Â§Ã˜Â­Ã˜Â© Ã™â€šÃ˜ÂµÃ™Å Ã˜Â±Ã˜Â© Ã™Ë†Ã˜Â¢Ã™â€¦Ã™â€ Ã˜Â© Ã™â€žÃ™â€žÃ˜ÂªÃ˜Â¹Ã˜Â¨Ã™Å Ã˜Â± Ã™Ë†Ã˜Â§Ã™â€žÃ˜Â¯Ã˜Â¹Ã™â€¦ Ã˜Â£Ã˜Â«Ã™â€ Ã˜Â§Ã˜Â¡ Ã™â€¦Ã˜Â±Ã˜Â­Ã™â€žÃ˜Â© Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â®Ã˜ÂªÃ˜Â¨Ã˜Â§Ã˜Â±.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFE7B2),
                  fontSize: 18,
                  height: 1.45,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ã˜Â·Ã™â€¦Ã™â€ Ã™â€˜Ã˜Â§ Ã˜Â¹Ã™â€žÃ™Å Ã™Æ’ Ã˜ÂªÃ˜Â¨Ã˜Â¯Ã˜Â£ Ã˜Â¨Ã˜Â£Ã˜Â³Ã˜Â¦Ã™â€žÃ˜Â© Ã˜Â¨Ã˜Â³Ã™Å Ã˜Â·Ã˜Â© Ã˜ÂªÃ˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã™Æ’ Ã˜ÂªÃ˜Â¹Ã˜Â¨Ã™â€˜Ã˜Â± Ã˜Â¹Ã™â€  Ã˜Â­Ã˜Â§Ã™â€žÃ˜ÂªÃ™Æ’Ã˜Å’ Ã™Ë†Ã˜Â¨Ã˜Â¹Ã˜Â¯Ã™â€¡Ã˜Â§ Ã™â€žÃ™Ë† Ã˜Â­Ã˜Â§Ã˜Â¨Ã˜Â¨ Ã˜ÂªÃ˜Â´Ã˜Â§Ã˜Â±Ã™Æ’ Ã˜Â±Ã˜Â³Ã˜Â§Ã™â€žÃ˜Â© Ã™â€šÃ˜ÂµÃ™Å Ã˜Â±Ã˜Â© Ã˜Â£Ã™Ë† Ã˜ÂªÃ˜Â´Ã™Ë†Ã™Â Ã˜Â±Ã˜Â³Ã˜Â§Ã˜Â¦Ã™â€ž Ã˜Â¯Ã˜Â¹Ã™â€¦ Ã™â€¦Ã™â€  Ã˜Â£Ã˜ÂµÃ˜Â¯Ã™â€šÃ˜Â§Ã˜Â¡ Mental SmileÃ˜Å’ Ã˜ÂªÃ™â€šÃ˜Â¯Ã˜Â± Ã˜ÂªÃ˜Â³Ã˜ÂªÃ˜Â®Ã˜Â¯Ã™â€¦ Ã™â€¦Ã˜Â³Ã˜Â§Ã˜Â­Ã˜Â© Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â©.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE0C174),
                  fontSize: 14,
                  height: 1.55,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),
              _SupportSpaceModeSwitch(mode: _mode, onModeChanged: _changeMode),
              const SizedBox(height: 18),
              if (_mode == _SupportSpaceMode.write)
                _buildWritePanel()
              else
                _buildMessagesPanel(messages),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWritePanel() {
    return _SupportSpacePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Ã™â€¦Ã˜Â³Ã˜Â§Ã˜Â­Ã˜Â© Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â© Ã™â€¦Ã™Æ’Ã˜Â§Ã™â€  Ã˜Â¢Ã™â€¦Ã™â€  Ã™â€žÃ™â€žÃ˜ÂªÃ˜Â¹Ã˜Â¨Ã™Å Ã˜Â± Ã™Ë†Ã˜Â§Ã™â€žÃ˜Â¯Ã˜Â¹Ã™â€¦.\nÃ™â€¦Ã™â€  Ã™ÂÃ˜Â¶Ã™â€žÃ™Æ’:\n- Ã™â€žÃ˜Â§ Ã˜ÂªÃ™Æ’Ã˜ÂªÃ˜Â¨ Ã˜Â¨Ã™Å Ã˜Â§Ã™â€ Ã˜Â§Ã˜ÂªÃ™Æ’ Ã˜Â§Ã™â€žÃ˜Â´Ã˜Â®Ã˜ÂµÃ™Å Ã˜Â©.\n- Ã™â€žÃ˜Â§ Ã˜ÂªÃ˜Â°Ã™Æ’Ã˜Â± Ã˜Â£Ã˜Â³Ã™â€¦Ã˜Â§Ã˜Â¡ Ã˜Â£Ã˜Â´Ã˜Â®Ã˜Â§Ã˜Âµ Ã˜Â¢Ã˜Â®Ã˜Â±Ã™Å Ã™â€ .\n- Ã™â€žÃ˜Â§ Ã˜ÂªÃ˜Â³Ã˜ÂªÃ˜Â®Ã˜Â¯Ã™â€¦ Ã˜Â£Ã™â€žÃ™ÂÃ˜Â§Ã˜Â¸ Ã˜Â¬Ã˜Â§Ã˜Â±Ã˜Â­Ã˜Â©.\n- Ã™â€žÃ˜Â§ Ã˜ÂªÃ™â€šÃ˜Â¯Ã™â€¦ Ã™â€ Ã˜ÂµÃ˜Â§Ã˜Â¦Ã˜Â­ Ã˜Â·Ã˜Â¨Ã™Å Ã˜Â© Ã˜Â£Ã™Ë† Ã˜Â¹Ã™â€žÃ˜Â§Ã˜Â¬Ã™Å Ã˜Â©.\n- Ã™â€žÃ˜Â§ Ã˜ÂªÃ˜Â·Ã™â€žÃ˜Â¨ Ã™â€¦Ã˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã˜Â© Ã˜Â·Ã˜Â§Ã˜Â±Ã˜Â¦Ã˜Â© Ã™â€¦Ã™â€  Ã™â€¡Ã™â€ Ã˜Â§.\n- Ã˜Â¥Ã˜Â°Ã˜Â§ Ã™Æ’Ã™â€ Ã˜Âª Ã™ÂÃ™Å  Ã˜Â®Ã˜Â·Ã˜Â± Ã˜Â£Ã™Ë† Ã˜ÂªÃ˜Â­Ã˜ÂªÃ˜Â§Ã˜Â¬ Ã™â€¦Ã˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã˜Â© Ã™ÂÃ™Ë†Ã˜Â±Ã™Å Ã˜Â©Ã˜Å’ Ã˜ÂªÃ™Ë†Ã˜Â§Ã˜ÂµÃ™â€ž Ã™â€¦Ã˜Â¹ Ã˜Â¬Ã™â€¡Ã˜Â© Ã˜Â·Ã™Ë†Ã˜Â§Ã˜Â±Ã˜Â¦ Ã˜Â£Ã™Ë† Ã˜Â´Ã˜Â®Ã˜Âµ Ã˜ÂªÃ˜Â«Ã™â€š Ã˜Â¨Ã™â€¡.',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFFFE7B2),
              fontSize: 14,
              height: 1.6,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          CheckboxListTile(
            value: _acceptedRules,
            onChanged: (value) {
              setState(() {
                _acceptedRules = value ?? false;
                _errorText = null;
              });
            },
            activeColor: const Color(0xFFE0C174),
            checkColor: Colors.black,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text(
              'Ã™â€šÃ˜Â±Ã˜Â£Ã˜Âª Ã˜Â§Ã™â€žÃ™â€šÃ™Ë†Ã˜Â§Ã˜Â¹Ã˜Â¯ Ã™Ë†Ã˜Â£Ã™Ë†Ã˜Â§Ã™ÂÃ™â€š Ã˜Â¹Ã™â€žÃ™â€° Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â© Ã˜Â¨Ã˜Â§Ã˜Â­Ã˜ÂªÃ˜Â±Ã˜Â§Ã™â€¦.',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Color(0xFFFFE7B2),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _messageController,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            minLines: 3,
            maxLines: 5,
            maxLength: 500,
            decoration: InputDecoration(
              labelText: 'Ã˜Â§Ã™Æ’Ã˜ÂªÃ˜Â¨ Ã˜Â±Ã˜Â³Ã˜Â§Ã™â€žÃ˜ÂªÃ™Æ’',
              hintText:
                  'Ã˜Â§Ã™Æ’Ã˜ÂªÃ˜Â¨ Ã™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â© Ã™â€šÃ˜ÂµÃ™Å Ã˜Â±Ã˜Â© Ã˜ÂªÃ˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã™Æ’ Ã˜Â¹Ã™â€žÃ™â€° Ã˜Â§Ã™â€žÃ˜ÂªÃ˜Â¹Ã˜Â¨Ã™Å Ã˜Â± Ã˜Â£Ã™Ë† Ã˜Â§Ã™â€žÃ˜Â¯Ã˜Â¹Ã™â€¦...',
              labelStyle: const TextStyle(color: Color(0xFFE0C174)),
              hintStyle: TextStyle(
                color: const Color(0xFFFFE7B2).withValues(alpha: 0.58),
              ),
              counterStyle: const TextStyle(color: Color(0xFFE0C174)),
              filled: true,
              fillColor: const Color(0xFF1B1007),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0x668B5E34)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFE0C174),
                  width: 1.4,
                ),
              ),
            ),
            style: const TextStyle(
              color: Color(0xFFFFE7B2),
              fontSize: 16,
              height: 1.45,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (_errorText != null) ...[
            const SizedBox(height: 8),
            Text(
              _errorText!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFFC9B8),
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
          const SizedBox(height: 14),
          FilledButton(
            onPressed: _submitMessage,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFE0C174),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Ã™â€ Ã˜Â´Ã˜Â± Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â©',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesPanel(List<_ClientSupportMessage> messages) {
    if (messages.isEmpty) {
      return const _SupportSpacePanel(
        child: Text(
          'Ã™â€žÃ˜Â³Ã™â€¡ Ã™â€¦Ã™ÂÃ™Å Ã˜Â´ Ã™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â§Ã˜Âª. Ã™Æ’Ã™â€  Ã˜Â£Ã™Ë†Ã™â€ž Ã™â€¦Ã™â€  Ã™Å Ã˜ÂªÃ˜Â±Ã™Æ’ Ã˜Â±Ã˜Â³Ã˜Â§Ã™â€žÃ˜Â© Ã˜Â¨Ã˜Â³Ã™Å Ã˜Â·Ã˜Â©.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFE7B2),
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    }

    return Column(
      children: [
        const Text(
          'Ã™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â§Ã˜Âª Ã˜Â§Ã™â€žÃ˜Â£Ã˜ÂµÃ˜Â¯Ã™â€šÃ˜Â§Ã˜Â¡',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFE7B2),
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 12),
        for (final message in messages) ...[
          _SupportMessageTile(message: message),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _SupportSpaceModeSwitch extends StatelessWidget {
  const _SupportSpaceModeSwitch({
    required this.mode,
    required this.onModeChanged,
  });

  final _SupportSpaceMode mode;
  final ValueChanged<_SupportSpaceMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        _SupportSpaceToggleButton(
          selected: mode == _SupportSpaceMode.write,
          label: 'Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’ Ã˜Â¨Ã˜Â±Ã˜Â³Ã˜Â§Ã™â€žÃ˜Â©',
          icon: Icons.edit_note_rounded,
          onPressed: () => onModeChanged(_SupportSpaceMode.write),
        ),
        _SupportSpaceToggleButton(
          selected: mode == _SupportSpaceMode.view,
          label: 'Ã˜Â´Ã˜Â§Ã™â€¡Ã˜Â¯ Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã˜Â§Ã˜Âª',
          icon: Icons.visibility_rounded,
          onPressed: () => onModeChanged(_SupportSpaceMode.view),
        ),
      ],
    );
  }
}

class _SupportSpaceToggleButton extends StatelessWidget {
  const _SupportSpaceToggleButton({
    required this.selected,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final bool selected;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 19),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: selected ? Colors.black : const Color(0xFFFFE7B2),
        backgroundColor: selected
            ? const Color(0xFFE0C174)
            : const Color(0xFF1B1007),
        side: BorderSide(
          color: const Color(0xFFE0C174).withValues(alpha: 0.72),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontWeight: FontWeight.w900),
      ),
    );
  }
}

class _SupportSpacePanel extends StatelessWidget {
  const _SupportSpacePanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF1B1007).withValues(alpha: 0.9),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.45),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}

class _SupportMessageTile extends StatelessWidget {
  const _SupportMessageTile({required this.message});

  final _ClientSupportMessage message;

  @override
  Widget build(BuildContext context) {
    return _SupportSpacePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            message.text,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: Color(0xFFFFE7B2),
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _formatTimestamp(message.createdAt),
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: const Color(0xFFE0C174).withValues(alpha: 0.75),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime value) {
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _ClientSupportSpaceStore {
  static final List<_ClientSupportMessage> _messages =
      <_ClientSupportMessage>[];

  static List<_ClientSupportMessage> latestMessages() {
    return List<_ClientSupportMessage>.unmodifiable(_messages);
  }

  static void add(String text, {required String sourceScreen}) {
    _messages.insert(
      0,
      _ClientSupportMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: text,
        createdAt: DateTime.now(),
        userType: 'client',
        sourceScreen: sourceScreen,
        status: 'visible',
        isBeta: true,
      ),
    );
    if (_messages.length > 50) {
      _messages.removeRange(50, _messages.length);
    }
  }
}

class _ClientSupportMessage {
  const _ClientSupportMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userType,
    required this.sourceScreen,
    required this.status,
    required this.isBeta,
  });

  final String id;
  final String text;
  final DateTime createdAt;
  final String userType;
  final String sourceScreen;
  final String status;
  final bool isBeta;
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
        final returnRoute = _returnRouteFromArguments(context);
        Navigator.of(context).pushNamed(
          route,
          arguments: returnRoute == null ? null : {'returnRoute': returnRoute},
        );
      },
      onSpeak: onSpeak,
    );
  }
}

String? _returnRouteFromArguments(BuildContext context) {
  final args = ModalRoute.of(context)?.settings.arguments;
  if (args is Map) {
    final value = args['returnRoute'];
    if (value is String && value.trim().isNotEmpty) {
      return value.trim();
    }
  }
  return null;
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
