# Administrative Non Admin Extraction Package V1

Operation ID: OP-ADMINISTRATIVE-V1-FULL-ARCHIVE-EXECUTION-BLOCK-V1  
Date: 2026-06-25

## Scope

Classifies every non-Administrative item found in the Administrative inventory by its existing future owner bucket. No item remains UNKNOWN.

## OWNER

| Item | Current Path | Reason |
|---|---|---|
| `/s/owner` | `Routes.sOwnerHome` | Route ownership is assigned outside Administrative V1. |
| `/s/owner/room` | `Routes.sOwnerRoom` | Route ownership is assigned outside Administrative V1. |
| `/s/owner/sovereign-vault` | `Routes.sSovereignVault` | Route ownership is assigned outside Administrative V1. |
| SOwnerDistrictPage | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | Page ownership is assigned outside Administrative V1. |
| Owner District visible text | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | Visible text ownership follows the runtime surface owner. |
| Owner Approval Registry V1 | `docs/constitutional-baseline/registries/OWNER_APPROVAL_REGISTRY_V1.md` | Document ownership is assigned outside Administrative V1. |
| Owner Domain Audit Report V1 | `docs/constitutional-baseline/topology/OWNER_DOMAIN_AUDIT_REPORT_V1.md` | Document ownership is assigned outside Administrative V1. |
| Owner Governance Architecture Report V1 | `docs/constitutional-baseline/domain-audits/owner-governance/OWNER_GOVERNANCE_ARCHITECTURE_REPORT_V1.md` | Document ownership is assigned outside Administrative V1. |

## LEGAL

| Item | Current Path | Reason |
|---|---|---|
| None observed in required source reports. | N/A | N/A |

## ACCOUNTING

| Item | Current Path | Reason |
|---|---|---|
| None observed in required source reports. | N/A | N/A |

## STRATEGIC_PLANNING

| Item | Current Path | Reason |
|---|---|---|
| `/s/owner/sovereign-intelligence` | `Routes.sSovereignIntelligence` | Route ownership is assigned outside Administrative V1. |
| `/s/owner/strategic-memory` | `Routes.sStrategicMemory` | Route ownership is assigned outside Administrative V1. |
| `/s/capital/reports` | `Routes.sCapitalReports` | Route ownership is assigned outside Administrative V1. |
| Monitoring Authority Registry V1 | `docs/constitutional-baseline/registries/MONITORING_AUTHORITY_REGISTRY_V1.md` | Document ownership is assigned outside Administrative V1. |

## TECHNICAL

| Item | Current Path | Reason |
|---|---|---|
| `/s/owner/recovery-console` | `Routes.sRecoveryConsole` | Route ownership is assigned outside Administrative V1. |
| `/s/owner/capsules` | `Routes.sOwnerCapsules` | Route ownership is assigned outside Administrative V1. |
| `/s/owner/regeneration` | `Routes.sOwnerRegeneration` | Route ownership is assigned outside Administrative V1. |
| `/owner/os/construction-workbench` | `Routes.ownerConstructionWorkbench` | Route ownership is assigned outside Administrative V1. |
| SovereignConstructionWorkbenchPage | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | Page ownership is assigned outside Administrative V1. |
| ConstructionToolRegistry | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | Service or registry source ownership is assigned outside Administrative V1. |
| ConstructionToolEntry | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | Model or contract ownership is assigned outside Administrative V1. |
| ConstructionToolType | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | Model or contract ownership is assigned outside Administrative V1. |
| ConstructionLaunchType | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | Model or contract ownership is assigned outside Administrative V1. |
| Sovereign Construction Workbench visible text | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | Visible text ownership follows the runtime surface owner. |

## SUPPORT_SAFETY

| Item | Current Path | Reason |
|---|---|---|
| `/s/support-room` | `Routes.sSupportRoom` | Route ownership is assigned outside Administrative V1. |
| `/s/capital/trust-safety` | `Routes.sTrustSafety` | Route ownership is assigned outside Administrative V1. |
| SSupportRoomPage | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | Page ownership is assigned outside Administrative V1. |
| support_requests | `support_requests` | Collection or storage path ownership is assigned outside Administrative V1. |
| provider_contact_requests | `provider_contact_requests` | Collection or storage path ownership is assigned outside Administrative V1. |
| center_contact_requests | `center_contact_requests` | Collection or storage path ownership is assigned outside Administrative V1. |
| _SupportRequest | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | Model or contract ownership is assigned outside Administrative V1. |
| Support Room visible text | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | Visible text ownership follows the runtime surface owner. |

## DECLARATION_REVIEW

| Item | Current Path | Reason |
|---|---|---|
| `/s/declaration-review-room` | `Routes.sDeclarationReviewRoom` | Route ownership is assigned outside Administrative V1. |
| SDeclarationReviewRoomPage | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | Page ownership is assigned outside Administrative V1. |
| clinicians | `clinicians` | Collection or storage path ownership is assigned outside Administrative V1. |
| centers | `centers` | Collection or storage path ownership is assigned outside Administrative V1. |
| clinician_profile_change_requests | `clinician_profile_change_requests` | Collection or storage path ownership is assigned outside Administrative V1. |
| center_profile_change_requests | `center_profile_change_requests` | Collection or storage path ownership is assigned outside Administrative V1. |
| centers storage path | `centers/{uid}/{allPaths=**}` | Collection or storage path ownership is assigned outside Administrative V1. |
| clinicians storage path | `clinicians/{uid}/{allPaths=**}` | Collection or storage path ownership is assigned outside Administrative V1. |
| _DeclarationRecord | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | Model or contract ownership is assigned outside Administrative V1. |
| _DocumentItem | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | Model or contract ownership is assigned outside Administrative V1. |
| _ComparisonItem | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | Model or contract ownership is assigned outside Administrative V1. |
| ReviewerTypes | `lib/shared/contracts/reviewer_types.dart` | Model or contract ownership is assigned outside Administrative V1. |
| Declaration Review visible text | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | Visible text ownership follows the runtime surface owner. |
| Declaration Review Registry V1 | `docs/constitutional-baseline/registries/DECLARATION_REVIEW_REGISTRY_V1.md` | Document ownership is assigned outside Administrative V1. |

## CHAT_SAFETY

| Item | Current Path | Reason |
|---|---|---|
| `/chat/escalations` | `Routes.chatEscalations` | Route ownership is assigned outside Administrative V1. |
| `/chat/escalation/report` | `Routes.chatEscalationReport` | Route ownership is assigned outside Administrative V1. |
| ChatEscalationsPage | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | Page ownership is assigned outside Administrative V1. |
| ChatEscalationReportPage | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | Page ownership is assigned outside Administrative V1. |
| ChatFirestoreService | `lib/features/chat/data/services/chat_firestore_service.dart` | Service or registry source ownership is assigned outside Administrative V1. |
| chat_threads | `chat_threads` | Collection or storage path ownership is assigned outside Administrative V1. |
| chat_threads messages | `chat_threads/{threadId}/messages` | Collection or storage path ownership is assigned outside Administrative V1. |
| chat_escalations | `chat_escalations` | Collection or storage path ownership is assigned outside Administrative V1. |
| chat_escalation reports | `chat_escalations/{escalationId}/reports` | Collection or storage path ownership is assigned outside Administrative V1. |
| ChatEscalationModel | `lib/features/chat/data/models/chat_escalation_model.dart` | Model or contract ownership is assigned outside Administrative V1. |
| ChatThreadModel | `lib/features/chat/data/models/chat_thread_model.dart` | Model or contract ownership is assigned outside Administrative V1. |
| ChatMessageModel | `lib/features/chat/data/models/chat_message_model.dart` | Model or contract ownership is assigned outside Administrative V1. |
| ChatSignalRoutingModel | `lib/features/chat/data/models/chat_signal_routing_model.dart` | Model or contract ownership is assigned outside Administrative V1. |
| Chat Escalations visible text | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | Visible text ownership follows the runtime surface owner. |
| Chat Escalation Report visible text | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | Visible text ownership follows the runtime surface owner. |

## REGISTRY_GOVERNANCE

| Item | Current Path | Reason |
|---|---|---|
| `/s/registry-room` | `Routes.sRegistryRoom` | Route ownership is assigned outside Administrative V1. |
| `/s/owner/constitutional-memory` | `Routes.sConstitutionalMemory` | Route ownership is assigned outside Administrative V1. |
| SRegistryRoomPage | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | Page ownership is assigned outside Administrative V1. |
| DomainStatusService | `lib/core/system/domain_status_service.dart` | Service or registry source ownership is assigned outside Administrative V1. |
| domainRegistry | `lib/core/system/domain_registry.dart` | Service or registry source ownership is assigned outside Administrative V1. |
| system_domains | `system_domains` | Collection or storage path ownership is assigned outside Administrative V1. |
| DomainStatus | `lib/core/system/domain_status.dart` | Model or contract ownership is assigned outside Administrative V1. |
| DomainDefinition | `lib/core/system/domain_registry.dart` | Model or contract ownership is assigned outside Administrative V1. |
| DomainKey | `lib/core/system/domain_registry.dart` | Model or contract ownership is assigned outside Administrative V1. |
| DomainGovernanceCapability | `lib/core/system/domain_governance_capability.dart` | Model or contract ownership is assigned outside Administrative V1. |
| Registry Room visible text | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | Visible text ownership follows the runtime surface owner. |
| Constitutional Health Scorecard V1 | `docs/constitutional-baseline/domain-audits/owner-governance/CONSTITUTIONAL_HEALTH_SCORECARD_V1.md` | Document ownership is assigned outside Administrative V1. |
| Registry Governance Report V1 | `docs/constitutional-baseline/domain-audits/owner-governance/REGISTRY_GOVERNANCE_REPORT_V1.md` | Document ownership is assigned outside Administrative V1. |
| Registry Governance Guide V1 | `docs/constitutional-baseline/guides/REGISTRY_GOVERNANCE_GUIDE_V1.md` | Document ownership is assigned outside Administrative V1. |

## Validation

UNKNOWN items: 0

New ownership created: NO
