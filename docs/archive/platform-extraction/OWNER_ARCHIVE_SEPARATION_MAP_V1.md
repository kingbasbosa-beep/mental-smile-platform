# Owner Archive Separation Map V1

Operation ID: OP-ARCHIVE-PLATFORM-EXTRACTION-AND-ISOLATION-V1

Date: 2026-06-25

Purpose:

Map what belongs to Owner, what belongs to Archive, and what is currently mixed between Owner runtime and Archive concepts.

No execution, movement, deletion, route change, runtime change, or Firebase change occurred.

## Owner-Owned Items

| Item | Current Path | Reason |
|---|---|---|
| Owner district page shell | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | Owner runtime surface and owner-only route destination |
| Owner home routes | `lib/app/router/routes.dart`; `lib/app/router/app_router.dart` | Owner access and Owner district routing |
| Owner sovereign storage authority | `docs/archive/final-certification/ARCHIVE_OWNER_SOVEREIGN_STORAGE_INTEGRATION_V1.md` | Owner controls sovereign storage references; Archive records rules only |
| Owner approval registry | `docs/constitutional-baseline/registries/OWNER_APPROVAL_REGISTRY_V1.md` | Owner approval ownership, not Archive execution |

## Archive-Owned Items

| Item | Current Path | Reason |
|---|---|---|
| Archive Constitution | `docs/archive/ARCHIVE_CONSTITUTION_V1.md` | Certified Archive source of truth |
| Memory Operating Model | `docs/archive/ARCHIVE_MEMORY_OPERATING_MODEL_V1.md` | Archive memory operating model |
| Strategic Memory Vault | `docs/archive/strategic-memory-vault/` | Archive strategic memory |
| Technical Recovery Vault | `docs/archive/technical-recovery-vault/` | Archive recovery and technical knowledge |
| Prompt Recovery Library | `docs/archive/technical-recovery-vault/prompt-library/` | Archive prompt recovery structure |
| Failure Knowledge and Operations Ledger | `docs/archive/failure-knowledge-and-operations-ledger/` | Archive failure and operation memory layer |
| Provider Portfolio Vault | `docs/archive/provider-portfolio-vault/` | Archive business asset vault |
| Marketing Content and Asset Vaults | `docs/archive/marketing-content-library/` | Archive marketing content and asset memory |
| Departmental Vaults | `docs/archive/departmental-vaults/` | Archive-owned vault spaces for departments |

## Mixed Owner / Archive Concepts

| Mixed Item | Current Path | Current Connection | Future Conceptual Owner |
|---|---|---|---|
| `/s/owner/strategic-memory` | `Routes.sStrategicMemory`; `SOwnerDistrictPage(focus: strategicArchive)` | Owner runtime route exposes strategic memory concept | Archive strategic memory surface; Owner as read-only consumer |
| `/s/owner/sovereign-vault` | `Routes.sSovereignVault`; `SOwnerDistrictPage(focus: sovereignVault)` | Owner runtime route exposes vault concept | Archive/Owner separation required: Owner authority remains Owner; vault records belong to Archive |
| `/s/owner/constitutional-memory` | `Routes.sConstitutionalMemory`; `SOwnerDistrictPage(focus: constitutionalMemory)` | Owner runtime route exposes constitutional memory concept | Archive governance certification / section registry |
| `/s/owner/recovery-console` | `Routes.sRecoveryConsole`; `SOwnerDistrictPage(focus: recoveryConsole)` | Owner runtime route exposes recovery console concept | Technical Recovery Vault |
| `/s/owner/capsules` | `Routes.sOwnerCapsules`; `SOwnerDistrictPage(focus: survivalCapsules)` | Owner runtime route exposes capsule concept | Technical Recovery Vault / Archive recovery package layer |
| `/s/owner/regeneration` | `Routes.sOwnerRegeneration`; `SOwnerDistrictPage(focus: regenerationBoard)` | Owner runtime route exposes regeneration concept | Technical Recovery Vault |

## Must Remain Owner

- Owner authority.
- Owner access and authentication gates.
- Owner-only route protection.
- Owner sovereign storage control.
- Owner approval decisions.

## Must Move Conceptually Into Archive

- Strategic memory vault material.
- Technical recovery package material.
- Prompt recovery library material.
- Failure knowledge and lessons.
- Global operations ledger knowledge layer.
- Provider portfolio vault material.
- Marketing content and marketing asset vault material.
- Departmental vault records and registries.

## Separation Note

This file records conceptual separation only. It does not move Owner routes or Archive documents.

