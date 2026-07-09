# Administrative Archive Impact Map V1

Operation ID: OP-ADMINISTRATIVE-OWNERSHIP-AND-ARCHIVE-IMPACT-MAP-V1  
Date: 2026-06-25

## Purpose

This map lists impacted items if the current Administrative section is archived later.

No archive action is performed in this operation.

## Impact Map

| Item Name | Item Type | Current Path | Owner Bucket | Archive Package Required | Runtime Dependency Risk | Notes |
|---|---|---|---|---|---|---|
| `/s` | Route | `Routes.sIndex` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 route item. |
| `/s/support-room` | Route | `Routes.sSupportRoom` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/registry-room` | Route | `Routes.sRegistryRoom` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/declaration-review-room` | Route | `Routes.sDeclarationReviewRoom` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner` | Route | `Routes.sOwnerHome` | OWNER | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/room` | Route | `Routes.sOwnerRoom` | OWNER | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/sovereign-intelligence` | Route | `Routes.sSovereignIntelligence` | STRATEGIC_PLANNING | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/strategic-memory` | Route | `Routes.sStrategicMemory` | STRATEGIC_PLANNING | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/sovereign-vault` | Route | `Routes.sSovereignVault` | OWNER | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/constitutional-memory` | Route | `Routes.sConstitutionalMemory` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/recovery-console` | Route | `Routes.sRecoveryConsole` | TECHNICAL | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/capsules` | Route | `Routes.sOwnerCapsules` | TECHNICAL | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/owner/regeneration` | Route | `Routes.sOwnerRegeneration` | TECHNICAL | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/owner/os/construction-workbench` | Route | `Routes.ownerConstructionWorkbench` | TECHNICAL | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/capital/trust-safety` | Route | `Routes.sTrustSafety` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/s/capital/reports` | Route | `Routes.sCapitalReports` | STRATEGIC_PLANNING | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/chat/escalations` | Route | `Routes.chatEscalations` | CHAT_SAFETY | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| `/chat/escalation/report` | Route | `Routes.chatEscalationReport` | CHAT_SAFETY | NO | YES | Non-admin owner bucket route found in Administrative inventory. |
| SSupportRoomPage | Page | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket page found in Administrative inventory. |
| SRegistryRoomPage | Page | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket page found in Administrative inventory. |
| SDeclarationReviewRoomPage | Page | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket page found in Administrative inventory. |
| SOwnerDistrictPage | Page | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | NO | YES | Non-admin owner bucket page found in Administrative inventory. |
| SovereignConstructionWorkbenchPage | Page | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | NO | YES | Non-admin owner bucket page found in Administrative inventory. |
| ChatEscalationsPage | Page | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket page found in Administrative inventory. |
| ChatEscalationReportPage | Page | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket page found in Administrative inventory. |
| SSurfaceIndexPage | Page | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 page item. |
| SWebSurfacePage | Page | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 page item. |
| AccountAccessService | Service | `lib/core/auth/account_access_service.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 service or guard item. |
| DomainStatusService | Service | `lib/core/system/domain_status_service.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket service or registry source found in Administrative inventory. |
| ChatFirestoreService | Service | `lib/features/chat/data/services/chat_firestore_service.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket service or registry source found in Administrative inventory. |
| AppRouter route access gate | Service / Router Guard | `lib/app/router/app_router.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 service or guard item. |
| RoleAccessGateway | Service / Gateway | `lib/shared/gateways/role_access_gateway.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 service or guard item. |
| domainRegistry | Registry-like runtime source | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket service or registry source found in Administrative inventory. |
| ConstructionToolRegistry | Registry-like runtime source | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | NO | YES | Non-admin owner bucket service or registry source found in Administrative inventory. |
| support_requests | Firestore Collection | `support_requests` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| system_domains | Firestore Collection | `system_domains` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| clinicians | Firestore Collection | `clinicians` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| centers | Firestore Collection | `centers` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| clinician_profile_change_requests | Firestore Collection | `clinician_profile_change_requests` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| center_profile_change_requests | Firestore Collection | `center_profile_change_requests` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| chat_threads | Firestore Collection | `chat_threads` | CHAT_SAFETY | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| chat_threads messages | Firestore Subcollection | `chat_threads/{threadId}/messages` | CHAT_SAFETY | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| chat_escalations | Firestore Collection | `chat_escalations` | CHAT_SAFETY | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| chat_escalation reports | Firestore Subcollection | `chat_escalations/{escalationId}/reports` | CHAT_SAFETY | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| provider_contact_requests | Firestore Collection | `provider_contact_requests` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| center_contact_requests | Firestore Collection | `center_contact_requests` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| centers storage path | Storage Path | `centers/{uid}/{allPaths=**}` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| clinicians storage path | Storage Path | `clinicians/{uid}/{allPaths=**}` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket collection or rules path found in Administrative inventory. |
| identity storage path | Storage Path | `identity/{uid}/{allPaths=**}` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 collection or rules path item. |
| SignedInAccessState | Model | `lib/core/auth/account_access_service.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 model or contract item. |
| DomainStatus | Model | `lib/core/system/domain_status.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| DomainDefinition | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| DomainKey | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| DomainGovernanceCapability | Model | `lib/core/system/domain_governance_capability.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| ConstructionToolEntry | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| ConstructionToolType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| ConstructionLaunchType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| ChatEscalationModel | Model | `lib/features/chat/data/models/chat_escalation_model.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| ChatThreadModel | Model | `lib/features/chat/data/models/chat_thread_model.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| ChatMessageModel | Model | `lib/features/chat/data/models/chat_message_model.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| ChatSignalRoutingModel | Model | `lib/features/chat/data/models/chat_signal_routing_model.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| _SupportRequest | Local Page Model | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| _DeclarationRecord | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| _DocumentItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| _ComparisonItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| RoleNames | Contract | `lib/shared/contracts/role_names.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 model or contract item. |
| ReviewerTypes | Contract | `lib/shared/contracts/reviewer_types.dart` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket model or contract found in Administrative inventory. |
| Gold back left navigation icon | Asset | `assets/branding/navigation/back/back_left_gold.png` | ADMINISTRATIVE_V1 | YES | YES | Asset referenced by Administrative runtime inventory. |
| Gold back right navigation icon | Asset | `assets/branding/navigation/back/back_right_gold.png` | ADMINISTRATIVE_V1 | YES | YES | Asset referenced by Administrative runtime inventory. |
| app_localizations.dart | Localization file | `lib/l10n/app_localizations.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 localization item. |
| app_ar.arb | Localization source file | `lib/l10n/app_ar.arb` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 localization item. |
| app_en.arb | Localization source file | `lib/l10n/app_en.arb` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 localization item. |
| AppLocalizations routeNotFound usage | Localization usage | `lib/app/router/app_router.dart` | ADMINISTRATIVE_V1 | YES | YES | Administrative V1 localization item. |
| Support Room visible text | Hardcoded text location | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | NO | YES | Non-admin owner bucket localization item found in Administrative inventory. |
| Registry Room visible text | Hardcoded text location | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | NO | YES | Non-admin owner bucket localization item found in Administrative inventory. |
| Declaration Review visible text | Hardcoded text location | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | NO | YES | Non-admin owner bucket localization item found in Administrative inventory. |
| Owner District visible text | Hardcoded text location | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | NO | YES | Non-admin owner bucket localization item found in Administrative inventory. |
| Sovereign Construction Workbench visible text | Hardcoded text location | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | NO | YES | Non-admin owner bucket localization item found in Administrative inventory. |
| Chat Escalations visible text | Hardcoded text location | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket localization item found in Administrative inventory. |
| Chat Escalation Report visible text | Hardcoded text location | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | NO | YES | Non-admin owner bucket localization item found in Administrative inventory. |
| Administrative Architecture Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_ARCHITECTURE_REPORT_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Collection Health Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_COLLECTION_HEALTH_REPORT_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Findings Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_FINDINGS_REPORT_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Health Scorecard V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_HEALTH_SCORECARD_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Route Health Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_ROUTE_HEALTH_REPORT_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Signal Flow Report V1 | Document | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_SIGNAL_FLOW_REPORT_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Route Ownership Registry V1 | Document | `docs/constitutional-baseline/registries/ADMINISTRATIVE_ROUTE_OWNERSHIP_REGISTRY_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Collection Ownership Registry V1 | Document | `docs/constitutional-baseline/registries/ADMINISTRATIVE_COLLECTION_OWNERSHIP_REGISTRY_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Declaration Review Registry V1 | Document | `docs/constitutional-baseline/registries/DECLARATION_REVIEW_REGISTRY_V1.md` | DECLARATION_REVIEW | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
| Owner Approval Registry V1 | Document | `docs/constitutional-baseline/registries/OWNER_APPROVAL_REGISTRY_V1.md` | OWNER | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
| Monitoring Authority Registry V1 | Document | `docs/constitutional-baseline/registries/MONITORING_AUTHORITY_REGISTRY_V1.md` | STRATEGIC_PLANNING | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
| Archive Card Admin Zero Transition V1 | Document | `docs/constitutional-baseline/cards/archive/ARCHIVE_CARD_ADMIN_ZERO_TRANSITION_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Administrative Prompt Library Index V1 | Document | `docs/archive/technical-recovery-vault/prompt-library/ADMINISTRATIVE_PROMPT_LIBRARY_INDEX_V1.md` | ADMINISTRATIVE_V1 | YES | NO | Administrative V1 documentation item. |
| Owner Domain Audit Report V1 | Document | `docs/constitutional-baseline/topology/OWNER_DOMAIN_AUDIT_REPORT_V1.md` | OWNER | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
| Constitutional Health Scorecard V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/CONSTITUTIONAL_HEALTH_SCORECARD_V1.md` | REGISTRY_GOVERNANCE | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
| Owner Governance Architecture Report V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/OWNER_GOVERNANCE_ARCHITECTURE_REPORT_V1.md` | OWNER | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
| Registry Governance Report V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/REGISTRY_GOVERNANCE_REPORT_V1.md` | REGISTRY_GOVERNANCE | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
| Registry Governance Guide V1 | Document | `docs/constitutional-baseline/guides/REGISTRY_GOVERNANCE_GUIDE_V1.md` | REGISTRY_GOVERNANCE | NO | NO | Non-admin owner bucket documentation found in Administrative inventory. |
