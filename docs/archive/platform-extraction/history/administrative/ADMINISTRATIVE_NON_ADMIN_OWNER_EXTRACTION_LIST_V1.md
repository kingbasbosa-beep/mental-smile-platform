# Administrative Non-Admin Owner Extraction List V1

Operation ID: OP-ADMINISTRATIVE-OWNERSHIP-AND-ARCHIVE-IMPACT-MAP-V1  
Date: 2026-06-25

## Purpose

This list records items found in Administrative inventory that are constitutionally owned by another future section or owner bucket.

No extraction is performed.

## Items

| Item Name | Current Path | Future Owner Bucket | Reason |
|---|---|---|---|
| `/s/support-room` | `Routes.sSupportRoom` | SUPPORT_SAFETY | Route ownership is assigned outside Administrative V1. |
| `/s/registry-room` | `Routes.sRegistryRoom` | REGISTRY_GOVERNANCE | Route ownership is assigned outside Administrative V1. |
| `/s/declaration-review-room` | `Routes.sDeclarationReviewRoom` | DECLARATION_REVIEW | Route ownership is assigned outside Administrative V1. |
| `/s/owner` | `Routes.sOwnerHome` | OWNER | Route ownership is assigned outside Administrative V1. |
| `/s/owner/room` | `Routes.sOwnerRoom` | OWNER | Route ownership is assigned outside Administrative V1. |
| `/s/owner/sovereign-intelligence` | `Routes.sSovereignIntelligence` | STRATEGIC_PLANNING | Route ownership is assigned outside Administrative V1. |
| `/s/owner/strategic-memory` | `Routes.sStrategicMemory` | STRATEGIC_PLANNING | Route ownership is assigned outside Administrative V1. |
| `/s/owner/sovereign-vault` | `Routes.sSovereignVault` | OWNER | Route ownership is assigned outside Administrative V1. |
| `/s/owner/constitutional-memory` | `Routes.sConstitutionalMemory` | REGISTRY_GOVERNANCE | Route ownership is assigned outside Administrative V1. |
| `/s/owner/recovery-console` | `Routes.sRecoveryConsole` | TECHNICAL | Route ownership is assigned outside Administrative V1. |
| `/s/owner/capsules` | `Routes.sOwnerCapsules` | TECHNICAL | Route ownership is assigned outside Administrative V1. |
| `/s/owner/regeneration` | `Routes.sOwnerRegeneration` | TECHNICAL | Route ownership is assigned outside Administrative V1. |
| `/owner/os/construction-workbench` | `Routes.ownerConstructionWorkbench` | TECHNICAL | Route ownership is assigned outside Administrative V1. |
| `/s/capital/trust-safety` | `Routes.sTrustSafety` | SUPPORT_SAFETY | Route ownership is assigned outside Administrative V1. |
| `/s/capital/reports` | `Routes.sCapitalReports` | STRATEGIC_PLANNING | Route ownership is assigned outside Administrative V1. |
| `/chat/escalations` | `Routes.chatEscalations` | CHAT_SAFETY | Route ownership is assigned outside Administrative V1. |
| `/chat/escalation/report` | `Routes.chatEscalationReport` | CHAT_SAFETY | Route ownership is assigned outside Administrative V1. |
| SSupportRoomPage | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Page ownership is assigned outside Administrative V1. |
| SRegistryRoomPage | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | Page ownership is assigned outside Administrative V1. |
| SDeclarationReviewRoomPage | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Page ownership is assigned outside Administrative V1. |
| SOwnerDistrictPage | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | Page ownership is assigned outside Administrative V1. |
| SovereignConstructionWorkbenchPage | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | Page ownership is assigned outside Administrative V1. |
| ChatEscalationsPage | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | Page ownership is assigned outside Administrative V1. |
| ChatEscalationReportPage | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | Page ownership is assigned outside Administrative V1. |
| DomainStatusService | `lib/core/system/domain_status_service.dart` | REGISTRY_GOVERNANCE | Service or registry source ownership is assigned outside Administrative V1. |
| ChatFirestoreService | `lib/features/chat/data/services/chat_firestore_service.dart` | CHAT_SAFETY | Service or registry source ownership is assigned outside Administrative V1. |
| domainRegistry | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Service or registry source ownership is assigned outside Administrative V1. |
| ConstructionToolRegistry | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Service or registry source ownership is assigned outside Administrative V1. |
| support_requests | `support_requests` | SUPPORT_SAFETY | Collection or storage path ownership is assigned outside Administrative V1. |
| system_domains | `system_domains` | REGISTRY_GOVERNANCE | Collection or storage path ownership is assigned outside Administrative V1. |
| clinicians | `clinicians` | DECLARATION_REVIEW | Collection or storage path ownership is assigned outside Administrative V1. |
| centers | `centers` | DECLARATION_REVIEW | Collection or storage path ownership is assigned outside Administrative V1. |
| clinician_profile_change_requests | `clinician_profile_change_requests` | DECLARATION_REVIEW | Collection or storage path ownership is assigned outside Administrative V1. |
| center_profile_change_requests | `center_profile_change_requests` | DECLARATION_REVIEW | Collection or storage path ownership is assigned outside Administrative V1. |
| chat_threads | `chat_threads` | CHAT_SAFETY | Collection or storage path ownership is assigned outside Administrative V1. |
| chat_threads messages | `chat_threads/{threadId}/messages` | CHAT_SAFETY | Collection or storage path ownership is assigned outside Administrative V1. |
| chat_escalations | `chat_escalations` | CHAT_SAFETY | Collection or storage path ownership is assigned outside Administrative V1. |
| chat_escalation reports | `chat_escalations/{escalationId}/reports` | CHAT_SAFETY | Collection or storage path ownership is assigned outside Administrative V1. |
| provider_contact_requests | `provider_contact_requests` | SUPPORT_SAFETY | Collection or storage path ownership is assigned outside Administrative V1. |
| center_contact_requests | `center_contact_requests` | SUPPORT_SAFETY | Collection or storage path ownership is assigned outside Administrative V1. |
| centers storage path | `centers/{uid}/{allPaths=**}` | DECLARATION_REVIEW | Collection or storage path ownership is assigned outside Administrative V1. |
| clinicians storage path | `clinicians/{uid}/{allPaths=**}` | DECLARATION_REVIEW | Collection or storage path ownership is assigned outside Administrative V1. |
| DomainStatus | `lib/core/system/domain_status.dart` | REGISTRY_GOVERNANCE | Model or contract ownership is assigned outside Administrative V1. |
| DomainDefinition | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Model or contract ownership is assigned outside Administrative V1. |
| DomainKey | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Model or contract ownership is assigned outside Administrative V1. |
| DomainGovernanceCapability | `lib/core/system/domain_governance_capability.dart` | REGISTRY_GOVERNANCE | Model or contract ownership is assigned outside Administrative V1. |
| ConstructionToolEntry | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Model or contract ownership is assigned outside Administrative V1. |
| ConstructionToolType | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Model or contract ownership is assigned outside Administrative V1. |
| ConstructionLaunchType | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Model or contract ownership is assigned outside Administrative V1. |
| ChatEscalationModel | `lib/features/chat/data/models/chat_escalation_model.dart` | CHAT_SAFETY | Model or contract ownership is assigned outside Administrative V1. |
| ChatThreadModel | `lib/features/chat/data/models/chat_thread_model.dart` | CHAT_SAFETY | Model or contract ownership is assigned outside Administrative V1. |
| ChatMessageModel | `lib/features/chat/data/models/chat_message_model.dart` | CHAT_SAFETY | Model or contract ownership is assigned outside Administrative V1. |
| ChatSignalRoutingModel | `lib/features/chat/data/models/chat_signal_routing_model.dart` | CHAT_SAFETY | Model or contract ownership is assigned outside Administrative V1. |
| _SupportRequest | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Model or contract ownership is assigned outside Administrative V1. |
| _DeclarationRecord | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Model or contract ownership is assigned outside Administrative V1. |
| _DocumentItem | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Model or contract ownership is assigned outside Administrative V1. |
| _ComparisonItem | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Model or contract ownership is assigned outside Administrative V1. |
| ReviewerTypes | `lib/shared/contracts/reviewer_types.dart` | DECLARATION_REVIEW | Model or contract ownership is assigned outside Administrative V1. |
| Support Room visible text | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Visible text ownership follows the runtime surface owner. |
| Registry Room visible text | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | Visible text ownership follows the runtime surface owner. |
| Declaration Review visible text | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Visible text ownership follows the runtime surface owner. |
| Owner District visible text | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | Visible text ownership follows the runtime surface owner. |
| Sovereign Construction Workbench visible text | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | Visible text ownership follows the runtime surface owner. |
| Chat Escalations visible text | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | Visible text ownership follows the runtime surface owner. |
| Chat Escalation Report visible text | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | Visible text ownership follows the runtime surface owner. |
| Declaration Review Registry V1 | `docs/constitutional-baseline/registries/DECLARATION_REVIEW_REGISTRY_V1.md` | DECLARATION_REVIEW | Document ownership is assigned outside Administrative V1. |
| Owner Approval Registry V1 | `docs/constitutional-baseline/registries/OWNER_APPROVAL_REGISTRY_V1.md` | OWNER | Document ownership is assigned outside Administrative V1. |
| Monitoring Authority Registry V1 | `docs/constitutional-baseline/registries/MONITORING_AUTHORITY_REGISTRY_V1.md` | STRATEGIC_PLANNING | Document ownership is assigned outside Administrative V1. |
| Owner Domain Audit Report V1 | `docs/constitutional-baseline/topology/OWNER_DOMAIN_AUDIT_REPORT_V1.md` | OWNER | Document ownership is assigned outside Administrative V1. |
| Constitutional Health Scorecard V1 | `docs/constitutional-baseline/domain-audits/owner-governance/CONSTITUTIONAL_HEALTH_SCORECARD_V1.md` | REGISTRY_GOVERNANCE | Document ownership is assigned outside Administrative V1. |
| Owner Governance Architecture Report V1 | `docs/constitutional-baseline/domain-audits/owner-governance/OWNER_GOVERNANCE_ARCHITECTURE_REPORT_V1.md` | OWNER | Document ownership is assigned outside Administrative V1. |
| Registry Governance Report V1 | `docs/constitutional-baseline/domain-audits/owner-governance/REGISTRY_GOVERNANCE_REPORT_V1.md` | REGISTRY_GOVERNANCE | Document ownership is assigned outside Administrative V1. |
| Registry Governance Guide V1 | `docs/constitutional-baseline/guides/REGISTRY_GOVERNANCE_GUIDE_V1.md` | REGISTRY_GOVERNANCE | Document ownership is assigned outside Administrative V1. |
