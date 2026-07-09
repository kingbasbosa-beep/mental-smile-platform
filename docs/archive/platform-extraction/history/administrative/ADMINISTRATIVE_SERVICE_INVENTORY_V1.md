# Administrative Service Inventory V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Services

| Service Name | File Path | Consumers | References |
|---|---|---|---|
| AccountAccessService | `lib/core/auth/account_access_service.dart` | `AppRouter`, `RoleAccessGateway`, login/role resolution flows | Firebase Auth user, custom claims, `clinicians`, `centers`, `VisibilityReadiness`, `RoleNames`. |
| DomainStatusService | `lib/core/system/domain_status_service.dart` | `SRegistryRoomPage` | Firestore `system_domains`, `DomainStatus`, `DomainKey`. |
| ChatFirestoreService | `lib/features/chat/data/services/chat_firestore_service.dart` | `ChatEscalationsPage`, `ChatEscalationReportPage`, chat controller/pages outside this inventory | Firestore `chat_threads`, `chat_threads/{threadId}/messages`, `chat_escalations`, `chat_escalations/{escalationId}/reports`; chat models. |
| AppRouter route access gate | `lib/app/router/app_router.dart` | All guarded Administrative routes | Firebase Auth current user, `AccountAccessService`, route role sets. |
| RoleAccessGateway | `lib/shared/gateways/role_access_gateway.dart` | Role checks by shared gateway consumers | `AccountAccessService`, `RoleNames`. |

## Registry-Like Runtime Sources

| Source | File Path | Consumers | References |
|---|---|---|---|
| domainRegistry | `lib/core/system/domain_registry.dart` | `SRegistryRoomPage`, domain services | `DomainDefinition`, `DomainKey`, owned collection names. |
| ConstructionToolRegistry | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | `SovereignConstructionWorkbenchPage` | Construction tool entries, launch type, tool type, local/external references. |
