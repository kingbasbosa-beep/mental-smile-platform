# Exit Destination Recovery Audit Report V1

Status: ARCHIVE_ONLY

Current-state note: This report preserves the exit-flow state discovered before `OP-RESIDENTIAL-EXIT-SOCIAL-LINKS-PAGE-V1`. The current Client Room and Accessibility Room exit destination is `/residential/exit-social-links`, not `/splash`.

Operation ID: OP-EXIT-DESTINATION-RECOVERY-AUDIT-V1  
Date: 2026-06-23  
Mode: Forensic audit only  
Runtime Changes: none

## Executive Finding

An official accounts and social-links exit page exists in active runtime:

- Route: `/app/exit-social-links`
- Route constant: `Routes.exitSocialLinks`
- File: `lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart`
- Widget: `AppExitSocialLinksPage`

The page is registered in `AppRouter`, classified as `ACTIVE` in current route inventories, and remains connected to authenticated shell logout through `AppShellActions.signOutToLogin`.

The current Client Room and Accessibility Room exit cups do not open it. They clear local state and navigate directly to `/splash`.

Historical documentation repeatedly states:

```text
Rooms -> Exit Social Links -> Login / Home / Official Links
```

Therefore, the page exists and was historically intended as the room-exit destination, but the two current Residential room cups are no longer connected to it.

## 1. Official Accounts Page

Official Accounts Page Found: **YES**

| Field | Evidence |
|---|---|
| Route | `/app/exit-social-links` |
| Route constant | `Routes.exitSocialLinks` |
| File | `lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart` |
| Widget | `AppExitSocialLinksPage` |
| Router case | `lib/app/router/app_router.dart` |
| Current route classification | ACTIVE |
| Current ownership classification | System / Residential exit-social handoff |
| Current direct room-cup usage | none |
| Current authenticated-shell usage | active through `AppShellActions.signOutToLogin` |

### Purpose

The page presents a calm public destination after room/account exit, offers official Mental Smile channels, and provides return actions to Login and Home.

### Contained Official Channels

| Channel | Current Destination |
|---|---|
| Website | `https://mental-smile-platform.web.app` |
| Mental Smile OS | `https://kingbasbosa-beep.github.io/mental-smile-os/` |
| Facebook | `https://www.facebook.com/MentalSmileOrg` |
| LinkedIn | `https://www.linkedin.com/company/mentalsmileorg` |
| Telegram | `https://t.me/MentalSmileOrg` |
| WhatsApp | `https://wa.me/201014116531` |
| Instagram | `https://instagram.com/mentalsmile.platform` |
| X | `https://x.com/MentaSmileorg` |
| TikTok | `https://www.tiktok.com/@mentalsmileorg` |
| YouTube | `https://www.youtube.com/@MentalSmileOs` |
| GitHub | `https://github.com/kingbasbosa-beep/mental-smile-os` |
| Email | `mailto:mentalsmile.platform@gmail.com` |

### Current Page Actions

- Open official channels externally.
- Return to `/login`.
- Return to `/home`.

### Classification

`ACTIVE`

The page, route constant, and router case all exist. It is not archive-only.

## 2. Was It Previously Connected?

Answer: **YES**

### Runtime Evidence

`lib/shared/ui_kit/app_shell_actions.dart` currently performs:

```text
Firebase sign out
-> Routes.exitSocialLinks
```

Current consumers include:

- Clinician Room logout
- Center Dashboard logout
- Center Room logout
- shell app bars that use `AppShellActions.signOutToLogin`

### Historical Evidence

The recovered historical package states:

```text
Previous: CLIENT_ROOM_SCREEN
Previous: PROVIDER_ROOM_SCREEN
Previous: CENTER_ROOM_SCREEN
Next Option: APP_LOGIN_SCREEN
Next Option: APP_HOME_SCREEN
Next Option: External Official Links
```

Multiple historical flow documents state:

```text
Room -> Exit Social Links Screen -> Login / Home / Official Links
```

The implementation report also records that the route and page were created and connected to shell logout.

### Historical Reference Count

45 files contain direct references to:

- `exitSocialLinks`
- `/app/exit-social-links`
- `APP_EXIT_SOCIAL_LINKS_SCREEN`
- Room-to-Exit-Social-Links flow

Classification: `HISTORICAL_REFERENCE`

## 3. Separate Contact Page

A separate public contact page also exists.

| Field | Value |
|---|---|
| Route | `/contact` |
| Route constant | `Routes.portalContact` |
| File | `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart` |
| Widget | `PortalContactPage` |
| Purpose | General contact intake through a Gmail draft |
| Status | ACTIVE |

This page is not the Official Accounts page and is not the historically documented room-exit destination.

Classification: `ACTIVE`

## 4. Current Exit Destinations

| Surface | Current control/action | Current destination | State clearing | Classification |
|---|---|---|---|---|
| Client Room | Exit cup | `/splash` | Clears temporary photo and notebook message | ACTIVE |
| Accessibility Room | Exit cup | `/splash` | Clears temporary photo and notebook message | ACTIVE |
| Unified Start | Cancel | Pops current route when possible; otherwise `/splash` | none | ACTIVE |
| Splash | No dedicated exit control | none | none | ACTIVE |
| Clinician Room | Logout | `/app/exit-social-links` after Firebase sign-out | Auth session cleared | ACTIVE |
| Center Dashboard | Logout | `/app/exit-social-links` after Firebase sign-out | Auth session cleared | ACTIVE |
| Center Room | Logout | `/app/exit-social-links` after Firebase sign-out | Auth session cleared | ACTIVE |

## 5. Historical Intended Destination

Historical Intended Destination Found: **YES**

The documented room exit flow was:

```text
Client / Provider / Center Room
-> Exit Social Links
-> Login / Home / Official Links
```

The historical master card describes the purpose as providing a calm public presence destination after room exit rather than forcing users directly to Login.

The current Client and Accessibility room behavior differs from that lineage.

Classification: `OWNER_DECISION_REQUIRED`

No reconnection was performed by this audit.

## 6. Finding Classification

| Finding | Classification | Evidence |
|---|---|---|
| `AppExitSocialLinksPage` and route | ACTIVE | File, route constant, and router case exist |
| Shell logout connection | ACTIVE | `AppShellActions.signOutToLogin` routes to it |
| Client Room cup connection | ORPHANED | Cup routes to Splash, not Exit Social Links |
| Accessibility Room cup connection | ORPHANED | Cup routes to Splash, not Exit Social Links |
| Historical room-exit doctrine | HISTORICAL_REFERENCE | 45 direct references |
| `/contact` page | ACTIVE | Public portal route and page exist |
| Direct navigation/menu entry to Exit Social Links | UNREFERENCED | No current public menu or Splash link found |
| Exit page return-to-Login action | OWNER_DECISION_REQUIRED | `/login` is documented elsewhere as archive-only |
| Exit page return-to-Home action | OWNER_DECISION_REQUIRED | `/home` is an operational menu alias, not Splash |
| Official website URL consistency | OWNER_DECISION_REQUIRED | Historical report and current page use different Firebase Hosting URLs |

## 7. URL Consistency Finding

The historical implementation report records:

`https://mental-smile-app-clean.web.app`

The current runtime page uses:

`https://mental-smile-platform.web.app`

No determination was made about which URL is currently authoritative.

Classification: `OWNER_DECISION_REQUIRED`

## 8. Key Evidence Paths

### Active Runtime

- `lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart`
- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`
- `lib/shared/ui_kit/app_shell_actions.dart`
- `lib/features/client/presentation/pages/client_room_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_room_page.dart`
- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`
- `lib/features/splash/presentation/pages/splash_page.dart`
- `lib/features/web_portal/presentation/pages/portal_skeleton_pages.dart`

### Active Registries And Audits

- `docs/constitutional-baseline/inventory/ROUTES_INVENTORY_V1.md`
- `docs/constitutional-baseline/registries/RESIDENTIAL_ROUTE_OWNERSHIP_REGISTRY_V1.md`
- `docs/constitutional-baseline/domain-audits/residential/RESIDENTIAL_ROUTE_HEALTH_REPORT_V1.md`
- `docs/audits/MENTAL_SMILE_RUNTIME_VS_ARCHIVE_TRUTH_AUDIT_V1.md`

### Historical Lineage

- `mental-smile-os-workspace/docs/mental-smile-os/app-exit-links-patch/APP_EXIT_OFFICIAL_LINKS_REPORT_V1.md`
- `mental-smile-os-workspace/docs/mental-smile-os/app-surface/exit-social-links/APP_EXIT_SOCIAL_LINKS_SCREEN_MASTER_CARD_V1.md`
- `mental-smile-os-workspace/docs/mental-smile-os/runtime-reconnection/SCREEN_RECONNECTION_MODEL_V1.md`
- `mental-smile-os-workspace/docs/mental-smile-os/pure-runtime/ACTIVE_RUNTIME_SCREEN_MAP_V1.md`
- `mental-smile-os-workspace/docs/mental-smile-os/city-generation-1/CITY_SNAPSHOT_PATCH_001_LOGIN_EXIT_REPORT.md`

## 9. Audit Boundary

- Routes changed: NO
- Buttons reconnected: NO
- Pages created: NO
- Runtime changed: NO
- Firebase changed: NO
- Files deleted: NO

## Final Report

Official Accounts Page Found: **YES**

Route: `/app/exit-social-links`

File: `lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart`

Current Exit Destinations:

- Client Room -> `/splash`
- Accessibility Room -> `/splash`
- Unified Start Cancel -> previous route or `/splash`
- Splash -> no dedicated exit
- Clinician/Center authenticated logout -> `/app/exit-social-links`

Historical References Found: **45 files**

Owner Decision Required: **YES**

Operations Registry Updated: **YES**

Operations Index Updated: **YES**

Final Verdict: EXIT_DESTINATION_RECOVERY_AUDIT_COMPLETED
