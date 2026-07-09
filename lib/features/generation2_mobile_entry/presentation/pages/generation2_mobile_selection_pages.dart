import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class Generation2MobileFriendsSelectionPage extends StatelessWidget {
  const Generation2MobileFriendsSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _G2MobilePortalPage(
      title: 'الأصدقاء',
      daleelAssistant: const DaleelAssistant(
        iconOnly: true,
        guideAssetPath:
            'assets/branding/guides/client_account_selection_mobile_guide.png',
        surveyTitle: 'رأيك يهمنا',
        surveyIntro: 'ساعدنا في تحسين شاشة اختيار نوع حساب العميل.\n\n'
            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
        sections:
            DaleelAssistantSurvey.premiumClientAccountSelectionMobileSections,
        extraTextFields: [
          DaleelSurveyTextFieldData(
            sectionTitle: 'مقترحات لتحسين تجربة الاستخدام',
            label: 'شاركنا أفكارك',
            placeholder:
                'إذا كانت لديك أفكار تساعدنا في تحسين سهولة الاستخدام أو إضافة وسائل مساعدة جديدة، يسعدنا سماعها.',
          ),
        ],
        suggestionsTitle: 'اقتراحات عامة',
        suggestionsLabel: 'اقتراحاتك تهمنا',
        suggestionsPlaceholder:
            'اكتب أي اقتراح يساعدنا في تطوير شاشة اختيار نوع الحساب...',
      ),
      buttons: [
        _G2MobilePortalButtonData(
          label: 'صديقي العميل',
          icon: Icons.person_rounded,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const Generation2MobileFriendClientRoomPage(),
            ),
          ),
        ),
        _G2MobilePortalButtonData(
          label: 'صديقي المميز',
          icon: Icons.accessible_forward_rounded,
          onPressed: () => Navigator.of(context).pushNamed(
            Routes.generation2MobileClientRoom,
          ),
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
      title: 'الداعمين',
      daleelAssistant: const DaleelAssistant(
        iconOnly: true,
        guideAssetPath:
            'assets/branding/guides/supporters_account_selection_mobile_guide.png',
        surveyTitle: 'رأيك يهمنا',
        surveyIntro:
            'ساعدنا في تحسين شاشة اختيار حساب الداعمين داخل منصة Mental Smile.\n\n'
            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
        sections:
            DaleelAssistantSurvey.supportersAccountSelectionMobileSections,
        extraTextFields: [
          DaleelSurveyTextFieldData(
            sectionTitle: 'القسم الثالث\nاقتراحات لتحسين تجربة الاستخدام',
            label: 'شاركنا أفكارك',
            placeholder:
                'اكتب أي اقتراح يساعدنا في تحسين سهولة الاستخدام أو إضافة وسائل مساعدة جديدة...',
          ),
        ],
        suggestionsTitle: 'القسم الرابع\nاقتراحات عامة',
        suggestionsLabel: 'اقتراحاتك تهمنا',
        suggestionsPlaceholder:
            'اكتب أي اقتراح يساعدنا في تطوير شاشة اختيار حساب الداعمين...',
      ),
      buttons: [
        _G2MobilePortalButtonData(
          label: 'أخصائيين داعمين',
          icon: Icons.medical_services_rounded,
          onPressed: () => Navigator.of(context).pushNamed(
            Routes.generation2MobileSpecialistRoom,
          ),
        ),
        _G2MobilePortalButtonData(
          label: 'مراكز داعمة',
          icon: Icons.apartment_rounded,
          onPressed: () => Navigator.of(context).pushNamed(
            Routes.generation2MobileCenterRoom,
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
    this.daleelAssistant,
  });

  static const String _background =
      'assets/images/mobile/login/background_mobile.webp';
  static const double _backgroundScale = 0.96;

  final String title;
  final List<_G2MobilePortalButtonData> buttons;
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
            final shellWidth =
                constraints.maxWidth > 430 ? 390.0 : constraints.maxWidth;

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
                          _background,
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
                                padding:
                                    const EdgeInsetsDirectional.only(start: 38),
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
                        Shadow(
                          color: Color(0xAAFFFFFF),
                          blurRadius: 8,
                        ),
                        Shadow(
                          color: Color(0x77D4AF37),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const AccessibilityGuideIcon(
                  size: 12,
                  tooltipIconSize: 96,
                ),
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
          AccessibilityGuideIcon(
            size: 13,
            tooltipIconSize: 96,
          ),
        ],
      ),
    );
  }
}
