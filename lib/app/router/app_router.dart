import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_smile_os/core/auth/account_access_service.dart';
import 'package:mental_smile_os/core/auth/presentation/pages/account_blocked_page.dart';
import 'package:mental_smile_os/core/visibility/visibility_readiness.dart';
import 'package:mental_smile_os/l10n/app/app_section_localizations.dart';

import 'routes.dart';

import 'package:mental_smile_os/features/library/presentation/pages/library_page.dart';
import 'package:mental_smile_os/features/library/presentation/pages/library_provider_content_pages.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/data/knowledge_card_repository.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/domain/models/knowledge_card.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/presentation/pages/knowledge_article_viewer_page.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/presentation/pages/knowledge_cards_page.dart';
import 'package:mental_smile_os/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart';
import 'package:mental_smile_os/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart';
import 'package:mental_smile_os/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart';
import 'package:mental_smile_os/features/generation2_mobile_entry/presentation/pages/generation2_mobile_lite_client_page.dart';
import 'package:mental_smile_os/features/generation2_mobile_entry/presentation/pages/generation2_mobile_login_selection_page.dart';
import 'package:mental_smile_os/features/generation2_mobile_entry/presentation/pages/generation2_splash_page.dart';
import 'package:mental_smile_os/features/splash/presentation/pages/splash_page.dart';
import 'package:mental_smile_os/features/app_exit/presentation/pages/app_exit_social_links_page.dart';
import 'package:mental_smile_os/features/residential/presentation/pages/residential_exit_social_portal_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_checkin_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_community_tools_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_links_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_suggestions_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_tools_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_room_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_login_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_professional_library_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_professional_profile_clean_layout_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/center_room_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_access_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_public_accounts_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_register_pages.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_room_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/commercial_shared_assistive_tools_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_professional_library_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_professional_profile_clean_layout_page.dart';
import 'package:mental_smile_os/features/commercial/presentation/pages/specialist_login_page.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart';
import 'package:mental_smile_os/features/client/presentation/pages/client_room_page.dart';
import 'package:mental_smile_os/shared/capsule_runtime/commercial_test_port.dart';
import 'package:mental_smile_os/shared/capsule_runtime/library_test_port.dart';
import 'package:mental_smile_os/shared/capsule_runtime/residential_test_port.dart';

const String _roleClinician = 'clinician';
const String _roleCenter = 'center';

class AppRouter {
  static const Set<String> _clinicianRoutes = {
    Routes.commercialRoom,
    Routes.commercialSpecialistProfessionalProfile,
    Routes.commercialSpecialistProfessionalLibrary,
    Routes.generation2MobileSpecialistRoom,
  };

  static const Set<String> _centerRoutes = {
    Routes.commercialCenterRoom,
    Routes.commercialCenterProfessionalProfile,
    Routes.commercialCenterProfessionalLibrary,
    Routes.generation2MobileCenterRoom,
  };

  static const Set<String> _clinicianAndCenterRoutes = {
    Routes.commercialAssistiveTools,
  };

  static bool _requiresSignedInNonAnonymous(RouteSettings settings) {
    switch (settings.name) {
      case Routes.blockedAccount:
        return true;
      default:
        return false;
    }
  }

  static Set<String>? _requiredRoles(String? routeName) {
    if (routeName == null) return null;
    if (_clinicianRoutes.contains(routeName)) return {_roleClinician};
    if (_centerRoutes.contains(routeName)) return {_roleCenter};
    if (_clinicianAndCenterRoutes.contains(routeName)) {
      return {_roleClinician, _roleCenter};
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

  static String _libraryReturnRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (args is Map) {
      final value = args['returnRoute'];
      if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
    }
    return Routes.splash;
  }

  static String? _knowledgeCardId(RouteSettings settings) {
    final args = settings.arguments;
    if (args is KnowledgeCard) return args.id;
    if (args is Map) {
      final value = args['cardId'];
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

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (_) => const CommercialV2WebShowcasePage(),
        settings: settings,
      );
    }

    final needsNonAnonymous = _requiresSignedInNonAnonymous(settings);
    if (needsNonAnonymous && (currentUser == null || currentUser.isAnonymous)) {
      return _redirectToUnifiedStart(settings);
    }

    switch (settings.name) {
      case Routes.webLibrary:
        return MaterialPageRoute(
          builder: (_) => LibraryPage(
            initialCategoryKey: _libraryCategoryKey(settings),
            returnRoute: _libraryReturnRoute(settings),
          ),
          settings: settings,
        );

      case Routes.knowledgeCards:
        return MaterialPageRoute(
          builder: (_) => const KnowledgeCardsPage(),
          settings: settings,
        );

      case Routes.knowledgeArticleViewer:
        final args = settings.arguments;
        if (args is KnowledgeCard) {
          return MaterialPageRoute(
            builder: (_) => KnowledgeArticleViewerPage(card: args),
            settings: settings,
          );
        }
        final cardId = _knowledgeCardId(settings);
        return MaterialPageRoute(
          builder: (_) => _KnowledgeArticleRouteLoader(cardId: cardId),
          settings: settings,
        );

      case Routes.libraryProviderSpecialists:
        return MaterialPageRoute(
          builder: (_) => LibrarySpecialistsPage(
            returnRoute: _libraryReturnRoute(settings),
          ),
          settings: settings,
        );

      case Routes.libraryProviderCenters:
        return MaterialPageRoute(
          builder: (_) => LibraryCentersPage(
            returnRoute: _libraryReturnRoute(settings),
          ),
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

      case Routes.commercialSpecialistRegister:
        return MaterialPageRoute(
          builder: (_) => const SpecialistRegisterPage(),
          settings: settings,
        );

      case Routes.commercialCenterLogin:
        return MaterialPageRoute(
          builder: (_) => const CenterLoginPage(),
          settings: settings,
        );

      case Routes.commercialCenterRegister:
        return MaterialPageRoute(
          builder: (_) => const CenterRegisterPage(),
          settings: settings,
        );

      case Routes.commercialRoom:
        return _protectedRoute(
          child: const CommercialRoomPage(),
          settings: settings,
        );

      case Routes.commercialSpecialistProfessionalProfile:
        return _protectedRoute(
          child: const SpecialistProfessionalProfileCleanLayoutPage(),
          settings: settings,
        );

      case Routes.commercialSpecialistProfessionalLibrary:
        return _protectedRoute(
          child: const SpecialistProfessionalLibraryPage(),
          settings: settings,
        );

      case Routes.commercialCenterRoom:
        return _protectedRoute(
          child: const CenterRoomPage(),
          settings: settings,
        );

      case Routes.commercialCenterProfessionalProfile:
        return _protectedRoute(
          child: const CenterProfessionalProfileCleanLayoutPage(),
          settings: settings,
        );

      case Routes.commercialCenterProfessionalLibrary:
        return _protectedRoute(
          child: const CenterProfessionalLibraryPage(),
          settings: settings,
        );

      case Routes.commercialAssistiveTools:
        return _protectedRoute(
          child: const CommercialSharedAssistiveToolsPage(),
          settings: settings,
        );

      case Routes.commercialPublicAccounts:
        return MaterialPageRoute(
          builder: (_) => const CommercialPublicAccountsPage(),
          settings: settings,
        );

      case Routes.commercialV2Web:
        return MaterialPageRoute(
          builder: (_) => const CommercialV2WebShowcasePage(),
          settings: settings,
        );

      case Routes.landingPreview:
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

      case Routes.residentialCapsuleTest:
        return MaterialPageRoute(
          builder: (_) => const ResidentialCapsuleTestRoute(),
          settings: settings,
        );

      case Routes.commercialCapsuleTest:
        return MaterialPageRoute(
          builder: (_) => const CommercialCapsuleTestRoute(),
          settings: settings,
        );

      case Routes.libraryCapsuleTest:
        return MaterialPageRoute(
          builder: (_) => const LibraryCapsuleTestRoute(),
          settings: settings,
        );

      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const Generation2SplashPage(),
          settings: settings,
        );

      case Routes.legacySplash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );

      case Routes.generation2MobileLiteClient:
        return MaterialPageRoute(
          builder: (_) => const Generation2MobileLiteClientPage(),
          settings: settings,
        );

      case Routes.generation2MobileLoginSelection:
        return MaterialPageRoute(
          builder: (_) => const Generation2MobileLoginSelectionPage(),
          settings: settings,
        );

      case Routes.generation2MobileClientRoom:
        return MaterialPageRoute(
          builder: (_) => const Generation2MobileClientRoomPage(),
          settings: settings,
        );

      case Routes.generation2MobileSpecialistRoom:
        return _protectedRoute(
          child: const Generation2MobileSpecialistRoomPage(),
          settings: settings,
        );

      case Routes.generation2MobileCenterRoom:
        return _protectedRoute(
          child: const Generation2MobileCenterRoomPage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(AppSectionLocalizations.of(context).routeNotFound),
            ),
          ),
          settings: settings,
        );
    }
  }
}

class _KnowledgeArticleRouteLoader extends StatelessWidget {
  _KnowledgeArticleRouteLoader({required this.cardId});

  final String? cardId;
  final KnowledgeCardRepository _repository = AssetKnowledgeCardRepository();

  @override
  Widget build(BuildContext context) {
    if (cardId == null || cardId!.trim().isEmpty) {
      return _RouteNotFoundMessage(
          message: AppSectionLocalizations.of(context).routeNotFound);
    }

    return FutureBuilder<KnowledgeCard?>(
      future: _repository.findById(cardId!),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFFFFD47A)),
            ),
          );
        }

        final card = snapshot.data;
        if (card == null) {
          return _RouteNotFoundMessage(
            message: AppSectionLocalizations.of(context).routeNotFound,
          );
        }

        return KnowledgeArticleViewerPage(
          card: card,
          repository: _repository,
        );
      },
    );
  }
}

class _RouteNotFoundMessage extends StatelessWidget {
  const _RouteNotFoundMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(message)),
    );
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
