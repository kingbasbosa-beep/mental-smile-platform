# Commercial V2 Route Forensic Map V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24

## Route Evidence

Routes were inspected in:

- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`

## Commercial V2 Routes

| Route | Destination | Owner Surface | Status | Notes |
|---|---|---|---:|---|
| `/commercial-v2/start` | `CommercialV2StartPage` | Commercial V2 | ACTIVE | Account creation/login entry. |
| `/commercial-v2/owner` | `CommercialV2OwnerProfilePage` | Commercial V2 | ACTIVE | Signed-in profile owner dashboard. Unsigned users are sent to start. |
| `/commercial-v2/preview` | `CommercialV2PreviewPage` | Commercial V2 | ACTIVE | Signed-in draft preview. Unsigned users are sent to start. |
| `/commercial-v2/p/{profileId}` | `CommercialV2PublicProfilePage(profileId)` | Commercial V2 | ACTIVE | Dynamic route handled by prefix match. Shows live profile only when published and not hidden. |

## Commercial Legacy / V1 Routes

| Route | Destination | Owner Surface | Status | Notes |
|---|---|---|---:|---|
| `/register/provider` | `WebClinicianRegisterPortalPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_ALIAS | Route constant marked legacy/frozen. Runtime still resolves to web clinician registration. |
| `/register/clinician` | `WebClinicianRegisterPortalPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_ALIAS | Route constant marked legacy/frozen. |
| `/register/center` | `WebCenterRegisterPortalPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_ALIAS | Route constant marked legacy/frozen. |
| `/web/clinician/register` | `WebClinicianRegisterPortalPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Creates clinician registration record. |
| `/web/clinician/profile` | `WebClinicianProfilePage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Updates `clinicians/{uid}`. |
| `/web/clinician/documents` | `WebClinicianDocumentsPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Writes declaration/readiness data. |
| `/web/center/register` | `WebCenterRegisterPortalPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Creates center registration record. |
| `/web/center/profile` | `WebCenterProfilePage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Updates `centers/{uid}`. |
| `/web/center/media` | `WebCenterMediaPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Media declaration step. |
| `/web/center/pricing` | `WebCenterPricingPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Pricing/capability declaration step. |
| `/web/center/documents` | `WebCenterDocumentsPage` | Commercial V1 / Web Registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | Document declaration step. |

## Provider / Center App Runtime Routes

| Route | Destination | Owner Surface | Status | Notes |
|---|---|---|---:|---|
| `/clinician/room` | `ClinicianRoomPage` | Commercial legacy app runtime | ACTIVE | Protected by clinician role/readiness. Explicitly excluded from Commercial V1 archive marker. |
| `/clinician/profile-edit-request` | `ClinicianProfileEditRequestPage` | Commercial legacy app runtime | ACTIVE | Protected clinician route. |
| `/clinician/chat-inbox` | `ClinicianChatInboxPage` | Commercial legacy app runtime | ACTIVE | Protected clinician route. |
| `/center/dashboard` | `CenterDashboardPage` | Commercial legacy app runtime | ACTIVE | Protected center landing/dashboard. |
| `/center/room` | `CenterRoomPage` | Commercial legacy app runtime | ACTIVE | Protected center room. |
| `/center/profile-edit-request` | `CenterProfileEditRequestPage` | Commercial legacy app runtime | ACTIVE | Protected center route. |

## Public Discovery / Legacy Placeholder Routes

| Route | Destination | Owner Surface | Status | Notes |
|---|---|---|---:|---|
| `/s/city/providers` | `SWebSurfacePage` | S City / Commercial V1 placeholder | PLACEHOLDER | Route constant marked legacy/frozen provider discovery placeholder. |
| `/s/city/centers` | `SWebSurfacePage` | S City / Commercial V1 placeholder | PLACEHOLDER | Route constant marked legacy/frozen center discovery placeholder. |
| `/s/city/organizations` | `SWebSurfacePage` | S City placeholder | PLACEHOLDER | Future organization surface; not Commercial V2 profile listing. |
| `/s/city/programs` | `SWebSurfacePage` | S City placeholder | PLACEHOLDER | Future programs surface. |
| `/s/city/marketplace` | `SWebSurfacePage` | S City placeholder | PLACEHOLDER | Future marketplace surface. |
| `/module/specialists` | `SpecialistsCategoriesPage` | Legacy/public module | ACTIVE | Reads legacy `clinicians` data via specialist list/details flow. |
| `/module/specialists/list` | `SpecialistsListPage` | Legacy/public module | ACTIVE | Lists visible clinicians from `clinicians`. |
| `/module/specialists/details` | `SpecialistDetailsPage` | Legacy/public module | ACTIVE | Opens one clinician details page. |
| `/module/centers` | `CentersLandingPage` | Legacy/public module | ACTIVE | Category landing for centers. |
| `/module/centers/list` | `CentersListPage` | Legacy/public module | ACTIVE | Lists visible centers from `centers`. |
| `/module/centers/details` | `CenterDetailsPage` | Legacy/public module | ACTIVE | Opens one center details page. |

## Route Conclusion

Commercial V2 has four real routes. Commercial V2 does not currently own a public listing/search/filter route. Legacy and placeholder commercial routes remain reachable through router cases but are marked frozen or are outside the Commercial V2 profile engine.

