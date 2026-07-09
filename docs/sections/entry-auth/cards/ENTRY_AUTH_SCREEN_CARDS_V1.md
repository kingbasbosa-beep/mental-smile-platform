# Entry/Auth Screen Cards V1

Operation: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Date: 2026-06-23

## EA-SCREEN-001 - Splash Page

- Card ID: EA-SCREEN-001
- Item type: Screen
- Screen owner: Entry/Auth
- Current file: `lib/features/splash/presentation/pages/splash_page.dart`
- Current route: `/splash`
- Current visible label: Splash gateway buttons
- Current purpose: First app gateway for quick residential access, accessibility access, provider/center access, and official website access.
- Expected mission: Provide public entry points without login.
- Opens / calls / depends on: `Routes.clientRoom`, `Routes.accessibilityRoom`, `Routes.commercialV2Start`, `Routes.portalHome`, `LocaleStorage`, `localeProvider`.
- Auth required? No
- Firebase required? No direct Firebase call.
- YAML asset required? `assets/branding/splash/`, `assets/branding/language/`
- Signal candidate? Yes, future entry button intent signals.
- Accessibility requirement: Language toggle and button labels should remain readable and audio-ready later.
- Status: ACTIVE
- Evidence: `SplashPage` is registered by `Routes.splash`; `MaterialApp.initialRoute` is `Routes.splash`.
- Owner decision needed? No
- Notes: ARCHIVE_ONLY Login is not present on Splash.

## EA-SCREEN-002 - Login Archive Page

- Card ID: EA-SCREEN-002
- Item type: Screen
- Screen owner: Entry/Auth archive only
- Current file: `lib/features/auth/presentation/pages/login_page.dart`
- Current route: `/login`
- Current visible label: Email, Password, Login, register link
- Current purpose: Previous account login and role-based routing.
- Expected mission: Retained as archive-only evidence after Unified Start migration.
- Opens / calls / depends on: `FirebaseAuth.signInWithEmailAndPassword`, `AccountAccessService.resolve`, protected role destinations.
- Auth required? It creates an authenticated session.
- Firebase required? Firebase Auth and Firestore role documents/claims.
- YAML asset required? `assets/branding/login/`
- Signal candidate? Yes, future login attempt/success/failure operational signals.
- Accessibility requirement: Fields and controls should retain labels, focus order, and readable error messages.
- Status: ARCHIVE_ONLY
- Evidence: `Routes.login` opens `LoginPage`; login submit calls `_login()`.
- Owner decision needed? No
- Notes: `/login` is no longer the official Entry/Auth auth route.

## EA-SCREEN-003 - Commercial V2 Start Destination Reference

- Card ID: EA-SCREEN-003
- Item type: Destination screen reference
- Screen owner: Entry/Auth as Unified Start, runtime file shared with Commercial V2
- Current file: `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- Current route: `/commercial-v2/start`
- Current visible label: Commercial V2 account start controls
- Current purpose: Unified authentication entry point.
- Expected mission: Provider / Center / Owner authentication entry from Splash.
- Opens / calls / depends on: Firebase Auth, `commercial_v2_profiles`, `Routes.commercialV2Owner`.
- Auth required? Public screen; account actions require Firebase Auth.
- Firebase required? Yes.
- YAML asset required? `assets/branding/commercial_v2/`
- Signal candidate? Yes, future commercial entry signals.
- Accessibility requirement: Compact help and language controls should remain available.
- Status: ACTIVE
- Evidence: Splash Provider / Center Access opens `Routes.commercialV2Start`; router returns `CommercialV2StartPage`.
- Owner decision needed? No
- Notes: Entry/Auth owns auth entry responsibility only. Profile creation/editing and Commercial V2 profile management remain outside Entry/Auth.

## EA-SCREEN-004 - Official Website / Web Portal Destination Reference

- Card ID: EA-SCREEN-004
- Item type: Destination screen reference
- Screen owner: Public Web Portal, opened by Entry/Auth Splash
- Current file: `lib/app/router/app_router.dart`
- Current route: `/`
- Current visible label: Official Website
- Current purpose: Open the public website route from Splash.
- Expected mission: Send users to the official public website, not owner/admin/commercial dashboard routes.
- Opens / calls / depends on: `Routes.portalHome`, `PortalHomePage`, Firebase Hosting config.
- Auth required? No
- Firebase required? No runtime Auth requirement. Hosting config is relevant for deployed website identity.
- YAML asset required? No Entry/Auth-specific asset beyond Splash button rendering.
- Signal candidate? Yes, future external/public website intent signal.
- Accessibility requirement: Button label should remain localized and readable.
- Status: ACTIVE
- Evidence: Splash button calls `Navigator.pushReplacementNamed(Routes.portalHome)`. `Routes.portalHome` is `/` and router returns `PortalHomePage`.
- Owner decision needed? Yes
- Notes: Local public route exists. Hosted public URL still requires Owner verification.
