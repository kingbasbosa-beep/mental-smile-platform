import 'package:flutter/widgets.dart';

import '../accessibility/presentation/pages/accessibility_checkin_page.dart';
import '../accessibility/presentation/pages/accessibility_community_tools_page.dart';
import '../accessibility/presentation/pages/accessibility_links_page.dart';
import '../accessibility/presentation/pages/accessibility_message_of_day_page.dart';
import '../accessibility/presentation/pages/accessibility_room_page.dart';
import '../accessibility/presentation/pages/accessibility_suggestions_page.dart';
import '../accessibility/presentation/pages/accessibility_tools_page.dart';
import '../client/presentation/pages/client_room_page.dart';
import '../entry/splash/presentation/pages/splash_page.dart';
import '../generation2/client_room/presentation/pages/generation2_mobile_client_room_page.dart';
import '../generation2/entry/presentation/pages/generation2_mobile_lite_client_page.dart';
import '../generation2/entry/presentation/pages/generation2_mobile_login_selection_page.dart';
import '../generation2/entry/presentation/pages/generation2_splash_page.dart';
import '../residential/presentation/pages/residential_exit_social_portal_page.dart';

typedef ResidentialCapsulePageBuilder = Widget Function(BuildContext context);

class ResidentialCapsuleRouteDescriptor {
  const ResidentialCapsuleRouteDescriptor({
    required this.routeCode,
    required this.routePath,
    required this.owner,
    required this.requiredCapability,
    required this.lifecycleRequirement,
    required this.builder,
  });

  final String routeCode;
  final String routePath;
  final String owner;
  final String requiredCapability;
  final String lifecycleRequirement;
  final ResidentialCapsulePageBuilder builder;
}

class ResidentialCapsuleRoutes {
  const ResidentialCapsuleRoutes._();

  static const splash = '/splash';
  static const legacySplash = '/legacy/splash';
  static const generation2MobileLiteClient = '/g2/mobile/client';
  static const generation2MobileLoginSelection = '/g2/mobile/login-selection';
  static const generation2MobileClientRoom = '/g2/mobile/client-room';
  static const clientRoom = '/client/room';
  static const accessibilityRoom = '/accessibility/room';
  static const accessibilityLinks = '/accessibility/links';
  static const accessibilityTools = '/accessibility/tools';
  static const accessibilitySuggestions = '/accessibility/suggestions';
  static const accessibilityCommunityTools = '/accessibility/community-tools';
  static const accessibilityCheckin = '/accessibility/checkin';
  static const accessibilityMessageOfDay = '/accessibility/message-of-the-day';
  static const residentialExitSocialLinks = '/residential/exit-social-links';

  static final descriptors = <ResidentialCapsuleRouteDescriptor>[
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-001',
      routePath: splash,
      owner: 'GENERATION2_ENTRY',
      requiredCapability: 'entry',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const Generation2SplashPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-002',
      routePath: legacySplash,
      owner: 'RESIDENTIAL_ENTRY',
      requiredCapability: 'entry',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const SplashPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-003',
      routePath: generation2MobileLiteClient,
      owner: 'GENERATION2_ENTRY',
      requiredCapability: 'entry',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const Generation2MobileLiteClientPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-004',
      routePath: generation2MobileLoginSelection,
      owner: 'GENERATION2_ENTRY',
      requiredCapability: 'entry',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const Generation2MobileLoginSelectionPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-005',
      routePath: generation2MobileClientRoom,
      owner: 'GENERATION2_CLIENT',
      requiredCapability: 'client_room',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const Generation2MobileClientRoomPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-006',
      routePath: clientRoom,
      owner: 'CLIENT',
      requiredCapability: 'client_room',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const ClientRoomPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-007',
      routePath: accessibilityRoom,
      owner: 'ACCESSIBILITY',
      requiredCapability: 'accessibility_room',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const AccessibilityRoomPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-008',
      routePath: accessibilityLinks,
      owner: 'ACCESSIBILITY',
      requiredCapability: 'accessibility_links',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const AccessibilityLinksPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-009',
      routePath: accessibilityTools,
      owner: 'ACCESSIBILITY',
      requiredCapability: 'accessibility_tools',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const AccessibilityToolsPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-010',
      routePath: accessibilitySuggestions,
      owner: 'ACCESSIBILITY',
      requiredCapability: 'accessibility_suggestions',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const AccessibilitySuggestionsPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-011',
      routePath: accessibilityCommunityTools,
      owner: 'ACCESSIBILITY',
      requiredCapability: 'accessibility_community_tools',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const AccessibilityCommunityToolsPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-012',
      routePath: accessibilityCheckin,
      owner: 'ACCESSIBILITY',
      requiredCapability: 'accessibility_checkin',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const AccessibilityCheckinPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-013',
      routePath: accessibilityMessageOfDay,
      owner: 'ACCESSIBILITY',
      requiredCapability: 'accessibility_message_of_day',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const AccessibilityMessageOfDayPage(),
    ),
    ResidentialCapsuleRouteDescriptor(
      routeCode: 'MS-RES-ROUTE-014',
      routePath: residentialExitSocialLinks,
      owner: 'RESIDENTIAL_EXIT',
      requiredCapability: 'exit_social_links',
      lifecycleRequirement: 'UNMOUNTED',
      builder: (_) => const ResidentialExitSocialPortalPage(),
    ),
  ];
}

class Routes {
  const Routes._();

  static const splash = ResidentialCapsuleRoutes.splash;
  static const legacySplash = ResidentialCapsuleRoutes.legacySplash;
  static const generation2MobileLiteClient =
      ResidentialCapsuleRoutes.generation2MobileLiteClient;
  static const generation2MobileLoginSelection =
      ResidentialCapsuleRoutes.generation2MobileLoginSelection;
  static const generation2MobileClientRoom =
      ResidentialCapsuleRoutes.generation2MobileClientRoom;
  static const clientRoom = ResidentialCapsuleRoutes.clientRoom;
  static const accessibilityRoom = ResidentialCapsuleRoutes.accessibilityRoom;
  static const accessibilityLinks = ResidentialCapsuleRoutes.accessibilityLinks;
  static const accessibilityTools = ResidentialCapsuleRoutes.accessibilityTools;
  static const accessibilitySuggestions =
      ResidentialCapsuleRoutes.accessibilitySuggestions;
  static const accessibilityCommunityTools =
      ResidentialCapsuleRoutes.accessibilityCommunityTools;
  static const accessibilityCheckin =
      ResidentialCapsuleRoutes.accessibilityCheckin;
  static const accessibilityMessageOfDay =
      ResidentialCapsuleRoutes.accessibilityMessageOfDay;
  static const residentialExitSocialLinks =
      ResidentialCapsuleRoutes.residentialExitSocialLinks;

  static const generation2MobileSpecialistRoom =
      '/host/commercial/specialist-room';
  static const generation2MobileCenterRoom = '/host/commercial/center-room';
  static const commercialAccess = '/host/commercial/access';
  static const commercialSpecialistLogin = '/host/commercial/specialist/login';
  static const commercialSpecialistProfessionalProfile =
      '/host/commercial/specialist/professional-profile';
  static const commercialSpecialistProfessionalLibrary =
      '/host/commercial/specialist/professional-library';
  static const commercialAssistiveTools = '/host/commercial/tools/assistive';
  static const commercialCenterLogin = '/host/commercial/center/login';
  static const commercialCenterProfessionalProfile =
      '/host/commercial/center/professional-profile';
  static const commercialCenterProfessionalLibrary =
      '/host/commercial/center/professional-library';
  static const libraryProviderSpecialists =
      '/host/library/providers/specialists';
  static const libraryProviderCenters = '/host/library/providers/centers';
  static const webLibrary = '/host/web/library';
}
