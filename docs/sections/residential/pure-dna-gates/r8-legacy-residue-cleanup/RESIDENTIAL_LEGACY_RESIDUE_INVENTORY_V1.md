# RESIDENTIAL_LEGACY_RESIDUE_INVENTORY_V1

Status: ACTIVE

Gate: R8

Runtime Status: DOCUMENTATION_ONLY

Purpose: Classify Residential legacy and residue items without deleting or modifying runtime.

---

## Classification Legend

| Status | Meaning |
|---|---|
| ACTIVE | Current active document or runtime surface. |
| ACTIVE_PROTECTED | Active and must not be touched in cleanup. |
| SUPERSEDED_BY_R_GATE | Replaced by R1-R7 governance but preserved as history/evidence. |
| ARCHIVE_ONLY | Already in archive or should only be treated as historical. |
| LEGACY_KEEP_FOR_HISTORY | Old but useful for reconstruction/history. |
| OWNER_DECISION_REQUIRED | Needs Owner decision before archive/removal. |
| SAFE_TO_ARCHIVE_LATER | Candidate for later archive operation, no deletion now. |
| DO_NOT_TOUCH | Shared/global or active dependency; do not classify for cleanup. |

---

## Legacy / Residue Inventory

| Item | Type | Evidence | Classification | Reason |
|---|---|---|---|---|
| `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart` | Active page | `app_router.dart` imports and builds `ResidentialExitSocialPortalPage` | ACTIVE_PROTECTED | Current `/residential/exit-social-links` destination. |
| Old Residential exit social links page | Inactive old page | Removed during platform runtime purification | REMOVED_DURING_PLATFORM_RUNTIME_PURIFICATION | Old exit/social-links implementation no longer routed. |
| Old Residential exit social links polished page | Inactive old page | Removed during platform runtime purification | REMOVED_DURING_PLATFORM_RUNTIME_PURIFICATION | Superseded by portal redesign and goodbye-only page. |
| `docs/sections/residential/RESIDENTIAL_RUNTIME_GUIDE_V1.md` | Stale doc reference | Still references polished exit page | SUPERSEDED_BY_R_GATE | Route truth now in R6 Digital Twin/navigation map. |
| `docs/sections/residential/RESIDENTIAL_LOCALIZATION_REGISTRY_V1.md` | Stale localization doc | References polished page and social-link content | SUPERSEDED_BY_R_GATE | Active UI localization is governed by Application UI closure and R4. |
| `docs/sections/residential/RESIDENTIAL_EXIT_SOCIAL_LINKS_PAGE_REPORT_V1.md` | Old report | Original exit/social page report | LEGACY_KEEP_FOR_HISTORY | Historical evidence of old exit page creation. |
| `docs/sections/residential/cards/RESIDENTIAL_EXIT_SOCIAL_LINKS_PAGE_CARD_V1.md` | Old card | References old runtime file | SUPERSEDED_BY_R_GATE | R1-R7 and active portal supersede this card. |
| `docs/sections/application/APPLICATION_SECTION_ROUTE_HEALTH_REPORT_V1.md` | Stale route doc | References `ResidentialExitSocialLinksPage` | SUPERSEDED_BY_R_GATE | Active route evidence is R6 route map. |
| `docs/sections/application/APPLICATION_SECTION_FINAL_RUNTIME_INVENTORY_V1.md` | Stale runtime inventory | References polished page as active | SUPERSEDED_BY_R_GATE | Active runtime now portal page. |
| `docs/accessibility/RESIDENTIAL_EXIT_SOCIAL_PORTAL_REDESIGN_REPORT_V1.md` | Historical report | Portal redesign report | LEGACY_KEEP_FOR_HISTORY | Important history for portal transition. |
| `docs/accessibility/RESIDENTIAL_EXIT_PORTAL_CLEAN_GOODBYE_ONLY_REPORT_V1.md` | Historical report | Goodbye-only portal report | LEGACY_KEEP_FOR_HISTORY | Important history for current portal philosophy. |
| `docs/archive/global-documentation-purification/history/residential/*` | Archived old Residential docs | Already under archive/history | ARCHIVE_ONLY | History-only source evidence. |
| `docs/sections/residential/pure-dna-gates/r1-r7/*` | Pure DNA gates | Current gates | ACTIVE_PROTECTED | Current Residential governance source. |
| `assets/backgrounds/residential_exit_social_portal.webp.png` | Active asset | Registered in `pubspec.yaml` and used by active portal | ACTIVE_PROTECTED | Do not archive/remove. |
| `assets/branding/rooms/client_room/*` | Active room assets | Client Room runtime assets | ACTIVE_PROTECTED | Do not touch without asset usage audit. |
| `assets/branding/rooms/accessibility_room/*` | Active room assets | Accessibility Room runtime assets | ACTIVE_PROTECTED | Do not touch without asset usage audit. |
| `assets/icons/accessibility/ms_accessibility_guide.webp.png` | Active accessibility icon | Registered in `pubspec.yaml` | ACTIVE_PROTECTED | Global accessibility affordance. |
| Old headphone/audio icon patterns in inactive polished page | UI residue | `SnackBar` / `Coming soon` found in inactive polished page | SAFE_TO_ARCHIVE_LATER | Inactive page candidate; do not fix unless reactivated. |
| SnackBars/Tooltips in active Client/Accessibility pages | Active UI affordances | Targeted search found SnackBars/Tooltips | ACTIVE_PROTECTED | Current UI behavior, not cleanup target in R8. |
| Monitoring Residential files | Runtime/monitoring layer | `lib/features/monitoring/residential/*` | DO_NOT_TOUCH | Outside R8 cleanup; may be needed by monitoring architecture. |

---

## Validation

Every residue item classified: YES

Unknown residue: 0

No deletion performed: YES

Final Status: RESIDENTIAL_LEGACY_RESIDUE_INVENTORY_CREATED
