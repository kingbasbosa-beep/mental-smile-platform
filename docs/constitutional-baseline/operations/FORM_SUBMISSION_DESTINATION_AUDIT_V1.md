# Form Submission Destination Audit V1

Status: COMPLETED
Date: 2026-07-07
Scope: Flutter runtime audit only
Runtime effect: none

## Purpose

Audit every questionnaire, survey, form, suggestion, contact, registration, and submit/save action found in the current Flutter project and identify where submitted data goes.

This audit did not modify runtime code, routing, Firebase, localization, assets, or UI.

## Executive Findings

- Real Firestore writes found:
  - `clinicians/{uid}` during specialist registration.
  - `centers/{uid}` during center registration.
  - `support_requests/{autoId}` during structured support issue submission.
  - `signal_events/{signalId}` as support telemetry side-effect.
  - `archive_signal_events/{eventId}` as residential/accessibility telemetry side-effect.
- Local-only submissions found:
  - Shared Daleel surveys.
  - Legacy splash Daleel survey.
  - Accessibility client support-space messages.
  - Commercial room notebook notes.
  - Specialist/center professional profile draft forms.
- External-only submissions found:
  - Accessibility suggestions via WhatsApp.
  - Accessibility check-in via WhatsApp.
- NOT_CONNECTED / data-loss issue:
  - Accessibility check-in has five text controllers, but `_sendCheckin()` sends a static localized WhatsApp message and does not include the typed answers.
  - Shared Daleel survey responses are only `debugPrint`ed and then lost when the sheet closes.
  - Specialist/center professional profile drafts create local `rawProfile` maps and do not persist them.
- Firebase rule issue:
  - `support_requests` rules require signed-in user and `createdByUid == uid()`. The UI allows guest/anonymous context and sets `createdByUid: user?.uid`, so anonymous/guest support issue submissions can fail.

## Final Table

| Screen | Route | Submit Action | Destination | Collection | Status |
| --- | --- | --- | --- | --- | --- |
| Specialist Register | `/commercial/specialist/register` | `Create Account` -> `_register()` | Firebase Auth + Firestore doc | `clinicians/{uid}` | CONNECTED |
| Center Register | `/commercial/center/register` | `Create Account` -> `_register()` | Firebase Auth + Firestore doc | `centers/{uid}` | CONNECTED |
| Specialist Login | `/commercial/specialist/login` | `Login` -> `_login()` | Firebase Auth sign-in; reads clinician account | `clinicians` read/query only | AUTH_ONLY |
| Center Login | `/commercial/center/login` | `Login` -> `_login()` | Firebase Auth sign-in; reads center account | `centers` read/query only | AUTH_ONLY |
| Admin Login | `/commercial/admin/login` | `Login` -> `_handleLogin()` | Firebase Auth sign-in only | none | AUTH_ONLY |
| Accessibility Suggestions | `/accessibility/suggestions` | localized submit button -> `_submitSuggestion()` | External WhatsApp URL; signal side-effect | `archive_signal_events` telemetry only | EXTERNAL_WHATSAPP |
| Accessibility Check-in | `/accessibility/checkin` | localized submit button -> `_sendCheckin()` | External WhatsApp URL with static text; typed fields not sent | `archive_signal_events` telemetry only | EXTERNAL_WHATSAPP_WITH_UNSUBMITTED_FIELDS |
| Client Support Space | opened from `/accessibility/checkin` | `نشر المشاركة` -> `_submitMessage()` | Static in-memory list | none | LOCAL_ONLY_LOST_ON_EXIT |
| Support Issue Selector | `/module/support-issue-selector` | issue card tap -> `_submitIssue()` | Firestore doc + signal telemetry | `support_requests/{autoId}` + `signal_events/{signalId}` | CONNECTED_WITH_RULE_RISK |
| Shared Daleel Survey | multiple routes listed below | `إرسال الرأي` -> `_submitSurvey()` | `debugPrint`, SnackBar, close sheet | none | LOCAL_ONLY_LOST_ON_EXIT |
| Legacy Splash Daleel Survey | `/legacy/splash` | `إرسال الرأي` -> `_submitSurvey()` | `debugPrint`, SnackBar, close sheet | none | LOCAL_ONLY_LOST_ON_EXIT |
| Specialist Professional Profile Clean | `/commercial/specialist/professional-profile` | `💛 معاكم يا شباب 😊` -> preview -> `تمام.. ابعتوها` | local `rawProfile` map + `debugPrint`; no persistence | none | NOT_CONNECTED |
| Center Professional Profile Clean | `/commercial/center/professional-profile` | `💛 معاكم يا شباب 😊` -> preview -> `تمام.. ابعتوها` | local `rawProfile` map + `debugPrint`; no persistence | none | NOT_CONNECTED |
| Specialist Professional Profile legacy | not currently routed | save button -> `_saveRawProfessionalProfile()` | local map + `debugPrint`/SnackBar | none | UNROUTED_LOCAL_ONLY |
| Specialist Professional Profile refined | not currently routed | save button -> `_saveRawProfessionalProfile()` | local map + `debugPrint` | none | UNROUTED_LOCAL_ONLY |
| Specialist Professional Profile signal-first | not currently routed | save button -> `_saveRawProfile()` | local map + `debugPrint` | none | UNROUTED_LOCAL_ONLY |
| Specialist Professional Profile upload-refinement | not currently routed | save button -> `_saveRawProfessionalProfile()` | local map + `debugPrint` | none | UNROUTED_LOCAL_ONLY |
| Commercial Room Notebook | commercial room utility dialog | localized save button -> dialog `onPressed` | widget state `_savedNote`, `_savedDateTime` | none | LOCAL_ONLY_LOST_ON_EXIT |

## Detailed Findings

### Specialist Register

1. Screen name: Specialist Register
2. File path:
   - `lib/features/commercial/presentation/pages/commercial_register_pages.dart`
   - destination service: `lib/features/commercial/application/commercial_auth_service.dart`
3. User type: specialist
4. Form purpose: create specialist account.
5. Submit button text: `Create Account`
6. Does it save data: yes.
7. Firebase destination:
   - Firebase Auth: `createUserWithEmailAndPassword`
   - Firestore collection: `clinicians`
   - Document path: `clinicians/{user.uid}`
   - Fields saved on initial `set`: `name`, `displayName`, `uid`, `role`, `email`, `phone`, `phoneNumber`, `isBlocked`, `visibilityReadiness`, `testingMode`, `source`, `createdAt`, `updatedAt`.
   - Fields saved on following `update`: `visibilityReadiness`, `readinessUpdatedAt`, `readinessSource`, `updatedAt`.
8. Local only: no.
9. UI only: no.
10. Route: `/commercial/specialist/register`
11. Validation:
   - all fields required.
   - password length >= 6.
   - password confirmation must match.
12. Firebase rules:
   - `match /clinicians/{clinicianId}` allows create via `clinicianCreateValid`.
   - follow-up update allowed while `visibilityReadiness != ready` and affected keys are allowed registration fields.

### Center Register

1. Screen name: Center Register
2. File path:
   - `lib/features/commercial/presentation/pages/commercial_register_pages.dart`
   - destination service: `lib/features/commercial/application/commercial_auth_service.dart`
3. User type: center
4. Form purpose: create center account.
5. Submit button text: `Create Account`
6. Does it save data: yes.
7. Firebase destination:
   - Firebase Auth: `createUserWithEmailAndPassword`
   - Firestore collection: `centers`
   - Document path: `centers/{user.uid}`
   - Fields saved on initial `set`: `name`, `centerName`, `uid`, `role`, `email`, `phone`, `phoneNumber`, `isBlocked`, `visibilityReadiness`, `testingMode`, `source`, `createdAt`, `updatedAt`.
   - Fields saved on following `update`: `visibilityReadiness`, `readinessUpdatedAt`, `readinessSource`, `updatedAt`.
8. Local only: no.
9. UI only: no.
10. Route: `/commercial/center/register`
11. Validation:
   - all fields required.
   - password length >= 6.
   - password confirmation must match.
12. Firebase rules:
   - `match /centers/{centerId}` allows create via `centerCreateValid`.
   - follow-up update allowed while `visibilityReadiness != ready` and affected keys are allowed registration fields.

### Specialist Login

1. Screen name: Specialist Login
2. File path:
   - `lib/features/commercial/presentation/pages/specialist_login_page.dart`
   - auth service: `lib/features/commercial/application/commercial_auth_service.dart`
3. User type: specialist
4. Form purpose: authenticate existing specialist.
5. Submit button text: `Login`
6. Does it save data: no submitted form data is saved.
7. Firebase destination:
   - Firebase Auth sign-in.
   - Firestore reads from `clinicians` to resolve phone/email and account access.
8. Local only: controllers `_phoneController`, `_passwordController`; disposed on exit.
9. UI only: auth action only.
10. Route: `/commercial/specialist/login`
11. Validation: identity and password must be non-empty.
12. Firebase rules: `clinicians` read rules apply to account resolution; no write rule needed for login.

### Center Login

1. Screen name: Center Login
2. File path:
   - `lib/features/commercial/presentation/pages/center_login_page.dart`
   - auth service: `lib/features/commercial/application/commercial_auth_service.dart`
3. User type: center
4. Form purpose: authenticate existing center.
5. Submit button text: `Login`
6. Does it save data: no submitted form data is saved.
7. Firebase destination:
   - Firebase Auth sign-in.
   - Firestore reads from `centers` to resolve account access.
8. Local only: controllers `_emailController`, `_passwordController`; disposed on exit.
9. UI only: auth action only.
10. Route: `/commercial/center/login`
11. Validation: email and password must be non-empty.
12. Firebase rules: `centers` read rules apply to account resolution; no write rule needed for login.

### Admin Login

1. Screen name: Admin Login
2. File path: `lib/features/commercial/presentation/pages/admin_login_page.dart`
3. User type: unknown/admin
4. Form purpose: authenticate admin/owner account.
5. Submit button text: `Login`
6. Does it save data: no.
7. Firebase destination: Firebase Auth sign-in only.
8. Local only: `_emailController`, `_passwordController`; disposed on exit.
9. UI only: auth action only.
10. Route: `/commercial/admin/login`
11. Validation: email and password must be non-empty.
12. Firebase rules: no Firestore write involved.

### Accessibility Suggestions

1. Screen name: Accessibility Suggestions
2. File path: `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart`
3. User type: accessibility client
4. Form purpose: suggest an accessibility/community tool.
5. Submit button text: localized `applicationAccessibilitySuggestionsSubmitButton`.
6. Does it save data: not as form data.
7. Destination:
   - Opens external WhatsApp URL: `https://wa.me/201014116531?text=...`
   - Message contains `toolName`, `reason`, and optional `link`.
   - Emits residential signal `suggestionSubmit`; signal writer may persist telemetry to `archive_signal_events`.
8. Local only: `_toolNameController`, `_reasonController`, `_linkController`; data lost on exit after external handoff.
9. UI only: no direct Firestore form destination.
10. Route: `/accessibility/suggestions`
11. Validation: `toolName` and `reason` required; `link` optional.
12. Firebase rules:
   - no `suggestions` collection rule exists.
   - telemetry uses `archive_signal_events` rule if the signal package is accepted.

### Accessibility Check-in

1. Screen name: Accessibility Check-in
2. File path: `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart`
3. User type: accessibility client
4. Form purpose: five check-in questions plus WhatsApp contact.
5. Submit button text: localized `applicationAccessibilitySuggestionsSubmit`.
6. Does it save data: typed answers are not saved and not included in the outgoing message.
7. Destination:
   - Opens external WhatsApp URL: `https://wa.me/201014116531?text=...`
   - `_sendCheckin()` sends `l10n.applicationAccessibilityCheckinMessage`, not `_questionControllers` values.
   - Emits residential signal `checkinToolOpen`; signal writer may persist telemetry to `archive_signal_events`.
8. Local only:
   - state variable: `_questionControllers`
   - data is lost on exit and currently ignored on submit.
9. UI only: submitted typed fields are effectively NOT_CONNECTED.
10. Route: `/accessibility/checkin`
11. Validation: none for the five answers.
12. Firebase rules:
   - no check-in collection/rule exists.
   - telemetry uses `archive_signal_events` rule if accepted.

### Client Support Space

1. Screen name: Client Support Space
2. File path: `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart`
3. User type: client / accessibility client
4. Form purpose: local beta support/share message.
5. Submit button text: `نشر المشاركة`
6. Does it save data: local memory only.
7. Firebase destination: none.
8. Local only:
   - state/controller: `_messageController`
   - store: `_ClientSupportSpaceStore._messages`
   - fields stored locally: `id`, `text`, `createdAt`, `userType`, `sourceScreen`, `status`, `isBeta`
   - data is lost on app refresh/restart/hot restart.
9. UI only: not Firebase-connected.
10. Route: opened from `/accessibility/checkin` via local page push.
11. Validation:
   - must accept rules.
   - message required.
   - max 500 characters.
   - max 5 lines.
   - small denylist check.
12. Firebase rules: no collection/rule exists for this local message store.

### Support Issue Selector

1. Screen name: Support Issue Selector
2. File path: `lib/features/modules/presentation/pages/support_issue_selector_page.dart`
3. User type: client / unknown, depending on entry and auth state.
4. Form purpose: submit a structured support request by selecting an issue card.
5. Submit button text: no text submit button; issue card tap calls `_submitIssue(option)`.
6. Does it save data: yes.
7. Firebase destination:
   - Collection: `support_requests`
   - Document path: `support_requests/{autoId}`
   - Fields saved: `id`, `createdAt`, `createdByUid`, `userRole`, `supportType`, `issueType`, `status`, `source`, `priority`
   - Side-effect: `CleanSignalRuntime.firestore().emit(...)` writes support-start telemetry to `signal_events/{signalId}`.
8. Local only: `_submittingIssueKey` prevents duplicate submit; reset after submit/failure.
9. UI only: no.
10. Route: `/module/support-issue-selector`, requires argument `supportType` in `recovery_support`, `family_support`, `client_support`, `center_support`, or `clinician_support`.
11. Validation:
   - route validates `supportType`.
   - duplicate submit blocked while `_submittingIssueKey != null`.
12. Firebase rules:
   - `support_requests` rule requires `signedIn()`, `createdByUid == uid()`, `status == 'new'`, and `source == 'structured_support'`.
   - Risk: code allows `user == null` or anonymous and sets `createdByUid: user?.uid`; those submits can fail against rules.

### Shared Daleel Survey Engine

1. Screen name: Shared Daleel Survey
2. File path: `lib/shared/guides/daleel_assistant.dart`
3. User type: varies by host screen.
4. Form purpose: guide/survey feedback and suggestions.
5. Submit button text: `إرسال الرأي`
6. Does it save data: no durable save.
7. Firebase destination: none.
8. Local only:
   - state variable: `_answers`
   - controller: `_suggestionsController`
   - extra controllers: `_extraTextControllers`
   - submit only calls `debugPrint(...)`, shows SnackBar, and closes sheet.
   - data is lost on sheet close/exit.
9. UI only: LOCAL_ONLY.
10. Routes/placements found:
   - `/commercial/access`
   - `/commercial/specialist/login`
   - `/commercial/center/login`
   - `/commercial/room`
   - `/commercial/center/room`
   - `/client/room`
   - `/accessibility/room`
   - `/g2/mobile/login-selection`
   - `/g2/mobile/client-room`
   - `/g2/mobile/specialist-room`
   - `/g2/mobile/center-room`
   - nested `Generation2MobileFriendsSelectionPage` opened from mobile flow
   - nested `Generation2MobileSupportersSelectionPage` opened from mobile flow
   - nested `Generation2MobileFriendClientRoomPage` opened from mobile flow
11. Validation: none; empty submissions are accepted.
12. Firebase rules: no `surveys` or `feedback` collection/rule exists.

### Legacy Splash Daleel Survey

1. Screen name: Legacy Splash Daleel Survey
2. File path: `lib/features/splash/presentation/pages/splash_page.dart`
3. User type: public landing / unknown
4. Form purpose: welcome screen feedback.
5. Submit button text: `إرسال الرأي`
6. Does it save data: no durable save.
7. Firebase destination: none.
8. Local only:
   - state variable: `_answers`
   - controller: `_suggestionsController`
   - submit only calls `debugPrint(...)`, shows SnackBar, and closes sheet.
   - data is lost on sheet close/exit.
9. UI only: LOCAL_ONLY.
10. Route: `/legacy/splash`
11. Validation: none.
12. Firebase rules: no `surveys` or `feedback` collection/rule exists.

### Specialist Professional Profile Clean

1. Screen name: Specialist Professional Profile Clean
2. File path: `lib/features/commercial/presentation/pages/specialist_professional_profile_clean_layout_page.dart`
3. User type: specialist
4. Form purpose: prepare raw specialist profile/generation preferences.
5. Submit button text:
   - first: `💛 معاكم يا شباب 😊`
   - preview confirm: `تمام.. ابعتوها 💛`
6. Does it save data: no durable save.
7. Firebase destination: none.
8. Local only:
   - local variable: `rawProfile`
   - fields prepared: `specialty`, `subSpecialty`, `appearanceStyle`, `publishingTargets`, `presentationFormats`, `personalPhotoSelected`, `productsGeneratedInsideSpecialistRoom`
   - data is only `debugPrint`ed; images/state cleared after submit.
9. UI only: NOT_CONNECTED.
10. Route: `/commercial/specialist/professional-profile`
11. Validation: `Form` validators on required fields.
12. Firebase rules: no matching destination/rule used.

### Center Professional Profile Clean

1. Screen name: Center Professional Profile Clean
2. File path: `lib/features/commercial/presentation/pages/center_professional_profile_clean_layout_page.dart`
3. User type: center
4. Form purpose: prepare raw center profile/generation preferences.
5. Submit button text:
   - first: `💛 معاكم يا شباب 😊`
   - preview confirm: `تمام.. ابعتوها 💛`
6. Does it save data: no durable save.
7. Firebase destination: none.
8. Local only:
   - local variable: `rawProfile`
   - fields prepared: `centerType`, `serviceNote`, `appearanceStyle`, `yearsInOperation`, `governorate`, `hasAccommodation`, `hasClinics`, `hasExternalServices`, `ageGroup`, `serviceType`, `workingDays`, `publishingTargets`, `presentationFormats`, `centerLogoSelected`, `centerCoverSelected`, `productsGeneratedInsideCenterRoom`
   - data is only `debugPrint`ed; images/state cleared after submit.
9. UI only: NOT_CONNECTED.
10. Route: `/commercial/center/professional-profile`
11. Validation: `Form` validators on required fields.
12. Firebase rules: no matching destination/rule used.

### Legacy / Unrouted Specialist Profile Forms

| File | Route | Submit | Destination | Status |
| --- | --- | --- | --- | --- |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_page.dart` | not currently routed | `_saveRawProfessionalProfile()` | local `rawProfessionalProfile` + `debugPrint`/SnackBar | UNROUTED_LOCAL_ONLY |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_refined_page.dart` | not currently routed | `_saveRawProfessionalProfile()` | local `rawProfessionalProfile` + `debugPrint` | UNROUTED_LOCAL_ONLY |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_signal_first_page.dart` | not currently routed | `_saveRawProfile()` | local `rawProfile` + `debugPrint`; image bytes cleared | UNROUTED_LOCAL_ONLY |
| `lib/features/commercial/presentation/pages/specialist_professional_profile_upload_refinement_page.dart` | not currently routed | `_saveRawProfessionalProfile()` | local `rawProfessionalProfile` + `debugPrint`; image bytes cleared | UNROUTED_LOCAL_ONLY |

Validation exists through `Form` validators in these files. No Firestore destination is used.

### Commercial Room Notebook

1. Screen name: Commercial Room Notebook dialog
2. File path: `lib/features/commercial/presentation/widgets/commercial_room_utility_tools.dart`
3. User type: specialist / center, depending on host room.
4. Form purpose: local note and reminder.
5. Submit button text: localized `commercialRoomNotebookSave`
6. Does it save data: widget state only.
7. Firebase destination: none.
8. Local only:
   - state variables: `_savedNote`, `_savedDateTime`
   - data lost when the widget/page is disposed.
9. UI only: LOCAL_ONLY.
10. Route: used inside commercial rooms, including `/commercial/room` and `/commercial/center/room`.
11. Validation: none.
12. Firebase rules: no collection/rule exists.

## Observed TextFields Excluded From Submission Table

These TextFields do not have a form submission destination and appear to be search/filter/input widgets rather than questionnaire/contact/registration submits:

- `Block1SearchField` in `lib/features/block_1_archive_operations/presentation/widgets/block_1_archive_ops_widgets.dart`
- search fields in commercial professional libraries and assistive tools pages
- admin dashboard text-entry cards in `lib/features/commercial/presentation/pages/admin_room_page.dart`
- declaration review search/filter `TextField` in `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart`
- `BoundedAssistantPanel` command input in `lib/features/assistant/presentation/widgets/bounded_assistant_panel.dart`; this calls `widget.onCommand(text)` and does not persist by itself.

## Firebase Rules Coverage

| Collection | Used By Submit | Rule Status | Notes |
| --- | --- | --- | --- |
| `clinicians` | Specialist Register | PRESENT | Create/update path exists for self-registration. |
| `centers` | Center Register | PRESENT | Create/update path exists for self-registration. |
| `support_requests` | Support Issue Selector | PRESENT_WITH_RISK | Requires signed-in user; guest/anonymous UI flow can fail. |
| `signal_events` | Support Started telemetry | PRESENT | Used as telemetry side-effect, not form payload storage. |
| `archive_signal_events` | Accessibility/residential telemetry | PRESENT | Used as telemetry side-effect, not form payload storage. |
| `clinician_profile_change_requests` | read-only declaration room | CREATE_DISABLED | No current submit source found. |
| `center_profile_change_requests` | read-only declaration room | CREATE_DISABLED | No current submit source found. |
| `suggestions` | not used | MISSING | Accessibility suggestions go to WhatsApp instead. |
| `feedback` | not used | MISSING | Daleel feedback is local only. |
| `surveys` | not used | MISSING | Daleel surveys are local only. |
| `assessments` | not used | MISSING | No submit source found. |
| `contact_requests` | not used in current active code | MISSING | No submit source found. |
| `profiles` | not used | MISSING | Commercial profile forms are local/debug only. |

## Recommended Follow-Up Decisions

1. Decide whether Daleel surveys should remain local-only or write to a governed `surveys` / `feedback` collection.
2. Decide whether Accessibility Suggestions should remain WhatsApp-only or write to a governed `suggestions` collection before external handoff.
3. Fix Accessibility Check-in if typed answers are expected to be submitted; currently they are ignored.
4. Decide whether specialist/center profile forms should write draft records, create profile change requests, or remain UI-only.
5. Align `support_requests` UI access with Firestore rules: either require signed-in users before route entry or add a governed anonymous/session support request rule.
