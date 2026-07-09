# Administrative Ownership Map V1

Operation ID: OP-ADMINISTRATIVE-OWNERSHIP-AND-ARCHIVE-IMPACT-MAP-V1  
Date: 2026-06-25

## Source Material

This map uses the Administrative forensic inventory files under:

`docs/sections/administrative/`

## Owner Buckets

Allowed owner buckets used:

- OWNER
- STRATEGIC_PLANNING
- TECHNICAL
- SUPPORT_SAFETY
- REGISTRY_GOVERNANCE
- DECLARATION_REVIEW
- CHAT_SAFETY
- ADMINISTRATIVE_V1
- UNKNOWN_OWNER

UNKNOWN_OWNER count in this map:

0

## Route Ownership

| Item | Type | Path / Route | Owner Bucket |
|---|---|---|---|
| `/s` | Route | `Routes.sIndex` | ADMINISTRATIVE_V1 |
| `/s/support-room` | Route | `Routes.sSupportRoom` | SUPPORT_SAFETY |
| `/s/registry-room` | Route | `Routes.sRegistryRoom` | REGISTRY_GOVERNANCE |
| `/s/declaration-review-room` | Route | `Routes.sDeclarationReviewRoom` | DECLARATION_REVIEW |
| `/s/owner` | Route | `Routes.sOwnerHome` | OWNER |
| `/s/owner/room` | Route | `Routes.sOwnerRoom` | OWNER |
| `/s/owner/sovereign-intelligence` | Route | `Routes.sSovereignIntelligence` | STRATEGIC_PLANNING |
| `/s/owner/strategic-memory` | Route | `Routes.sStrategicMemory` | STRATEGIC_PLANNING |
| `/s/owner/sovereign-vault` | Route | `Routes.sSovereignVault` | OWNER |
| `/s/owner/constitutional-memory` | Route | `Routes.sConstitutionalMemory` | REGISTRY_GOVERNANCE |
| `/s/owner/recovery-console` | Route | `Routes.sRecoveryConsole` | TECHNICAL |
| `/s/owner/capsules` | Route | `Routes.sOwnerCapsules` | TECHNICAL |
| `/s/owner/regeneration` | Route | `Routes.sOwnerRegeneration` | TECHNICAL |
| `/owner/os/construction-workbench` | Route | `Routes.ownerConstructionWorkbench` | TECHNICAL |
| `/s/capital/trust-safety` | Route | `Routes.sTrustSafety` | SUPPORT_SAFETY |
| `/s/capital/reports` | Route | `Routes.sCapitalReports` | STRATEGIC_PLANNING |
| `/chat/escalations` | Route | `Routes.chatEscalations` | CHAT_SAFETY |
| `/chat/escalation/report` | Route | `Routes.chatEscalationReport` | CHAT_SAFETY |

## Page Ownership

| Item | Type | Path | Owner Bucket |
|---|---|---|---|
| SSupportRoomPage | Page | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY |
| SRegistryRoomPage | Page | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE |
| SDeclarationReviewRoomPage | Page | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW |
| SOwnerDistrictPage | Page | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER |
| SovereignConstructionWorkbenchPage | Page | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL |
| ChatEscalationsPage | Page | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY |
| ChatEscalationReportPage | Page | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY |
| SSurfaceIndexPage | Page | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | ADMINISTRATIVE_V1 |
| SWebSurfacePage | Page | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | ADMINISTRATIVE_V1 |

## Service Ownership

| Item | Type | Path | Owner Bucket |
|---|---|---|---|
| AccountAccessService | Service | `lib/core/auth/account_access_service.dart` | ADMINISTRATIVE_V1 |
| DomainStatusService | Service | `lib/core/system/domain_status_service.dart` | REGISTRY_GOVERNANCE |
| ChatFirestoreService | Service | `lib/features/chat/data/services/chat_firestore_service.dart` | CHAT_SAFETY |
| AppRouter route access gate | Service / Router Guard | `lib/app/router/app_router.dart` | ADMINISTRATIVE_V1 |
| RoleAccessGateway | Service / Gateway | `lib/shared/gateways/role_access_gateway.dart` | ADMINISTRATIVE_V1 |
| domainRegistry | Registry-like runtime source | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE |
| ConstructionToolRegistry | Registry-like runtime source | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL |

## Collection Ownership

| Item | Type | Path / Collection | Owner Bucket |
|---|---|---|---|
| support_requests | Firestore Collection | `support_requests` | SUPPORT_SAFETY |
| system_domains | Firestore Collection | `system_domains` | REGISTRY_GOVERNANCE |
| clinicians | Firestore Collection | `clinicians` | DECLARATION_REVIEW |
| centers | Firestore Collection | `centers` | DECLARATION_REVIEW |
| clinician_profile_change_requests | Firestore Collection | `clinician_profile_change_requests` | DECLARATION_REVIEW |
| center_profile_change_requests | Firestore Collection | `center_profile_change_requests` | DECLARATION_REVIEW |
| chat_threads | Firestore Collection | `chat_threads` | CHAT_SAFETY |
| chat_threads messages | Firestore Subcollection | `chat_threads/{threadId}/messages` | CHAT_SAFETY |
| chat_escalations | Firestore Collection | `chat_escalations` | CHAT_SAFETY |
| chat_escalation reports | Firestore Subcollection | `chat_escalations/{escalationId}/reports` | CHAT_SAFETY |
| provider_contact_requests | Firestore Collection | `provider_contact_requests` | SUPPORT_SAFETY |
| center_contact_requests | Firestore Collection | `center_contact_requests` | SUPPORT_SAFETY |
| centers storage path | Storage Path | `centers/{uid}/{allPaths=**}` | DECLARATION_REVIEW |
| clinicians storage path | Storage Path | `clinicians/{uid}/{allPaths=**}` | DECLARATION_REVIEW |
| identity storage path | Storage Path | `identity/{uid}/{allPaths=**}` | ADMINISTRATIVE_V1 |

## Model Ownership

| Item | Type | Path | Owner Bucket |
|---|---|---|---|
| SignedInAccessState | Model | `lib/core/auth/account_access_service.dart` | ADMINISTRATIVE_V1 |
| DomainStatus | Model | `lib/core/system/domain_status.dart` | REGISTRY_GOVERNANCE |
| DomainDefinition | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE |
| DomainKey | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE |
| DomainGovernanceCapability | Model | `lib/core/system/domain_governance_capability.dart` | REGISTRY_GOVERNANCE |
| ConstructionToolEntry | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL |
| ConstructionToolType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL |
| ConstructionLaunchType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL |
| ChatEscalationModel | Model | `lib/features/chat/data/models/chat_escalation_model.dart` | CHAT_SAFETY |
| ChatThreadModel | Model | `lib/features/chat/data/models/chat_thread_model.dart` | CHAT_SAFETY |
| ChatMessageModel | Model | `lib/features/chat/data/models/chat_message_model.dart` | CHAT_SAFETY |
| ChatSignalRoutingModel | Model | `lib/features/chat/data/models/chat_signal_routing_model.dart` | CHAT_SAFETY |
| _SupportRequest | Local Page Model | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY |
| _DeclarationRecord | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW |
| _DocumentItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW |
| _ComparisonItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW |
| RoleNames | Contract | `lib/shared/contracts/role_names.dart` | ADMINISTRATIVE_V1 |
| ReviewerTypes | Contract | `lib/shared/contracts/reviewer_types.dart` | DECLARATION_REVIEW |

## Asset Ownership

| Item | Type | Path | Owner Bucket |
|---|---|---|---|
| Gold back left navigation icon | Asset | `assets/branding/navigation/back/back_left_gold.png` | ADMINISTRATIVE_V1 |
| Gold back right navigation icon | Asset | `assets/branding/navigation/back/back_right_gold.png` | ADMINISTRATIVE_V1 |

## Localization Ownership

| Item | Type | Path | Owner Bucket |
|---|---|---|---|
| app_localizations.dart | Localization file | `lib/l10n/app_localizations.dart` | ADMINISTRATIVE_V1 |
| app_ar.arb | Localization source file | `lib/l10n/app_ar.arb` | ADMINISTRATIVE_V1 |
| app_en.arb | Localization source file | `lib/l10n/app_en.arb` | ADMINISTRATIVE_V1 |
| AppLocalizations routeNotFound usage | Localization usage | `lib/app/router/app_router.dart` | ADMINISTRATIVE_V1 |
| Support Room visible text | Hardcoded text location | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY |
| Registry Room visible text | Hardcoded text location | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE |
| Declaration Review visible text | Hardcoded text location | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW |
| Owner District visible text | Hardcoded text location | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER |
| Sovereign Construction Workbench visible text | Hardcoded text location | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL |
| Chat Escalations visible text | Hardcoded text location | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY |
| Chat Escalation Report visible text | Hardcoded text location | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY |

## Documentation Ownership

| Item | Type | Path | Owner Bucket |
|---|---|---|---|
| Administrative Architecture Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_ARCHITECTURE_REPORT_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Collection Health Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_COLLECTION_HEALTH_REPORT_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Findings Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_FINDINGS_REPORT_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Health Scorecard V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_HEALTH_SCORECARD_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Route Health Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_ROUTE_HEALTH_REPORT_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Signal Flow Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_SIGNAL_FLOW_REPORT_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Route Ownership Registry V1 | Document | `docs/constitutional-baseline/registries/ADMINISTRATIVE_ROUTE_OWNERSHIP_REGISTRY_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Collection Ownership Registry V1 | Document | `docs/constitutional-baseline/registries/ADMINISTRATIVE_COLLECTION_OWNERSHIP_REGISTRY_V1.md` | ADMINISTRATIVE_V1 |
| Declaration Review Registry V1 | Document | `docs/constitutional-baseline/registries/DECLARATION_REVIEW_REGISTRY_V1.md` | DECLARATION_REVIEW |
| Owner Approval Registry V1 | Document | `docs/constitutional-baseline/registries/OWNER_APPROVAL_REGISTRY_V1.md` | OWNER |
| Monitoring Authority Registry V1 | Document | `docs/constitutional-baseline/registries/MONITORING_AUTHORITY_REGISTRY_V1.md` | STRATEGIC_PLANNING |
| Archive Card Admin Zero Transition V1 | Document | `docs/constitutional-baseline/cards/archive/ARCHIVE_CARD_ADMIN_ZERO_TRANSITION_V1.md` | ADMINISTRATIVE_V1 |
| Administrative Prompt Library Index V1 | Document | `docs/archive/technical-recovery-vault/prompt-library/ADMINISTRATIVE_PROMPT_LIBRARY_INDEX_V1.md` | ADMINISTRATIVE_V1 |
| Owner Domain Audit Report V1 | Document | `docs/constitutional-baseline/topology/OWNER_DOMAIN_AUDIT_REPORT_V1.md` | OWNER |
| Constitutional Health Scorecard V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/CONSTITUTIONAL_HEALTH_SCORECARD_V1.md` | REGISTRY_GOVERNANCE |
| Owner Governance Architecture Report V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/OWNER_GOVERNANCE_ARCHITECTURE_REPORT_V1.md` | OWNER |
| Registry Governance Report V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/REGISTRY_GOVERNANCE_REPORT_V1.md` | REGISTRY_GOVERNANCE |
| Registry Governance Guide V1 | Document | `docs/constitutional-baseline/guides/REGISTRY_GOVERNANCE_GUIDE_V1.md` | REGISTRY_GOVERNANCE |

