# Archive Legacy Reference Discovery V1

Operation ID: OP-ARCHIVE-PLATFORM-EXTRACTION-AND-ISOLATION-V1

Date: 2026-06-25

Purpose:

Record places where Archive, memory, vault, prompt, ledger, capsule, or recovery concepts still appear outside the new `docs/archive/` source of truth.

No modification, movement, deletion, or migration execution occurred.

## Owner Runtime References

| Reference | Path | Evidence | Status |
|---|---|---|---|
| Owner strategic memory route | `lib/app/router/routes.dart` | `Routes.sStrategicMemory = /s/owner/strategic-memory` | FOUND_OUTSIDE_NEW_ARCHIVE |
| Owner sovereign vault route | `lib/app/router/routes.dart` | `Routes.sSovereignVault = /s/owner/sovereign-vault` | FOUND_OUTSIDE_NEW_ARCHIVE |
| Owner constitutional memory route | `lib/app/router/routes.dart` | `Routes.sConstitutionalMemory = /s/owner/constitutional-memory` | FOUND_OUTSIDE_NEW_ARCHIVE |
| Owner recovery console route | `lib/app/router/routes.dart` | `Routes.sRecoveryConsole = /s/owner/recovery-console` | FOUND_OUTSIDE_NEW_ARCHIVE |
| Owner capsules route | `lib/app/router/routes.dart` | `Routes.sOwnerCapsules = /s/owner/capsules` | FOUND_OUTSIDE_NEW_ARCHIVE |
| Owner regeneration route | `lib/app/router/routes.dart` | `Routes.sOwnerRegeneration = /s/owner/regeneration` | FOUND_OUTSIDE_NEW_ARCHIVE |
| Owner archive/memory/vault panels | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | `_StrategicArchiveHall`, `_SovereignVaultPanel`, `_SurvivalCapsuleCenter`, `_RegenerationBoard` | FOUND_OUTSIDE_NEW_ARCHIVE |
| Owner navigation labels | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | `Survival Capsules`, `Regeneration Board`, `Archive Status` | FOUND_OUTSIDE_NEW_ARCHIVE |

## Administrative Documentation References

| Reference | Path | Evidence | Status |
|---|---|---|---|
| Administrative archive readiness | `docs/sections/administrative/ADMINISTRATIVE_ARCHIVE_READINESS_AUDIT_V1.md` | Administrative archive preparation and non-admin route extraction references | FOUND_OUTSIDE_NEW_ARCHIVE |
| Administrative archive impact map | `docs/sections/administrative/ADMINISTRATIVE_ARCHIVE_IMPACT_MAP_V1.md` | Archive package requirement rows and owner/archive route impact | FOUND_OUTSIDE_NEW_ARCHIVE |
| Administrative V1 archive package | `docs/sections/administrative/ADMINISTRATIVE_V1_ARCHIVE_PACKAGE_LIST_V1.md` | Future archive package checklist | FOUND_OUTSIDE_NEW_ARCHIVE |
| Administrative archive execution simulation | `docs/sections/administrative/ADMINISTRATIVE_ARCHIVE_EXECUTION_SIMULATION_V1.md` | Simulated archive effects and survival lists | FOUND_OUTSIDE_NEW_ARCHIVE |
| Administrative prompt library index | `docs/archive/technical-recovery-vault/prompt-library/ADMINISTRATIVE_PROMPT_LIBRARY_INDEX_V1.md` | Future prompt library container for Administrative | FOUND_INSIDE_NEW_ARCHIVE_WITH_ADMINISTRATIVE_SCOPE |

## Legacy Constitutional Baseline References

| Reference | Path | Evidence | Status |
|---|---|---|---|
| Owner governance architecture report | `docs/constitutional-baseline/domain-audits/owner-governance/OWNER_GOVERNANCE_ARCHITECTURE_REPORT_V1.md` | Owner memory/vault/capsule route references | LEGACY_DOCUMENTATION_REFERENCE |
| Memory governance report | `docs/constitutional-baseline/domain-audits/owner-governance/MEMORY_GOVERNANCE_REPORT_V1.md` | Archive memory and runtime owner memory surface references | LEGACY_DOCUMENTATION_REFERENCE |
| Registry governance report | `docs/constitutional-baseline/domain-audits/owner-governance/REGISTRY_GOVERNANCE_REPORT_V1.md` | `ARCHIVE_REGISTRY_V1.md`, `MEMORY_REGISTRY_V1.md` | LEGACY_DOCUMENTATION_REFERENCE |
| Card governance report | `docs/constitutional-baseline/domain-audits/owner-governance/CARD_GOVERNANCE_REPORT_V1.md` | Archive card era references | LEGACY_DOCUMENTATION_REFERENCE |
| Ghost infrastructure archival guide | `docs/constitutional-baseline/guides/GHOST_INFRASTRUCTURE_ARCHIVAL_GUIDE_V1.md` | Multiple old archive-card mappings | LEGACY_DOCUMENTATION_REFERENCE |
| Memory governance guide | `docs/constitutional-baseline/guides/MEMORY_GOVERNANCE_GUIDE_V1.md` | Global memory categories and archive memory language | LEGACY_DOCUMENTATION_REFERENCE |
| Registry governance guide | `docs/constitutional-baseline/guides/REGISTRY_GOVERNANCE_GUIDE_V1.md` | Old registry archive-state rules | LEGACY_DOCUMENTATION_REFERENCE |

## Legacy Archive Card References

| Reference | Path | Evidence | Status |
|---|---|---|---|
| Admin zero transition archive card | `docs/constitutional-baseline/cards/archive/ARCHIVE_CARD_ADMIN_ZERO_TRANSITION_V1.md` | Administrative V1 documentation item | LEGACY_DOCUMENTATION_REFERENCE |
| Ghost signal archive card family | `docs/constitutional-baseline/guides/GHOST_INFRASTRUCTURE_ARCHIVAL_GUIDE_V1.md` | `ARCHIVE_CARD_GHOST_SIGNAL_*` rows | LEGACY_DOCUMENTATION_REFERENCE |
| Ghost route archive card family | `docs/constitutional-baseline/guides/GHOST_INFRASTRUCTURE_ARCHIVAL_GUIDE_V1.md` | `ARCHIVE_CARD_GHOST_ROUTE_*` rows | LEGACY_DOCUMENTATION_REFERENCE |
| Ghost asset archive card family | `docs/constitutional-baseline/guides/GHOST_INFRASTRUCTURE_ARCHIVAL_GUIDE_V1.md` | `ARCHIVE_CARD_GHOST_ASSET_*` rows | LEGACY_DOCUMENTATION_REFERENCE |

## Discovery Notes

- The new Archive source of truth is structurally separate under `docs/archive/`.
- Owner runtime still exposes Archive-like concepts as Owner district panels and subroutes.
- Administrative documentation still references Archive preparation, impact, simulation, and old archive card items.
- Constitutional baseline historical docs still contain global archive/memory/card doctrine from before the new Archive platform certification.

