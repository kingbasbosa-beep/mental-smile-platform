# Entry/Auth Button Cards V1

Operation: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Date: 2026-06-23

## Splash Controls

### EA-BUTTON-001 - Splash Language Toggle

- Item type: Visible control
- Screen owner: Splash
- Current file: `lib/features/splash/presentation/pages/splash_page.dart`
- Current route: `/splash`
- Current visible label: EN/AR icon fallback
- Current purpose: Toggle locale between Arabic and English.
- Expected mission: Let user choose interface language before choosing an entry path.
- Opens / calls / depends on: `LocaleStorage().write(nextCode)`, `localeProvider`.
- Auth required? No
- Firebase required? No
- YAML asset required? `assets/branding/language/en_gold.png`
- Signal candidate? Yes
- Accessibility requirement: Needs clear tooltip/speaker placeholder in future pass.
- Status: ACTIVE
- Evidence: `_toggleLocale` writes locale and updates provider.
- Owner decision needed? No

### EA-BUTTON-002 - Quick Access

- Item type: Button
- Screen owner: Splash
- Current file: `lib/features/splash/presentation/pages/splash_page.dart`
- Current route: `/splash`
- Current visible label: Quick Access / الوصول السريع
- Current purpose: Open Client Room.
- Expected mission: Residential client/session access.
- Opens / calls / depends on: `Routes.clientRoom` -> `/client/room`
- Auth required? No
- Firebase required? No direct dependency.
- YAML asset required? Splash background only.
- Signal candidate? Yes
- Accessibility requirement: Needs icon + readable label.
- Status: ACTIVE
- Evidence: Button calls `Navigator.of(context).pushNamed(Routes.clientRoom)`.
- Owner decision needed? No

### EA-BUTTON-003 - Accessibility Access

- Item type: Button
- Screen owner: Splash
- Current file: `lib/features/splash/presentation/pages/splash_page.dart`
- Current route: `/splash`
- Current visible label: Accessibility Access / وصول إمكانية الاستخدام
- Current purpose: Open Accessibility Room.
- Expected mission: Residential accessibility entry.
- Opens / calls / depends on: `Routes.accessibilityRoom` -> `/accessibility/room`
- Auth required? No
- Firebase required? No direct dependency.
- YAML asset required? Splash background only.
- Signal candidate? Yes
- Accessibility requirement: High priority for visual/audio-ready label.
- Status: ACTIVE
- Evidence: Button calls `Navigator.of(context).pushNamed(Routes.accessibilityRoom)`.
- Owner decision needed? No

### EA-BUTTON-004 - Provider / Center Access

- Item type: Button
- Screen owner: Splash
- Current file: `lib/features/splash/presentation/pages/splash_page.dart`
- Current route: `/splash`
- Current visible label: Provider / Center / Owner Access / دخول مقدم الخدمة / المركز / المالك
- Current purpose: Open Unified Start.
- Expected mission: Open Unified Start for Provider / Center / Owner authentication only.
- Opens / calls / depends on: `Routes.commercialV2Start` -> `/commercial-v2/start`
- Auth required? No for entry; account actions require Auth.
- Firebase required? Destination uses Firebase Auth and Firestore profile shell.
- YAML asset required? Splash background, destination uses `assets/branding/commercial_v2/`.
- Signal candidate? Yes
- Accessibility requirement: Needs clear role-neutral label.
- Status: ACTIVE
- Evidence: Button calls `Navigator.of(context).pushNamed(Routes.commercialV2Start)`.
- Owner decision needed? No
- Unified Start migration note: `/commercial-v2/start` is now the official Entry/Auth unified authentication entry.

### EA-BUTTON-005 - Official Website

- Item type: Button
- Screen owner: Splash
- Current file: `lib/features/splash/presentation/pages/splash_page.dart`
- Current route: `/splash`
- Current visible label: Official Website / Arabic localized label
- Current purpose: Open the verified Firebase-hosted official website externally.
- Expected mission: Official public website only.
- Opens / calls / depends on: `url_launcher` -> `https://mental-smile-platform.web.app`
- Auth required? No
- Firebase required? No Auth. Firebase Hosting config relevant for deployed website.
- YAML asset required? Splash background only.
- Signal candidate? Yes
- Accessibility requirement: Needs clear public website label.
- Status: ACTIVE
- Evidence: Button calls `launchUrl` with `LaunchMode.externalApplication`.
- Owner decision needed? No
- Notes: The button does not open `/`, Owner, Commercial dashboard, or Monitoring routes.

## Login Archive Controls

### EA-BUTTON-006 - Login Email Field

- Item type: Input field
- Screen owner: Login
- Current file: `lib/features/auth/presentation/pages/login_page.dart`
- Current route: `/login`
- Current visible label: localized email label
- Current purpose: Collect account email.
- Expected mission: Firebase Auth email credential.
- Opens / calls / depends on: `_emailController`, `_normalizeEmail`
- Auth required? No before submit.
- Firebase required? Used by Firebase Auth submit.
- YAML asset required? Login background.
- Signal candidate? No immediate signal; possible future validation signal.
- Accessibility requirement: Must keep semantic label.
- Status: ARCHIVE_ONLY
- Evidence: `_login()` passes normalized email to `signInWithEmailAndPassword`.
- Owner decision needed? No

### EA-BUTTON-007 - Login Password Field

- Item type: Input field
- Screen owner: Login
- Current file: `lib/features/auth/presentation/pages/login_page.dart`
- Current route: `/login`
- Current visible label: localized password label
- Current purpose: Collect account password.
- Expected mission: Firebase Auth password credential.
- Opens / calls / depends on: `_passwordController`
- Auth required? No before submit.
- Firebase required? Used by Firebase Auth submit.
- YAML asset required? Login background.
- Signal candidate? No
- Accessibility requirement: Must keep semantic label and obscure behavior.
- Status: ARCHIVE_ONLY
- Evidence: `_login()` passes password to `signInWithEmailAndPassword`.
- Owner decision needed? No

### EA-BUTTON-008 - Password Visibility Toggle

- Item type: Icon button/control
- Screen owner: Login
- Current file: `lib/features/auth/presentation/pages/login_page.dart`
- Current route: `/login`
- Current visible label: visibility icon
- Current purpose: Toggle password visibility.
- Expected mission: Local UI assistance only.
- Opens / calls / depends on: `_obscurePassword`
- Auth required? No
- Firebase required? No
- YAML asset required? No
- Signal candidate? No
- Accessibility requirement: Needs tooltip/semantic label in future accessibility pass.
- Status: ARCHIVE_ONLY
- Evidence: Password field suffix toggles `_obscurePassword`.
- Owner decision needed? No

### EA-BUTTON-009 - Login Submit

- Item type: Button
- Screen owner: Login
- Current file: `lib/features/auth/presentation/pages/login_page.dart`
- Current route: `/login`
- Current visible label: localized login submit
- Current purpose: Sign in and route by role/readiness.
- Expected mission: Auth gateway for existing accounts.
- Opens / calls / depends on: `_login()`, Firebase Auth, `AccountAccessService.resolve`.
- Auth required? Creates authenticated session.
- Firebase required? Yes.
- YAML asset required? Login background.
- Signal candidate? Yes, future auth attempt/success/failure signal.
- Accessibility requirement: Needs clear busy/error states.
- Status: ARCHIVE_ONLY
- Evidence: `_login()` signs in, resolves access state, and navigates with `pushNamedAndRemoveUntil`.
- Owner decision needed? No

### EA-BUTTON-010 - Register Link

- Item type: Text link
- Screen owner: Login
- Current file: `lib/features/auth/presentation/pages/login_page.dart`
- Current route: `/login`
- Current visible label: localized register prompt/link
- Current purpose: Send users toward registration/language entry.
- Expected mission: Account creation path, if retained in Entry/Auth.
- Opens / calls / depends on: `Routes.language` -> `/language`
- Auth required? No
- Firebase required? No direct dependency.
- YAML asset required? Login background.
- Signal candidate? Yes, future registration intent signal.
- Accessibility requirement: Link must remain keyboard/screen-reader discoverable.
- Status: ARCHIVE_ONLY
- Evidence: Login register link calls `Navigator.of(context).pushNamed(Routes.language)`.
- Owner decision needed? Yes
- Notes: Correct registration destination was not confirmed in this operation, so no route change was made.

## Absent Controls

- Login back/cancel control: Not present in archived Login page.
- Login language control: Not present in archived Login page.

## Unified Start Controls

Unified Start route: `/commercial-v2/start`

These controls are owned by Entry/Auth as authentication entry controls. Their broader runtime implementation remains in the shared Commercial V2 file.

| Card ID | Control | Mission | Status |
|---|---|---|---|
| EA-BUTTON-011 | Phone field | Required identity input for Entry/Auth doctrine | ACTIVE |
| EA-BUTTON-012 | Password field | Required authentication secret | ACTIVE |
| EA-BUTTON-013 | Login button | Authenticate existing Provider / Center / Owner user | ACTIVE |
| EA-BUTTON-014 | Create Account button | Start registration with Phone + Password doctrine | ACTIVE |
| EA-BUTTON-015 | Language toggle | Switch visible labels between English and Arabic | ACTIVE |
| EA-BUTTON-016 | Cancel button | Exit Unified Start safely back to Splash or previous route | ACTIVE |
