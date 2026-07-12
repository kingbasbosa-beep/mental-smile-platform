# CENTRAL_PLATFORM_CORE_PHASE_4B_COMPLETE_THREE_SECTION_ADAPTER_LAYER

## Purpose

Phase 4B completes the optional parallel adapter layer for the three operational public sections:

```text
Residential
Commercial
Library
```

This phase connects section identity, socket ownership, platform language compatibility, and test signal delivery without connecting any real button, route, screen, or startup flow.

## Sections

```text
SOCKET_01 -> Residential -> MS-SECTION-RESIDENTIAL -> RES
SOCKET_02 -> Commercial  -> MS-SECTION-COMMERCIAL  -> COM
SOCKET_03 -> Library     -> MS-SECTION-LIBRARY     -> LIB
SOCKET_04-10 -> Reserved
```

## Adapters

Residential:

```text
Path: lib/features/residential/platform_core/residential_section_adapter.dart
Section ID: MS-SECTION-RESIDENTIAL
Section Code: RES
Socket: SOCKET_01
Environment: test
Allowed Families: login, logout, survey, feedback
Allowed Prefixes: cl
Test Code: cl006bt
```

Commercial:

```text
Path: lib/features/commercial/platform_core/commercial_section_adapter.dart
Section ID: MS-SECTION-COMMERCIAL
Section Code: COM
Socket: SOCKET_02
Environment: test
Allowed Families: login, logout, survey, feedback, application
Allowed Prefixes: sp, ct, cm
Test Code: cm001bt
```

Library:

```text
Path: lib/features/library/platform_core/library_section_adapter.dart
Section ID: MS-SECTION-LIBRARY
Section Code: LIB
Socket: SOCKET_03
Environment: test
Allowed Families: feedback
Allowed Prefixes: lb
Test Code: lb001bt
```

## Adapter Registry

```text
lib/core/platform_core/registry/platform_adapter_registry.dart
```

The registry:

```text
registers adapters
looks up by Section ID
looks up by Section Code
prevents duplicate section IDs
prevents duplicate section codes
prevents duplicate socket claims
validates declared socket ownership
creates SectionSocket lists for tests and probes
```

It is not imported by `main.dart`, app startup, routes, or any section page.

## Platform Dictionary

The dictionary now contains 13 codes with a maximum of 15.

The increase exists only for three real section adapter verification codes:

```text
cl006bt -> client_residential_adapter_test_tap
cm001bt -> commercial_adapter_test_tap
lb001bt -> library_test_entry_tap
```

All three are test environment only.

## Platform Language

Platform Language now includes:

```text
Section Codes: RES, COM, LIB
Socket Codes: SOCKET_01 through SOCKET_10
Adapter Test Prefixes: cl, cm, lb
Signal Families: login, logout, survey, feedback, application
Environments: test, production
Contract Version: 1
```

It does not include Owner, Admin, Archive, Marketing, or Monitoring section codes.

## Simultaneous Connection

The core can receive all three adapters together:

```text
Residential -> SOCKET_01
Commercial  -> SOCKET_02
Library     -> SOCKET_03
```

Expected state:

```text
3 connected sections
3 occupied sockets
7 reserved sockets
0 collisions
```

Disconnecting and reconnecting one adapter does not affect the other connected adapters.

## Probe

Unified probe:

```text
tool/platform_three_section_adapter_probe.dart
```

Run manually:

```powershell
flutter run -d chrome -t tool/platform_three_section_adapter_probe.dart
```

Each section has its own button:

```text
Send Residential Test Signal
Send Commercial Test Signal
Send Library Test Signal
```

There is no automatic send on startup. Each click sends one signal only and prevents double tap while sending.

Contexts:

```json
{ "surface": "residential_adapter_probe" }
{ "surface": "commercial_adapter_probe" }
{ "surface": "library_adapter_probe" }
```

No personal data, content data, search term, provider data, center data, or credentials are sent.

## Firestore

The adapter layer uses only the existing test collection:

```text
core_test_signal_events
```

Expected source:

```text
central_platform_core_phase_2b
```

No production collection is introduced.

## Manual Probe Results

```text
Residential Result: PENDING_OWNER_EXECUTION
Residential Signal ID: PENDING_OWNER_EXECUTION

Commercial Result: PENDING_OWNER_EXECUTION
Commercial Signal ID: PENDING_OWNER_EXECUTION

Library Result: PENDING_OWNER_EXECUTION
Library Signal ID: PENDING_OWNER_EXECUTION

Firestore Verification: PENDING_OWNER_EXECUTION
```

## Tests

Automated tests cover:

```text
Residential adapter identity and signal acceptance
Commercial adapter identity and signal acceptance
Library adapter compatibility
three-adapter registry registration
duplicate and wrong socket rejection
simultaneous three-section connection
disconnect and reconnect behavior
fake Firebase writer document shape
wrong section rejection before writer
unknown code rejection before writer
gateway failure fail-soft behavior
dictionary and platform language consistency
forbidden internal section exclusion
```

Unit tests use fake writers only and never access real Firebase.

## Runtime Impact

```text
PUBLIC RUNTIME IMPACT:
NONE
```

No runtime page, screen, widget, route, startup file, Firebase configuration, Storage rule, or GitHub Pages setting was changed.

## Existing Probe Tools

The older tools remain available as historical test tools:

```text
tool/platform_core_phase_2c_probe.dart
tool/library_platform_core_adapter_probe.dart
```

They are not used by runtime and are not removed in this phase.

## Next Step

Next:

```text
CONNECT THE FIRST REAL SIGNAL GROUPS TO THE CORE
IN ONE CONTROLLED LARGE BLOCK
```
