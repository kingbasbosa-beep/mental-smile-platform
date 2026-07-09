# OLD_MENU_SPECIALISTS_CENTERS_UI_SHELL_ARCHIVE_AND_RUNTIME_REMOVAL_REPORT_V1

Date: 2026-06-26

Operation ID:

OP-OLD-MENU-SPECIALISTS-CENTERS-RUNTIME-REMOVAL-V1

Status:

COMPLETED

Override Applied:

YES

Override Meaning:

The old Menu / Specialists / Centers runtime was removed from active source without archive-copy, museum-copy, or reference-copy creation.

## Active Routes Removed

- `/menu`
- `/home`
- `/module/specialists`
- `/module/specialists/list`
- `/module/specialists/details`
- `/module/centers`
- `/module/centers/list`
- `/module/centers/details`

## Active Route Constants Removed

- `Routes.menu`
- `Routes.home`
- `Routes.specialists`
- `Routes.specialistsList`
- `Routes.specialistDetails`
- `Routes.centers`
- `Routes.centersList`
- `Routes.centerDetails`

## Router Cases Removed

- `Routes.menu`
- `Routes.home`
- `Routes.specialists`
- `Routes.specialistsList`
- `Routes.specialistDetails`
- `Routes.centers`
- `Routes.centersList`
- `Routes.centerDetails`

## Active Files Deleted

- `lib/features/home/presentation/pages/menu_page.dart`
- `lib/features/home/presentation/pages/home_page.dart`
- `lib/features/home/presentation/widgets/module_card.dart`
- `lib/features/specialists/data/clinician_specialty_catalog.dart`
- `lib/features/specialists/presentation/specialists_categories_page.dart`
- `lib/features/specialists/presentation/specialists_list_page.dart`
- `lib/features/specialists/presentation/specialist_details_page.dart`
- `lib/features/centers/data/models/center_model.dart`
- `lib/features/centers/data/services/centers_firestore_service.dart`
- `lib/features/centers/presentation/pages/centers_landing_page.dart`
- `lib/features/centers/presentation/pages/centers_list_page.dart`
- `lib/features/centers/presentation/pages/center_details_page.dart`
- `lib/features/contact_requests/contact_requests.dart`
- `lib/features/contact_requests/data/contact_request_repository.dart`
- `lib/features/contact_requests/domain/models/provider_contact_request_record.dart`
- `lib/features/contact_requests/domain/models/center_contact_request_record.dart`

## Active Files Preserved

- `lib/features/centers/data/models/center_pricing.dart`
- `lib/features/centers/presentation/center_document_requirements.dart`

Reason:

These two files are still imported by `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` and were not deleted to avoid breaking an unrelated active declaration-review surface.

## Active Navigation Links Removed Or Replaced

- Login unknown-role fallback changed from old menu to splash.
- App shell return action changed from old menu to splash.
- Chat back navigation changed from old menu to splash.
- App exit navigation changed from `/home` to splash.
- Accessibility check-in specialists link changed to `Routes.libraryProviderSpecialists`.
- Accessibility check-in centers link changed to `Routes.libraryProviderCenters`.
- Support entry specialists links changed to `Routes.libraryProviderSpecialists`.
- Support entry centers links changed to `Routes.libraryProviderCenters`.
- Support entry menu back link changed to splash.
- Library default return route changed from old menu to splash.
- Owner route gate denied-access fallback changed from old menu to splash.

## Firestore Reads Removed From Active Runtime

YES

Removed active old reads from:

- `clinicians`
- `centers`

## Firestore Writes Removed From Active Runtime

YES

Removed active old writes to:

- `provider_contact_requests`
- `center_contact_requests`

## Contact Request Flows Removed From Active Runtime

YES

Removed active provider/center contact request repository and model files.

## Signal Flows Removed From Active Runtime

YES

Removed active old signal factory methods for:

- provider contact start
- center contact start
- accessible provider/center selection
- accessible contact requested/completed
- provider profile opened
- center profile opened

## UI Source Archived

NO

Reason:

Owner override explicitly required full active removal with no archive-copy, no museum-copy, and no source preservation.

## Firebase Rules Changed

NO

## Firestore Rules Changed

NO

## Storage Rules Changed

NO

## New Runtime Preserved

YES

Preserved:

- Splash
- Residential / Client Room
- Accessibility Room pages except old specialists/centers links
- Library Provider Content branches
- Commercial Access
- Specialist Room
- Center Room
- Admin / Owner Visual Room
- Owner operational branch rooms

## Direct URL Access Removed

YES

The removed paths now fall through to the default route-not-found behavior because their route constants and router cases were removed.

## Verification Performed

Search confirmed no active references remain for:

- removed route constants
- removed page classes
- removed center model/service classes
- removed contact request repository/classes
- removed provider/center contact request collection names
- removed `/menu`
- removed `/module/specialists`
- removed `/module/centers`

## Manual Validation Commands For Owner

```powershell
dart format lib/app/router/routes.dart lib/app/router/app_router.dart lib/features/library/presentation/pages/library_page.dart lib/shared/ui_kit/app_shell_actions.dart lib/features/auth/presentation/pages/login_page.dart lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart lib/features/chat/presentation/pages/chat_page.dart lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart lib/features/modules/presentation/pages/support_entry_page.dart lib/features/signals/domain/factories/signal_package_factory.dart
flutter analyze
```

Final Verdict:

OLD_MENU_SPECIALISTS_CENTERS_UI_SHELL_ARCHIVED_AND_RUNTIME_REMOVED
