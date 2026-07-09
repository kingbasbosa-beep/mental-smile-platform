# Real Auth Testing Activation Report V1

## Current route map

| Surface | Route | Active screen | Auth status |
| --- | --- | --- | --- |
| Commercial access selection | `/commercial/access` | `CommercialAccessPage` | Public entry |
| Specialist desktop login | `/commercial/specialist/login` | `SpecialistLoginPage` | Real FirebaseAuth login |
| Specialist register | `/commercial/specialist/register` | `SpecialistRegisterPage` | Real FirebaseAuth registration |
| Specialist desktop room | `/commercial/room` | `CommercialRoomPage` | Protected: `clinician` only |
| Specialist professional profile | `/commercial/specialist/professional-profile` | `SpecialistProfessionalProfileCleanLayoutPage` | Protected: `clinician` only |
| Specialist professional library | `/commercial/specialist/professional-library` | `SpecialistProfessionalLibraryPage` | Protected: `clinician` only |
| Center desktop login | `/commercial/center/login` | `CenterLoginPage` | Real FirebaseAuth login |
| Center register | `/commercial/center/register` | `CenterRegisterPage` | Real FirebaseAuth registration |
| Center desktop room | `/commercial/center/room` | `CenterRoomPage` | Protected: `center` only |
| Center professional profile | `/commercial/center/professional-profile` | `CenterProfessionalProfileCleanLayoutPage` | Protected: `center` only |
| Center professional library | `/commercial/center/professional-library` | `CenterProfessionalLibraryPage` | Protected: `center` only |
| Shared assistive tools | `/commercial/tools/assistive` | `CommercialSharedAssistiveToolsPage` | Protected: `clinician` or `center` |
| Mobile welcome selection | `/g2/mobile/login-selection` | `Generation2MobileLoginSelectionPage` | Public visual selector |
| Mobile specialist room | `/g2/mobile/specialist-room` | `Generation2MobileSpecialistRoomPage` | Protected: `clinician` only |
| Mobile center room | `/g2/mobile/center-room` | `Generation2MobileCenterRoomPage` | Protected: `center` only |

No separate mobile specialist/center login route exists in the current router. The active real login implementation is the commercial login flow, which is responsive and can be opened on mobile-sized screens.

## Specialist auth flow status

- Previous state: `SpecialistLoginPage` collected phone/password but the Login button navigated directly to `/commercial/room`.
- Current state: Login calls `CommercialAuthService.loginClinician()`.
- FirebaseAuth method: `signInWithEmailAndPassword`.
- Identifier behavior: accepts email directly; phone lookup is attempted through `clinicians` for visible ready profiles.
- Role validation: after FirebaseAuth succeeds, `AccountAccessService.resolve()` must return `role == clinician`.
- Wrong role behavior: signs out and shows a safe error message.
- Successful destination: `/commercial/room`.

## Center auth flow status

- Previous state: `CenterLoginPage` collected email/password but the Login button navigated directly to `/commercial/center/room`.
- Current state: Login calls `CommercialAuthService.loginCenter()`.
- FirebaseAuth method: `signInWithEmailAndPassword`.
- Role validation: after FirebaseAuth succeeds, `AccountAccessService.resolve()` must return `role == center`.
- Wrong role behavior: signs out and shows a safe error message.
- Successful destination: `/commercial/center/room`.

## Registration status

### Specialist

- Added `/commercial/specialist/register`.
- Creates a real FirebaseAuth account with email/password.
- Creates a Firestore profile in `clinicians/{uid}`.
- Saves role as `clinician`.
- Saves testing metadata and contact fields.
- Uses `visibilityReadiness: incomplete` during create to satisfy current Firestore rules, then updates the profile to `ready` using the existing self-update allowance.

### Center

- Added `/commercial/center/register`.
- Creates a real FirebaseAuth account with email/password.
- Creates a Firestore profile in `centers/{uid}`.
- Saves role as `center`.
- Saves testing metadata and contact fields.
- Uses `visibilityReadiness: incomplete` during create to satisfy current Firestore rules, then updates the profile to `ready` using the existing self-update allowance.

## Login status

- Specialist login is no longer a navigation bypass.
- Center login is no longer a navigation bypass.
- Password validation remains real FirebaseAuth password validation.
- Empty fields are blocked locally before hitting Firebase.
- Role mismatch is blocked after auth resolution.
- Protected rooms use `_RouteAccessGate`.

## Firebase status

- `lib/firebase_options.dart` exists.
- `lib/main.dart` calls `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`.
- `firebase_auth` is already in `pubspec.yaml`.
- `cloud_firestore` is already in `pubspec.yaml`.
- No Firebase dependency was added.
- No Firebase config was modified.

## Firestore/profile status

Active profile collections found:

- `clinicians`
- `centers`

Active review/support collections found:

- `clinician_profile_change_requests`
- `center_profile_change_requests`
- `support_requests`
- archive/signal/system collections already present in other features

Expected but not active in this auth flow:

- `specialists`
- `providers`
- `users`
- `commercial_profiles`
- `commercial_v2_profiles`
- `center_profiles`
- `provider_profiles`

The auth flow now uses the existing active collections only: `clinicians` and `centers`.

## Problems found

1. Specialist Login previously bypassed FirebaseAuth and opened `/commercial/room` directly.
2. Center Login previously bypassed FirebaseAuth and opened `/commercial/center/room` directly.
3. Register links existed visually but had empty callbacks.
4. No explicit specialist/center register routes existed.
5. Commercial specialist/center rooms were not role-protected by the existing route gate.
6. Mobile specialist/center room routes were visual-only and not role-protected.
7. Firestore rules require provider profiles to be created as `visibilityReadiness: incomplete`, so direct `ready` creation would fail.

## Files changed

- `lib/features/commercial/application/commercial_auth_service.dart`
- `lib/features/commercial/presentation/pages/specialist_login_page.dart`
- `lib/features/commercial/presentation/pages/center_login_page.dart`
- `lib/features/commercial/presentation/pages/commercial_register_pages.dart`
- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`
- `docs/auth/REAL_AUTH_TESTING_ACTIVATION_REPORT_V1.md`

## Routes changed

Added:

- `/commercial/specialist/register`
- `/commercial/center/register`

Protected with role gates:

- `/commercial/room` -> `clinician`
- `/commercial/specialist/professional-profile` -> `clinician`
- `/commercial/specialist/professional-library` -> `clinician`
- `/commercial/center/room` -> `center`
- `/commercial/center/professional-profile` -> `center`
- `/commercial/center/professional-library` -> `center`
- `/commercial/tools/assistive` -> `clinician` or `center`
- `/g2/mobile/specialist-room` -> `clinician`
- `/g2/mobile/center-room` -> `center`

## Testing checklist

### Specialist test

1. Open `/commercial/specialist/register`.
2. Create account with a real test email, phone, and password.
3. Confirm account exists in Firebase Authentication.
4. Confirm `clinicians/{uid}` exists in Firestore with `role: clinician`.
5. Confirm `visibilityReadiness: ready` after registration completes.
6. Logout.
7. Open `/commercial/specialist/login`.
8. Login with the same credentials.
9. Confirm navigation to `/commercial/room`.
10. Confirm `/commercial/center/room` is not available for this account.

### Center test

1. Open `/commercial/center/register`.
2. Create account with a real test email, phone, and password.
3. Confirm account exists in Firebase Authentication.
4. Confirm `centers/{uid}` exists in Firestore with `role: center`.
5. Confirm `visibilityReadiness: ready` after registration completes.
6. Logout.
7. Open `/commercial/center/login`.
8. Login with the same credentials.
9. Confirm navigation to `/commercial/center/room`.
10. Confirm `/commercial/room` is not available for this account.

### Negative tests

1. Wrong password shows an error.
2. Empty password is blocked before FirebaseAuth.
3. Existing email shows the FirebaseAuth email-in-use error.
4. Specialist account cannot enter center dashboard/room.
5. Center account cannot enter specialist dashboard/room.
6. Signed-out access to protected commercial/mobile provider rooms redirects to the unified commercial access surface.

## Remaining risks

- I did not run `flutter analyze`, `flutter test`, or `flutter build`.
- Phone-based specialist login depends on Firestore query permissions and may require an index because it queries phone plus readiness fields. Email/password is the primary reliable path.
- The current mobile provider rooms are now protected, but there is no dedicated mobile login page route. Mobile users can still use the responsive commercial login routes.
- Firestore security rules are local in this workspace; deployed rules must match this behavior for live testing.
- Test profiles are marked ready for route access, so use test accounts and non-sensitive data only.

REAL_AUTH_TESTING_ACTIVATION_COMPLETED
