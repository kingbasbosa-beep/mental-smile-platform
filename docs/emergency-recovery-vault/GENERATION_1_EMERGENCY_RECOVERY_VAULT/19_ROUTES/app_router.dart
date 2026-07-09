import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_smile_os/core/auth/account_access_service.dart';
import 'package:mental_smile_os/core/auth/presentation/pages/account_blocked_page.dart';
import 'package:mental_smile_os/core/visibility/visibility_readiness.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

import 'routes.dart';
import 'package:mental_smile_os/features/s_capital/presentation/pages/s_capital_operations_office_page.dart';
import 'package:mental_smile_os/features/s_capital/presentation/pages/s_signal_monitoring_room_page.dart';
import 'package:mental_smile_os/features/s_owner/presentation/pages/owner_operational_branch_rooms.dart';
import 'package:mental_smile_os/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart';
import 'package:mental_smile_os/features/s_support_room/presentation/pages/s_support_room_page.dart';
import 'package:mental_smile_os/features/s_registry_room/presentation/pages/s_registry_room_page.dart';
import 'package:mental_smile_os/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart';

import 'package:mental_smile_os/features/library/presentation/pages/library_page.dart';
import 'package:mental_smile_os/features/library/presentation/pages/library_provider_content_pages.dart';
import 'package:mental_smile_os/features/splash/presentation/pages/splash_page.dart';
import 'package:mental_smile_os/features/modules/presentation/pages/support_entry_page.dart';
import 'package:mental_smile_os/features/modules/presentation/pages/support_issue_selector_page.dart';
import 'package:mental_smile_os/features/app_exit/presentation/pages/app_exit_social_links_page.dart';
import 'package:mental_smile_os/features/residential/presentation/pages/residential_exit_social_portal_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_checkin_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_community_tools_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_links_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_suggestions_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_tools_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_room_page.dart';
import 'package:mental_smile_os/features/block_1_archive_operations/presentation/pages/block_1_archive_dashboard_page.dart';
import 'package:mental_smile_os/features/block_1_archive_operations/presentation/pages/block_1_operations_dashboard_page.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/presentation/pages/block_2_constitutions_dashboard_page.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/presentation/pages/block_2_governance_dashboard_page.dart';
import 'package:mental_smile_os/features/block_2_guides_constitutions/presentation/pages/block_2_guides_dashboard_page.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/pages/block_3_card_compliance_dashboard_page.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/pages/block_3_card_kernel_dashboard_page.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/pages/block_3_card_registries_dashboard_page.dart';
import 'package:mental_smile_os/features/block_3_card_kernel/presentation/pages/block_3_card_relations_dashboard_page.dart';
import 'package:mental_smile_os/features/block_4_reports_snapshots/presentation/pages/block_4_reports_snapshots_pages.dart';
import 'package:mental_smile_os/features/block_5_prompt_ai_memory/presentation/pages/block_5_prompt_ai_memory_pages.dart';
import 'package:mental_smile_os/features/block_6_dna_capsules/presentation/pages/block_6_dna_capsules_pages.dart';
import 'package:mental_smile_os/features/block_7_publish_readiness/presentation/pages/block_7_publish_readiness_pages.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/admin_login_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/admin_room_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_login_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_professional_library_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_professional_profile_clean_layout_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_room_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_access_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_public_accounts_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_room_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_shared_assistive_tools_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_professional_library_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_professional_profile_clean_layout_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_login_page.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart';
import 'package:mental_smile_os/features/decision_intelligence_engine/presentation/pages/decision_intelligence_pages.dart';
import 'package:mental_smile_os/features/governance_operations_ecosystem/presentation/pages/governance_operations_pages.dart';
import 'package:mental_smile_os/features/intelligence_engine_foundation/presentation/pages/intelligence_engine_foundation_pages.dart';
import 'package:mental_smile_os/features/intelligence_orchestration_engine/presentation/pages/intelligence_orchestration_pages.dart';
import 'package:mental_smile_os/features/workshop_foundation/presentation/pages/workshop_foundation_pages.dart';
import 'package:mental_smile_os/features/client/presentation/pages/client_room_page.dart';

const String _roleOwner = 'owner';
const String _roleMonitoringOperator = 'monitoring_operator';
const String _roleRegistrySteward = 'registry_steward';
const String _roleDeclarationReviewer = 'declaration_reviewer';
const String _roleSupportObserver = 'support_observer';

class AppRouter {
  static const Set<String> _ownerOnlyRoutes = {
    Routes.sSovereignIntelligence,
    Routes.ownerArchiveRoom,
    Routes.ownerMarketingMediaRoom,
    Routes.technicalMaintenanceRoom,
    Routes.accountingRoom,
    Routes.legalRoom,
  };

  static const Set<String> _monitoringOperatorRoutes = {
    Routes.sSignalMonitoringRoom,
    Routes.sCapitalReports,
  };

  static const Set<String> _supportObserverRoutes = {
    Routes.sTrustSafety,
  };

  static const Set<String> _ownerAndSupportObserverRoutes = {
    Routes.sSupportRoom,
  };

  static const Set<String> _ownerAndRegistryStewardRoutes = {
    Routes.sRegistryRoom,
  };

  static const Set<String> _ownerAndDeclarationReviewerRoutes = {
    Routes.sDeclarationReviewRoom,
  };

  static bool _isScopedProtectedRoute(String? routeName) {
    if (routeName == null) return false;
    return _ownerOnlyRoutes.contains(routeName) ||
        _monitoringOperatorRoutes.contains(routeName) ||
        _supportObserverRoutes.contains(routeName) ||
        _ownerAndSupportObserverRoutes.contains(routeName) ||
        _ownerAndRegistryStewardRoutes.contains(routeName) ||
        _ownerAndDeclarationReviewerRoutes.contains(routeName);
  }

  static bool _requiresSignedInNonAnonymous(RouteSettings settings) {
    if (_isScopedProtectedRoute(settings.name)) {
      return true;
    }

    switch (settings.name) {
      case Routes.blockedAccount:
        return true;
      default:
        return false;
    }
  }

  static Set<String>? _requiredRoles(String? routeName) {
    if (routeName == null) return null;
    if (_ownerOnlyRoutes.contains(routeName)) return {_roleOwner};
    if (_monitoringOperatorRoutes.contains(routeName)) {
      return {_roleMonitoringOperator};
    }
    if (_supportObserverRoutes.contains(routeName)) {
      return {_roleSupportObserver};
    }
    if (_ownerAndSupportObserverRoutes.contains(routeName)) {
      return {_roleOwner, _roleSupportObserver};
    }
    if (_ownerAndRegistryStewardRoutes.contains(routeName)) {
      return {_roleOwner, _roleRegistrySteward};
    }
    if (_ownerAndDeclarationReviewerRoutes.contains(routeName)) {
      return {_roleOwner, _roleDeclarationReviewer};
    }
    return null;
  }

  static Route<dynamic> _redirectToUnifiedStart(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const CommercialAccessPage(),
      settings: const RouteSettings(name: Routes.commercialAccess),
    );
  }

  static String? _libraryCategoryKey(RouteSettings settings) {
    final args = settings.arguments;
    if (args is Map) {
      final value = args['categoryKey'];
      if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
    }
    return null;
  }

  static Route<dynamic> _protectedRoute({
    required Widget child,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      builder: (_) => _RouteAccessGate(
        routeName: settings.name,
        allowedRoles: _requiredRoles(settings.name),
        child: child,
      ),
      settings: settings,
    );
  }

  static Route<dynamic> _scopedProtectedRoute({
    required Widget child,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      builder: (_) => _RouteAccessGate(
        routeName: settings.name,
        allowedRoles: _requiredRoles(settings.name) ?? const {_roleOwner},
        child: child,
      ),
      settings: settings,
    );
  }

  static Route<dynamic> _sWebSurfaceRoute({
    required RouteSettings settings,
    required String surfaceName,
    required String surfaceType,
    required String description,
    required List<String> items,
  }) {
    final page = SWebSurfacePage(
      surfaceName: surfaceName,
      surfaceType: surfaceType,
      routeName: settings.name ?? '',
      description: description,
      items: items,
    );
    return MaterialPageRoute(
      builder: (_) {
        final allowedRoles = _requiredRoles(settings.name);
        if (allowedRoles == null) return page;
        return _RouteAccessGate(
          routeName: settings.name,
          allowedRoles: allowedRoles,
          child: page,
        );
      },
      settings: settings,
    );
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
        settings: const RouteSettings(name: Routes.splash),
      );
    }

    final needsNonAnonymous = _requiresSignedInNonAnonymous(settings);
    if (needsNonAnonymous && (currentUser == null || currentUser.isAnonymous)) {
      return _redirectToUnifiedStart(settings);
    }

    switch (settings.name) {
      case Routes.sIndex:
        return MaterialPageRoute(
          builder: (_) => const SSurfaceIndexPage(),
          settings: settings,
        );

      case Routes.sSupportRoom:
        return _scopedProtectedRoute(
          child: const SSupportRoomPage(),
          settings: settings,
        );

      case Routes.sRegistryRoom:
        return _scopedProtectedRoute(
          child: const SRegistryRoomPage(),
          settings: settings,
        );

      case Routes.sDeclarationReviewRoom:
        return _scopedProtectedRoute(
          child: const SDeclarationReviewRoomPage(),
          settings: settings,
        );

      case Routes.sCapitalHome:
        return MaterialPageRoute(
          builder: (_) => const SCapitalOperationsOfficePage(),
          settings: settings,
        );

      case Routes.sCapitalOperationsOffice:
        return MaterialPageRoute(
          builder: (_) => const SCapitalOperationsOfficePage(
            focus: SCapitalOfficeFocus.operationsOffice,
          ),
          settings: settings,
        );

      case Routes.sSignalMonitoringRoom:
        return _protectedRoute(
          child: const SSignalMonitoringRoomPage(),
          settings: settings,
        );

      case Routes.sCapitalDepartments:
        return _sWebSurfaceRoute(
          settings: settings,
          surfaceName: 'Departments',
          surfaceType: 'Federation Capital Web [S]',
          description:
              'Future department operating surface for non-sovereign execution units.',
          items: const <String>[
            'Marketing Studio',
            'Technical Studio',
            'Education Services',
            'Provider Operations',
            'Center Operations',
            'Partnership Office',
          ],
        );

      case Routes.sTrustSafety:
        return _sWebSurfaceRoute(
          settings: settings,
          surfaceName: 'Trust & Safety',
          surfaceType: 'Federation Capital Web [S]',
          description:
              'Future trust, safety, complaints, and escalation signal surface.',
          items: const <String>[
            'Safety Signals',
            'Complaint Patterns',
            'Escalation Visibility',
            'Policy References',
          ],
        );

      case Routes.sCapitalReports:
        return _sWebSurfaceRoute(
          settings: settings,
          surfaceName: 'Reports',
          surfaceType: 'Federation Capital Web [S]',
          description:
              'Future reporting surface for department, signal, content, and operational reports.',
          items: const <String>[
            'Signal Reports',
            'Department Reports',
            'Content Reports',
            'Support Reports',
          ],
        );

      case Routes.sSovereignIntelligence:
        return _sWebSurfaceRoute(
          settings: settings,
          surfaceName: 'Strategic Intelligence',
          surfaceType: 'Owner Operational Intelligence',
          description:
              'Strategic intelligence destination for the active visual Owner Operational Room.',
          items: const <String>[
            'Strategic summaries',
            'Risk visibility',
            'Opportunity visibility',
            'Owner review material',
          ],
        );

      case Routes.ownerArchiveRoom:
        return _protectedRoute(
          child: const ArchiveRoomPage(),
          settings: settings,
        );

      case Routes.ownerMarketingMediaRoom:
        return _protectedRoute(
          child: const MarketingMediaRoomPage(),
          settings: settings,
        );

      case Routes.technicalMaintenanceRoom:
        return _protectedRoute(
          child: const TechnicalMaintenanceRoomPage(),
          settings: settings,
        );

      case Routes.accountingRoom:
        return _protectedRoute(
          child: const AccountingRoomPage(),
          settings: settings,
        );

      case Routes.legalRoom:
        return _protectedRoute(
          child: const LegalRoomPage(),
          settings: settings,
        );

      case Routes.webLibrary:
        return MaterialPageRoute(
          builder: (_) => LibraryPage(
            initialCategoryKey: _libraryCategoryKey(settings),
          ),
          settings: settings,
        );

      case Routes.libraryProviderSpecialists:
        return MaterialPageRoute(
          builder: (_) => const LibrarySpecialistsPage(),
          settings: settings,
        );

      case Routes.libraryProviderCenters:
        return MaterialPageRoute(
          builder: (_) => const LibraryCentersPage(),
          settings: settings,
        );

      case Routes.exitSocialLinks:
        return MaterialPageRoute(
          builder: (_) => const AppExitSocialLinksPage(),
          settings: settings,
        );

      case Routes.residentialExitSocialLinks:
        return MaterialPageRoute(
          builder: (_) => const ResidentialExitSocialPortalPage(),
          settings: settings,
        );

      case Routes.blockedAccount:
        final args = settings.arguments;
        final reason = args is String ? args : null;
        return MaterialPageRoute(
          builder: (_) => AccountBlockedPage(reason: reason),
          settings: settings,
        );

      case Routes.clientRoom:
        return MaterialPageRoute(
          builder: (_) => const ClientRoomPage(),
          settings: settings,
        );

      case Routes.commercialAccess:
        return MaterialPageRoute(
          builder: (_) => const CommercialAccessPage(),
          settings: settings,
        );

      case Routes.commercialSpecialistLogin:
        return MaterialPageRoute(
          builder: (_) => const SpecialistLoginPage(),
          settings: settings,
        );

      case Routes.commercialCenterLogin:
        return MaterialPageRoute(
          builder: (_) => const CenterLoginPage(),
          settings: settings,
        );

      case Routes.commercialAdminLogin:
        return MaterialPageRoute(
          builder: (_) => const AdminLoginPage(),
          settings: settings,
        );

      case Routes.commercialRoom:
        return MaterialPageRoute(
          builder: (_) => const CommercialRoomPage(),
          settings: settings,
        );

      case Routes.commercialSpecialistProfessionalProfile:
        return MaterialPageRoute(
          builder: (_) => const SpecialistProfessionalProfileCleanLayoutPage(),
          settings: settings,
        );

      case Routes.commercialSpecialistProfessionalLibrary:
        return MaterialPageRoute(
          builder: (_) => const SpecialistProfessionalLibraryPage(),
          settings: settings,
        );

      case Routes.commercialCenterRoom:
        return MaterialPageRoute(
          builder: (_) => const CenterRoomPage(),
          settings: settings,
        );

      case Routes.commercialCenterProfessionalProfile:
        return MaterialPageRoute(
          builder: (_) => const CenterProfessionalProfileCleanLayoutPage(),
          settings: settings,
        );

      case Routes.commercialCenterProfessionalLibrary:
        return MaterialPageRoute(
          builder: (_) => const CenterProfessionalLibraryPage(),
          settings: settings,
        );

      case Routes.commercialAssistiveTools:
        return MaterialPageRoute(
          builder: (_) => const CommercialSharedAssistiveToolsPage(),
          settings: settings,
        );

      case Routes.commercialPublicAccounts:
        return MaterialPageRoute(
          builder: (_) => const CommercialPublicAccountsPage(),
          settings: settings,
        );

      case Routes.commercialAdminRoom:
        return MaterialPageRoute(
          builder: (_) => const AdminRoomPage(),
          settings: settings,
        );

      case Routes.commercialAdminArchive:
        return MaterialPageRoute(
          builder: (_) => const Block1ArchiveDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminOperations:
        return MaterialPageRoute(
          builder: (_) => const Block1OperationsDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminGuides:
        return MaterialPageRoute(
          builder: (_) => const Block2GuidesDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminConstitutions:
        return MaterialPageRoute(
          builder: (_) => const Block2ConstitutionsDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminGovernance:
        return MaterialPageRoute(
          builder: (_) => const Block2GovernanceDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminCards:
        return MaterialPageRoute(
          builder: (_) => const Block3CardKernelDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminCardRegistries:
        return MaterialPageRoute(
          builder: (_) => const Block3CardRegistriesDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminCardRelations:
        return MaterialPageRoute(
          builder: (_) => const Block3CardRelationsDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminCardCompliance:
        return MaterialPageRoute(
          builder: (_) => const Block3CardComplianceDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminReports:
        return MaterialPageRoute(
          builder: (_) => const Block4ReportsDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminSnapshots:
        return MaterialPageRoute(
          builder: (_) => const Block4SnapshotsDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminReportHealth:
        return MaterialPageRoute(
          builder: (_) => const Block4ReportHealthDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminTimeline:
        return MaterialPageRoute(
          builder: (_) => const Block4TimelineDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminPrompts:
        return MaterialPageRoute(
          builder: (_) => const Block5PromptsDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminPromptPacks:
        return MaterialPageRoute(
          builder: (_) => const Block5PromptPacksDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminAiMemory:
        return MaterialPageRoute(
          builder: (_) => const Block5AiMemoryDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminPromptHealth:
        return MaterialPageRoute(
          builder: (_) => const Block5PromptHealthDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminDna:
        return MaterialPageRoute(
          builder: (_) => const Block6DnaDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminCapsules:
        return MaterialPageRoute(
          builder: (_) => const Block6CapsulesDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminEvolution:
        return MaterialPageRoute(
          builder: (_) => const Block6EvolutionDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminRestoreReadiness:
        return MaterialPageRoute(
          builder: (_) => const Block6RestoreReadinessDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminPublishReadiness:
        return MaterialPageRoute(
          builder: (_) => const Block7PublishReadinessDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminSelfEvolution:
        return MaterialPageRoute(
          builder: (_) => const Block7SelfEvolutionDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminOsHealth:
        return MaterialPageRoute(
          builder: (_) => const Block7OsHealthDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminFinalGates:
        return MaterialPageRoute(
          builder: (_) => const Block7FinalGatesDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshop:
        return MaterialPageRoute(
          builder: (_) => const WorkshopOverviewPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopAiTeam:
        return MaterialPageRoute(
          builder: (_) => const WorkshopAiTeamPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopTools:
        return MaterialPageRoute(
          builder: (_) => const WorkshopToolsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopPresence:
        return MaterialPageRoute(
          builder: (_) => const WorkshopPresencePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopAccounts:
        return MaterialPageRoute(
          builder: (_) => const WorkshopAccountsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopPrompts:
        return MaterialPageRoute(
          builder: (_) => const WorkshopPromptsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopLibrary:
        return MaterialPageRoute(
          builder: (_) => const WorkshopLibraryPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopWorkstation:
        return MaterialPageRoute(
          builder: (_) => const WorkshopWorkstationPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopAssets:
        return MaterialPageRoute(
          builder: (_) => const WorkshopAssetsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOwner:
        return MaterialPageRoute(
          builder: (_) => const WorkshopOwnerDeskPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopGenerationTwo:
        return MaterialPageRoute(
          builder: (_) => const WorkshopGenerationTwoPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligence:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceEngineDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligenceRuntime:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceRuntimePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligenceSessions:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceSessionsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligenceContext:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceContextPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligenceMemory:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceMemoryPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligenceKnowledge:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceKnowledgePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligencePrompts:
        return MaterialPageRoute(
          builder: (_) => const IntelligencePromptsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligenceCapabilities:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceCapabilitiesPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopIntelligenceLogs:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceLogsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestration:
        return MaterialPageRoute(
          builder: (_) => const IntelligenceOrchestrationDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationTasks:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationTaskEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationWorkflows:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationWorkflowEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationMatching:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationCapabilityMatchingPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationDependencies:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationDependencyEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationQueues:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationQueueManagerPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationReviews:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationReviewEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationTimeline:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationTimelinePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationWorkspace:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationWorkspacePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopOrchestrationObservability:
        return MaterialPageRoute(
          builder: (_) => const OrchestrationObservabilityPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisions:
        return MaterialPageRoute(
          builder: (_) => const DecisionIntelligenceDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionEngine:
        return MaterialPageRoute(
          builder: (_) => const DecisionEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionRules:
        return MaterialPageRoute(
          builder: (_) => const ConstitutionalRuleEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionPolicies:
        return MaterialPageRoute(
          builder: (_) => const PolicyEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionApprovals:
        return MaterialPageRoute(
          builder: (_) => const ApprovalIntelligencePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionRisks:
        return MaterialPageRoute(
          builder: (_) => const RiskEvaluationEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionRecommendations:
        return MaterialPageRoute(
          builder: (_) => const RecommendationEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionEscalations:
        return MaterialPageRoute(
          builder: (_) => const EscalationEnginePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDecisionAnalytics:
        return MaterialPageRoute(
          builder: (_) => const DecisionAnalyticsPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopGovernanceOps:
        return MaterialPageRoute(
          builder: (_) => const GovernanceOperationsDashboardPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopGovernancePlaybooks:
        return MaterialPageRoute(
          builder: (_) => const GovernancePlaybooksPage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopDocumentGovernance:
        return MaterialPageRoute(
          builder: (_) => const DocumentGovernancePage(),
          settings: settings,
        );

      case Routes.commercialAdminWorkshopCorporateVault:
        return MaterialPageRoute(
          builder: (_) => const CorporateCommunicationVaultPage(),
          settings: settings,
        );

      case Routes.commercialV2Web:
        return MaterialPageRoute(
          builder: (_) => const CommercialV2WebShowcasePage(),
          settings: settings,
        );

      case Routes.accessibilityRoom:
        return MaterialPageRoute(
          builder: (_) => const AccessibilityRoomPage(),
          settings: settings,
        );

      case Routes.accessibilityLinks:
        return MaterialPageRoute(
          builder: (_) => const AccessibilityLinksPage(),
          settings: settings,
        );

      case Routes.accessibilityTools:
        return MaterialPageRoute(
          builder: (_) => const AccessibilityToolsPage(),
          settings: settings,
        );

      case Routes.accessibilitySuggestions:
        return MaterialPageRoute(
          builder: (_) => const AccessibilitySuggestionsPage(),
          settings: settings,
        );

      case Routes.accessibilityCommunityTools:
        return MaterialPageRoute(
          builder: (_) => const AccessibilityCommunityToolsPage(),
          settings: settings,
        );

      case Routes.accessibilityCheckin:
        return MaterialPageRoute(
          builder: (_) => const AccessibilityCheckinPage(),
          settings: settings,
        );

      case Routes.accessibilityMessageOfDay:
        return MaterialPageRoute(
          builder: (_) => const AccessibilityMessageOfDayPage(),
          settings: settings,
        );

      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );

      case Routes.addiction:
        return MaterialPageRoute(
          builder: (_) => const SupportEntryPage.addiction(),
          settings: settings,
        );

      case Routes.specialNeeds:
        return MaterialPageRoute(
          builder: (_) => const SupportEntryPage.specialNeeds(),
          settings: settings,
        );

      case Routes.supportIssueSelector:
        final args = settings.arguments;
        final supportType =
            args is Map ? args['supportType']?.toString() : null;
        if (supportType != 'recovery_support' &&
            supportType != 'family_support' &&
            supportType != 'client_support' &&
            supportType != 'center_support' &&
            supportType != 'clinician_support') {
          return MaterialPageRoute(
            builder: (ctx) => Scaffold(
              body: Center(
                child: Text(AppLocalizations.of(ctx)!.routeNotFound),
              ),
            ),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => SupportIssueSelectorPage(supportType: supportType!),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(AppLocalizations.of(context)!.routeNotFound),
            ),
          ),
          settings: settings,
        );
    }
  }
}

class _RouteAccessGate extends StatelessWidget {
  const _RouteAccessGate({
    required this.routeName,
    required this.allowedRoles,
    required this.child,
  });

  final String? routeName;
  final Set<String>? allowedRoles;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_RouteAccessDecision>(
      future: _resolveRouteAccess(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final decision = snapshot.data!;
        _roleGuardTrace(
          'route=$routeName '
          'signedIn=${FirebaseAuth.instance.currentUser != null && !FirebaseAuth.instance.currentUser!.isAnonymous} '
          'role=${decision.role ?? 'none'} '
          'allowed=${decision.allowed} '
          'redirect=${decision.redirectTarget}',
        );
        if (decision.redirectToUnifiedStart) {
          return const CommercialAccessPage();
        }

        if (decision.isBlocked) {
          return AccountBlockedPage(reason: decision.blockReason);
        }

        if (!decision.allowed) {
          final isArabic =
              Localizations.localeOf(context).languageCode.toLowerCase() ==
                  'ar';
          return Scaffold(
            appBar: AppBar(
              title: Text(isArabic
                  ? 'Ø§Ù„ÙˆØµÙˆÙ„ ØºÙŠØ± Ù…ØªØ§Ø­'
                  : 'Access unavailable'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_outline, size: 40),
                    const SizedBox(height: 12),
                    Text(
                      isArabic
                          ? 'Ù‡Ø°Ù‡ Ø§Ù„ØµÙØ­Ø© ØºÙŠØ± Ù…ØªØ§Ø­Ø© Ù„Ù‡Ø°Ø§ Ø§Ù„Ø­Ø³Ø§Ø¨.'
                          : 'This page is not available for this account.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.splash,
                          (route) => false,
                        );
                      },
                      child: Text(isArabic
                          ? 'Ø§Ù„Ø¹ÙˆØ¯Ø© Ù„Ù„Ù‚Ø§Ø¦Ù…Ø©'
                          : 'Back to menu'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return child;
      },
    );
  }

  Future<_RouteAccessDecision> _resolveRouteAccess() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.isAnonymous) {
      _roleGuardTrace(
        'route=$routeName '
        'signedIn=false '
        'allowed=false '
        'redirect=${Routes.commercialAccess}',
      );
      return const _RouteAccessDecision(
        allowed: false,
        redirectToUnifiedStart: true,
        redirectTarget: Routes.commercialAccess,
      );
    }

    final access = await AccountAccessService().resolve(user);
    final role = access.role;
    if (access.isBlocked) {
      _roleGuardTrace(
        'route=$routeName '
        'signedIn=true '
        'role=${role ?? 'none'} '
        'allowed=false '
        'redirect=blocked_account',
      );
      return _RouteAccessDecision(
        allowed: false,
        isBlocked: true,
        blockReason: access.blockReason,
        role: role,
        redirectTarget: 'blocked_account',
      );
    }

    final protectsCenterOrClinician =
        allowedRoles?.contains('clinician') == true ||
            allowedRoles?.contains('center') == true;
    final needsReadiness = protectsCenterOrClinician &&
        (access.role == 'clinician' || access.role == 'center');
    if (needsReadiness &&
        access.visibilityReadiness != VisibilityReadiness.ready) {
      _roleGuardTrace(
        'route=$routeName '
        'signedIn=true '
        'role=${role ?? 'none'} '
        'allowed=false '
        'redirect=visibility_incomplete '
        'role=${access.role} '
        'visibilityReadiness=${access.visibilityReadiness} '
        'readiness=${access.visibilityReadiness}',
      );
      return _RouteAccessDecision(
        allowed: false,
        isBlocked: true,
        blockReason:
            'Required declaration signals are incomplete. Visibility is not ready.',
        role: role,
        redirectTarget: 'visibility_incomplete',
      );
    }

    if (allowedRoles == null || allowedRoles!.isEmpty) {
      return _RouteAccessDecision(
        allowed: true,
        role: role,
        redirectTarget: 'none',
      );
    }

    final isAllowed = role != null && allowedRoles!.contains(role);
    return _RouteAccessDecision(
      allowed: isAllowed,
      role: role,
      redirectTarget: isAllowed ? 'none' : Routes.splash,
    );
  }
}

void _roleGuardTrace(String message) {
  if (!kDebugMode) return;
  debugPrint('ROLE_GUARD $message');
}

class _RouteAccessDecision {
  const _RouteAccessDecision({
    required this.allowed,
    this.redirectToUnifiedStart = false,
    this.isBlocked = false,
    this.blockReason = '',
    this.role,
    this.redirectTarget = 'none',
  });

  final bool allowed;
  final bool redirectToUnifiedStart;
  final bool isBlocked;
  final String blockReason;
  final String? role;
  final String redirectTarget;
}
