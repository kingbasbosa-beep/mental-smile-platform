import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class Generation2MobileRoomScaffold extends StatefulWidget {
  const Generation2MobileRoomScaffold({
    super.key,
    required this.cardTitles,
    required this.speech,
    this.returnRoute = Routes.splash,
    this.supportSpaceEnabled = false,
    this.daleelAssistant,
  });

  final List<String> cardTitles;
  final Generation2MobileSpeechContract speech;
  final String returnRoute;
  final bool supportSpaceEnabled;
  final Widget? daleelAssistant;

  @override
  State<Generation2MobileRoomScaffold> createState() =>
      _Generation2MobileRoomScaffoldState();
}

class Generation2MobileSpeechNode {
  const Generation2MobileSpeechNode({
    required this.sectionId,
    required this.localizationKey,
    required this.localizedText,
    required this.tooltip,
    required this.semanticLabel,
  });

  final String sectionId;
  final String localizationKey;
  final String localizedText;
  final String tooltip;
  final String semanticLabel;
}

class Generation2MobileSpeechContract {
  const Generation2MobileSpeechContract({
    required this.exit,
    required this.logo,
    required this.image,
    required this.message,
    required this.carousel,
  });

  final Generation2MobileSpeechNode exit;
  final Generation2MobileSpeechNode logo;
  final Generation2MobileSpeechNode image;
  final Generation2MobileSpeechNode message;
  final Generation2MobileSpeechNode carousel;
}

class _Generation2MobileRoomScaffoldState
    extends State<Generation2MobileRoomScaffold> {
  static const ClientLocalSessionStore _sessionStore =
      ClientLocalSessionStore();

  static const String _mobileBackground =
      'assets/images/mobile/client_room/background_mobile.webp';
  static const String _tabletBackground =
      'assets/images/mobile/client_room/background_tablet.webp';
  static const String _cardsStrip =
      'assets/images/mobile/client_room/client_cards_strip.webp';
  static const String _clientImageFrame =
      'assets/images/mobile/client_room/frame_client_image.webp';

  static const List<String> _messageChoices = [
    'بحبك',
    'وحشتني',
    'زعلان منك',
    'متزعلش مني',
  ];

  final PageController _cardController = PageController(viewportFraction: 0.78);
  int _cardIndex = 0;
  bool _messagePanelOpen = false;
  String? _selectedMessage;
  Uint8List? _selectedImageBytes;

  @override
  void initState() {
    super.initState();
    unawaited(_sessionStore.startSession());
  }

  @override
  void dispose() {
    _selectedImageBytes = null;
    _selectedMessage = null;
    _cardController.dispose();
    super.dispose();
  }

  String _backgroundFor(Size size) {
    final isPortrait = size.height > size.width;
    final isMobile = size.width < 700 || (isPortrait && size.width < 900);
    return isMobile ? _mobileBackground : _tabletBackground;
  }

  Future<void> _speakActiveControl(Generation2MobileSpeechNode node) {
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: node.sectionId,
        localizationKey: node.localizationKey,
        localizedText: node.localizedText,
      ),
    );
  }

  Future<void> _showImagePickerSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.black.withValues(alpha: 0.92),
      barrierColor: Colors.black.withValues(alpha: 0.58),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (sheetContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 24),
              child: TextButton(
                onPressed: () async {
                  Navigator.of(sheetContext).pop();
                  await _pickImage();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFFE0C174),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'ارفع صورة لحد بتحبه',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    if (!mounted) return;
    setState(() => _selectedImageBytes = bytes);
    unawaited(_sessionStore.saveClientImageReference(picked.path));
  }

  void _clearImage() {
    _selectedImageBytes = null;
    _selectedMessage = null;
    unawaited(_sessionStore.clearSession());
  }

  void _exitRoom() {
    _clearImage();
    Navigator.of(context).pushReplacementNamed(
      Routes.generation2MobileLoginSelection,
    );
  }

  void _moveCards(int delta) {
    final nextIndex = (_cardIndex + delta) % widget.cardTitles.length;
    final normalizedIndex =
        nextIndex < 0 ? widget.cardTitles.length - 1 : nextIndex;
    _cardController.animateToPage(
      normalizedIndex,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  void _openCard(String title) {
    final routeName = _routeForCardTitle(title);
    if (routeName == null) {
      return;
    }
    final arguments = <String, Object>{'returnRoute': widget.returnRoute};
    if (routeName == Routes.accessibilityCheckin &&
        widget.supportSpaceEnabled) {
      arguments['supportSpaceEnabled'] = true;
    }
    Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  String? _routeForCardTitle(String title) {
    switch (title) {
      case 'طمّنا عليك':
        return Routes.accessibilityCheckin;
      case 'تطبيقات':
        return Routes.accessibilityCommunityTools;
      case 'تطبيقات وأدوات':
        return Routes.accessibilityCommunityTools;
      case 'شارك باقتراح':
        return Routes.accessibilitySuggestions;
      case 'شاركنا باقتراح':
        return Routes.accessibilitySuggestions;
      case 'بوابة الأدوات المساعدة':
        return Routes.accessibilityTools;
      case 'أدواتك':
        return Routes.accessibilityTools;
      case 'لينكاتك':
        return Routes.accessibilityLinks;
      case 'بوابة الروابط المهمة':
        return Routes.accessibilityLinks;
      case 'اللينكات':
        return Routes.accessibilityLinks;
      case 'الملف المهني':
        return Routes.commercialSpecialistProfessionalProfile;
      case 'المكتبة المهنية':
        return Routes.commercialSpecialistProfessionalLibrary;
      case 'أدوات مساعدة':
        return Routes.commercialAssistiveTools;
      case 'ملف المركز':
        return Routes.commercialCenterProfessionalProfile;
      case 'المكتبة المهنية للمراكز':
        return Routes.commercialCenterProfessionalLibrary;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.sizeOf(context);
    final shellWidth = mediaSize.width > 430 ? 390.0 : mediaSize.width;
    final horizontalPadding = (shellWidth * 0.04).clamp(12.0, 16.0);
    final logoHeight = (shellWidth * 0.28).clamp(92.0, 112.0);
    final frameSize = (shellWidth * 0.43).clamp(152.0, 174.0);
    final carouselHeight = (mediaSize.height * 0.215).clamp(164.0, 204.0);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: shellWidth,
            height: mediaSize.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _backgroundFor(Size(shellWidth, mediaSize.height)),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.02),
                        Colors.black.withValues(alpha: 0.12),
                        Colors.black.withValues(alpha: 0.48),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              horizontalPadding,
                              8,
                              horizontalPadding,
                              12,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: _ExitButton(
                                    onPressed: _exitRoom,
                                    onSpeak: () =>
                                        _speakActiveControl(widget.speech.exit),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                _LogoHeader(
                                  logoHeight: logoHeight,
                                  onSpeak: () =>
                                      _speakActiveControl(widget.speech.logo),
                                ),
                                const SizedBox(height: 6),
                                _ClientImageFrame(
                                  frameAsset: _clientImageFrame,
                                  imageBytes: _selectedImageBytes,
                                  size: frameSize,
                                  onTap: _showImagePickerSheet,
                                  onSpeak: () =>
                                      _speakActiveControl(widget.speech.image),
                                ),
                                const SizedBox(height: 6),
                                _LovedOneMessageField(
                                  choices: _messageChoices,
                                  panelOpen: _messagePanelOpen,
                                  selectedMessage: _selectedMessage,
                                  onToggle: () {
                                    setState(
                                      () => _messagePanelOpen =
                                          !_messagePanelOpen,
                                    );
                                  },
                                  onSelect: (message) {
                                    setState(() {
                                      _selectedMessage = message;
                                      _messagePanelOpen = false;
                                    });
                                    unawaited(
                                      _sessionStore.saveSelectedNote(message),
                                    );
                                  },
                                  onSpeak: () => _speakActiveControl(
                                      widget.speech.message),
                                ),
                                SizedBox(
                                  height: (mediaSize.height * 0.022)
                                      .clamp(8.0, 18.0),
                                ),
                                _CardCarousel(
                                  controller: _cardController,
                                  titles: widget.cardTitles,
                                  stripAsset: _cardsStrip,
                                  activeIndex: _cardIndex,
                                  height: carouselHeight,
                                  onPageChanged: (index) {
                                    setState(() => _cardIndex = index);
                                  },
                                  onMove: _moveCards,
                                  onSpeak: () => _speakActiveControl(
                                      widget.speech.carousel),
                                  onTapCard: _openCard,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (widget.daleelAssistant != null)
                  SafeArea(
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 10,
                          end: 12,
                        ),
                        child: widget.daleelAssistant!,
                      ),
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

class _LogoHeader extends StatelessWidget {
  const _LogoHeader({
    required this.logoHeight,
    required this.onSpeak,
  });

  final double logoHeight;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-14, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/branding/logo_primary.png',
            height: logoHeight,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 4),
          AccessibilityGuideIcon(
            size: 20,
            tooltipIconSize: 96,
            onPressed: onSpeak,
          ),
        ],
      ),
    );
  }
}

class _ClientImageFrame extends StatelessWidget {
  const _ClientImageFrame({
    required this.frameAsset,
    required this.imageBytes,
    required this.size,
    required this.onTap,
    required this.onSpeak,
  });

  final String frameAsset;
  final Uint8List? imageBytes;
  final double size;
  final VoidCallback onTap;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    final innerSize = size * 0.58;

    return Semantics(
      button: true,
      label: 'صورة العميل',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: innerSize,
                  height: innerSize,
                  color: Colors.black.withValues(alpha: 0.34),
                  child: imageBytes == null
                      ? Icon(
                          Icons.person,
                          color:
                              const Color(0xFFFFE8A3).withValues(alpha: 0.74),
                          size: innerSize * 0.42,
                        )
                      : Image.memory(
                          imageBytes!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned.fill(
                child: Image.asset(
                  frameAsset,
                  fit: BoxFit.contain,
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: AccessibilityGuideIcon(
                  size: 20,
                  tooltipIconSize: 96,
                  onPressed: onSpeak,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LovedOneMessageField extends StatelessWidget {
  const _LovedOneMessageField({
    required this.choices,
    required this.panelOpen,
    required this.selectedMessage,
    required this.onToggle,
    required this.onSelect,
    required this.onSpeak,
  });

  final List<String> choices;
  final bool panelOpen;
  final String? selectedMessage;
  final VoidCallback onToggle;
  final ValueChanged<String> onSelect;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 286),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onToggle,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFE0C174).withValues(alpha: 0.76),
                ),
                color: Colors.black.withValues(alpha: 0.22),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE0C174).withValues(alpha: 0.16),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.history_edu_rounded,
                      color: Color(0xFFFFE8A3),
                      size: 18,
                    ),
                    if (selectedMessage != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        selectedMessage!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFFFE8A3),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 7,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(width: 6),
                    AccessibilityGuideIcon(
                      size: 16,
                      tooltipIconSize: 96,
                      onPressed: onSpeak,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 160),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: panelOpen
                ? Padding(
                    key: const ValueKey('message-panel'),
                    padding: const EdgeInsets.only(top: 6),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              const Color(0xFFE0C174).withValues(alpha: 0.52),
                        ),
                        color: Colors.black.withValues(alpha: 0.38),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 7, 8, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Flexible(
                                  child: Text(
                                    'تحب تقول لصاحب الصورة ايه؟',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFFE8A3),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 3),
                                AccessibilityGuideIcon(
                                  size: 15,
                                  tooltipIconSize: 96,
                                  onPressed: onSpeak,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                for (final choice in choices)
                                  _MessageChoiceChip(
                                    label: choice,
                                    selected: selectedMessage == choice,
                                    onTap: () => onSelect(choice),
                                    onSpeak: onSpeak,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(key: ValueKey('message-closed')),
          ),
        ],
      ),
    );
  }
}

class _MessageChoiceChip extends StatelessWidget {
  const _MessageChoiceChip({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.onSpeak,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected
              ? const Color(0xFFE0C174).withValues(alpha: 0.24)
              : Colors.black.withValues(alpha: 0.18),
          border: Border.all(
            color: const Color(0xFFE0C174).withValues(
              alpha: selected ? 0.86 : 0.46,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFFFFE8A3),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(width: 2),
              AccessibilityGuideIcon(
                size: 13,
                tooltipIconSize: 96,
                onPressed: onSpeak,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardCarousel extends StatelessWidget {
  const _CardCarousel({
    required this.controller,
    required this.titles,
    required this.stripAsset,
    required this.activeIndex,
    required this.height,
    required this.onPageChanged,
    required this.onMove,
    required this.onSpeak,
    required this.onTapCard,
  });

  final PageController controller;
  final List<String> titles;
  final String stripAsset;
  final int activeIndex;
  final double height;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onMove;
  final VoidCallback onSpeak;
  final ValueChanged<String> onTapCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height,
            child: PageView.builder(
              controller: controller,
              padEnds: true,
              reverse: true,
              onPageChanged: onPageChanged,
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return AnimatedScale(
                  scale: index == activeIndex ? 1.0 : 0.9,
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: _ClientRoomCard(
                      title: titles[index],
                      stripAsset: stripAsset,
                      onTap: () => onTapCard(titles[index]),
                      onSpeak: onSpeak,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            child: _ArrowButton(
              icon: Icons.chevron_right,
              onPressed: () => onMove(-1),
              onSpeak: onSpeak,
            ),
          ),
          Positioned(
            right: 0,
            child: _ArrowButton(
              icon: Icons.chevron_left,
              onPressed: () => onMove(1),
              onSpeak: onSpeak,
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientRoomCard extends StatelessWidget {
  const _ClientRoomCard({
    required this.title,
    required this.stripAsset,
    required this.onTap,
    required this.onSpeak,
  });

  final String title;
  final String stripAsset;
  final VoidCallback onTap;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: title,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                stripAsset,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
              PositionedDirectional(
                top: 2,
                end: 2,
                child: _GoldHalo(
                  size: 30,
                  child: AccessibilityGuideIcon(
                    size: 18,
                    tooltipIconSize: 96,
                    onPressed: onSpeak,
                  ),
                ),
              ),
              Center(
                child: Transform.translate(
                  offset: const Offset(0, -5),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 14, 24, 28),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFFFE8A3),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 8,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.icon,
    required this.onPressed,
    required this.onSpeak,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 58,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _GoldHalo(
            size: 42,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(icon, size: 34),
              style: IconButton.styleFrom(
                foregroundColor: const Color(0xFFE0C174),
                backgroundColor: Colors.transparent,
                fixedSize: const Size.square(36),
              ),
            ),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: _GoldHalo(
              size: 26,
              child: AccessibilityGuideIcon(
                size: 16,
                tooltipIconSize: 96,
                onPressed: onSpeak,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExitButton extends StatelessWidget {
  const _ExitButton({
    required this.onPressed,
    required this.onSpeak,
  });

  final VoidCallback onPressed;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFFFE8A3),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          letterSpacing: 0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _GoldHalo(
            size: 26,
            child: Icon(Icons.logout_rounded, size: 17),
          ),
          const SizedBox(width: 3),
          _GoldHalo(
            size: 28,
            child: AccessibilityGuideIcon(
              size: 18,
              tooltipIconSize: 96,
              onPressed: onSpeak,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoldHalo extends StatelessWidget {
  const _GoldHalo({
    required this.child,
    this.size = 30,
  });

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFE0C174).withValues(alpha: 0.12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE0C174).withValues(alpha: 0.26),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
