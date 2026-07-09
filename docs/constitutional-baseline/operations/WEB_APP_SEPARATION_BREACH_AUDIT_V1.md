# Web App Separation Breach Audit V1

Operation ID: OP-WEB-APP-SEPARATION-BREACH-AUDIT-V1
Operation Date: 2026-06-19
Execution Mode: AUDIT ONLY
Runtime Changes: none
Final Verdict: SEPARATION_BREACH_CONFIRMED

## Executive Summary

The dashboards did not move to the web. Clinician/provider and center dashboards/rooms are still protected app runtime surfaces behind Firebase Auth and role/readiness gates.

The web side is mostly registration and public portal, but the boundary is not clean in naming and navigation:

- `/register/provider` is a public portal route but opens `WebClinicianRegisterPortalPage`.
- `/register/clinician` is an app-style alias but opens the same web registration page.
- `/register/center` is an app-style alias but opens the web center registration page.
- Splash `Provider / Center Access` does not open registration, login, dashboards, or rooms; it opens public `[S] City` placeholder directory surfaces.
- Splash `Legacy Login` is the active shared login for owner, monitoring, registry, declaration reviewer, support observer, clinician/provider, and center roles.

Therefore the technical runtime boundary is mostly intact, but user-facing access labels and route naming create a separation breach.

## Files And Route Classification

| Route / File | Classification | Evidence | Notes |
| --- | --- | --- | --- |
| `/` / `PortalHomePage` | WEB_PUBLIC | `Routes.portalHome`, `PortalHomePage` | Public in-app web portal skeleton. |
| `/about` / `PortalAboutPage` | WEB_PUBLIC | `Routes.portalAbout` | Public portal page. |
| `/library` / `LibraryPage` via portal | WEB_PUBLIC | `Routes.portalLibrary` maps to `LibraryPage(returnRoute: Routes.portalHome)` | Public portal library entry. |
| `/contact` / `PortalContactPage` | WEB_PUBLIC | `Routes.portalContact` | Public portal contact page. |
| `/register/provider` | WEB_REGISTRATION / MISPLACED NAMING | `Routes.portalProviderRegister` maps to `WebClinicianRegisterPortalPage` | Says provider but runtime class is clinician registration. |
| `/register/clinician` | WEB_REGISTRATION / MISPLACED ALIAS | `Routes.clinicianRegister` maps to `WebClinicianRegisterPortalPage` | App-style alias opens web registration. |
| `/web/clinician/register` | WEB_REGISTRATION | `WebClinicianRegisterPortalPage` | Creates Firebase Auth user and `clinicians/{uid}`. |
| `/web/clinician/profile` | WEB_REGISTRATION | `WebClinicianProfilePage` | Updates registration/profile data in `clinicians/{uid}`. |
| `/web/clinician/documents` | WEB_REGISTRATION | `WebClinicianDocumentsPage` | Writes document/readiness data for registration. |
| `/register/center` | WEB_REGISTRATION / MISPLACED ALIAS | `Routes.centerRegister` maps to `WebCenterRegisterPortalPage` | App-style alias opens web registration. |
| `/web/center/register` | WEB_REGISTRATION | `WebCenterRegisterPortalPage` | Creates Firebase Auth user and `centers/{uid}`. |
| `/web/center/profile` | WEB_REGISTRATION | `WebCenterProfilePage` | Updates registration/profile data in `centers/{uid}`. |
| `/web/center/media` | WEB_REGISTRATION | `WebCenterMediaPage` | Registration media step. |
| `/web/center/pricing` | WEB_REGISTRATION | `WebCenterPricingPage` | Registration pricing/capability step. |
| `/web/center/documents` | WEB_REGISTRATION | `WebCenterDocumentsPage` | Registration document step. |
| `/web/register/success` | WEB_REGISTRATION | `WebRegistrationSuccessPage` | Completion page. |
| `/login` | APP_PROTECTED_RUNTIME gateway | `LoginPage` uses Firebase Auth and routes by role | Label `Legacy Login` is misleading. |
| `/clinician/room` | APP_PROTECTED_RUNTIME | `_protectedRoute`, `ClinicianRoomPage` | Active clinician/provider room; reads `clinicians`, writes profile change requests. |
| `/clinician/profile-edit-request` | APP_PROTECTED_RUNTIME | `_protectedRoute`, `ClinicianProfileEditRequestPage` | Protected app runtime update request. |
| `/clinician/chat-inbox` | APP_PROTECTED_RUNTIME | `_RouteAccessGate`, `ClinicianChatInboxPage` | Protected clinician runtime. |
| `/center/dashboard` | APP_PROTECTED_RUNTIME / COMMERCIAL_LEGACY_RUNTIME | `_protectedRoute`, `CenterDashboardPage` | Login landing for center role; reads `centers`. |
| `/center/room` | APP_PROTECTED_RUNTIME / COMMERCIAL_LEGACY_RUNTIME | `_protectedRoute`, `CenterRoomPage` | Protected center workspace; writes profile change requests. |
| `/center/profile-edit-request` | APP_PROTECTED_RUNTIME | `_protectedRoute`, `CenterProfileEditRequestPage` | Protected app runtime update request. |
| `/s/city/providers` | WEB_PUBLIC / PLACEHOLDER | `SWebSurfacePage` provider directory placeholder | Public discovery placeholder, not account access. |
| `/s/city/centers` | WEB_PUBLIC / PLACEHOLDER | `SWebSurfacePage` center directory placeholder | Public discovery placeholder, not account access. |
| `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart` | WEB_PUBLIC | Public portal pages and nav | Public shell, but nav label Providers routes to registration. |
| `lib/features/web_registration/**` | WEB_REGISTRATION | Firebase registration and declaration readiness steps | Not dashboards, but writes provider/center records. |
| `lib/features/clinician/presentation/pages/clinician_room_page.dart` | APP_PROTECTED_RUNTIME | Firebase Auth current user and Firestore `clinicians` streams | Active app runtime room. |
| `lib/features/centers/presentation/pages/center_dashboard_page.dart` | APP_PROTECTED_RUNTIME / COMMERCIAL_LEGACY_RUNTIME | Firebase Auth current user and Firestore `centers` reads | Active center dashboard, not web. |
| `lib/features/centers/presentation/pages/center_room_page.dart` | APP_PROTECTED_RUNTIME / COMMERCIAL_LEGACY_RUNTIME | Firestore `centers` and `center_profile_change_requests` | Active center room/workspace. |
| `lib/features/splash/presentation/pages/splash_page.dart` | MISPLACED LABELS | Provider/Center button opens directories, Legacy Login opens shared account login | User-facing separation breach. |

## Firebase Collection Map

| Surface | Collections / Firebase use | Classification |
| --- | --- | --- |
| Web clinician registration | Firebase Auth account creation; `clinicians/{uid}` writes | WEB_REGISTRATION |
| Web center registration | Firebase Auth account creation; `centers/{uid}` writes | WEB_REGISTRATION |
| Web center profile/media/pricing/documents | `centers/{uid}` updates | WEB_REGISTRATION |
| Web clinician profile/documents | `clinicians/{uid}` updates | WEB_REGISTRATION |
| Login | Firebase Auth sign-in; `AccountAccessService` role/readiness resolution | APP_PROTECTED_RUNTIME gateway |
| Clinician room | Firebase Auth current user; `clinicians/{uid}` stream; `clinician_profile_change_requests` | APP_PROTECTED_RUNTIME |
| Center dashboard | Firebase Auth current user; `centers` reads | APP_PROTECTED_RUNTIME |
| Center room | Firebase Auth current user; `centers` stream; `center_profile_change_requests` writes | APP_PROTECTED_RUNTIME |
| Public portal | No direct Firestore in portal home/about; contact opens external draft behavior | WEB_PUBLIC |
| Splash provider/center directories | No direct Firebase; placeholder route pages | WEB_PUBLIC / PLACEHOLDER |

## Direct Answers

### 1. Did dashboards move to web?

No. Dashboards and rooms remain app runtime:

- Clinician/provider app runtime: `/clinician/room`
- Center app runtime landing: `/center/dashboard`
- Center workspace: `/center/room`

### 2. Are web registration pages only registration/public profile?

Mostly yes, but with an important nuance:

- Web registration pages are registration/profile/media/pricing/document declaration steps.
- They write to the same Firestore role collections used later by app runtime.
- They are not dashboards.
- They are not public profile display pages in the marketplace sense; they are registration/profile declaration steps.

### 3. Are clinician/center dashboards still app runtime?

Yes.

- `ClinicianRoomPage` is protected app runtime.
- `CenterDashboardPage` is protected app runtime.
- `CenterRoomPage` is protected app runtime.

### 4. Which files violate separation naming?

| File / Route | Issue |
| --- | --- |
| `Routes.portalProviderRegister = '/register/provider'` | Provider route opens clinician registration class. |
| `Routes.clinicianRegister = '/register/clinician'` | App alias opens web registration page. |
| `Routes.centerRegister = '/register/center'` | App alias opens web registration page. |
| `portal_skeleton_pages.dart` nav item `Providers` | Opens `/register/provider`, not provider directory. |
| `splash_page.dart` label `Provider / Center Access` | Opens public directory placeholders, not account access. |
| `splash_page.dart` label `Legacy Login` | Opens active shared account login, not only legacy login. |
| `CenterDashboardPage` / `CenterRoomPage` naming split | Center login lands on dashboard, room is a secondary protected workspace. Requires commercial cleanup decision. |

### 5. Which Splash buttons are mislabeled?

| Button | Current behavior | Label issue |
| --- | --- | --- |
| Provider / Center Access | Opens public provider/center directory placeholders | Should say Provider / Center Directory unless it is changed to login/register gateway. |
| Legacy Login | Opens active shared account login for many roles | Should say Account Login / Existing Account Login / Provider-Center-Owner Login. |

### 6. What must be fixed now vs later?

Fix now:

- Rename Splash `Legacy Login`.
- Rename Splash `Provider / Center Access` or change it in a separate approved implementation to a true provider/center gateway.
- Document that `/s/city/providers` and `/s/city/centers` are public placeholders.

Fix later / commercial cleanup:

- Decide provider vs clinician naming doctrine.
- Decide whether `/register/provider` should remain an alias to clinician registration.
- Decide whether center login should land on `/center/dashboard` or `/center/room`.
- Decide whether public provider/center profile pages should be separate from registration forms.
- Separate marketplace/public profile display from registration declaration flow.

Do not touch until Owner approval:

- Auth/role route guards.
- Clinician room runtime.
- Center dashboard/runtime.
- Firestore registration collection writes.
- Declaration reviewer/visibility readiness flow.

## Boundary Assessment

| Boundary | Status | Reason |
| --- | --- | --- |
| Web portal vs app runtime | PARTIAL_CLEAR | Portal is public, but nav includes registration aliases. |
| Web registration vs app dashboard | MOSTLY_CLEAR | Registration creates/updates role docs; dashboards remain app runtime. |
| Provider naming vs clinician runtime | BREACH | Provider route and clinician class naming are mixed. |
| Center registration vs center runtime | CLEAR_WITH_ALIAS_RISK | Registration is web, runtime is protected app, but `/register/center` alias can look like app route. |
| Splash access semantics | BREACH | Labels do not match actual destinations. |

## Final Recommendation

The separation breach is not that dashboards moved to web. They did not.

The breach is semantic and navigational:

- public directory placeholders are labeled as access,
- active shared account login is labeled legacy,
- provider and clinician names are used interchangeably,
- public profile/register/discovery routes are not clearly separated in naming.

The next implementation card should be limited to label and gateway clarification only, unless Owner separately approves deeper commercial cleanup.

## Final Verdict

SEPARATION_BREACH_CONFIRMED
