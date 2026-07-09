# Commercial V2 Route Forensic Report V1

Operation: COMMERCIAL_V2_FORENSIC_ROUTES_SCREENS_CONNECTION_AUDIT
Date: 2026-07-02
Mode: Investigation only

## Scope Boundary

No Flutter, route, runtime, Firebase, Firestore, Storage, deletion, or rename action was performed by this audit.

## Router Evidence

- Route constants: `lib/app/router/routes.dart`
- Router switch: `lib/app/router/app_router.dart`
- Commercial V2 registry: `lib/features/commercial_v2_web/domain/commercial_v2_web_registry.dart`
- Library provider routes: `lib/features/library/presentation/pages/library_provider_content_pages.dart`

## Route Inventory

| Route Path | Route Constant | Router Location | Screen Opened | Status |
|---|---|---|---|---|
| `/commercial-v2/web` | `Routes.commercialV2Web` | `app_router.dart` case `Routes.commercialV2Web` | `CommercialV2WebShowcasePage` | ACTIVE |
| `/web/library` | `Routes.webLibrary` | `app_router.dart` case `Routes.webLibrary` | `LibraryPage` | ACTIVE |
| `/library/providers/specialists` | `Routes.libraryProviderSpecialists` | `app_router.dart` case `Routes.libraryProviderSpecialists` | `LibrarySpecialistsPage` | ACTIVE |
| `/library/providers/centers` | `Routes.libraryProviderCenters` | `app_router.dart` case `Routes.libraryProviderCenters` | `LibraryCentersPage` | ACTIVE |
| `/library/providers/specialists/psychologists` | `Routes.libraryProviderSpecialistsPsychologists` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/social-workers` | `Routes.libraryProviderSpecialistsSocialWorkers` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/clinical` | `Routes.libraryProviderSpecialistsClinical` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/family-counseling` | `Routes.libraryProviderSpecialistsFamilyCounseling` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/addiction-recovery` | `Routes.libraryProviderSpecialistsAddictionRecovery` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/behavior-autism` | `Routes.libraryProviderSpecialistsBehaviorAutism` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/special-needs-rehab` | `Routes.libraryProviderSpecialistsSpecialNeedsRehab` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/coaching-development` | `Routes.libraryProviderSpecialistsCoachingDevelopment` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/recovery-program-supervisors` | `Routes.libraryProviderSpecialistsRecoveryProgramSupervisors` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/specialists/lecturers-trainers` | `Routes.libraryProviderSpecialistsLecturersTrainers` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/addiction-detox` | `Routes.libraryProviderCentersAddictionDetox` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/rehab-recovery` | `Routes.libraryProviderCentersRehabRecovery` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/mental-health` | `Routes.libraryProviderCentersMentalHealth` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/behavior-autism` | `Routes.libraryProviderCentersBehaviorAutism` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/special-needs` | `Routes.libraryProviderCentersSpecialNeeds` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/family-counseling` | `Routes.libraryProviderCentersFamilyCounseling` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/education-training` | `Routes.libraryProviderCentersEducationTraining` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/government-entities` | `Routes.libraryProviderCentersGovernmentEntities` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/ngos-foundations` | `Routes.libraryProviderCentersNgosFoundations` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/library/providers/centers/local-international-orgs` | `Routes.libraryProviderCentersLocalInternationalOrgs` | grouped provider branch route cases | `LibraryProviderBranchPage` | PENDING |
| `/commercial-v2/web/library` | removed constant | no active router case found | former placeholder page | LEGACY |
| `/commercial-v2/web/specialists` | removed constant | no active router case found | former placeholder page | LEGACY |
| `/commercial-v2/web/centers` | removed constant | no active router case found | former placeholder page | LEGACY |
| CV2 specialist registration route | none found | none found | none found | PENDING |
| CV2 center registration route | none found | none found | none found | PENDING |

## Adjacent Public Discovery Routes

These routes are not Commercial V2 routes, but they are active public discovery skeletons with Library/provider/center language and therefore relevant to duplicate public-page forensics.

| Route Path | Route Constant | Router Location | Screen Opened | Status |
|---|---|---|---|---|
| `/s/city` | `Routes.sCityHome` | `app_router.dart` case `Routes.sCityHome` | `SCityDistrictPage` | ACTIVE |
| `/s/city/library` | `Routes.sCityLibrary` | `_sWebSurfaceRoute` | `SWebSurfacePage` | PENDING |
| `/s/city/providers` | `Routes.sCityProviders` | `_sWebSurfaceRoute` | `SWebSurfacePage` | LEGACY |
| `/s/city/centers` | `Routes.sCityCenters` | `_sWebSurfaceRoute` | `SWebSurfacePage` | LEGACY |
| `/s/city/services` | `Routes.sCityServices` | `_sWebSurfaceRoute` | `SWebSurfacePage` | PENDING |
| `/s/city/tools` | `Routes.sCityTools` | `_sWebSurfaceRoute` | `SWebSurfacePage` | PENDING |
| `/s/city/organizations` | `Routes.sCityOrganizations` | `_sWebSurfaceRoute` | `SWebSurfacePage` | PENDING |
| `/s/city/programs` | `Routes.sCityPrograms` | `_sWebSurfaceRoute` | `SWebSurfacePage` | PENDING |
| `/s/city/marketplace` | `Routes.sCityMarketplace` | `_sWebSurfaceRoute` | `SWebSurfacePage` | PENDING |

## Finding

Commercial V2 has one active public showcase route. Library, Specialists, Centers, and provider branch pages are Library-owned routes. The old Commercial V2 placeholder subroutes are not active route constants or router cases in the inspected code.

Adjacent `[S] City` public discovery routes remain active and include future Library, provider, center, service, tool, organization, program, and marketplace surfaces. The route constants label providers/centers as legacy/frozen Commercial V1 placeholder discovery routes.
