# Administrative Route Inventory V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Routes

| Route | Target Page | Feature | Referenced By | Status |
|---|---|---|---|---|
| `/s` | `SSurfaceIndexPage` | `s_web_surfaces` | `Routes.sIndex`, `AppRouter.onGenerateRoute` | Present in router. |
| `/s/support-room` | `SSupportRoomPage` | `s_support_room` | `Routes.sSupportRoom`, `AppRouter._ownerAndSupportObserverRoutes`, `MenuPage`, login role resolution | Present in router and guarded. |
| `/s/registry-room` | `SRegistryRoomPage` | `s_registry_room` | `Routes.sRegistryRoom`, `AppRouter._ownerAndRegistryStewardRoutes`, `MenuPage`, login role resolution | Present in router and guarded. |
| `/s/declaration-review-room` | `SDeclarationReviewRoomPage` | `s_declaration_review_room` | `Routes.sDeclarationReviewRoom`, `AppRouter._ownerAndDeclarationReviewerRoutes`, `MenuPage`, login role resolution | Present in router and guarded. |
| `/s/owner` | `SOwnerDistrictPage` | `s_owner` | `Routes.sOwnerHome`, `AppRouter._ownerOnlyRoutes`, `SSurfaceIndexPage`, `SWebSurfacePage`, `MenuPage`, login role resolution | Present in router and guarded. |
| `/s/owner/room` | `SOwnerDistrictPage(focus: ownerRoom)` | `s_owner` | `Routes.sOwnerRoom`, `AppRouter._ownerOnlyRoutes`, owner navigation | Present in router and guarded. |
| `/s/owner/sovereign-intelligence` | `SOwnerDistrictPage(focus: executiveIntelligence)` | `s_owner` | `Routes.sSovereignIntelligence`, owner navigation | Present in router and guarded. |
| `/s/owner/strategic-memory` | `SOwnerDistrictPage(focus: strategicArchive)` | `s_owner` | `Routes.sStrategicMemory`, owner navigation | Present in router and guarded. |
| `/s/owner/sovereign-vault` | `SOwnerDistrictPage(focus: sovereignVault)` | `s_owner` | `Routes.sSovereignVault`, owner navigation | Present in router and guarded. |
| `/s/owner/constitutional-memory` | `SOwnerDistrictPage(focus: constitutionalMemory)` | `s_owner` | `Routes.sConstitutionalMemory`, owner navigation | Present in router and guarded. |
| `/s/owner/recovery-console` | `SOwnerDistrictPage(focus: recoveryConsole)` | `s_owner` | `Routes.sRecoveryConsole`, owner navigation | Present in router and guarded. |
| `/s/owner/capsules` | `SOwnerDistrictPage(focus: survivalCapsules)` | `s_owner` | `Routes.sOwnerCapsules`, owner navigation | Present in router and guarded. |
| `/s/owner/regeneration` | `SOwnerDistrictPage(focus: regenerationBoard)` | `s_owner` | `Routes.sOwnerRegeneration`, owner navigation | Present in router and guarded. |
| `/owner/os/construction-workbench` | `SovereignConstructionWorkbenchPage` | `sovereign_construction` | `Routes.ownerConstructionWorkbench`, owner navigation | Present in router and guarded. |
| `/s/capital/trust-safety` | `SWebSurfacePage` | `s_web_surfaces` | `Routes.sTrustSafety`, `AppRouter._supportObserverRoutes` | Present in router and guarded by support observer role set. |
| `/s/capital/reports` | `SWebSurfacePage` | `s_web_surfaces` | `Routes.sCapitalReports`, `AppRouter._monitoringOperatorRoutes` | Present in router and guarded by monitoring operator route set. |
| `/chat/escalations` | `ChatEscalationsPage` | `safety` | `Routes.chatEscalations`, `AppRouter._supportObserverRoutes`, `ChatEscalationsPage` links to report route | Present in router and guarded. |
| `/chat/escalation/report` | `ChatEscalationReportPage` | `chat` | `Routes.chatEscalationReport`, `AppRouter._supportObserverRoutes`, `ChatEscalationsPage` | Present in router and guarded. |

## Role Route Sets Observed In Router

| Route Set | Roles | Routes |
|---|---|---|
| `_ownerOnlyRoutes` | `owner` | Owner district routes and construction workbench. |
| `_supportObserverRoutes` | `support_observer` | `/s/capital/trust-safety`, `/chat/escalations`, `/chat/escalation/report`. |
| `_ownerAndSupportObserverRoutes` | `owner`, `support_observer` | `/s/support-room`. |
| `_ownerAndRegistryStewardRoutes` | `owner`, `registry_steward` | `/s/registry-room`. |
| `_ownerAndDeclarationReviewerRoutes` | `owner`, `declaration_reviewer` | `/s/declaration-review-room`. |
