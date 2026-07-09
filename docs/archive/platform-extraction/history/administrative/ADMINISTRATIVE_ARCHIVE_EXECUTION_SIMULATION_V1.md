# Administrative Archive Execution Simulation V1

Operation ID: OP-ADMINISTRATIVE-V1-FULL-ARCHIVE-EXECUTION-BLOCK-V1  
Date: 2026-06-25

## Scope

Simulation only. No archive, deletion, move, route change, runtime change, Firebase change, Firestore change, or Storage change was performed.

## If Archive Happened Today: What Disappears

| Item | Group / Type | Path | Simulation Result |
|---|---|---|---|
| `/s` | Routes | `Routes.sIndex` | Would be included in Administrative V1 archive package, subject to card block. |
| SSurfaceIndexPage | Pages | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| SWebSurfacePage | Pages | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| AccountAccessService | Services | `lib/core/auth/account_access_service.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| AppRouter route access gate | Services | `lib/app/router/app_router.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| RoleAccessGateway | Services | `lib/shared/gateways/role_access_gateway.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| SignedInAccessState | Models | `lib/core/auth/account_access_service.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| RoleNames | Models | `lib/shared/contracts/role_names.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| identity storage path | Collections | `identity/{uid}/{allPaths=**}` | Would be included in Administrative V1 archive package, subject to card block. |
| Gold back left navigation icon | Assets | `assets/branding/navigation/back/back_left_gold.png` | Would be included in Administrative V1 archive package, subject to card block. |
| Gold back right navigation icon | Assets | `assets/branding/navigation/back/back_right_gold.png` | Would be included in Administrative V1 archive package, subject to card block. |
| app_localizations.dart | Localization | `lib/l10n/app_localizations.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| app_ar.arb | Localization | `lib/l10n/app_ar.arb` | Would be included in Administrative V1 archive package, subject to card block. |
| app_en.arb | Localization | `lib/l10n/app_en.arb` | Would be included in Administrative V1 archive package, subject to card block. |
| AppLocalizations routeNotFound usage | Localization | `lib/app/router/app_router.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Architecture Report V1 | Documentation | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_ARCHITECTURE_REPORT_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Collection Health Report V1 | Documentation | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_COLLECTION_HEALTH_REPORT_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Findings Report V1 | Documentation | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_FINDINGS_REPORT_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Health Scorecard V1 | Documentation | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_HEALTH_SCORECARD_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Route Health Report V1 | Documentation | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_ROUTE_HEALTH_REPORT_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Signal Flow Report V1 | Documentation | `docs/constitutional-baseline/domain-audits/administrative/ADMINISTRATIVE_SIGNAL_FLOW_REPORT_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Route Ownership Registry V1 | Documentation | `docs/constitutional-baseline/registries/ADMINISTRATIVE_ROUTE_OWNERSHIP_REGISTRY_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Collection Ownership Registry V1 | Documentation | `docs/constitutional-baseline/registries/ADMINISTRATIVE_COLLECTION_OWNERSHIP_REGISTRY_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Archive Card Admin Zero Transition V1 | Documentation | `docs/constitutional-baseline/cards/archive/ARCHIVE_CARD_ADMIN_ZERO_TRANSITION_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Administrative Prompt Library Index V1 | Documentation | `docs/archive/technical-recovery-vault/prompt-library/ADMINISTRATIVE_PROMPT_LIBRARY_INDEX_V1.md` | Would be included in Administrative V1 archive package, subject to card block. |
| Constitutional role functions | Rules References | `firestore.rules` | Would be included in Administrative V1 archive package, subject to card block. |
| Route guard role set references | Rules References | `lib/app/router/app_router.dart` | Would be included in Administrative V1 archive package, subject to card block. |
| Owner authority storage helper | Rules References | `storage.rules` | Would be included in Administrative V1 archive package, subject to card block. |

## If Archive Happened Today: What Remains

| Item | Type | Path | Owner Bucket | Simulation Result |
|---|---|---|---|---|
| `/s/support-room` | Route | `Routes.sSupportRoom` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| `/s/registry-room` | Route | `Routes.sRegistryRoom` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| `/s/declaration-review-room` | Route | `Routes.sDeclarationReviewRoom` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| `/s/owner` | Route | `Routes.sOwnerHome` | OWNER | Remains outside Administrative V1 archive package. |
| `/s/owner/room` | Route | `Routes.sOwnerRoom` | OWNER | Remains outside Administrative V1 archive package. |
| `/s/owner/sovereign-intelligence` | Route | `Routes.sSovereignIntelligence` | STRATEGIC_PLANNING | Remains outside Administrative V1 archive package. |
| `/s/owner/strategic-memory` | Route | `Routes.sStrategicMemory` | STRATEGIC_PLANNING | Remains outside Administrative V1 archive package. |
| `/s/owner/sovereign-vault` | Route | `Routes.sSovereignVault` | OWNER | Remains outside Administrative V1 archive package. |
| `/s/owner/constitutional-memory` | Route | `Routes.sConstitutionalMemory` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| `/s/owner/recovery-console` | Route | `Routes.sRecoveryConsole` | TECHNICAL | Remains outside Administrative V1 archive package. |
| `/s/owner/capsules` | Route | `Routes.sOwnerCapsules` | TECHNICAL | Remains outside Administrative V1 archive package. |
| `/s/owner/regeneration` | Route | `Routes.sOwnerRegeneration` | TECHNICAL | Remains outside Administrative V1 archive package. |
| `/owner/os/construction-workbench` | Route | `Routes.ownerConstructionWorkbench` | TECHNICAL | Remains outside Administrative V1 archive package. |
| `/s/capital/trust-safety` | Route | `Routes.sTrustSafety` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| `/s/capital/reports` | Route | `Routes.sCapitalReports` | STRATEGIC_PLANNING | Remains outside Administrative V1 archive package. |
| `/chat/escalations` | Route | `Routes.chatEscalations` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| `/chat/escalation/report` | Route | `Routes.chatEscalationReport` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| SSupportRoomPage | Page | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| SRegistryRoomPage | Page | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| SDeclarationReviewRoomPage | Page | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| SOwnerDistrictPage | Page | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | Remains outside Administrative V1 archive package. |
| SovereignConstructionWorkbenchPage | Page | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | Remains outside Administrative V1 archive package. |
| ChatEscalationsPage | Page | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| ChatEscalationReportPage | Page | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| DomainStatusService | Service | `lib/core/system/domain_status_service.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| ChatFirestoreService | Service | `lib/features/chat/data/services/chat_firestore_service.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| domainRegistry | Registry-like runtime source | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| ConstructionToolRegistry | Registry-like runtime source | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Remains outside Administrative V1 archive package. |
| support_requests | Firestore Collection | `support_requests` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| system_domains | Firestore Collection | `system_domains` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| clinicians | Firestore Collection | `clinicians` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| centers | Firestore Collection | `centers` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| clinician_profile_change_requests | Firestore Collection | `clinician_profile_change_requests` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| center_profile_change_requests | Firestore Collection | `center_profile_change_requests` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| chat_threads | Firestore Collection | `chat_threads` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| chat_threads messages | Firestore Subcollection | `chat_threads/{threadId}/messages` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| chat_escalations | Firestore Collection | `chat_escalations` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| chat_escalation reports | Firestore Subcollection | `chat_escalations/{escalationId}/reports` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| provider_contact_requests | Firestore Collection | `provider_contact_requests` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| center_contact_requests | Firestore Collection | `center_contact_requests` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| centers storage path | Storage Path | `centers/{uid}/{allPaths=**}` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| clinicians storage path | Storage Path | `clinicians/{uid}/{allPaths=**}` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| DomainStatus | Model | `lib/core/system/domain_status.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| DomainDefinition | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| DomainKey | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| DomainGovernanceCapability | Model | `lib/core/system/domain_governance_capability.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| ConstructionToolEntry | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Remains outside Administrative V1 archive package. |
| ConstructionToolType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Remains outside Administrative V1 archive package. |
| ConstructionLaunchType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Remains outside Administrative V1 archive package. |
| ChatEscalationModel | Model | `lib/features/chat/data/models/chat_escalation_model.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| ChatThreadModel | Model | `lib/features/chat/data/models/chat_thread_model.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| ChatMessageModel | Model | `lib/features/chat/data/models/chat_message_model.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| ChatSignalRoutingModel | Model | `lib/features/chat/data/models/chat_signal_routing_model.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| _SupportRequest | Local Page Model | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| _DeclarationRecord | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| _DocumentItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| _ComparisonItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| ReviewerTypes | Contract | `lib/shared/contracts/reviewer_types.dart` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| Support Room visible text | Hardcoded text location | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Remains outside Administrative V1 archive package. |
| Registry Room visible text | Hardcoded text location | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| Declaration Review visible text | Hardcoded text location | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| Owner District visible text | Hardcoded text location | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | Remains outside Administrative V1 archive package. |
| Sovereign Construction Workbench visible text | Hardcoded text location | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | Remains outside Administrative V1 archive package. |
| Chat Escalations visible text | Hardcoded text location | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| Chat Escalation Report visible text | Hardcoded text location | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | Remains outside Administrative V1 archive package. |
| Declaration Review Registry V1 | Document | `docs/constitutional-baseline/registries/DECLARATION_REVIEW_REGISTRY_V1.md` | DECLARATION_REVIEW | Remains outside Administrative V1 archive package. |
| Owner Approval Registry V1 | Document | `docs/constitutional-baseline/registries/OWNER_APPROVAL_REGISTRY_V1.md` | OWNER | Remains outside Administrative V1 archive package. |
| Monitoring Authority Registry V1 | Document | `docs/constitutional-baseline/registries/MONITORING_AUTHORITY_REGISTRY_V1.md` | STRATEGIC_PLANNING | Remains outside Administrative V1 archive package. |
| Owner Domain Audit Report V1 | Document | `docs/constitutional-baseline/topology/OWNER_DOMAIN_AUDIT_REPORT_V1.md` | OWNER | Remains outside Administrative V1 archive package. |
| Constitutional Health Scorecard V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/CONSTITUTIONAL_HEALTH_SCORECARD_V1.md` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| Owner Governance Architecture Report V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/OWNER_GOVERNANCE_ARCHITECTURE_REPORT_V1.md` | OWNER | Remains outside Administrative V1 archive package. |
| Registry Governance Report V1 | Document | `docs/constitutional-baseline/domain-audits/owner-governance/REGISTRY_GOVERNANCE_REPORT_V1.md` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |
| Registry Governance Guide V1 | Document | `docs/constitutional-baseline/guides/REGISTRY_GOVERNANCE_GUIDE_V1.md` | REGISTRY_GOVERNANCE | Remains outside Administrative V1 archive package. |

## If Archive Happened Today: What Breaks

| Item | Type | Path | Reason |
|---|---|---|---|
| `/s` | Route | `Routes.sIndex` | Runtime dependency risk is YES in the archive impact map. |
| SSurfaceIndexPage | Page | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | Runtime dependency risk is YES in the archive impact map. |
| SWebSurfacePage | Page | `lib/features/s_web_surfaces/presentation/pages/s_web_surface_pages.dart` | Runtime dependency risk is YES in the archive impact map. |
| AccountAccessService | Service | `lib/core/auth/account_access_service.dart` | Runtime dependency risk is YES in the archive impact map. |
| AppRouter route access gate | Service / Router Guard | `lib/app/router/app_router.dart` | Runtime dependency risk is YES in the archive impact map. |
| RoleAccessGateway | Service / Gateway | `lib/shared/gateways/role_access_gateway.dart` | Runtime dependency risk is YES in the archive impact map. |
| identity storage path | Storage Path | `identity/{uid}/{allPaths=**}` | Runtime dependency risk is YES in the archive impact map. |
| SignedInAccessState | Model | `lib/core/auth/account_access_service.dart` | Runtime dependency risk is YES in the archive impact map. |
| RoleNames | Contract | `lib/shared/contracts/role_names.dart` | Runtime dependency risk is YES in the archive impact map. |
| Gold back left navigation icon | Asset | `assets/branding/navigation/back/back_left_gold.png` | Runtime dependency risk is YES in the archive impact map. |
| Gold back right navigation icon | Asset | `assets/branding/navigation/back/back_right_gold.png` | Runtime dependency risk is YES in the archive impact map. |
| app_localizations.dart | Localization file | `lib/l10n/app_localizations.dart` | Runtime dependency risk is YES in the archive impact map. |
| app_ar.arb | Localization source file | `lib/l10n/app_ar.arb` | Runtime dependency risk is YES in the archive impact map. |
| app_en.arb | Localization source file | `lib/l10n/app_en.arb` | Runtime dependency risk is YES in the archive impact map. |
| AppLocalizations routeNotFound usage | Localization usage | `lib/app/router/app_router.dart` | Runtime dependency risk is YES in the archive impact map. |

## If Archive Happened Today: What Survives

| Item | Type | Path | Owner Bucket | Reason |
|---|---|---|---|---|
| `/s/support-room` | Route | `Routes.sSupportRoom` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/registry-room` | Route | `Routes.sRegistryRoom` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/declaration-review-room` | Route | `Routes.sDeclarationReviewRoom` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner` | Route | `Routes.sOwnerHome` | OWNER | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/room` | Route | `Routes.sOwnerRoom` | OWNER | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/sovereign-intelligence` | Route | `Routes.sSovereignIntelligence` | STRATEGIC_PLANNING | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/strategic-memory` | Route | `Routes.sStrategicMemory` | STRATEGIC_PLANNING | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/sovereign-vault` | Route | `Routes.sSovereignVault` | OWNER | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/constitutional-memory` | Route | `Routes.sConstitutionalMemory` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/recovery-console` | Route | `Routes.sRecoveryConsole` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/capsules` | Route | `Routes.sOwnerCapsules` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/owner/regeneration` | Route | `Routes.sOwnerRegeneration` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/owner/os/construction-workbench` | Route | `Routes.ownerConstructionWorkbench` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/capital/trust-safety` | Route | `Routes.sTrustSafety` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/s/capital/reports` | Route | `Routes.sCapitalReports` | STRATEGIC_PLANNING | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/chat/escalations` | Route | `Routes.chatEscalations` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| `/chat/escalation/report` | Route | `Routes.chatEscalationReport` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| SSupportRoomPage | Page | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| SRegistryRoomPage | Page | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| SDeclarationReviewRoomPage | Page | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| SOwnerDistrictPage | Page | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | Non-admin owner bucket item survives as extraction/transfer candidate. |
| SovereignConstructionWorkbenchPage | Page | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ChatEscalationsPage | Page | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ChatEscalationReportPage | Page | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| DomainStatusService | Service | `lib/core/system/domain_status_service.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ChatFirestoreService | Service | `lib/features/chat/data/services/chat_firestore_service.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| domainRegistry | Registry-like runtime source | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ConstructionToolRegistry | Registry-like runtime source | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| support_requests | Firestore Collection | `support_requests` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| system_domains | Firestore Collection | `system_domains` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| clinicians | Firestore Collection | `clinicians` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| centers | Firestore Collection | `centers` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| clinician_profile_change_requests | Firestore Collection | `clinician_profile_change_requests` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| center_profile_change_requests | Firestore Collection | `center_profile_change_requests` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| chat_threads | Firestore Collection | `chat_threads` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| chat_threads messages | Firestore Subcollection | `chat_threads/{threadId}/messages` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| chat_escalations | Firestore Collection | `chat_escalations` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| chat_escalation reports | Firestore Subcollection | `chat_escalations/{escalationId}/reports` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| provider_contact_requests | Firestore Collection | `provider_contact_requests` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| center_contact_requests | Firestore Collection | `center_contact_requests` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| centers storage path | Storage Path | `centers/{uid}/{allPaths=**}` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| clinicians storage path | Storage Path | `clinicians/{uid}/{allPaths=**}` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| DomainStatus | Model | `lib/core/system/domain_status.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| DomainDefinition | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| DomainKey | Model | `lib/core/system/domain_registry.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| DomainGovernanceCapability | Model | `lib/core/system/domain_governance_capability.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ConstructionToolEntry | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ConstructionToolType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ConstructionLaunchType | Model | `lib/features/sovereign_construction/domain/construction_tool_registry.dart` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ChatEscalationModel | Model | `lib/features/chat/data/models/chat_escalation_model.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ChatThreadModel | Model | `lib/features/chat/data/models/chat_thread_model.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ChatMessageModel | Model | `lib/features/chat/data/models/chat_message_model.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ChatSignalRoutingModel | Model | `lib/features/chat/data/models/chat_signal_routing_model.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| _SupportRequest | Local Page Model | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| _DeclarationRecord | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| _DocumentItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| _ComparisonItem | Local Page Model | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| ReviewerTypes | Contract | `lib/shared/contracts/reviewer_types.dart` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| Support Room visible text | Hardcoded text location | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | SUPPORT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| Registry Room visible text | Hardcoded text location | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | REGISTRY_GOVERNANCE | Non-admin owner bucket item survives as extraction/transfer candidate. |
| Declaration Review visible text | Hardcoded text location | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | DECLARATION_REVIEW | Non-admin owner bucket item survives as extraction/transfer candidate. |
| Owner District visible text | Hardcoded text location | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | OWNER | Non-admin owner bucket item survives as extraction/transfer candidate. |
| Sovereign Construction Workbench visible text | Hardcoded text location | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | TECHNICAL | Non-admin owner bucket item survives as extraction/transfer candidate. |
| Chat Escalations visible text | Hardcoded text location | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |
| Chat Escalation Report visible text | Hardcoded text location | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | CHAT_SAFETY | Non-admin owner bucket item survives as extraction/transfer candidate. |

## What Moves To Future Departments

| Item | Current Path | Future Owner Bucket | Reason |
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

## Simulation Verdict

Administrative Archive Readiness: NO

Administrative Archive Package Ready: NO

Missing Card Count: 27

Items Awaiting Documentation: 27

Runtime Changed: NO

Routes Changed: NO

Firebase Changed: NO
