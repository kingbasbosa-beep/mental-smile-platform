import 'package:flutter/material.dart';

typedef CommercialCapsulePageBuilder = Widget Function(BuildContext context);

class CommercialCapsuleRouteDescriptor {
  const CommercialCapsuleRouteDescriptor({
    required this.routeCode,
    required this.routePath,
    required this.destinationName,
    required this.owner,
    required this.requiredCapability,
    required this.authRequirement,
    required this.lifecycleRequirement,
    required this.builder,
  });

  final String routeCode;
  final String routePath;
  final String destinationName;
  final String owner;
  final String requiredCapability;
  final String authRequirement;
  final String lifecycleRequirement;
  final CommercialCapsulePageBuilder builder;
}

class CommercialCapsuleRoutes {
  const CommercialCapsuleRoutes._();

  static const root = '/';
  static const commercialAccess = '/commercial/access';
  static const commercialSpecialistLogin = '/commercial/specialist/login';
  static const commercialSpecialistRegister = '/commercial/specialist/register';
  static const commercialCenterLogin = '/commercial/center/login';
  static const commercialCenterRegister = '/commercial/center/register';
  static const commercialRoom = '/commercial/room';
  static const commercialSpecialistProfessionalProfile =
      '/commercial/specialist/professional-profile';
  static const commercialSpecialistProfessionalLibrary =
      '/commercial/specialist/professional-library';
  static const commercialCenterRoom = '/commercial/center/room';
  static const commercialCenterProfessionalProfile =
      '/commercial/center/professional-profile';
  static const commercialCenterProfessionalLibrary =
      '/commercial/center/professional-library';
  static const commercialAssistiveTools = '/commercial/tools/assistive';
  static const commercialPublicAccounts = '/commercial/public-accounts';
  static const commercialV2Web = '/commercial-v2/web';
  static const landingPreview = '/landing-preview';
  static const generation2MobileSpecialistRoom = '/g2/mobile/specialist-room';
  static const generation2MobileCenterRoom = '/g2/mobile/center-room';

  static final descriptors = <CommercialCapsuleRouteDescriptor>[
    _descriptor(
      'MS-COM-ROUTE-000',
      root,
      'CommercialV2WebShowcasePage',
      'COMMERCIAL_V2_WEB',
      'showcase',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-001',
      commercialAccess,
      'CommercialAccessPage',
      'COMMERCIAL',
      'access',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-002',
      commercialSpecialistLogin,
      'SpecialistLoginPage',
      'SPECIALIST',
      'specialist_login',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-003',
      commercialSpecialistRegister,
      'SpecialistRegisterPage',
      'SPECIALIST',
      'registration',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-004',
      commercialCenterLogin,
      'CenterLoginPage',
      'CENTER',
      'center_login',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-005',
      commercialCenterRegister,
      'CenterRegisterPage',
      'CENTER',
      'registration',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-006',
      commercialRoom,
      'CommercialRoomPage',
      'SPECIALIST',
      'specialist_room',
      'clinician',
    ),
    _descriptor(
      'MS-COM-ROUTE-007',
      commercialSpecialistProfessionalProfile,
      'SpecialistProfessionalProfileCleanLayoutPage',
      'SPECIALIST',
      'profile',
      'clinician',
    ),
    _descriptor(
      'MS-COM-ROUTE-008',
      commercialSpecialistProfessionalLibrary,
      'SpecialistProfessionalLibraryPage',
      'SPECIALIST',
      'library',
      'clinician',
    ),
    _descriptor(
      'MS-COM-ROUTE-009',
      commercialCenterRoom,
      'CenterRoomPage',
      'CENTER',
      'center_room',
      'center',
    ),
    _descriptor(
      'MS-COM-ROUTE-010',
      commercialCenterProfessionalProfile,
      'CenterProfessionalProfileCleanLayoutPage',
      'CENTER',
      'profile',
      'center',
    ),
    _descriptor(
      'MS-COM-ROUTE-011',
      commercialCenterProfessionalLibrary,
      'CenterProfessionalLibraryPage',
      'CENTER',
      'library',
      'center',
    ),
    _descriptor(
      'MS-COM-ROUTE-012',
      commercialAssistiveTools,
      'CommercialSharedAssistiveToolsPage',
      'COMMERCIAL',
      'assistive_tools',
      'commercial_account',
    ),
    _descriptor(
      'MS-COM-ROUTE-013',
      commercialPublicAccounts,
      'CommercialPublicAccountsPage',
      'COMMERCIAL',
      'public_profiles',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-014',
      commercialV2Web,
      'CommercialV2WebShowcasePage',
      'COMMERCIAL_V2_WEB',
      'showcase',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-015',
      landingPreview,
      'CommercialV2WebShowcasePage',
      'COMMERCIAL_V2_WEB',
      'landing',
      'none',
    ),
    _descriptor(
      'MS-COM-ROUTE-016',
      generation2MobileSpecialistRoom,
      'Generation2MobileSpecialistRoomPage',
      'GENERATION2_SPECIALIST',
      'mobile_specialist_room',
      'clinician',
    ),
    _descriptor(
      'MS-COM-ROUTE-017',
      generation2MobileCenterRoom,
      'Generation2MobileCenterRoomPage',
      'GENERATION2_CENTER',
      'mobile_center_room',
      'center',
    ),
  ];

  static CommercialCapsuleRouteDescriptor _descriptor(
    String code,
    String path,
    String destination,
    String owner,
    String capability,
    String auth,
  ) {
    return CommercialCapsuleRouteDescriptor(
      routeCode: code,
      routePath: path,
      destinationName: destination,
      owner: owner,
      requiredCapability: capability,
      authRequirement: auth,
      lifecycleRequirement: 'MATERIALIZED_UNMOUNTED_OR_TEST',
      builder: (_) => _CommercialCapsulePlaceholderPage(
        title: destination,
        routeCode: code,
        routePath: path,
        owner: owner,
      ),
    );
  }
}

class _CommercialCapsulePlaceholderPage extends StatelessWidget {
  const _CommercialCapsulePlaceholderPage({
    required this.title,
    required this.routeCode,
    required this.routePath,
    required this.owner,
  });

  final String title;
  final String routeCode;
  final String routePath;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(routeCode, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(routePath),
          const SizedBox(height: 8),
          Text('owner: $owner'),
          const SizedBox(height: 16),
          const Text('Commercial capsule route descriptor rendering.'),
        ],
      ),
    );
  }
}
