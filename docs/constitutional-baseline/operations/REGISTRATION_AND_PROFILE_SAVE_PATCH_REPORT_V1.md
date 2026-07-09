# Registration And Profile Save Patch Report V1

Status: COMPLETED
Date: 2026-07-08
Runtime effect: profile draft persistence enabled

## Scope

Patch the current routed specialist and center profile generation pages so submitted profile data is saved to Firestore instead of only being prepared locally and printed with `debugPrint`.

## Changed Runtime Files

| File | Change |
| --- | --- |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_clean_layout_page.dart` | Replaced debug-only specialist profile submit with Firestore merge save. |
| `lib/features/commercial/presentation/pages/center_professional_profile_clean_layout_page.dart` | Replaced debug-only center profile submit with Firestore merge save. |
| `firestore.rules` | Added owner-only rules for `profile/current` subdocuments under clinicians and centers. |

## Exact Firestore Paths

| User Type | Route | Firestore Path | Status |
| --- | --- | --- | --- |
| specialist | `/commercial/specialist/professional-profile` | `clinicians/{uid}/profile/current` | draft |
| center | `/commercial/center/professional-profile` | `centers/{uid}/profile/current` | draft |

## Why Subcollection Was Used

The patch uses `profile/current` subdocuments instead of merging into the root account document because:

- Root documents `clinicians/{uid}` and `centers/{uid}` already contain account/auth/readiness fields.
- Firestore rules for root profile/account documents are intentionally restrictive after readiness.
- Draft profile content is operational profile data, not core account identity.
- A subdocument keeps future publishing/review workflow cleaner.

## Specialist Profile Fields Saved

Path: `clinicians/{uid}/profile/current`

Fields:

- `fullName`
- `phone`
- `email`
- `specialty`
- `specialtyLabel`
- `subSpecialty`
- `cardLanguage`
- `cardLanguageLabel`
- `appearanceStyle`
- `appearanceStyleLabel`
- `background`
- `backgroundLabel`
- `about`
- `notes`
- `publishingTargets`
- `presentationFormats`
- `personalPhotoSelected`
- `productsGeneratedInsideSpecialistRoom`
- `ownerUid`
- `profileType: specialist`
- `status: draft`
- `createdAt`
- `updatedAt`
- `source: specialist_professional_profile_clean_layout_v1`

## Center Profile Fields Saved

Path: `centers/{uid}/profile/current`

Fields:

- `centerName`
- `customerServicePhone`
- `officialEmail`
- `centerType`
- `centerTypeLabel`
- `cardLanguage`
- `cardLanguageLabel`
- `serviceNote`
- `about`
- `notes`
- `appearanceStyle`
- `appearanceStyleLabel`
- `background`
- `backgroundLabel`
- `yearsInOperation`
- `yearsInOperationLabel`
- `governorate`
- `governorateLabel`
- `hasAccommodation`
- `hasAccommodationLabel`
- `hasClinics`
- `hasClinicsLabel`
- `hasExternalServices`
- `hasExternalServicesLabel`
- `ageGroup`
- `ageGroupLabel`
- `serviceType`
- `serviceTypeLabel`
- `workingDays`
- `workingDaysLabel`
- `publishingTargets`
- `presentationFormats`
- `centerLogoSelected`
- `centerCoverSelected`
- `productsGeneratedInsideCenterRoom`
- `ownerUid`
- `profileType: center`
- `status: draft`
- `createdAt`
- `updatedAt`
- `source: center_professional_profile_clean_layout_v1`

## Firebase Rules Added

Rules added:

- `match /clinicians/{clinicianId}/profile/{profileId}`
- `match /centers/{centerId}/profile/{profileId}`

Allowed:

- Owner user can read/write only their own `profile/current`.
- Declaration reviewer can read.
- Delete remains denied.
- Writes require matching `ownerUid`, correct `profileType`, and `status` in `draft` or `published`.

## UI Preservation

The existing UI flow was preserved:

- Same form layout.
- Same preview step.
- Same success dialog.
- No booking, payment, appointments, pricing, or dashboard behavior was added.

## Support Requests Rules Mismatch Audit

No rules were changed for `support_requests`.

Current mismatch:

- UI code in `SupportIssueSelectorPage` can run when `FirebaseAuth.instance.currentUser` is null or anonymous.
- Firestore rules require:
  - `signedIn()`
  - `request.resource.data.createdByUid == uid()`
  - `status == 'new'`
  - `source == 'structured_support'`
- Result: guest/anonymous support request submission may fail.

Recommended fix only:

1. Either require signed-in non-anonymous users before opening `/module/support-issue-selector`.
2. Or design a governed anonymous/session support request rule and payload contract.

## Verification Not Run

Per current workflow preference, no Flutter build/analyze/format commands were run by Codex.
