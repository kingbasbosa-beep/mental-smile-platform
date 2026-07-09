# Entry/Auth Route Cards V1

Operation: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Finalization Update: OP-ENTRY-AUTH-FINALIZATION-BLOCK-V1
Date: 2026-06-23

## Final Active Entry Paths

| Card ID | Route | Final path role | Who opens it | Ownership | Status | Evidence |
|---|---|---|---|---|---|---|
| EA-ROUTE-001 | `/splash` | Entry surface | App startup | Entry/Auth-owned | ACTIVE | `MaterialApp.initialRoute: Routes.splash` |
| EA-ROUTE-002 | `/commercial-v2/start` | Unified Start target | Provider / Center / Owner Access final path | Entry/Auth-owned | ACTIVE | Router returns `CommercialV2StartPage` |
| EA-ROUTE-003 | `/client/room` | Quick Access destination | Splash Quick Access | Destination-only Residential | ACTIVE | Splash uses `Routes.clientRoom` |
| EA-ROUTE-004 | `/accessibility/room` | Accessibility Access destination | Splash Accessibility Access | Destination-only Residential | ACTIVE | Splash uses `Routes.accessibilityRoom` |
| EA-ROUTE-006 | `/` | Official Website/public web destination | Splash Official Website | Destination-only Public Web | ACTIVE | Router returns `PortalHomePage`; hosted URL requires Owner-hosted URL verification |

## Archive-Only Route References For Entry/Auth

These routes may still exist in runtime or in their owning sections. Entry/Auth does not treat them as active Entry/Auth-owned paths after finalization.

| Card ID | Route | Current connection | Entry/Auth final classification | Evidence |
|---|---|---|---|---|
| EA-ROUTE-005 | `/login` | Previous Login page route | ARCHIVE_ONLY | Previous Entry/Auth login route is replaced by Unified Start |
| EA-ROUTE-007 | `/language` | Login register link destination | ARCHIVE_ONLY | Login register link opens `Routes.language` |
| EA-ROUTE-008 | `/account-blocked` | Login readiness/block gate | ARCHIVE_ONLY | Login returns route when blocked/not ready |
| EA-ROUTE-009 | `/s/owner` | Login role resolution destination | ARCHIVE_ONLY | Owner role returns `Routes.sOwnerHome` |
| EA-ROUTE-010 | `/s/capital/signal-monitoring-room` | Login role resolution destination | ARCHIVE_ONLY | Monitoring role returns `Routes.sSignalMonitoringRoom` |
| EA-ROUTE-011 | `/s/registry-room` | Login role resolution destination | ARCHIVE_ONLY | Registry steward role returns `Routes.sRegistryRoom` |
| EA-ROUTE-012 | `/s/declaration-review-room` | Login role resolution destination | ARCHIVE_ONLY | Declaration reviewer role returns `Routes.sDeclarationReviewRoom` |
| EA-ROUTE-013 | `/s/support-room` | Login role resolution destination | ARCHIVE_ONLY | Support observer role returns `Routes.sSupportRoom` |
| EA-ROUTE-014 | `/clinician/room` | Login role resolution destination | ARCHIVE_ONLY | Login clinician role returns `Routes.clinicianRoom` |
| EA-ROUTE-015 | `/center/dashboard` | Login role resolution destination | ARCHIVE_ONLY | Login center role returns `Routes.centerDashboard` |
| EA-ROUTE-016 | `/menu` | Login default/no-role fallback | ARCHIVE_ONLY | Login default returns `Routes.menu` |

## Official Website Critical Check

The Splash Official Website button opens `Routes.portalHome`, which maps to `/` and returns `PortalHomePage`. No evidence showed it routing to Owner, Commercial dashboard, Monitoring, or another internal protected page.

Firebase hosting config identifies project `mental-smile-platform` and hosting public folder `public-landing`, but no local file proves the final deployed public URL or custom domain. Therefore the hosted URL status is `HOSTED_WEB_URL_UNVERIFIED_OWNER_REQUIRED`.

## Finalization Notes

1. `/login` is no longer an active Entry/Auth path and is documented as `ARCHIVE_ONLY`.
2. Unified Start ownership is documentation-only in this operation; no Commercial V2 internals were modified.
