# CENTRAL_PLATFORM_CORE_PHASE_2C_FIRST_FIREBASE_PROBE

## Purpose

Phase 2C adds a standalone manual probe for sending the first real Central Platform Core test signal to Firestore.

The probe is not a route, is not imported by `main.dart`, and is not part of the public runtime.

## Tool

```text
tool/platform_core_phase_2c_probe.dart
```

Run it manually:

```powershell
flutter run -d chrome -t tool/platform_core_phase_2c_probe.dart
```

## Signal Path

```text
Fake Section
SectionSocket
DockRegistry
PlatformCore
cl001bt
PlatformDictionaryV1
CoreSignalResolver
CoreSignalEnvelope
FirebaseCoreOutputGateway
core_test_signal_events
```

## Firebase Collection

```text
core_test_signal_events
```

Expected document path:

```text
core_test_signal_events/{signalId}
```

## Test Code

```text
code: cl001bt
eventName: client_login_entry_tap
family: login
logicalTarget: login
```

## Fake Section

```text
sectionId: test_residential
sectionCode: RES_TEST
environment: test
```

This is a fake section. No real Residential, Commercial, or Library section is connected.

## Context

The probe sends only:

```json
{
  "surface": "phase_2c_manual_probe"
}
```

No email, UID, phone, password, token, device data, client data, specialist data, center data, or private profile data is sent.

## Authentication

Firestore rules require an authenticated user.

If a Firebase session already exists, the probe uses it. If no user is signed in, the probe exposes manual Email and Password fields only inside the standalone tool.

Credentials are not stored by the probe and must not be recorded in documentation.

## Expected Result

Successful delivery:

```text
accepted: true
outputDelivered: true
reason: accepted
signalId: <generated signal ID>
```

Gateway failure after core acceptance:

```text
accepted: true
outputDelivered: false
reason: gatewayFailure
```

Pre-gateway rejection:

```text
accepted: false
outputDelivered: false
reason: <rejection reason>
```

## Firestore Document Verification

After a successful manual send, verify in Firebase Console that:

```text
core_test_signal_events/{signalId}
```

contains exactly the approved document shape:

```text
signalId
code
family
eventName
logicalTarget
sourceSectionId
environment
schemaVersion
createdAt
context
source
```

Expected fixed values:

```text
code: cl001bt
family: login
eventName: client_login_entry_tap
logicalTarget: login
environment: test
source: central_platform_core_phase_2b
context.surface: phase_2c_manual_probe
```

## Rules Deployment

Only Firestore rules may be deployed for this phase:

```powershell
firebase deploy --only firestore:rules
```

No hosting, storage, functions, database, app distribution, GitHub Pages, or full Firebase deployment is allowed.

## Manual Execution Record

```text
Firebase Project ID: PENDING_OWNER_VERIFICATION
Rules Deployment: PENDING_OWNER_VERIFICATION
Authentication Status: PENDING_OWNER_VERIFICATION
Signal ID: PENDING_MANUAL_PROBE
Firestore Document Verification: PENDING_MANUAL_PROBE
```

## Runtime Boundary

Touched:

```text
tool/platform_core_phase_2c_probe.dart
test/core/platform_core/platform_core_phase_2c_probe_test.dart
docs/platform-core/CENTRAL_PLATFORM_CORE_PHASE_2C_FIRST_FIREBASE_PROBE.md
```

Not touched:

```text
main.dart
app.dart
routes
router
Residential
Commercial
Library
Storage
Firebase providers
GitHub Pages
Public runtime
```
