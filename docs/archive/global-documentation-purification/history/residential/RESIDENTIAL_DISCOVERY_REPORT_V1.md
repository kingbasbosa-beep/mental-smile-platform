# Residential Discovery Report V1

Status: COMPLETED

Operation ID: OP-RESIDENTIAL-DISCOVERY-AND-INVENTORY-PHASE-V1

Date: 2026-06-23

Mode: DISCOVERY_ONLY

Final Verdict: RESIDENTIAL_DISCOVERY_AND_INVENTORY_COMPLETED

## Discovery Boundary

This report documents Residential runtime as it exists today.

No cleanup, refactor, route change, rules change, feature work, architecture change, or judgment was performed.

The inspected Residential scope includes:

- Splash entry points that open Residential rooms
- Client Room
- Accessibility Room
- Accessibility Room child pages
- Needs-like support selector flow where directly discoverable by route and code references
- Firestore and signal paths directly touched by the discovered Residential/support flow

Commercial, Owner, Monitoring, Archive, and Governance sections were not audited except where directly referenced by Residential/support runtime.

## Operation Action Ledger

The following discovery actions were recorded inside this report and summarized in the Operations Registry entry:

| Action ID | Action | Evidence |
| --- | --- | --- |
| RD-001 | Reviewed Residential route constants | `lib/app/router/routes.dart` |
| RD-002 | Reviewed Residential router cases | `lib/app/router/app_router.dart` |
| RD-003 | Reviewed Splash Residential entry buttons | `lib/features/splash/presentation/pages/splash_page.dart` |
| RD-004 | Reviewed Client Room page | `lib/features/client/presentation/pages/client_room_page.dart` |
| RD-005 | Reviewed Accessibility Room page | `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` |
| RD-006 | Reviewed Accessibility Links page | `lib/features/accessibility/presentation/pages/accessibility_links_page.dart` |
| RD-007 | Reviewed Accessibility Tools page | `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart` |
| RD-008 | Reviewed Accessibility Suggestions page | `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart` |
| RD-009 | Reviewed Accessibility Community Tools page | `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart` |
| RD-010 | Reviewed Accessibility Check-In page | `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart` |
| RD-011 | Reviewed Accessibility Message Of The Day page | `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart` |
| RD-012 | Reviewed needs-like Support Entry page | `lib/features/modules/presentation/pages/support_entry_page.dart` |
| RD-013 | Reviewed needs-like Support Issue Selector page | `lib/features/modules/presentation/pages/support_issue_selector_page.dart` |
| RD-014 | Reviewed Firestore support request rules | `firestore.rules` |
| RD-015 | Reviewed Firestore signal event rules | `firestore.rules` |
| RD-016 | Reviewed signal type registry | `lib/features/signals/domain/registries/signal_type_registry.dart` |
| RD-017 | Reviewed signal package factory | `lib/features/signals/domain/factories/signal_package_factory.dart` |
| RD-018 | Reviewed signal storage service | `lib/features/signals/data/services/signal_storage_service.dart` |
| RD-019 | Reviewed clean signal runtime | `lib/features/signals/domain/emitters/clean_signal_runtime.dart` |
| RD-020 | Reviewed signal emitter | `lib/features/signals/domain/emitters/signal_emitter.dart` |
| RD-021 | Reviewed signal package model | `lib/features/signals/domain/models/signal_package.dart` |
| RD-022 | Reviewed residential monitoring registry | `lib/features/monitoring/residential/domain/residential_monitoring_registry.dart` |
| RD-023 | Reviewed residential signal aggregate model | `lib/features/monitoring/residential/aggregates/residential_signal_aggregate.dart` |
| RD-024 | Reviewed support room consumer for support requests | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` |
| RD-025 | Reviewed bundled Residential room assets | `assets/branding/rooms/**` |
| RD-026 | Reviewed Residential asset bundle entries | `pubspec.yaml` |

## Section 1 - Residential Scope Map

### Screens And Pages

| Name | Purpose | Current Status | Dependencies |
| --- | --- | --- | --- |
| Splash Residential Entry | Opens Client Room and Accessibility Room | Active | `Routes.clientRoom`, `Routes.accessibilityRoom`, splash assets, locale provider |
| Client Room Page | Full-screen static room with YouTube, temporary local image, and exit controls | Active | `image_picker`, `url_launcher`, `Routes.splash`, room assets |
| Accessibility Room Page | Full-screen room with wall cards, YouTube, temporary image, notebook message, and exit controls | Active | `image_picker`, `url_launcher`, `Routes.* accessibility`, room assets |
| Accessibility Links Page | Papyrus-style external links directory | Active | `url_launcher`, papyrus background asset |
| Accessibility Tools Page | Papyrus-style assistive tools external directory | Active | `url_launcher`, papyrus background asset |
| Accessibility Suggestions Page | Local form that opens WhatsApp with suggestion text | Active | `url_launcher`, `TextEditingController`, papyrus background asset |
| Accessibility Community Tools Page | Placeholder page for future community tools | Active | `Routes.accessibilityRoom`, papyrus background asset |
| Accessibility Check-In Page | Local 5-question UI; WhatsApp opens with fixed check-in message and does not send answers | Active | `url_launcher`, `Routes.specialists`, `Routes.centers`, `Routes.library`, papyrus background asset |
| Accessibility Message Of The Day Page | Standalone selectable motivational messages page that pops selected message | Active route; room currently uses dialog selection internally | `Random`, papyrus background asset |
| Special Needs Support Entry | Needs-like family support entry surface | Active route | `Routes.specialNeeds`, `Routes.supportIssueSelector`, specialists, centers, library |
| Support Issue Selector | Needs-like support selection and support signal creation | Active route | Firebase Auth, Firestore, signal runtime |

### Routes

| Route | Destination | Status |
| --- | --- | --- |
| `/splash` | `SplashPage` | Active Residential entry point |
| `/client/room` | `ClientRoomPage` | Active |
| `/accessibility/room` | `AccessibilityRoomPage` | Active |
| `/accessibility/links` | `AccessibilityLinksPage` | Active |
| `/accessibility/tools` | `AccessibilityToolsPage` | Active |
| `/accessibility/suggestions` | `AccessibilitySuggestionsPage` | Active |
| `/accessibility/community-tools` | `AccessibilityCommunityToolsPage` | Active |
| `/accessibility/checkin` | `AccessibilityCheckinPage` | Active |
| `/accessibility/message-of-the-day` | `AccessibilityMessageOfDayPage` | Active |
| `/module/special_needs` | `SupportEntryPage.specialNeeds()` | Active needs-like support entry |
| `/module/support-issue-selector` | `SupportIssueSelectorPage` when valid `supportType` argument exists | Active needs-like support selector |

### Components

| Component | File | Purpose |
| --- | --- | --- |
| `_RoomPlacement` | Client Room / Accessibility Room | Normalized responsive placement object |
| `_MonitorPhoto` | Client Room / Accessibility Room | Displays selected local image bytes inside monitor area |
| `_RoomImageButton` | Client Room / Accessibility Room | Image-based clickable room control |
| `_RoomHoverImageButton` | Accessibility Room | Feather hover/click button |
| Accessibility card widgets | Accessibility Room | Wall card rendering and navigation |
| `_SpeakableText` variants | Accessibility pages | Visual text plus speaker placeholder |
| `_SuggestionField` | Accessibility Suggestions | Local form field widget |
| `_CheckinField` | Accessibility Check-In | Local check-in text field |
| `_SupportIssueOption` | Support Issue Selector | Represents selectable support issue option |

### Services, Models, Collections, Signals

| Item | Purpose | Current Status | Dependencies |
| --- | --- | --- | --- |
| `FirebaseFirestore.collection('support_requests')` | Stores selected support issue requests | Active in Support Issue Selector only | Firebase Auth, Firestore rules |
| `SignalPackageFactory.supportStarted` | Creates `support_started` signal package | Active in Support Issue Selector only | signal registries |
| `CleanSignalRuntime.firestore()` | Emits support signal fail-soft | Active in Support Issue Selector only | signal emitter, signal storage |
| `SignalStorageService.eventsCollection = signal_events` | Stores emitted signal packages | Active when signal emit succeeds | Firestore rules |
| `ResidentialMonitoringRegistry` | Lists residential monitoring signal categories | Referenced registry | signal type registry |

### Assets

Residential direct asset roots:

- `assets/branding/rooms/client_room/`
- `assets/branding/rooms/accessibility_room/`
- `assets/branding/rooms/accessibility_room/cards/`

These paths are bundled in `pubspec.yaml`.

## Section 2 - Client Page Full Inventory

File: `lib/features/client/presentation/pages/client_room_page.dart`

Route: `/client/room`

### Visible Areas

| Area | Current Purpose | Data Source | Related Files | Related Services | Related Collections | Runtime Behavior |
| --- | --- | --- | --- | --- | --- | --- |
| Background | Room scene | responsive asset constants `_desktop`, `_tablet`, `_mobile` | Client Room page, room assets | none | none | `Image.asset` fills screen; selected by width/orientation |
| TV | YouTube launch control area | `_youtubeButton`, `_youtubeUrl` | Client Room page | `url_launcher` | none | Tap opens `https://www.youtube.com/@MentalSmileOs` externally |
| Notebook | Visual background area only | background image | room asset | none | none | No notebook text or data behavior in Client Room |
| Wall Tools | None visible as separate cards in Client Room code | none | none | none | none | No wall card widgets in Client Room |
| Notification Area | None found | none | none | none | none | No notification widget found |
| User Area | None found | none | none | none | none | No user identity widget found |
| Image Area | Temporary photo displayed in monitor area | `_selectedPhotoBytes` in widget state | Client Room page | `image_picker` | none | Pick one image from gallery; show via `Image.memory`; no persistence |
| Photo Upload Area | Clickable image button centered in monitor area | `_photoButton` asset | Client Room page | `image_picker` | none | Opens gallery through `ImagePicker().pickImage` |
| Exit Area | Exit cup button | `_exitCup` asset | Client Room page | Navigator | none | Clears `_selectedPhotoBytes`; navigates to `Routes.splash` and removes previous routes |

### Client Room Runtime Storage

No Firestore reads or writes were found in `ClientRoomPage`.

No signal emission was found in `ClientRoomPage`.

No authentication dependency was found in `ClientRoomPage`.

## Section 3 - Needs Page Full Inventory

No file or route explicitly named `NeedsPage` or `/needs` was found in the inspected Residential route set.

The actual needs-like implementation discovered is:

- `Routes.specialNeeds` -> `SupportEntryPage.specialNeeds()`
- `Routes.supportIssueSelector` -> `SupportIssueSelectorPage(supportType: ...)`

### Support Entry Categories

File: `lib/features/modules/presentation/pages/support_entry_page.dart`

`SupportEntryPage.specialNeeds()` exposes cards for:

- specialists
- centers
- support issue selector
- library

It logs path selection through `AppAnalytics.logPathSelected` and navigates to the configured route for each card.

### Support Issue Selector Accepted Categories

File: `lib/features/modules/presentation/pages/support_issue_selector_page.dart`

The route accepts only these `supportType` values:

- `recovery_support`
- `family_support`
- `client_support`
- `center_support`
- `clinician_support`

If the argument is absent or not one of those values, router returns route-not-found UI.

### Fields / Submitted Data

The selector is not a free-form form. It is a tap-to-submit option list.

| Field Name | Purpose | Data Type | Required Or Optional | Storage Destination | Runtime Usage |
| --- | --- | --- | --- | --- | --- |
| `id` | Firestore document id | string | generated | `support_requests/{requestId}` | stored in request document |
| `createdAt` | server timestamp | timestamp | generated | `support_requests/{requestId}` | ordering / audit |
| `createdByUid` | current Firebase user uid | string/null | generated | `support_requests/{requestId}` | read rule ownership; may be null when user is absent |
| `userRole` | inferred actor role | string | generated | `support_requests/{requestId}` | one of center, clinician, session, guest based on support type and auth |
| `supportType` | selected support context | string | required route argument | `support_requests/{requestId}` | categorizes support request |
| `issueType` | selected option key | string | required by tap | `support_requests/{requestId}` | identifies selected need/issue |
| `status` | request status | string | fixed | `support_requests/{requestId}` | created as `new` |
| `source` | request source | string | fixed | `support_requests/{requestId}` | created as `structured_support` |
| `priority` | priority marker | string | fixed | `support_requests/{requestId}` | created as `normal` |

### Option Sets

`client_support` options:

- `service_access_question`
- `provider_contact_question`
- `account_profile_issue`
- `complaint_bad_experience`
- `need_human_guidance`
- `general_support_question`

`center_support` options:

- `profile_visibility_issue`
- `contact_request_question`
- `accessibility_information_issue`
- `system_issue`
- `general_support_request`

`clinician_support` options:

- `profile_visibility_issue`
- `client_communication_question`
- `recommendation_visibility_question`
- `system_issue`
- `need_support_room`

`recovery_support` options:

- `need_specialist`
- `need_center`
- `recovery_support`
- `relapse_concern`
- `risk_report`
- `general_help`

Default/family support options:

- `need_specialist`
- `need_center`
- `family_guidance`
- `special_case_support`
- `risk_report`
- `general_help`

### Save Actions

On option tap:

1. create `support_requests/{requestId}`
2. set request payload
3. emit `support_started` through `CleanSignalRuntime.firestore()`
4. show success snackbar
5. `Navigator.maybePop()`

### Validation Logic

Validation found:

- route argument must be an accepted `supportType`
- duplicate submit is blocked while `_submittingIssueKey != null`
- no free-text field validation exists because no text fields exist in this selector

## Section 4 - Navigation Flow

### Actual Residential Room Flow

```text
App / startup route
-> /splash
-> Quick Access
-> /client/room
```

```text
App / startup route
-> /splash
-> Accessibility Access
-> /accessibility/room
-> fixed accessibility card routes
```

No authentication gate was found on `/client/room` or `/accessibility/room`.

### Actual Needs-Like Flow

```text
/module/special_needs
-> SupportEntryPage.specialNeeds()
-> support issue card
-> /module/support-issue-selector with supportType=family_support
-> user taps one issue option
-> support_requests write
-> support_started signal emission
-> maybePop()
```

Authentication behavior in the Support Issue Selector:

- It reads `FirebaseAuth.instance.currentUser`.
- It can infer `guest` or `session`, but the Firestore create rule for `support_requests` requires `signedIn()` and `createdByUid == uid()`.
- Therefore actual write success depends on Firebase Auth state and deployed rules.

## Section 5 - Data Mapping

| Component | Reads From | Writes To | Consumes | Produces |
| --- | --- | --- | --- | --- |
| Splash Quick Access | locale provider, assets | none | route constants | navigation to `/client/room` |
| Splash Accessibility Access | locale provider, assets | none | route constants | navigation to `/accessibility/room` |
| Client Room background | room assets | none | layout constraints | selected background image |
| Client Room YouTube | `_youtubeUrl` constant | none | `url_launcher` | external browser/app launch |
| Client Room temp photo | local selected bytes | widget state only | `image_picker` | `Uint8List` image display |
| Client Room exit | local state | local state clear | Navigator | navigation to `/splash` |
| Accessibility Room background | room assets | none | layout constraints | selected background image |
| Accessibility Room cards | card assets, route constants | none | Navigator | navigation to accessibility child pages |
| Accessibility Room temp photo | local selected bytes | widget state only | `image_picker` | `Uint8List` image display |
| Accessibility Room notebook dialog | local message list | widget state only | `Random`, dialog | selected notebook message |
| Accessibility Links Page | static link list | none | `url_launcher` | external URL launch |
| Accessibility Tools Page | static tools list | none | `url_launcher` | external URL launch |
| Accessibility Suggestions Page | text controllers | none internal | `url_launcher`, WhatsApp URL | external WhatsApp launch |
| Accessibility Check-In Page | text controllers | none internal | `url_launcher`, route constants | WhatsApp launch; navigation to specialists/centers/library |
| Accessibility Community Tools Page | static copy | none | Navigator | navigation back to Accessibility Room |
| Accessibility Message Of The Day Page | static message list | none | Navigator pop | selected message returned to caller |
| Support Issue Selector | Firebase current user, selected option | `support_requests`, `signal_events` via signal runtime | Firestore, signal package factory | support request, support_started signal |
| Support Room consumer | `support_requests` | none | Firestore stream | read-only support request lists |

## Section 6 - Collection Inventory

| Collection | Purpose | Read Usage | Write Usage | Related Screens | Related Services |
| --- | --- | --- | --- | --- | --- |
| `support_requests` | Structured support issue requests | `SSupportRoomPage` streams ordered by `createdAt`; rules allow owner/support observer/self reads | `SupportIssueSelectorPage` creates new request document | Support Issue Selector, Support Room | FirebaseFirestore |
| `signal_events` | Generic signal event persistence | `SignalStorageService.watchLatestEvents` can read latest events for actor; rules include owner/monitoring/support observer access | `SignalStorageService.saveSignal` writes emitted `support_started` package | Support Issue Selector indirectly | CleanSignalRuntime, FirestoreSignalEmitter |

No Firestore collection usage was found inside Client Room or Accessibility Room page files.

## Section 7 - Signal Inventory

| Signal | Producer | Consumer / Registry | Purpose | Current Usage Status |
| --- | --- | --- | --- | --- |
| `support_started` | `SupportIssueSelectorPage` via `SignalPackageFactory.supportStarted` | `ResidentialMonitoringRegistry.supportSignals`; `SignalStorageService` persists to `signal_events` | records start of structured support request | Active in needs-like support selector |
| `library_category_opened` | Not produced in inspected Residential files | `ResidentialMonitoringRegistry.librarySignals` | residential library aggregation category | Referenced by registry; producer not verified in this Residential pass |
| `tool_added` | Not produced in inspected Residential files | `ResidentialMonitoringRegistry.toolSignals` | tool aggregation category | Referenced by registry only in this pass |
| `tool_removed` | Not produced in inspected Residential files | `ResidentialMonitoringRegistry.toolSignals` | tool aggregation category | Referenced by registry only in this pass |
| `tool_opened` | Not produced in inspected Residential files | `ResidentialMonitoringRegistry.toolSignals` | tool aggregation category | Referenced by registry only in this pass |

Other signal types exist in `SignalTypeRegistry`, including accessible contact and provider/center profile signals, but no producer was found inside the inspected Client Room or Accessibility Room pages.

## Section 8 - Asset Inventory

### Direct Residential Room Assets

| Path | Usage Location | Runtime Purpose | Current Status |
| --- | --- | --- | --- |
| `assets/branding/rooms/client_room/client_room_background_desktop.png` | Client Room | desktop background | bundled |
| `assets/branding/rooms/client_room/client_room_background_tablet.png` | Client Room | tablet background | bundled |
| `assets/branding/rooms/client_room/client_room_background_mobile.png` | Client Room | mobile background | bundled |
| `assets/branding/rooms/client_room/accessibility_room_exit_button.png` | Client Room | exit cup | bundled |
| `assets/branding/rooms/client_room/accessibility_room_youtube_button.png` | Client Room | YouTube button | bundled |
| `assets/branding/rooms/client_room/accessibility_room_photo_upload_button.png` | Client Room | photo picker button | bundled |
| `assets/branding/rooms/accessibility_room/client_room_background_desktop.png` | Accessibility Room | desktop background | bundled |
| `assets/branding/rooms/accessibility_room/client_room_background_tablet.png` | Accessibility Room | tablet background | bundled |
| `assets/branding/rooms/accessibility_room/client_room_background_mobile.png` | Accessibility Room | mobile background | bundled |
| `assets/branding/rooms/accessibility_room/accessibility_room_exit_button.png` | Accessibility Room | exit cup | bundled |
| `assets/branding/rooms/accessibility_room/accessibility_room_youtube_button.png` | Accessibility Room | YouTube button | bundled |
| `assets/branding/rooms/accessibility_room/accessibility_room_photo_upload_button.png` | Accessibility Room | photo picker button | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_note_feather_button.png` | Accessibility Room | notebook message button | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_links_card_icon.png` | Accessibility Room | links card icon | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_tools_card_icon.png` | Accessibility Room | tools card icon | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_suggestions_card_icon.png` | Accessibility Room | suggestions card icon | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_card_icon.png` | Accessibility Room | community tools card icon | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_checkin_card_icon.png` | Accessibility Room | check-in card icon | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_links_papyrus_background.png` | Accessibility child pages | papyrus page background | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_suggestions_papyrus_background.png` | Suggestions page | suggestions papyrus background | bundled |
| `assets/branding/rooms/accessibility_room/cards/accessibility_tools_papyrus_background.png` | present in assets folder | no usage confirmed in inspected pages | bundled by folder |
| `assets/branding/rooms/accessibility_room/cards/accessibility_checkin_papyrus_background.png` | present in assets folder | no usage confirmed in inspected pages | bundled by folder |
| `assets/branding/rooms/accessibility_room/cards/accessibility_community_tools_papyrus_background.png` | present in assets folder | no usage confirmed in inspected pages | bundled by folder |

### Needs-Like Support Assets

The needs-like support pages reference additional assets outside the direct room folders:

- `assets/images/backgrounds/specialists_bg_mobile.png`
- `assets/images/backgrounds/specialists_bg_tablet.png`
- `assets/images/backgrounds/specialists_bg_desktop.png`
- `assets/images/family_support/...`
- `assets/images/addiction/...`
- `assets/c7_branding/buttons/...`
- `assets/c7_branding/home/...`

These are used by `SupportEntryPage` and `SupportIssueSelectorPage`, not by Client Room or Accessibility Room.

## Section 9 - Dependency Inventory

| Dependency | Type | Purpose | Consumers |
| --- | --- | --- | --- |
| `ImagePicker` | package/service | select one local image | Client Room, Accessibility Room |
| `url_launcher` | package/service | open YouTube, external links, WhatsApp | Client Room, Accessibility Room child pages |
| `Navigator` | Flutter navigation | route movement and pop behavior | all room/page flows |
| `FirebaseAuth.instance.currentUser` | auth dependency | determine support request actor | Support Issue Selector |
| `FirebaseFirestore.instance` | data service | create support request, store signal events | Support Issue Selector, SignalStorageService |
| `CleanSignalRuntime.firestore()` | signal runtime | validate, aggregate, emit signal | Support Issue Selector |
| `SignalPackageFactory.supportStarted` | signal factory | build `support_started` signal | Support Issue Selector |
| `SignalStorageService` | signal persistence service | write to `signal_events` | FirestoreSignalEmitter |
| `ResidentialMonitoringRegistry` | registry | maps residential signal types to aggregate kinds | monitoring residential aggregation |
| `ResidentialSignalAggregate` | model | aggregate seed/count model | signal aggregation runtime |
| `TextEditingController` | local state controller | local suggestions/check-in text | Suggestions, Check-In |
| `LocaleStorage` / `localeProvider` | locale state | Splash language toggle | Splash |

## Section 10 - Runtime Reality Report

### Client Room Reality

When a user enters via Splash Quick Access:

1. Splash calls `Navigator.pushNamed(Routes.clientRoom)`.
2. Router returns `ClientRoomPage`.
3. Client Room selects a background asset based on layout width/orientation.
4. YouTube button opens the Mental Smile YouTube URL externally.
5. Photo button opens image picker.
6. Selected image bytes are held in widget memory and displayed inside the monitor.
7. Exit cup clears selected image bytes and navigates back to Splash.

No login, Firestore write, Storage write, profile read, signal emission, booking, payment, or provider assignment was found in Client Room.

### Accessibility Room Reality

When a user enters via Splash Accessibility Access:

1. Splash calls `Navigator.pushNamed(Routes.accessibilityRoom)`.
2. Router returns `AccessibilityRoomPage`.
3. Accessibility Room selects a background asset based on layout width/orientation.
4. Fixed wall cards navigate to Accessibility child routes.
5. YouTube button opens the Mental Smile YouTube URL externally.
6. Photo button opens image picker and displays selected image bytes inside monitor.
7. Feather button opens a local message dialog; chosen message appears on the notebook.
8. Exit cup clears selected image and selected notebook message and navigates back to Splash.

No Firestore write, Storage write, profile read, signal emission, booking, payment, or provider assignment was found in Accessibility Room.

### Accessibility Child Pages Reality

Accessibility Links and Tools pages:

- use static in-file lists
- open external URLs with `url_launcher`
- do not persist clicks
- do not emit signals in inspected files

Accessibility Suggestions:

- uses local text controllers
- validates tool name and reason are non-empty
- builds WhatsApp URL
- opens WhatsApp externally
- shows success dialog after launch
- does not write Firestore in inspected file

Accessibility Check-In:

- shows five text fields
- opens WhatsApp with a fixed message that does not include answers
- confirms answers were not sent or saved
- provides navigation buttons to specialists, centers, and library

Accessibility Community Tools:

- displays static placeholder copy
- can navigate back to Accessibility Room

Accessibility Message Of The Day:

- displays static message list
- selects random or chosen message
- returns the message via `Navigator.pop(message)`

### Needs-Like Support Reality

The needs-like flow is not entered from Client Room or Accessibility Room in the inspected code.

It is reachable through `/module/special_needs` and support entry cards.

When a user selects a support issue:

1. `SupportIssueSelectorPage` reads the current Firebase user.
2. It creates `support_requests/{requestId}`.
3. It emits `support_started` to `signal_events` through the signal runtime.
4. Signal emission is fail-soft and should not block the initiating user flow if signal persistence fails.
5. Firestore rules for `support_requests` require signed-in user and `createdByUid == uid()`.

## Final Discovery Metrics

Discovery Status: PASS

Inventory Coverage: 92%

Operations Recorded: 1 registry operation with 26 discovery action records in this report

Files Inspected: 24

Routes Discovered: 11

Collections Discovered: 2

Signals Discovered: 5

Assets Discovered: 23 direct Residential room assets

Final Verdict: RESIDENTIAL_DISCOVERY_AND_INVENTORY_COMPLETED

