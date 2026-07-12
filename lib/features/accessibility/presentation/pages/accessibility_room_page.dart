import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_os/features/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessibilityRoomPage extends StatefulWidget {
  const AccessibilityRoomPage({super.key});

  @override
  State<AccessibilityRoomPage> createState() => _AccessibilityRoomPageState();
}

class _AccessibilityRoomPageState extends State<AccessibilityRoomPage> {
  static const ClientLocalSessionStore _sessionStore =
      ClientLocalSessionStore();

  static const String _desktop =
      'assets/branding/rooms/accessibility_room/client_room_background_desktop.png';
  static const String _tablet =
      'assets/branding/rooms/accessibility_room/client_room_background_tablet.png';
  static const String _mobile =
      'assets/branding/rooms/accessibility_room/client_room_background_mobile.png';
  static const String _exitCup =
      'assets/branding/rooms/accessibility_room/accessibility_room_exit_button.png';
  static const String _youtubeButton =
      'assets/branding/rooms/accessibility_room/accessibility_room_youtube_button.png';
  static const String _photoButton =
      'assets/branding/rooms/accessibility_room/accessibility_room_photo_upload_button.png';
  static const String _noteFeatherButton =
      'assets/branding/rooms/accessibility_room/cards/accessibility_note_feather_button.png';
  static const String _linksCardIcon =
      'assets/branding/rooms/accessibility_room/cards/accessibility_links_card_icon.png';
  static const String _toolsCardIcon =
      'assets/branding/rooms/accessibility_room/cards/accessibility_tools_card_icon.png';
  static const String _suggestionsCardIcon =
      'assets/branding/rooms/accessibility_room/cards/accessibility_suggestions_card_icon.png';
  static const String _communityToolsCardIcon =
      'assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_card_icon.png';
  static const String _checkinCardIcon =
      'assets/branding/rooms/accessibility_room/cards/accessibility_checkin_card_icon.png';
  static const String _youtubeUrl = 'https://www.youtube.com/@MentalSmileOs';

  List<String> _notebookMessages(AppLocalizations l10n) => [
        l10n.applicationClientNotebookMessage1,
        l10n.applicationClientNotebookMessage2,
        l10n.applicationClientNotebookMessage3,
        l10n.applicationClientNotebookMessage4,
        l10n.applicationClientNotebookMessage5,
      ];

  Uint8List? _selectedPhotoBytes;
  String? _selectedNotebookMessage;

  @override
  void initState() {
    super.initState();
    unawaited(_sessionStore.startSession());
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.accessibilityRoomView,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'AccessibilityRoomPage',
      action: 'view',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final monitor = _monitorPlacement(constraints);
          final showDaleel = constraints.maxWidth >= 900 &&
              constraints.maxWidth > constraints.maxHeight;
          return SizedBox.expand(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _assetFor(constraints),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                if (_selectedPhotoBytes != null)
                  _MonitorPhoto(
                    placement: monitor,
                    bytes: _selectedPhotoBytes!,
                  ),
                if (_selectedNotebookMessage != null)
                  _NotebookMessage(
                    placement: _notebookMessagePlacement(constraints),
                    message: _selectedNotebookMessage!,
                  ),
                _AccessibilityLinksCard(
                  l10n: l10n,
                  assetPath: _linksCardIcon,
                  placement: _linksCardPlacement(constraints),
                  onPressed: _openImportantLinks,
                ),
                _AccessibilityToolsCard(
                  l10n: l10n,
                  assetPath: _toolsCardIcon,
                  placement: _toolsCardPlacement(constraints),
                  onPressed: _openAssistiveTools,
                ),
                _AccessibilitySuggestionsCard(
                  l10n: l10n,
                  assetPath: _suggestionsCardIcon,
                  placement: _suggestionsCardPlacement(constraints),
                  onPressed: _openSuggestions,
                ),
                _AccessibilityCommunityToolsCard(
                  l10n: l10n,
                  assetPath: _communityToolsCardIcon,
                  placement: _communityToolsCardPlacement(constraints),
                  onPressed: _openCommunityTools,
                ),
                _AccessibilityCheckinCard(
                  l10n: l10n,
                  assetPath: _checkinCardIcon,
                  placement: _checkinCardPlacement(constraints),
                  onPressed: _openCheckin,
                ),
                _RoomImageButton(
                  assetPath: _youtubeButton,
                  placement: _youtubePlacement(constraints),
                  semanticLabel: l10n.applicationClientYoutube,
                  onPressed: _openYoutube,
                ),
                _RoomImageButton(
                  assetPath: _photoButton,
                  placement: _photoButtonPlacement(monitor),
                  semanticLabel: l10n.applicationClientTemporaryPhoto,
                  onPressed: _pickTemporaryPhoto,
                ),
                _RoomImageButton(
                  assetPath: _exitCup,
                  placement: _cupPlacement(constraints),
                  semanticLabel: l10n.applicationClientExitRoom,
                  showAccessibilityGuideIcon: true,
                  onPressed: _exitRoom,
                ),
                _RoomHoverImageButton(
                  assetPath: _noteFeatherButton,
                  placement: _noteFeatherPlacement(constraints),
                  tooltip: l10n.applicationClientFeatherNotebook,
                  semanticLabel: l10n.applicationClientFeatherNotebook,
                  imageSize: _noteFeatherImageSize(constraints),
                  onPressed: () => _openMessageOfDayDialog(l10n),
                ),
                if (showDaleel)
                  const Positioned(
                    top: 18,
                    left: 24,
                    child: DaleelAssistant(
                      guideAssetPath:
                          'assets/branding/guides/client_room_desktop_guide.png',
                      surveyTitle: 'الاستبيان - غرفة صديقي المميز',
                      sections: DaleelAssistantSurvey.accessibilityRoomSections,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _assetFor(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    if (width < 700 || (isPortrait && width < 900)) return _mobile;
    if (width < 1100) return _tablet;
    return _desktop;
  }

  _RoomPlacement _cupPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final size = (width * (isMobile ? 0.105 : 0.072)).clamp(58.0, 116.0);
    return _RoomPlacement(
      width: size,
      height: size,
      left: width * (isMobile ? 0.68 : 0.58),
      top: height * (isMobile ? 0.68 : 0.77),
    );
  }

  _RoomPlacement _youtubePlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final size = (width * (isMobile ? 0.24 : 0.16)).clamp(150.0, 270.0);
    final centerX = width * 0.47;
    final centerY = height * (isMobile ? 0.52 : 0.61);
    return _RoomPlacement(
      width: size,
      height: size,
      left: centerX - size / 2,
      top: centerY - size / 2,
    );
  }

  _RoomPlacement _monitorPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return _RoomPlacement(
      width: width * (isMobile ? 0.31 : 0.20),
      height: height * (isMobile ? 0.13 : 0.19),
      left: width * (isMobile ? 0.66 : 0.72),
      top: height * (isMobile ? 0.495 : 0.45),
    );
  }

  _RoomPlacement _photoButtonPlacement(_RoomPlacement monitor) {
    final size = (monitor.width * 0.58).clamp(82.0, 160.0);
    return _RoomPlacement(
      width: size,
      height: size,
      left: monitor.left! + (monitor.width - size) / 2,
      top: monitor.top! + (monitor.height - size) / 2,
    );
  }

  _RoomPlacement _linksCardPlacement(BoxConstraints constraints) {
    return _topCardPlacement(constraints, 0);
  }

  _RoomPlacement _toolsCardPlacement(BoxConstraints constraints) {
    return _topCardPlacement(constraints, 1);
  }

  _RoomPlacement _suggestionsCardPlacement(BoxConstraints constraints) {
    return _topCardPlacement(constraints, 2);
  }

  _RoomPlacement _communityToolsCardPlacement(BoxConstraints constraints) {
    return _topCardPlacement(constraints, 3);
  }

  _RoomPlacement _checkinCardPlacement(BoxConstraints constraints) {
    return _topCardPlacement(constraints, 4);
  }

  _RoomPlacement _topCardPlacement(BoxConstraints constraints, int index) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final cardWidth = width * (isMobile ? 0.285 : 0.106);
    final cardHeight = height * (isMobile ? 0.1305 : 0.205);

    if (!isMobile) {
      final centers = <double>[0.2895, 0.3915, 0.5005, 0.6085, 0.7175];
      return _RoomPlacement(
        width: cardWidth,
        height: cardHeight,
        left: width * centers[index] - cardWidth / 2,
        top: height * 0.115,
      );
    }

    final gap = width * 0.016;
    final totalWidth = cardWidth * 5 + gap * 4;
    final start = ((width - totalWidth) / 2).clamp(width * 0.04, width * 0.18);

    return _RoomPlacement(
      width: cardWidth,
      height: cardHeight,
      left: start + index * (cardWidth + gap),
      top: height * 0.18,
    );
  }

  _RoomPlacement _noteFeatherPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final target =
        (width * (isMobile ? 0.15 : 0.065)).clamp(88.0, 108.0).toDouble();
    return _RoomPlacement(
      width: target,
      height: target,
      left: width * (isMobile ? 0.235 : 0.30),
      top: height * (isMobile ? 0.675 : 0.755),
    );
  }

  double _noteFeatherImageSize(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return (width * (isMobile ? 0.12 : 0.049)).clamp(72.0, 84.0).toDouble();
  }

  _RoomPlacement _notebookMessagePlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return _RoomPlacement(
      width: width * (isMobile ? 0.38 : 0.29),
      height: height * (isMobile ? 0.11 : 0.12),
      left: width * (isMobile ? 0.27 : 0.325),
      top: height * (isMobile ? 0.745 : 0.795),
    );
  }

  void _openImportantLinks() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.linksCardOpen,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'ImportantLinksCard',
      action: 'navigate_accessibility_links',
    );
    Navigator.of(context).pushNamed(Routes.accessibilityLinks);
  }

  void _openAssistiveTools() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.toolsCardOpen,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'AssistiveToolsCard',
      action: 'navigate_accessibility_tools',
    );
    Navigator.of(context).pushNamed(Routes.accessibilityTools);
  }

  void _openSuggestions() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.suggestionsCardOpen,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'SuggestionsCard',
      action: 'navigate_suggestions',
    );
    Navigator.of(context).pushNamed(Routes.accessibilitySuggestions);
  }

  void _openCommunityTools() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.communityToolsCardOpen,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'CommunityToolsCard',
      action: 'navigate_community_tools',
    );
    Navigator.of(context).pushNamed(Routes.accessibilityCommunityTools);
  }

  void _openCheckin() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.checkinCardOpen,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'CheckinCard',
      action: 'navigate_checkin',
    );
    Navigator.of(context).pushNamed(
      Routes.accessibilityCheckin,
      arguments: {'returnRoute': Routes.accessibilityRoom},
    );
  }

  Future<void> _openMessageOfDayDialog(AppLocalizations l10n) async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.messageOfDayOpen,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'FeatherNotebookButton',
      action: 'open_message_dialog',
    );
    final message = await showDialog<String>(
      context: context,
      builder: (context) => _buildMessageOfDayDialog(context, l10n),
    );
    if (!mounted || message == null) return;
    setState(() {
      _selectedNotebookMessage = message;
    });
    unawaited(_sessionStore.saveSelectedNote(message));
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.motivationSelect,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'MessageOfDayDialog',
      action: 'select_message',
    );
  }

  Widget _buildMessageOfDayDialog(BuildContext context, AppLocalizations l10n) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: const Color(0xFFFFF1D0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🌿 ', style: TextStyle(fontSize: 24)),
            Flexible(
              child: Text(
                l10n.applicationClientFeatherNotebook,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF7A4A00),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            AccessibilityGuideIcon(
              onPressed: () => _showSpeechPlaceholder(
                  context, l10n.applicationClientFeatherNotebook),
            ),
          ],
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.applicationAccessibilityDialogSelectMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF3A2A18),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                _MessageDialogOption(
                  text: l10n.applicationAccessibilityDialogRandomMessage,
                  onPressed: () {
                    final messages = _notebookMessages(l10n);
                    final randomMessage =
                        messages[Random().nextInt(messages.length)];
                    Navigator.of(context).pop(randomMessage);
                  },
                ),
                const SizedBox(height: 8),
                for (final message in _notebookMessages(l10n))
                  _MessageDialogOption(
                    text: message,
                    onPressed: () => Navigator.of(context).pop(message),
                    onSpeak: () => _showSpeechPlaceholder(context, message),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openYoutube() async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.youtubeOpen,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'YouTubeButton',
      action: 'open_external_youtube',
    );
    final uri = Uri.parse(_youtubeUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _pickTemporaryPhoto() async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.temporaryPhotoTap,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'TemporaryPhotoButton',
      action: 'open_image_picker',
    );
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    if (!mounted) return;
    setState(() {
      _selectedPhotoBytes = bytes;
    });
    unawaited(_sessionStore.saveClientImageReference(picked.path));
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.imageUpload,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'TemporaryPhotoButton',
      action: 'local_image_selected',
    );
  }

  void _exitRoom() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.exit,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'ExitCupButton',
      action: 'exit_to_residential_portal',
    );
    setState(() {
      _selectedPhotoBytes = null;
      _selectedNotebookMessage = null;
    });
    unawaited(_sessionStore.clearSession());
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.residentialExitSocialLinks,
      (route) => false,
    );
  }

  void _showSpeechPlaceholder(BuildContext context, String label) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Accessibility Room',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }
}

class _RoomPlacement {
  const _RoomPlacement({
    required this.width,
    required this.height,
    this.left,
    this.top,
  });

  final double width;
  final double height;
  final double? left;
  final double? top;
}

double _roomCardImageSize(_RoomPlacement placement) {
  final shortestSide =
      placement.width < placement.height ? placement.width : placement.height;
  return (shortestSide * 0.86).clamp(92.0, 168.0).toDouble();
}

class _MonitorPhoto extends StatelessWidget {
  const _MonitorPhoto({
    required this.placement,
    required this.bytes,
  });

  final _RoomPlacement placement;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.memory(
          bytes,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _NotebookMessage extends StatelessWidget {
  const _NotebookMessage({
    required this.placement,
    required this.message,
  });

  final _RoomPlacement placement;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            message,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF6B3F16),
              fontSize: (placement.width * 0.052).clamp(17.0, 22.0).toDouble(),
              fontWeight: FontWeight.w800,
              height: 1.12,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageDialogOption extends StatelessWidget {
  const _MessageDialogOption({
    required this.text,
    required this.onPressed,
    this.onSpeak,
  });

  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onSpeak;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF1D5F63),
          side: const BorderSide(color: Color(0x881D5F63)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            if (onSpeak != null) ...[
              const SizedBox(width: 8),
              AccessibilityGuideIcon(
                size: 22,
                onPressed: onSpeak,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _RoomImageButton extends StatelessWidget {
  const _RoomImageButton({
    required this.assetPath,
    required this.placement,
    required this.semanticLabel,
    required this.onPressed,
    this.showAccessibilityGuideIcon = true,
  });

  final String assetPath;
  final _RoomPlacement placement;
  final String semanticLabel;
  final VoidCallback onPressed;
  final bool showAccessibilityGuideIcon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: semanticLabel,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onPressed,
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
              ),
            ),
            if (showAccessibilityGuideIcon)
              const Positioned(
                right: 0,
                top: 0,
                child: AccessibilityGuideIcon(),
              ),
          ],
        ),
      ),
    );
  }
}

class _RoomHoverImageButton extends StatefulWidget {
  const _RoomHoverImageButton({
    required this.assetPath,
    required this.placement,
    required this.tooltip,
    required this.semanticLabel,
    required this.imageSize,
    required this.onPressed,
  });

  final String assetPath;
  final _RoomPlacement placement;
  final String tooltip;
  final String semanticLabel;
  final double imageSize;
  final VoidCallback onPressed;

  @override
  State<_RoomHoverImageButton> createState() => _RoomHoverImageButtonState();
}

class _RoomHoverImageButtonState extends State<_RoomHoverImageButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.placement.left,
      top: widget.placement.top,
      width: widget.placement.width,
      height: widget.placement.height,
      child: Semantics(
        button: true,
        label: widget.semanticLabel,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Tooltip(
              message: widget.tooltip,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _isHovering = true),
                onExit: (_) => setState(() => _isHovering = false),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: widget.onPressed,
                  child: Center(
                    child: AnimatedScale(
                      scale: _isHovering ? 1.08 : 1.0,
                      duration: const Duration(milliseconds: 140),
                      curve: Curves.easeOut,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFE4A3).withValues(
                                alpha: _isHovering ? 0.44 : 0.22,
                              ),
                              blurRadius: _isHovering ? 18 : 10,
                              spreadRadius: _isHovering ? 2 : 1,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          widget.assetPath,
                          width: widget.imageSize,
                          height: widget.imageSize,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 0,
              top: 0,
              child: AccessibilityGuideIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccessibilityLinksCard extends StatelessWidget {
  const _AccessibilityLinksCard({
    required this.l10n,
    required this.assetPath,
    required this.placement,
    required this.onPressed,
  });

  final AppLocalizations l10n;
  final String assetPath;
  final _RoomPlacement placement;
  final VoidCallback onPressed;

  void _showSpeechPlaceholder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: l10n.applicationAccessibilityLinksCardTitle,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Image.asset(
                  assetPath,
                  width: _roomCardImageSize(placement),
                  height: _roomCardImageSize(placement),
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: AccessibilityGuideIcon(
                  size: 24,
                  onPressed: () => _showSpeechPlaceholder(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessibilityToolsCard extends StatelessWidget {
  const _AccessibilityToolsCard({
    required this.l10n,
    required this.assetPath,
    required this.placement,
    required this.onPressed,
  });

  final AppLocalizations l10n;
  final String assetPath;
  final _RoomPlacement placement;
  final VoidCallback onPressed;

  void _showSpeechPlaceholder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: l10n.applicationAccessibilityToolsCardTitle,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Image.asset(
                  assetPath,
                  width: _roomCardImageSize(placement),
                  height: _roomCardImageSize(placement),
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: AccessibilityGuideIcon(
                  size: 24,
                  onPressed: () => _showSpeechPlaceholder(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessibilitySuggestionsCard extends StatelessWidget {
  const _AccessibilitySuggestionsCard({
    required this.l10n,
    required this.assetPath,
    required this.placement,
    required this.onPressed,
  });

  final AppLocalizations l10n;
  final String assetPath;
  final _RoomPlacement placement;
  final VoidCallback onPressed;

  void _showSpeechPlaceholder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: l10n.applicationAccessibilitySuggestionsCardTitle,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Image.asset(
                  assetPath,
                  width: _roomCardImageSize(placement),
                  height: _roomCardImageSize(placement),
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: AccessibilityGuideIcon(
                  size: 24,
                  onPressed: () => _showSpeechPlaceholder(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessibilityCommunityToolsCard extends StatelessWidget {
  const _AccessibilityCommunityToolsCard({
    required this.l10n,
    required this.assetPath,
    required this.placement,
    required this.onPressed,
  });

  final AppLocalizations l10n;
  final String assetPath;
  final _RoomPlacement placement;
  final VoidCallback onPressed;

  void _showSpeechPlaceholder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: l10n.applicationClientCommunityToolsTitle,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Image.asset(
                  assetPath,
                  width: _roomCardImageSize(placement),
                  height: _roomCardImageSize(placement),
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: AccessibilityGuideIcon(
                  size: 24,
                  onPressed: () => _showSpeechPlaceholder(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessibilityCheckinCard extends StatelessWidget {
  const _AccessibilityCheckinCard({
    required this.l10n,
    required this.assetPath,
    required this.placement,
    required this.onPressed,
  });

  final AppLocalizations l10n;
  final String assetPath;
  final _RoomPlacement placement;
  final VoidCallback onPressed;

  void _showSpeechPlaceholder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.applicationAudioSoon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: l10n.applicationClientCheckInTitle,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Image.asset(
                  assetPath,
                  width: _roomCardImageSize(placement),
                  height: _roomCardImageSize(placement),
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: AccessibilityGuideIcon(
                  size: 24,
                  onPressed: () => _showSpeechPlaceholder(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
