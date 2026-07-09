# Application Section Route Health Report V1

Operation ID: OP-APPLICATION-SECTION-FINAL-AUDIT-CLEANUP-V1  
Date: 2026-06-23

Only `ACTIVE` and `ARCHIVE_ONLY` classifications are used.

## Route Table

| Route | Owner | Opened By | Destination | Status | Evidence |
|---|---|---|---|---|---|
| `/splash` | Entry/Auth | app startup, Residential exit return | `SplashPage` | ACTIVE | initial route and router case |
| `/` | Public Web | direct/internal public portal navigation | `PortalHomePage` | ACTIVE | router case remains active; Splash no longer opens it |
| `/commercial-v2/start` | Entry/Auth auth entry | Splash Provider / Center Access | `CommercialV2StartPage` | ACTIVE | Splash callback and router case |
| `/client/room` | Residential | Splash Quick Access | `ClientRoomPage` | ACTIVE | Splash callback and router case |
| `/accessibility/room` | Residential | Splash Accessibility Access | `AccessibilityRoomPage` | ACTIVE | Splash callback and router case |
| `/accessibility/links` | Residential | Accessibility wall card | `AccessibilityLinksPage` | ACTIVE | room callback and router case |
| `/accessibility/tools` | Residential | Accessibility tools card | `AccessibilityToolsPage` | ACTIVE | room callback and router case |
| `/accessibility/suggestions` | Residential | both room suggestion cards | `AccessibilitySuggestionsPage` | ACTIVE | callbacks and router case |
| `/accessibility/community-tools` | Residential | both room apps cards | `AccessibilityCommunityToolsPage` | ACTIVE | callbacks and router case |
| `/accessibility/checkin` | Residential | both room check-in cards | `AccessibilityCheckinPage` | ACTIVE | callbacks and router case |
| `/accessibility/message-of-the-day` | Residential | registered message page | `AccessibilityMessageOfDayPage` | ACTIVE | route constant and router case |
| `/residential/exit-social-links` | Residential | Client and Accessibility exit cups | `ResidentialExitSocialPortalPage` | ACTIVE | router case builds active portal page |
| `/app/exit-social-links` | Application shell outside Residential | clinician/center authenticated logout | `AppExitSocialLinksPage` | ACTIVE | `AppShellActions.signOutToLogin` |
| `/login` | Entry/Auth archive | retained route only | `LoginPage` | ARCHIVE_ONLY | route card and migration decision |
| `/language` | Entry/Auth archive | archived Login registration link | language page | ARCHIVE_ONLY | route card |
| `/account-blocked` | Entry/Auth archive | archived Login readiness gate | blocked page | ARCHIVE_ONLY | route card |
| `/s/owner` | Owner destination | archived Login resolution | owner surface | ARCHIVE_ONLY | Entry/Auth route card |
| `/s/capital/signal-monitoring-room` | Monitoring destination | archived Login resolution | monitoring room | ARCHIVE_ONLY | Entry/Auth route card |
| `/s/registry-room` | Registry destination | archived Login resolution | registry room | ARCHIVE_ONLY | Entry/Auth route card |
| `/s/declaration-review-room` | Declaration destination | archived Login resolution | review room | ARCHIVE_ONLY | Entry/Auth route card |
| `/s/support-room` | Support destination | archived Login resolution | support room | ARCHIVE_ONLY | Entry/Auth route card |
| `/clinician/room` | Commercial runtime | archived Login resolution | clinician room | ARCHIVE_ONLY | Entry/Auth route card |
| `/center/dashboard` | Commercial runtime | archived Login resolution | center dashboard | ARCHIVE_ONLY | Entry/Auth route card |
| `/menu` | Application shell | archived Login fallback | menu | ARCHIVE_ONLY | Entry/Auth route card |

## Counts

- ACTIVE routes: **13**
- ARCHIVE_ONLY routes: **11**
- Other classifications: **0**

## Health Result

Route Health: PASS

No unexplained Application route was found in the reviewed scope.

Splash Official Website is now an external URL action and does not add or change a route.
