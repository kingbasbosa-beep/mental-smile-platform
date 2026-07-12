# CENTRAL_PLATFORM_CORE_PHASE_4A_LIBRARY_SECTION_ADAPTER

## Purpose

Phase 4A creates the first real section adapter for Central Platform Core:

```text
Library
LibrarySectionAdapter
SectionSocket
SOCKET_03
PlatformCore
FirebaseCoreOutputGateway
core_test_signal_events
```

This is not a migration, replacement, route connection, or public runtime change.

## Why Library First

Library is a stable, already purified section with a clear identity and a small safe surface for a first adapter experiment.

The adapter proves that a real section identity can connect to the core through the socket model without changing the section's existing screens, routes, content, providers, search, or local behavior.

## Adapter

```text
lib/features/library/platform_core/library_section_adapter.dart
```

Identity:

```text
Section ID: MS-SECTION-LIBRARY
Section Code: LIB
Section Name: Library
Default Socket: SOCKET_03
Contract Version: 1
Environment: test
Allowed Families: feedback
Allowed Code Prefixes: lb
```

The adapter contains no UI, route, Firebase collection name, Firestore business logic, content logic, provider display logic, archive logic, navigation, search logic, or startup connection.

## Test Code

One test-only dictionary code was added:

```text
code: lb001bt
eventName: library_test_entry_tap
family: feedback
logicalTarget: feedback
allowedSections: LIB
environment: test
schemaVersion: 1
description: Library adapter test signal.
```

This is not a production signal.

It exists only to test:

```text
Real Library Adapter
Core
Firebase Test Collection
```

## Probe

```text
tool/library_platform_core_adapter_probe.dart
```

Run manually:

```powershell
flutter run -d chrome -t tool/library_platform_core_adapter_probe.dart
```

The probe:

```text
initializes Firebase
checks authentication
creates PlatformCore with FirebaseCoreOutputGateway
creates LibrarySectionAdapter
connects Library to SOCKET_03
emits lb001bt
displays accepted/outputDelivered/reason/signalId
```

Safe context only:

```json
{
  "surface": "library_phase_4a_adapter_probe"
}
```

No content names, user names, specialist data, center data, queries, search terms, article text, credentials, or personal data are sent.

## Firestore

The probe uses the existing test collection:

```text
core_test_signal_events
```

No production collection is created.

Expected document values after a successful manual probe:

```text
code: lb001bt
eventName: library_test_entry_tap
family: feedback
logicalTarget: feedback
sourceSectionId: MS-SECTION-LIBRARY
environment: test
source: central_platform_core_phase_2b
context.surface: library_phase_4a_adapter_probe
```

## Manual Result

```text
Manual Probe Result: PENDING_OWNER_EXECUTION
Signal ID: PENDING_OWNER_EXECUTION
Firestore Document Verification: PENDING_OWNER_EXECUTION
```

## Runtime Boundary

The public Library runtime was not modified.

Not touched:

```text
Library pages
Library buttons
Library routes
Library navigation
Library provider display
Library knowledge cards
Library content Firestore data
Library specialist display
Library center display
Library search
Existing local Library behavior
main.dart
app.dart
router
storage.rules
firebase.json
GitHub Pages
```

## Next Step

The next step is not a full migration.

Next options:

```text
select the first optional real Library button
connect Residential or Commercial adapter later
```
