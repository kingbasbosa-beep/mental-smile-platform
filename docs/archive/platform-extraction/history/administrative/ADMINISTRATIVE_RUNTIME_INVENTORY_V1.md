# Administrative Runtime Inventory V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Scope

Inventory only.

No recommendations.

No cleanup.

No runtime changes.

## Runtime Pages

| Page Name | File Path | Feature Path | Route | Purpose | Status |
|---|---|---|---|---|---|
| SSupportRoomPage | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | `lib/features/s_support_room` | `/s/support-room` | Read-only support signal room showing support, risk, technical, and continuity request tabs from `support_requests`. | Present in router and guarded by owner/support observer roles. |
| SRegistryRoomPage | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | `lib/features/s_registry_room` | `/s/registry-room` | Registry visibility surface showing selected `domainRegistry` entries and streamed `system_domains` status. | Present in router and guarded by owner/registry steward roles. |
| SDeclarationReviewRoomPage | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | `lib/features/s_declaration_review_room` | `/s/declaration-review-room` | Readiness observatory for clinician, center, and profile change declaration streams. | Present in router and guarded by owner/declaration reviewer roles. |
| SOwnerDistrictPage | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | `lib/features/s_owner` | `/s/owner` and owner subroutes | Owner district surface with panels for owner room, strategic memory, constitutional memory, sovereign vault, capsules, regeneration, intelligence, and recovery console. | Present in router and guarded by owner role. |
| SovereignConstructionWorkbenchPage | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | `lib/features/sovereign_construction` | `/owner/os/construction-workbench` | Owner construction workbench listing construction tool registry entries and copy/open actions. | Present in router and guarded by owner role. |
| ChatEscalationsPage | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | `lib/features/safety` | `/chat/escalations` | Safety escalation observatory using `ChatFirestoreService.streamEscalations()` and resolve action. | Present in router and guarded by support observer role. |
| ChatEscalationReportPage | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | `lib/features/chat` | `/chat/escalation/report` | Loads latest report for an escalation through `ChatFirestoreService.getLatestReportForEscalation`. | Present in router and guarded by support observer route set. |
| SSurfaceIndexPage | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | `lib/features/s_web_surfaces` | `/s` | Surface index linking City, Capital, and Owner surfaces. | Present in router. |
| SWebSurfacePage | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | `lib/features/s_web_surfaces` | Multiple `/s/...` placeholder routes | Generic signal-native placeholder surface used by several City/Capital routes including Trust & Safety and Reports. | Present in router. |

## Authentication And Role Runtime

| Runtime Item | File Path | Purpose | Status |
|---|---|---|---|
| AccountAccessService | `lib/core/auth/account_access_service.dart` | Resolves custom-claim constitutional roles and clinician/center document-based roles. | Referenced by router access gate and role gateways. |
| RoleNames | `lib/shared/contracts/role_names.dart` | Defines `owner`, `monitoring_operator`, `registry_steward`, `declaration_reviewer`, `support_observer`, `center`, and `clinician`. | Referenced by auth and gateways. |
| AppRouter role sets | `lib/app/router/app_router.dart` | Defines owner-only, monitoring, support observer, owner/support, owner/registry, and owner/declaration route role sets. | Active in route generation. |
