# Beta Platform Runtime Capsule V1

Capsule ID: MS-BETA-PLATFORM-RUNTIME-CAPSULE-V1

Repository: mental-smile-platform

Workspace: C:\mental_smile_workspace\app\mental-smile-platform

Branch: residential-assets-purification-v1

Status: MATERIALIZED_PENDING_OWNER_VALIDATION

## Runtime Sections

Public runtime sections included:

- Residential
- Commercial
- Library
- Landing
- Central Platform Core

Runtime sections excluded:

- Administrative
- Owner
- Archive
- Monitoring
- Marketing

## Mobile Card Binding

Final binding:

- Mobile Normal Client -> Normal Client Desktop card set
- Mobile Distinguished/Accessibility Client -> Distinguished/Accessibility Desktop card set

Implementation evidence:

- `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_friend_client_room_page.dart`
  - `normalClientDesktopCardTitles`
- `lib/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart`
  - `distinguishedAccessibilityDesktopCardTitles`

No route, layout, asset, color, spacing, or background change was made.

## Central Platform Core

Core components:

- PlatformCore
- Platform Language
- Platform Dictionary
- Socket Registry
- Section Registry
- Adapter Registry
- Residential Adapter
- Commercial Adapter
- Library Adapter
- Runtime Signal Bridges
- Production Firebase Core Output Gateway
- Client Local Session Store

Socket assignment:

- SOCKET_01 -> Residential
- SOCKET_02 -> Commercial
- SOCKET_03 -> Library
- SOCKET_04 through SOCKET_10 -> Reserved

## Signal Destinations

Production signal destinations:

- login -> `core_login_signals`
- logout -> `core_logout_signals`
- survey -> `core_survey_signals`
- feedback -> `core_feedback_signals`
- application -> `core_application_signals`

Runtime production codes:

- `cl012sb`
- `cl014sb`
- `cl016bt`
- `sp010bt`
- `sp014sb`
- `ct010bt`
- `ct014sb`

Probe and test-only codes remain outside public runtime routing.

## Client Local Session

Temporary client data remains local only:

- image reference/path
- selected note
- temporary preferences
- session flags

Forbidden in signals and Firestore signal documents:

- password
- passwordHash
- confirmPassword
- authToken
- refreshToken
- email
- phone
- UID/userId
- note body
- image bytes
- survey text
- suggestion text
- complaint text

Clear-on-exit/logout coverage:

- Normal client room
- Accessibility client room
- Generation 2 mobile client room

## Authentication Boundary

Firebase Authentication remains the only password authority.

Commercial specialist and center flows pass passwords only to Firebase Auth operations. Profile/business Firestore writes persist provider and center data, not passwords or auth tokens.

## Build and Run Commands

Manual validation commands:

```powershell
dart format lib test tool
flutter gen-l10n
flutter analyze
flutter test
flutter build web --release --base-href /mental-smile-platform/
```

Production probe command:

```powershell
flutter run -d chrome -t tool/platform_core_production_probe.dart
```

## Validation Results

Owner validation pending for this capsule:

- format: PENDING_OWNER_MANUAL_VALIDATION
- gen-l10n: PENDING_OWNER_MANUAL_VALIDATION
- analyze: PENDING_OWNER_MANUAL_VALIDATION
- tests: PENDING_OWNER_MANUAL_VALIDATION
- web build: PENDING_OWNER_MANUAL_VALIDATION
- production probe: PENDING_OWNER_MANUAL_VALIDATION

Final state target:

- buildable: true after owner validation
- runnable: true after owner validation
- validated: true after owner validation
