# Splash Access Map And Rooms Inventory Audit V1

Operation ID: OP-SPLASH-ACCESS-MAP-ROOMS-INVENTORY-AUDIT-V1
Operation Date: 2026-06-19
Execution Mode: AUDIT ONLY
Runtime Changes: none
Final Verdict: SPLASH_ACCESS_MAP_HAS_LEGACY_CONFUSION

## Executive Summary

The Splash screen is active and currently opens five entry paths:

- Quick Access opens the active Client Room at `#/client/room`.
- Accessibility Access opens the active Accessibility Room at `#/accessibility/room`.
- Provider / Center Access opens a bottom sheet, then sends users to public `[S] City` provider/center directory placeholders, not registration or login.
- Legacy Login opens the shared Firebase login page at `#/login`.
- Web Portal opens the in-app public web portal route `#/`, not an external website.

The main confusion is naming and expectation mismatch:

- `Provider / Center Access` sounds like login/register access, but currently opens public discovery placeholders.
- `Legacy Login` is not only legacy; it is the active shared login for owner, monitoring, registry, declaration reviewer, support observer, clinician/provider, and center roles.
- Owner Room exists but is hidden from Splash and protected by owner role.
- Strategic capability exists as `Strategic Memory` inside the Owner District, not as a standalone Strategic Room.
- Provider/clinician and center runtime rooms exist, but they are reached after login and role/readiness checks, not from the Splash provider/center button.

## Sources Inspected

- `lib/features/splash/presentation/pages/splash_page.dart`
- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`
- `lib/features/auth/presentation/pages/login_page.dart`
- `lib/features/web_registration/presentation/pages/web_clinician_register_portal_page.dart`
- `lib/features/web_registration/presentation/pages/web_center_register_portal_page.dart`
- `lib/features/web_registration/presentation/pages/web_clinician_profile_page.dart`
- `lib/features/web_registration/presentation/pages/web_center_profile_page.dart`
- `lib/features/clinician/presentation/pages/clinician_room_page.dart`
- `lib/features/centers/presentation/pages/center_dashboard_page.dart`
- `lib/features/centers/presentation/pages/center_room_page.dart`
- `lib/features/s_owner/presentation/pages/s_owner_district_page.dart`
- `lib/features/s_capital/presentation/pages/s_signal_monitoring_room_page.dart`
- `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart`
- `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart`
- `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart`

## Splash Button Map

| Button label | Current route/action | Destination page | File path | Active? | Implemented? | Legacy? | Placeholder? | Login required? | Firebase/Auth? | Writes data? | Recommendation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Quick Access | `Navigator.pushNamed(Routes.clientRoom)` | `ClientRoomPage` | `lib/features/client/presentation/pages/client_room_page.dart` | Yes | Yes | No active legacy route, session-first room | No | No | No direct auth gate | No evidence of writes from Splash path | KEEP |
| Accessibility Access | `Navigator.pushNamed(Routes.accessibilityRoom)` | `AccessibilityRoomPage` | `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | Yes | Yes | No | No | No | No direct auth gate | No Firebase/storage writes in room controls audited recently | KEEP |
| Provider / Center Access | Opens bottom sheet; Providers -> `Routes.sCityProviders`; Centers -> `Routes.sCityCenters` | `SWebSurfacePage` placeholder | `lib/app/router/app_router.dart` via `_sWebSurfaceRoute` | Yes | Placeholder surface | No | Yes | No | No | No | RENAME or OWNER_DECISION |
| Legacy Login | `pushReplacementNamed(Routes.login)` | `LoginPage` | `lib/features/auth/presentation/pages/login_page.dart` | Yes | Yes | Label is legacy/confusing, route is active shared login | No | No before page; login uses Firebase | Yes, Firebase Auth sign-in | Auth read/sign-in only | RENAME |
| Web Portal | `pushReplacementNamed(Routes.portalHome)` | `PortalHomePage` | `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart` | Yes | Public skeleton | No | Partly skeleton | No | No direct auth | Contact opens external draft behavior; route itself no database write | KEEP or RENAME Public Portal |

## Splash Provider / Center Bottom Sheet

The bottom sheet contains only:

- Providers -> `Routes.sCityProviders` -> public provider directory placeholder.
- Centers -> `Routes.sCityCenters` -> public center directory placeholder.

It does not expose:

- `Routes.webClinicianRegister`
- `Routes.webCenterRegister`
- `Routes.login`
- `Routes.clinicianRoom`
- `Routes.centerDashboard`
- `Routes.centerRoom`

Finding: the label `Provider / Center Access` currently implies account access, but the implementation provides public discovery placeholders.

## Owner Room

| Item | Evidence |
| --- | --- |
| Primary owner route | `/s/owner` via `Routes.sOwnerHome` |
| Owner room route | `/s/owner/room` via `Routes.sOwnerRoom` |
| Page | `SOwnerDistrictPage` |
| File | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` |
| Guard | `_protectedRoute` and `_ownerOnlyRoutes` in `app_router.dart` |
| Required role | `owner` |
| Connected from Splash? | No |
| Current status | Active protected owner district with placeholder governance panels |
| Missing parts | No separate first-class Splash access; many panels are construction-era placeholders |

Owner navigation inside `SOwnerDistrictPage` includes:

- Overview
- Owner Room
- Strategic Memory
- Constitutional Memory
- Sovereign Vault
- Survival Capsules
- Regeneration Board
- Executive Intelligence
- Recovery Console
- Construction Workbench

## Strategic Room / Strategy Section

| Question | Answer |
| --- | --- |
| Standalone Strategic Room exists in runtime? | No explicit standalone `StrategicRoomPage` found. |
| Strategic section exists? | Yes, `Strategic Memory` exists as `Routes.sStrategicMemory`. |
| Route | `/s/owner/strategic-memory` |
| Page | `SOwnerDistrictPage(focus: SOwnerDistrictFocus.strategicArchive)` |
| File | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` |
| Connected to Owner Room? | Yes, via Owner District navigation. |
| Connected from Splash? | No. |
| Status | ACTIVE_OWNER_SECTION / not a standalone room. |

Related named concepts found in runtime:

- `SOwnerDistrictFocus.strategicArchive`
- `Routes.sStrategicMemory`
- Owner District navigation label `Strategic Memory`
- `Executive Intelligence`
- `Sovereign Vault`
- `Recovery Console`

Conclusion: Strategic function exists as an owner section, while a dedicated Strategic Room remains pending or not separately implemented.

## Provider / Center Access And Account Flow

### Specialist / Provider Registration

Route options:

- `/web/clinician/register` via `Routes.webClinicianRegister`
- `/register/clinician` via `Routes.clinicianRegister`
- `/register/provider` via `Routes.portalProviderRegister`

Destination:

- `WebClinicianRegisterPortalPage`
- File: `lib/features/web_registration/presentation/pages/web_clinician_register_portal_page.dart`

Behavior:

- Uses `FirebaseAuth.instance.createUserWithEmailAndPassword`.
- Writes a document to `clinicians/{uid}`.
- Sets `role: clinician`.
- Uses `DeclarationReadiness.clinicianPayload`.
- Navigates to `Routes.webClinicianProfile`.

After profile:

- `WebClinicianProfilePage` writes to `clinicians/{uid}`.
- Then navigates to `Routes.webClinicianDocuments`.
- Registration flow is web-registration, not the clinician room.

Login after registration:

- `LoginPage._resolve` sends `RoleNames.clinician` to `Routes.clinicianRoom` only if visibility readiness permits.
- `Routes.clinicianRoom` is protected by clinician role.

Specialist/provider room status:

- `ClinicianRoomPage` exists.
- File: `lib/features/clinician/presentation/pages/clinician_room_page.dart`
- It uses Firebase Auth and Firestore `clinicians/{uid}` stream.
- It appears to be an active role room/workspace, not merely a placeholder.
- It is not reached directly from Splash Provider / Center Access.

### Center Registration

Route options:

- `/web/center/register` via `Routes.webCenterRegister`
- `/register/center` via `Routes.centerRegister`

Destination:

- `WebCenterRegisterPortalPage`
- File: `lib/features/web_registration/presentation/pages/web_center_register_portal_page.dart`

Behavior:

- Uses `FirebaseAuth.instance.createUserWithEmailAndPassword`.
- Writes a document to `centers/{uid}`.
- Sets `role: center`.
- Uses `DeclarationReadiness.centerPayload`.
- Navigates to `Routes.webCenterProfile`.

After profile:

- `WebCenterProfilePage` writes to `centers/{uid}`.
- Then navigates to `Routes.webCenterMedia`.
- Later routes include pricing, documents, and registration success.

Login after registration:

- `LoginPage._resolve` sends `RoleNames.center` to `Routes.centerDashboard` only if visibility readiness permits.
- `Routes.centerDashboard`, `Routes.centerRoom`, and `Routes.centerProfileEditRequest` are center-role protected.

Center room/dashboard status:

- `CenterDashboardPage` exists and reads `centers/{uid}`.
- `CenterRoomPage` exists and reads/writes center profile change request declarations.
- The dashboard appears to be the login landing page.
- The room exists as an update/profile workspace, opened from dashboard actions.

## Legacy Login

`Legacy Login` opens `Routes.login` / `/login`.

The label is misleading because the route is still active shared account login for:

- Owner -> `/s/owner`
- Monitoring operator -> `/s/capital/signal-monitoring-room`
- Registry steward -> `/s/registry-room`
- Declaration reviewer -> `/s/declaration-review-room`
- Support observer -> `/s/support-room`
- Clinician/provider -> `/clinician/room`
- Center -> `/center/dashboard`

The route uses Firebase Auth sign-in and `AccountAccessService().resolve`.

Recommendation:

- Rename `Legacy Login` to `Account Login`, `Existing Account`, or `Provider / Center / Owner Login`.
- Do not remove it before commercial cleanup because it is the active gate for several protected roles.

## Web Portal

`Web Portal` opens `Routes.portalHome` / `/`.

It is not an external URL from Splash. It is an in-app public route using:

- `PortalHomePage`
- File: `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart`

The portal navbar exposes:

- Home `/`
- About `/about`
- Library `/library`
- Providers `/register/provider`
- Centers `/register/center`
- Contact `/contact`

Status:

- Active public skeleton.
- Public route, no login required.
- Provider registration route maps to clinician registration page.
- Center registration is listed in the portal navbar but `Routes.portal` only defines `portalProviderRegister`; the `/register/center` path exists as `Routes.centerRegister`.

## Active Rooms Inventory

| Room / Section | Route | File | Audience | Status | Data persistence | Auth required | Current source | Recommendation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Client Room | `/client/room` | `lib/features/client/presentation/pages/client_room_page.dart` | Public/client visitor | ACTIVE | Temporary room state only from recent room work | No | Splash Quick Access | KEEP |
| Accessibility Room | `/accessibility/room` | `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | Public/accessibility visitors | ACTIVE | Temporary photo/notebook message only | No | Splash Accessibility Access | KEEP |
| Owner Room | `/s/owner/room` | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | Owner | ACTIVE_PROTECTED_PLACEHOLDER | No writes in owner page | Yes, owner role | Hidden route / owner login | KEEP HIDDEN |
| Owner District Overview | `/s/owner` | same as above | Owner | ACTIVE_PROTECTED_PLACEHOLDER | No writes in owner page | Yes, owner role | Owner login | KEEP HIDDEN |
| Strategic Memory | `/s/owner/strategic-memory` | same as above | Owner | ACTIVE_OWNER_SECTION | No writes in owner page | Yes, owner role | Owner District navigation | OWNER_DECISION for standalone room |
| Monitoring Room | `/s/capital/signal-monitoring-room` | `lib/features/s_capital/presentation/pages/s_signal_monitoring_room_page.dart` | Monitoring operator | ACTIVE_PROTECTED_PLACEHOLDER | No writes in page comments | Yes, monitoring role | Login / hidden route | KEEP HIDDEN |
| Registry Room | `/s/registry-room` | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | Owner/registry steward | ACTIVE_PROTECTED_READ_ONLY | Reads domain status service | Yes | Login / hidden route | KEEP HIDDEN |
| Declaration Review Room | `/s/declaration-review-room` | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | Owner/declaration reviewer | ACTIVE_PROTECTED_FIRESTORE_READ | Reads Firestore streams | Yes | Login / hidden route | KEEP HIDDEN |
| Provider/Clinician Room | `/clinician/room` | `lib/features/clinician/presentation/pages/clinician_room_page.dart` | Clinician/provider | ACTIVE_PROTECTED_ROOM | Reads/writes clinician workspace data | Yes, clinician role | Login after readiness | KEEP, clarify naming |
| Center Dashboard | `/center/dashboard` | `lib/features/centers/presentation/pages/center_dashboard_page.dart` | Center | ACTIVE_PROTECTED_DASHBOARD | Reads `centers`; links to room/chat | Yes, center role | Login landing | KEEP until commercial cleanup |
| Center Room | `/center/room` | `lib/features/centers/presentation/pages/center_room_page.dart` | Center | ACTIVE_PROTECTED_ROOM | Reads `centers`, writes profile change requests | Yes, center role | Dashboard action | KEEP until commercial cleanup |
| Web Portal | `/` | `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart` | Public | ACTIVE_PUBLIC_SKELETON | No direct database writes in home | No | Splash Web Portal | KEEP |
| Legacy Login destination | `/login` | `lib/features/auth/presentation/pages/login_page.dart` | Existing accounts | ACTIVE_AUTH_GATE | Firebase Auth sign-in | No before login | Splash Legacy Login | RENAME |

## Route Truth Table

| Route path | Current truth |
| --- | --- |
| `/splash` | ACTIVE |
| `/` | ACTIVE public web portal skeleton |
| `/about` | ACTIVE public web portal skeleton |
| `/library` | ACTIVE public library route |
| `/contact` | ACTIVE public portal contact page |
| `/register/provider` | ACTIVE provider registration alias to clinician registration |
| `/register/center` | ACTIVE center registration alias |
| `/web/clinician/register` | ACTIVE web clinician registration |
| `/web/center/register` | ACTIVE web center registration |
| `/login` | ACTIVE shared Firebase login; label `Legacy Login` is misleading |
| `/client/room` | ACTIVE public room |
| `/accessibility/room` | ACTIVE public room |
| `/accessibility/links` | ACTIVE public accessibility page |
| `/accessibility/tools` | ACTIVE public accessibility page |
| `/accessibility/suggestions` | ACTIVE WhatsApp-only page |
| `/accessibility/community-tools` | ACTIVE placeholder page |
| `/accessibility/checkin` | ACTIVE WhatsApp-only page |
| `/accessibility/message-of-the-day` | ACTIVE page route, but feather currently uses room-local dialog |
| `/s/owner` | ACTIVE protected owner district |
| `/s/owner/room` | ACTIVE protected owner room section |
| `/s/owner/strategic-memory` | ACTIVE protected strategic memory section |
| `/owner` | BROKEN/NOT_DEFINED in current `Routes` |
| `/monitoring` | BROKEN/NOT_DEFINED; active route is `/s/capital/signal-monitoring-room` |
| `/registry` | BROKEN/NOT_DEFINED; active route is `/s/registry-room` |
| `/declaration` | BROKEN/NOT_DEFINED; active route is `/s/declaration-review-room` |
| `/s/registry-room` | ACTIVE protected registry room |
| `/s/declaration-review-room` | ACTIVE protected declaration review room |
| `/s/support-room` | ACTIVE protected support room |
| `/s/capital/signal-monitoring-room` | ACTIVE protected monitoring room |
| `/s/city/providers` | PLACEHOLDER public provider directory |
| `/s/city/centers` | PLACEHOLDER public center directory |
| `/clinician/room` | ACTIVE protected clinician/provider room |
| `/center/dashboard` | ACTIVE protected center dashboard |
| `/center/room` | ACTIVE protected center room |
| `/module/specialists` | ACTIVE public specialist discovery module |
| `/module/centers` | ACTIVE public center discovery module |

## Direct Answers To Owner Questions

1. What each Splash button opens:
   Quick Access -> Client Room; Accessibility Access -> Accessibility Room; Provider / Center Access -> bottom sheet to public provider/center placeholders; Legacy Login -> shared login; Web Portal -> in-app public portal.

2. Which routes/pages are active:
   All five Splash destinations are active. Provider/Center sub-destinations are active placeholders, not auth gateways.

3. Which rooms actually exist:
   Client Room, Accessibility Room, Owner Room/Owner District, Monitoring Room, Registry Room, Declaration Review Room, Clinician Room, Center Dashboard, and Center Room exist.

4. Where Owner Room exists:
   `/s/owner/room`, implemented inside `SOwnerDistrictPage`, protected by owner role.

5. Where Strategic Room / Strategy section exists:
   Strategic Memory exists at `/s/owner/strategic-memory` inside Owner District. A separate Strategic Room is not implemented.

6. What happens when creating or logging in as specialist/provider today:
   Registration creates Firebase Auth user and `clinicians/{uid}`, then continues web profile/documents flow. Later login routes clinician role to `/clinician/room` if readiness permits.

7. Whether specialist/provider room is old legacy, new separated room, or not implemented:
   `ClinicianRoomPage` exists as an active protected clinician/provider room. It is separated from registration, but the naming still mixes provider/clinician concepts.

8. Whether provider/center access points are web pages, app pages, owner/admin pages, or placeholders:
   Splash Provider / Center Access points are public `[S] City` placeholder pages. Registration routes are web pages. Login destinations are protected app rooms/dashboards. They are not owner/admin pages.

## Final Recommendation

Keep on Splash:

- Quick Access
- Accessibility Access
- Web Portal

Rename:

- `Legacy Login` -> `Account Login` or `Existing Account Login`
- `Provider / Center Access` -> `Provider / Center Directory` if it keeps opening `/s/city/providers` and `/s/city/centers`

Owner Decision:

- Whether Splash should expose provider/center registration directly.
- Whether Splash should expose account login separately from provider/center directory.
- Whether Strategic Memory should become a standalone Strategic Room.

Hide or avoid exposing:

- Owner Room
- Monitoring Room
- Registry Room
- Declaration Review Room

Safe to test now:

- Client Room
- Accessibility Room
- Web Portal skeleton
- Public provider/center discovery placeholders, if understood as placeholders
- Login flow only with known Firebase accounts and role readiness

Must not be touched until commercial cleanup:

- Provider/clinician naming boundary
- Center dashboard vs center room landing behavior
- Registration-to-room readiness gates
- Owner/monitoring/registry/declaration protected route structure

## Final Verdict

SPLASH_ACCESS_MAP_HAS_LEGACY_CONFUSION
