import 'package:flutter/material.dart';
import 'package:mental_smile_residential_capsule/src/capsule/residential_capsule_routes.dart';
import 'package:mental_smile_residential_capsule/src/generation2/client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';

class Generation2MobileFriendsSelectionPage extends StatelessWidget {
  const Generation2MobileFriendsSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _G2MobilePortalPage(
      title: 'Ø§Ù„Ø£ØµØ¯Ù‚Ø§Ø¡',
      backgroundAssetPath:
          'packages/mental_smile_residential_capsule/assets/client/generation2_mobile_client_selection/background_mobile.webp',
      daleelAssistant: const DaleelAssistant(
        iconOnly: true,
        guideAssetPath:
            'packages/mental_smile_residential_capsule/assets/client/generation2_mobile_client_selection/client_account_selection_mobile_guide.png',
        surveyTitle: 'Ø±Ø£ÙŠÙƒ ÙŠÙ‡Ù…Ù†Ø§',
        surveyIntro:
            'Ø³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ­Ø³ÙŠÙ† Ø´Ø§Ø´Ø© Ø§Ø®ØªÙŠØ§Ø± Ù†ÙˆØ¹ Ø­Ø³Ø§Ø¨ Ø§Ù„Ø¹Ù…ÙŠÙ„.\n\n'
            'Ù„Ù† ÙŠØ³ØªØºØ±Ù‚ Ù‡Ø°Ø§ Ø§Ù„Ø§Ø³ØªØ¨ÙŠØ§Ù† Ø³ÙˆÙ‰ Ø¯Ù‚ÙŠÙ‚Ø© ÙˆØ§Ø­Ø¯Ø©.',
        sections:
            DaleelAssistantSurvey.premiumClientAccountSelectionMobileSections,
        extraTextFields: [
          DaleelSurveyTextFieldData(
            sectionTitle:
                'Ù…Ù‚ØªØ±Ø­Ø§Øª Ù„ØªØ­Ø³ÙŠÙ† ØªØ¬Ø±Ø¨Ø© Ø§Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù…',
            label: 'Ø´Ø§Ø±ÙƒÙ†Ø§ Ø£ÙÙƒØ§Ø±Ùƒ',
            placeholder:
                'Ø¥Ø°Ø§ ÙƒØ§Ù†Øª Ù„Ø¯ÙŠÙƒ Ø£ÙÙƒØ§Ø± ØªØ³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ­Ø³ÙŠÙ† Ø³Ù‡ÙˆÙ„Ø© Ø§Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù… Ø£Ùˆ Ø¥Ø¶Ø§ÙØ© ÙˆØ³Ø§Ø¦Ù„ Ù…Ø³Ø§Ø¹Ø¯Ø© Ø¬Ø¯ÙŠØ¯Ø©ØŒ ÙŠØ³Ø¹Ø¯Ù†Ø§ Ø³Ù…Ø§Ø¹Ù‡Ø§.',
          ),
        ],
        suggestionsTitle: 'Ø§Ù‚ØªØ±Ø§Ø­Ø§Øª Ø¹Ø§Ù…Ø©',
        suggestionsLabel: 'Ø§Ù‚ØªØ±Ø§Ø­Ø§ØªÙƒ ØªÙ‡Ù…Ù†Ø§',
        suggestionsPlaceholder:
            'Ø§ÙƒØªØ¨ Ø£ÙŠ Ø§Ù‚ØªØ±Ø§Ø­ ÙŠØ³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ·ÙˆÙŠØ± Ø´Ø§Ø´Ø© Ø§Ø®ØªÙŠØ§Ø± Ù†ÙˆØ¹ Ø§Ù„Ø­Ø³Ø§Ø¨...',
      ),
      buttons: [
        _G2MobilePortalButtonData(
          label: 'ØµØ¯ÙŠÙ‚ÙŠ Ø§Ù„Ø¹Ù…ÙŠÙ„',
          icon: Icons.person_rounded,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const Generation2MobileFriendClientRoomPage(),
            ),
          ),
        ),
        _G2MobilePortalButtonData(
          label: 'ØµØ¯ÙŠÙ‚ÙŠ Ø§Ù„Ù…Ù…ÙŠØ²',
          icon: Icons.accessible_forward_rounded,
          onPressed: () => Navigator.of(
            context,
          ).pushNamed(Routes.generation2MobileClientRoom),
        ),
      ],
    );
  }
}

class Generation2MobileSupportersSelectionPage extends StatelessWidget {
  const Generation2MobileSupportersSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _G2MobilePortalPage(
      title: 'Ø§Ù„Ø¯Ø§Ø¹Ù…ÙŠÙ†',
      backgroundAssetPath:
          'packages/mental_smile_residential_capsule/assets/app/generation2_mobile_supporters_selection/background_mobile.webp',
      daleelAssistant: const DaleelAssistant(
        iconOnly: true,
        guideAssetPath:
            'packages/mental_smile_residential_capsule/assets/branding/guides/supporters_account_selection_mobile_guide.png',
        surveyTitle: 'Ø±Ø£ÙŠÙƒ ÙŠÙ‡Ù…Ù†Ø§',
        surveyIntro:
            'Ø³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ­Ø³ÙŠÙ† Ø´Ø§Ø´Ø© Ø§Ø®ØªÙŠØ§Ø± Ø­Ø³Ø§Ø¨ Ø§Ù„Ø¯Ø§Ø¹Ù…ÙŠÙ† Ø¯Ø§Ø®Ù„ Ù…Ù†ØµØ© Mental Smile.\n\n'
            'Ù„Ù† ÙŠØ³ØªØºØ±Ù‚ Ù‡Ø°Ø§ Ø§Ù„Ø§Ø³ØªØ¨ÙŠØ§Ù† Ø³ÙˆÙ‰ Ø¯Ù‚ÙŠÙ‚Ø© ÙˆØ§Ø­Ø¯Ø©.',
        sections:
            DaleelAssistantSurvey.supportersAccountSelectionMobileSections,
        extraTextFields: [
          DaleelSurveyTextFieldData(
            sectionTitle:
                'Ø§Ù„Ù‚Ø³Ù… Ø§Ù„Ø«Ø§Ù„Ø«\nØ§Ù‚ØªØ±Ø§Ø­Ø§Øª Ù„ØªØ­Ø³ÙŠÙ† ØªØ¬Ø±Ø¨Ø© Ø§Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù…',
            label: 'Ø´Ø§Ø±ÙƒÙ†Ø§ Ø£ÙÙƒØ§Ø±Ùƒ',
            placeholder:
                'Ø§ÙƒØªØ¨ Ø£ÙŠ Ø§Ù‚ØªØ±Ø§Ø­ ÙŠØ³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ­Ø³ÙŠÙ† Ø³Ù‡ÙˆÙ„Ø© Ø§Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù… Ø£Ùˆ Ø¥Ø¶Ø§ÙØ© ÙˆØ³Ø§Ø¦Ù„ Ù…Ø³Ø§Ø¹Ø¯Ø© Ø¬Ø¯ÙŠØ¯Ø©...',
          ),
        ],
        suggestionsTitle: 'Ø§Ù„Ù‚Ø³Ù… Ø§Ù„Ø±Ø§Ø¨Ø¹\nØ§Ù‚ØªØ±Ø§Ø­Ø§Øª Ø¹Ø§Ù…Ø©',
        suggestionsLabel: 'Ø§Ù‚ØªØ±Ø§Ø­Ø§ØªÙƒ ØªÙ‡Ù…Ù†Ø§',
        suggestionsPlaceholder:
            'Ø§ÙƒØªØ¨ Ø£ÙŠ Ø§Ù‚ØªØ±Ø§Ø­ ÙŠØ³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ·ÙˆÙŠØ± Ø´Ø§Ø´Ø© Ø§Ø®ØªÙŠØ§Ø± Ø­Ø³Ø§Ø¨ Ø§Ù„Ø¯Ø§Ø¹Ù…ÙŠÙ†...',
      ),
      buttons: [
        _G2MobilePortalButtonData(
          label: 'Ø£Ø®ØµØ§Ø¦ÙŠÙŠÙ† Ø¯Ø§Ø¹Ù…ÙŠÙ†',
          icon: Icons.medical_services_rounded,
          onPressed: () => Navigator.of(context).pushNamed(
            Routes.commercialSpecialistLogin,
            arguments: const <String, Object>{
              'successRoute': Routes.generation2MobileSpecialistRoom,
            },
          ),
        ),
        _G2MobilePortalButtonData(
          label: 'Ù…Ø±Ø§ÙƒØ² Ø¯Ø§Ø¹Ù…Ø©',
          icon: Icons.apartment_rounded,
          onPressed: () => Navigator.of(context).pushNamed(
            Routes.commercialCenterLogin,
            arguments: const <String, Object>{
              'successRoute': Routes.generation2MobileCenterRoom,
            },
          ),
        ),
      ],
    );
  }
}

class _G2MobilePortalPage extends StatelessWidget {
  const _G2MobilePortalPage({
    required this.title,
    required this.buttons,
    required this.backgroundAssetPath,
    this.daleelAssistant,
  });

  static const double _backgroundScale = 0.96;

  final String title;
  final List<_G2MobilePortalButtonData> buttons;
  final String backgroundAssetPath;
  final Widget? daleelAssistant;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final mediaSize = MediaQuery.sizeOf(context);
            final shellWidth = constraints.maxWidth > 430
                ? 390.0
                : constraints.maxWidth;

            return Center(
              child: SizedBox(
                width: shellWidth,
                height: mediaSize.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: Transform.scale(
                        scale: _backgroundScale,
                        child: Image.asset(
                          backgroundAssetPath,
                          width: shellWidth,
                          height: mediaSize.height,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          excludeFromSemantics: true,
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.12),
                            Colors.black.withValues(alpha: 0.25),
                            Colors.black.withValues(alpha: 0.58),
                          ],
                        ),
                      ),
                    ),
                    if (daleelAssistant != null)
                      Positioned(
                        top: MediaQuery.paddingOf(context).top + 20,
                        left: 56,
                        child: daleelAssistant!,
                      ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 18, 24, 28),
                        child: Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 38,
                                ),
                                child: _PortalBackButton(
                                  onPressed: () =>
                                      Navigator.of(context).maybePop(),
                                ),
                              ),
                            ),
                            const Spacer(flex: 5),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 174),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (final button in buttons) ...[
                                    _G2MobilePortalButton(data: button),
                                    const SizedBox(height: 10),
                                  ],
                                ],
                              ),
                            ),
                            const Spacer(flex: 6),
                          ],
                        ),
                      ),
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
}

class _G2MobilePortalButtonData {
  const _G2MobilePortalButtonData({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
}

class _G2MobilePortalButton extends StatefulWidget {
  const _G2MobilePortalButton({required this.data});

  final _G2MobilePortalButtonData data;

  @override
  State<_G2MobilePortalButton> createState() => _G2MobilePortalButtonState();
}

class _G2MobilePortalButtonState extends State<_G2MobilePortalButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.data.label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.data.onPressed,
        child: AnimatedScale(
          scale: _pressed ? 0.96 : 1,
          duration: const Duration(milliseconds: 130),
          curve: Curves.easeOut,
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 37),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFE0C174).withValues(alpha: 0.82),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE0C174).withValues(alpha: 0.18),
                  blurRadius: 12,
                  spreadRadius: 0.5,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            child: Row(
              children: [
                Icon(
                  widget.data.icon,
                  color: const Color(0xFFE0C174),
                  size: 17,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    widget.data.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFECECEC),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0,
                      shadows: [
                        Shadow(color: Color(0xAAFFFFFF), blurRadius: 8),
                        Shadow(color: Color(0x77D4AF37), blurRadius: 12),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const AccessibilityGuideIcon(size: 12, tooltipIconSize: 96),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PortalBackButton extends StatelessWidget {
  const _PortalBackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFE0C174),
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        minimumSize: const Size(34, 34),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back_ios_new_rounded, size: 17),
          SizedBox(width: 3),
          AccessibilityGuideIcon(size: 13, tooltipIconSize: 96),
        ],
      ),
    );
  }
}
