# LIBRARY_CLEAN_SHOWCASE_ROUTE_SCREEN_INVENTORY_V1

Status: ACTIVE INVENTORY

Purpose: Current clean inventory for the Library / Specialists / Centers public display section after removing legacy chat and the old module-style library alias.

## Active Library Screens

| Screen | Route | Widget/Page | File | Status |
|---|---|---|---|---|
| Library Home | `/library` | `LibraryPage` | `lib/features/library/presentation/pages/library_page.dart` | ACTIVE_CLEAN_SHOWCASE |
| Library Web Home | `/web/library` | `LibraryPage` | `lib/features/library/presentation/pages/library_page.dart` | ACTIVE_CLEAN_SHOWCASE |
| Library Policy | `/web/library/policy` | `LibraryPolicyPage` | `lib/features/library/presentation/pages/library_policy_page.dart` | ACTIVE_DIRECT_ROUTE_ONLY |
| Specialists Library | `/library/providers/specialists` | `LibrarySpecialistsPage` | `lib/features/library/presentation/pages/library_provider_content_pages.dart` | ACTIVE_CATEGORY_SHOWCASE |
| Centers Library | `/library/providers/centers` | `LibraryCentersPage` | `lib/features/library/presentation/pages/library_provider_content_pages.dart` | ACTIVE_CATEGORY_SHOWCASE |

## Specialist Category Screens

| Route | Page |
|---|---|
| `/library/providers/specialists/psychologists` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/social-workers` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/clinical` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/family-counseling` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/addiction-recovery` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/behavior-autism` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/special-needs-rehab` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/coaching-development` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/recovery-program-supervisors` | `LibraryProviderBranchPage` |
| `/library/providers/specialists/lecturers-trainers` | `LibraryProviderBranchPage` |

## Center Category Screens

| Route | Page |
|---|---|
| `/library/providers/centers/addiction-detox` | `LibraryProviderBranchPage` |
| `/library/providers/centers/rehab-recovery` | `LibraryProviderBranchPage` |
| `/library/providers/centers/mental-health` | `LibraryProviderBranchPage` |
| `/library/providers/centers/behavior-autism` | `LibraryProviderBranchPage` |
| `/library/providers/centers/special-needs` | `LibraryProviderBranchPage` |
| `/library/providers/centers/family-counseling` | `LibraryProviderBranchPage` |
| `/library/providers/centers/education-training` | `LibraryProviderBranchPage` |
| `/library/providers/centers/government-entities` | `LibraryProviderBranchPage` |
| `/library/providers/centers/ngos-foundations` | `LibraryProviderBranchPage` |
| `/library/providers/centers/local-international-orgs` | `LibraryProviderBranchPage` |

## Legacy Removed From Active Library Flow

| Legacy Item | Previous Path/Reference | Current Status |
|---|---|---|
| Old module-style library alias | Exact legacy path documented only in archive report | REMOVED_FROM_ACTIVE_ROUTING |
| Old support-entry library card | Legacy library alias card | REMOVED_FROM_ACTIVE_UI |
| Old accessibility check-in library button | Legacy library alias button | REMOVED_FROM_ACTIVE_UI |
| Legacy chat feature | Exact legacy paths documented only in archive report | REMOVED_FROM_ACTIVE_SYSTEM |
| Library policy visible button | `_LibraryPolicyLink` | REMOVED_FROM_LIBRARY_HOME_UI |

## Current Library Shape

The active Library section is now treated as a clean public showcase layer:

- Library
- Specialists
- Centers
- Category display pages
- Static cards and visual sections
- No chat dependency
- No AI dependency
- No legacy module-style library route
- No legacy support chat route

## Boundaries

Firebase changed: NO

Firestore changed: NO

AI connected: NO

Chat connected: NO

Legacy route conversion performed: NO

Legacy route removal performed: YES

FINAL STATUS: LIBRARY_CLEAN_SHOWCASE_ROUTE_SCREEN_INVENTORY_COMPLETED
