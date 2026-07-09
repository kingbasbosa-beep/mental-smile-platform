# Administrative Model Inventory V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Models And Local Records

| Model Name | File Path | Referenced By |
|---|---|---|
| SignedInAccessState | `lib/core/auth/account_access_service.dart` | `AccountAccessService`, route access gate, role gateways. |
| DomainStatus | `lib/core/system/domain_status.dart` | `DomainStatusService`, `SRegistryRoomPage`. |
| DomainDefinition | `lib/core/system/domain_registry.dart` | `domainRegistry`, `SRegistryRoomPage`. |
| DomainKey | `lib/core/system/domain_registry.dart` | `domainRegistry`, `DomainStatusService`, `SRegistryRoomPage`. |
| DomainGovernanceCapability | `lib/core/system/domain_governance_capability.dart` | `SRegistryRoomPage`. |
| ConstructionToolEntry | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | `ConstructionToolRegistry`, `SovereignConstructionWorkbenchPage`. |
| ConstructionToolType | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | `ConstructionToolEntry`, `SovereignConstructionWorkbenchPage`. |
| ConstructionLaunchType | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | `ConstructionToolEntry`, `SovereignConstructionWorkbenchPage`. |
| ChatEscalationModel | `lib/features/chat/data/models/chat_escalation_model.dart` | `ChatFirestoreService`, `ChatEscalationsPage`. |
| ChatThreadModel | `lib/features/chat/data/models/chat_thread_model.dart` | `ChatFirestoreService`. |
| ChatMessageModel | `lib/features/chat/data/models/chat_message_model.dart` | `ChatFirestoreService`. |
| ChatSignalRoutingModel | `lib/features/chat/data/models/chat_signal_routing_model.dart` | `ChatFirestoreService`. |
| _SupportRequest | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | `SSupportRoomPage` internal request cards and tab filters. |
| _DeclarationRecord | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | `SDeclarationReviewRoomPage` internal declaration list, filters, summary, metadata. |
| _DocumentItem | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | `SDeclarationReviewRoomPage` internal document metadata. |
| _ComparisonItem | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | `SDeclarationReviewRoomPage` internal profile-change comparison display. |
| RoleNames | `lib/shared/contracts/role_names.dart` | `AccountAccessService`, login role routing, role gateways. |
| ReviewerTypes | `lib/shared/contracts/reviewer_types.dart` | Declaration reviewer type references. |
