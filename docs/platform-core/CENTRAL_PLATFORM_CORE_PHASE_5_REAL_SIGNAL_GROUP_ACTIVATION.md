# CENTRAL_PLATFORM_CORE_PHASE_5_REAL_SIGNAL_GROUP_ACTIVATION

## Scope

Phase 5 activates real approved runtime signal groups through Central Platform Core for the current operational sections:

```text
Residential
Commercial
Library
```

The runtime signal destination remains test-only:

```text
collection: core_test_signal_events
environment: test
source: central_platform_core_phase_2b
```

No production signal collection was created.

## Signal Families

The only approved families in this phase are:

```text
login
logout
survey
feedback
application
```

No navigation, analytics, content, search, profile, monitoring, archive, marketing, admin, or owner families were added.

## Runtime Bridge

```text
lib/core/platform_core/bridge/platform_core_signal_bridge.dart
```

The bridge:

```text
uses the section adapter
connects the correct socket once
emits through PlatformCore
uses FirebaseCoreOutputGateway explicitly
fails soft
blocks unapproved context keys
does not make Firebase the default PlatformCore gateway
```

Allowed context keys:

```text
surface
actionType
actorType
formType
status
submissionStatus
```

Blocked context examples:

```text
email
phone
uid
password
token
note
text
message
content
answers
image
file
device
session
profile data
```

## Approved Codes

Residential:

```text
cl012sb -> client_checkin_submit
cl014sb -> client_suggestion_submit
```

Commercial:

```text
sp010bt -> specialist_login_submit
sp014sb -> specialist_application_submit_real
ct010bt -> center_login_submit
ct014sb -> center_application_submit_real
```

Library:

```text
No approved real runtime signal call site in the five-family scope.
```

The Library adapter remains connected and valid, but no Library runtime button was invented in this phase.

## Connected Call Sites

Residential:

```text
Accessibility Check-in submit -> cl012sb
Accessibility Suggestions submit -> cl014sb
```

These are connected through the existing Residential signal emitter and do not send form text, answers, links, notes, or personal data.

Commercial:

```text
Specialist login success -> sp010bt
Center login success -> ct010bt
Specialist registration/application success -> sp014sb
Center registration/application success -> ct014sb
```

These are emitted only after the existing Firebase/Auth/Profile operation succeeds.

Library:

```text
No Library feedback/suggestion submit call site exists in the approved five-family scope.
Content opening, search, filter, card opening, and provider navigation were not connected.
```

## Business Data Separation

Business data writers were preserved:

```text
Commercial account/profile writes
Residential WhatsApp check-in/suggestion flow
Library content and navigation behavior
```

The signal records only event occurrence metadata. It does not carry profile fields, application form data, feedback text, suggestion text, search terms, or content data.

## Legacy Signal Paths

Residential check-in and suggestion events that are now approved Core signals no longer continue through the old local/archive signal path.

Other existing Residential and Library tracking calls remain untouched where they are outside the approved five-family runtime signal scope.

No business data writer was removed.

## Dictionary Size

```text
PlatformDictionaryV1 definitions: 19
PlatformDictionaryV1 maxCodeCount: 30
```

The limit remains bounded and was increased to support real runtime signal groups while keeping adapter probe codes temporarily available.

## Manual Probe

```text
tool/platform_real_signal_group_probe.dart
```

Run:

```powershell
flutter run -d chrome -t tool/platform_real_signal_group_probe.dart
```

The tool sends one signal per manual button press and does not store credentials.

Manual probe result:

```text
PENDING_OWNER_EXECUTION
```

Firestore signal IDs:

```text
PENDING_OWNER_EXECUTION
```

## Verification Status

```text
Format: PENDING_OWNER_EXECUTION
Analyze: PENDING_OWNER_EXECUTION
Tests: PENDING_OWNER_EXECUTION
Manual Probe: PENDING_OWNER_EXECUTION
Real Runtime Verification: PENDING_OWNER_EXECUTION
```

## Guarantees

```text
CLIENT PERSONAL DATA:
NOT SENT

PROVIDER PROFILE DATA:
NOT SENT

BUSINESS DATA:
UNCHANGED

PRODUCTION SIGNAL COLLECTION:
NOT CREATED

PUBLIC FUNCTIONAL BEHAVIOR:
PRESERVED
```

## Next

```text
Production Signal Collections and Core Runtime Finalization
Client Local Session Store
Final Legacy Signal Cleanup
```
