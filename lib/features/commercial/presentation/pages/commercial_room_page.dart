import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_room_screen_image.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_room_tv_apps.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_room_utility_tools.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/wellbeing/shared_wellbeing_room_card.dart';

class CommercialRoomPage extends StatelessWidget {
  const CommercialRoomPage({super.key});

  static const String _desktop =
      'assets/branding/rooms/client_room/client_room_background_desktop.png';
  static const String _tablet =
      'assets/branding/rooms/client_room/client_room_background_tablet.png';
  static const String _mobile =
      'assets/branding/rooms/client_room/client_room_background_mobile.png';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenPlacement = _computerScreenPlacement(constraints);
          final tvPlacement = _tvScreenPlacement(constraints);
          final cupPlacement = _cupPlacement(constraints);
          final featherPlacement = _featherPlacement(constraints);
          return SizedBox.expand(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _assetFor(constraints),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                CommercialRoomScreenImage(
                  storageKey: 'commercial_specialist_room_screen_image',
                  placement: screenPlacement,
                ),
                CommercialRoomTvApps(
                  placement: tvPlacement,
                  returnRoute: Routes.commercialRoom,
                ),
                CommercialRoomUtilityTools(
                  cupPlacement: cupPlacement,
                  featherPlacement: featherPlacement,
                  featherImageSize: _featherImageSize(constraints),
                  noteTitle: l10n.commercialRoomNoteTitle,
                ),
                Align(
                  alignment: const Alignment(0, -0.74),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: constraints.maxWidth < 720 ? 7 : 10,
                    runSpacing: 7,
                    children: [
                      _ProfessionalProfileCardFixed(
                        l10n: l10n,
                        isCompact: constraints.maxWidth < 720,
                      ),
                      _ProfessionalLibraryCardFixed(
                        l10n: l10n,
                        isCompact: constraints.maxWidth < 720,
                      ),
                      _AssistiveToolsCardFixed(
                        l10n: l10n,
                        isCompact: constraints.maxWidth < 720,
                      ),
                      SharedWellbeingRoomCard(
                        isCompact: constraints.maxWidth < 720,
                      ),
                    ],
                  ),
                ),
                if (constraints.maxWidth >= 900 &&
                    constraints.maxWidth > constraints.maxHeight)
                  const Positioned(
                    top: 18,
                    left: 24,
                    child: DaleelAssistant(
                      guideAssetPath:
                          'assets/branding/guides/specialist_room_mobile_guide.png',
                      surveyTitle: 'الاستبيان - غرفة الأخصائي',
                      sections: DaleelAssistantSurvey.specialistRoomSections,
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

  CommercialRoomScreenPlacement _computerScreenPlacement(
    BoxConstraints constraints,
  ) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final targetWidth = width * (isMobile ? 0.31 : 0.20) * 1.3;
    final targetHeight = height * (isMobile ? 0.13 : 0.19) * 1.3;
    final baseLeft = width * (isMobile ? 0.66 : 0.72);
    final baseTop = height * (isMobile ? 0.495 : 0.45);
    return CommercialRoomScreenPlacement(
      width: targetWidth,
      height: targetHeight,
      left: baseLeft - (targetWidth - width * (isMobile ? 0.31 : 0.20)) / 2,
      top: baseTop - (targetHeight - height * (isMobile ? 0.13 : 0.19)) / 2,
    );
  }

  CommercialRoomScreenPlacement _tvScreenPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return CommercialRoomScreenPlacement(
      width: width * (isMobile ? 0.58 : 0.47),
      height: height * (isMobile ? 0.20 : 0.28),
      left: width * (isMobile ? 0.21 : 0.235),
      top: height * (isMobile ? 0.455 : 0.475),
    );
  }

  CommercialRoomScreenPlacement _cupPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final size = (width * (isMobile ? 0.105 : 0.072)).clamp(58.0, 116.0);
    return CommercialRoomScreenPlacement(
      width: size,
      height: size,
      left: width * (isMobile ? 0.68 : 0.58),
      top: height * (isMobile ? 0.68 : 0.77),
    );
  }

  CommercialRoomScreenPlacement _featherPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final target =
        (width * (isMobile ? 0.16 : 0.07)).clamp(86.0, 112.0).toDouble();
    return CommercialRoomScreenPlacement(
      width: target,
      height: target,
      left: width * (isMobile ? 0.235 : 0.30),
      top: height * (isMobile ? 0.675 : 0.755),
    );
  }

  double _featherImageSize(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return (width * (isMobile ? 0.12 : 0.047)).clamp(68.0, 82.0).toDouble();
  }
}

class _ProfessionalProfileCardFixed extends StatelessWidget {
  const _ProfessionalProfileCardFixed(
      {required this.l10n, required this.isCompact});

  final AppLocalizations l10n;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return _FixedSpecialistRoomCard(
      isCompact: isCompact,
      icon: Icons.badge_outlined,
      title: l10n.commercialRoomProfessionalProfile,
      subtitle: l10n.commercialRoomProfessionalProfileSubtitle,
      routeName: '/commercial/specialist/professional-profile',
    );
  }
}

class _ProfessionalLibraryCardFixed extends StatelessWidget {
  const _ProfessionalLibraryCardFixed(
      {required this.l10n, required this.isCompact});

  final AppLocalizations l10n;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return _FixedSpecialistRoomCard(
      isCompact: isCompact,
      icon: Icons.menu_book_outlined,
      title: l10n.commercialRoomProfessionalLibrary,
      subtitle: l10n.commercialRoomProfessionalLibrarySubtitle,
      routeName: '/commercial/specialist/professional-library',
    );
  }
}

class _AssistiveToolsCardFixed extends StatelessWidget {
  const _AssistiveToolsCardFixed({required this.l10n, required this.isCompact});

  final AppLocalizations l10n;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return _FixedSpecialistRoomCard(
      isCompact: isCompact,
      icon: Icons.handyman_outlined,
      title: l10n.commercialRoomAssistiveTools,
      subtitle: l10n.commercialRoomAssistiveToolsSubtitle,
      routeName: '/commercial/tools/assistive',
    );
  }
}

class _FixedSpecialistRoomCard extends StatelessWidget {
  const _FixedSpecialistRoomCard({
    required this.isCompact,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.routeName,
  });

  final bool isCompact;
  final IconData icon;
  final String title;
  final String subtitle;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final width = isCompact ? 118.0 : 140.0;
    return Semantics(
      button: true,
      label: title,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 8 : 10,
            vertical: isCompact ? 8 : 10,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.64),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFC8952D),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: const Color(0xFFFFE8A3),
                    size: isCompact ? 21 : 25,
                  ),
                  const SizedBox(width: 6),
                  AccessibilityGuideIcon(size: isCompact ? 16 : 18),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                title,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFFFE8A3),
                  fontSize: 12.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFE0C174),
                  fontSize: 8.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
