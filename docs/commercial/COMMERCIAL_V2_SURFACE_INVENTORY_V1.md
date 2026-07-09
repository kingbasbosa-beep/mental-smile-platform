# Commercial V2 Surface Inventory V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24  
Mode: Discovery only

## Scope

This inventory records Commercial V2 surfaces as they exist in runtime today. It does not classify future desired architecture.

Primary runtime file:

- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

Primary route files:

- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`

## Surface Inventory

| Surface | Route | Status | Purpose | Audience | Runtime State |
|---|---|---:|---|---|---|
| Commercial V2 Start Page | `/commercial-v2/start` | ACTIVE | Email/password account creation and login entry for Commercial V2 profile owners | Commercial entity owner | Uses Firebase Auth; creates/loads `commercial_v2_profiles/{uid}` shell |
| Registration | `/commercial-v2/start` | ACTIVE | Create Firebase Auth account with email, phone, and password | Commercial entity owner | `createUserWithEmailAndPassword`; phone stored in profile shell, not phone verification |
| Login | `/commercial-v2/start` | ACTIVE | Sign in existing Commercial V2 user | Commercial entity owner | `signInWithEmailAndPassword`; then ensures profile shell |
| Profile Creation / Owner Dashboard | `/commercial-v2/owner` | ACTIVE | Edit draft profile, publish/hide, create version, upload identity image, generate outputs | Signed-in Commercial V2 owner | Redirects unsigned users to start page; reads/writes `commercial_v2_profiles/{uid}` |
| Profile Preview | `/commercial-v2/preview` | ACTIVE | Read-only preview of draft profile before publishing | Signed-in Commercial V2 owner | Reads `draftProfile`; not public |
| Public Profile | `/commercial-v2/p/{profileId}` | ACTIVE | Public read-only profile for published and visible profile documents | Visitor/client/public | Reads `liveProfile` only if `isPublished == true` and `isHidden != true` |
| Identity Image Upload | inside `/commercial-v2/owner` | ACTIVE | Upload one identity image: specialist photo or entity logo | Profile owner | Uses Firebase Storage `commercial_v2_identity/{uid}/profile_photo` or `logo`; saves URL in draft/root |
| Official PDF Profile | owner action | ACTIVE | Generate profile PDF from published live profile | Profile owner | Uses `Printing.layoutPdf`; blocked until profile is published and visible |
| Generated CV Preview | owner section/action | ACTIVE / PARTIAL | Generate a printable draft-based medical-white CV preview | Profile owner | Uses draft payload; template selection always resolves to `medical_white` |
| Preview PDF | owner action in generated CV section | ACTIVE | Export generated CV preview from draft data | Profile owner | Uses `Printing.layoutPdf`; marked preview/not published |
| Listing | none found for Commercial V2 | PLACEHOLDER | Public profile listing/discovery | Public/client | No Commercial V2 list route found |
| Search | none found for Commercial V2 | PLACEHOLDER | Search Commercial V2 profiles | Public/client | No Commercial V2 search UI found |
| Filters | none found for Commercial V2 | PLACEHOLDER | Filter by category/subcategory | Public/client | Category keys exist in profile data, but no filter UI found |
| Card Print | none found | PLACEHOLDER | Business card generation | Profile owner | Not implemented in Commercial V2 runtime |
| Promo Post | none found | PLACEHOLDER | Promotional post generation | Profile owner | Not implemented in Commercial V2 runtime |
| Commercial Home | none found for Commercial V2 | UNKNOWN | Standalone Commercial V2 public home | Public/client | No dedicated Commercial V2 home route found |
| Commercial Discovery | none found for Commercial V2 | PLACEHOLDER | Browse providers/centers/education/organizations | Public/client | Legacy/frozen S City placeholders exist, but no Commercial V2 discovery engine |

## Summary

Commercial V2 currently operates as a profile publishing engine with owner auth, draft/live profile workflow, public direct profile URL, identity image upload, and PDF/CV generation. Public marketplace discovery, listing, search, and filters are not implemented as Commercial V2 runtime surfaces.

