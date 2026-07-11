# CENTRAL_PLATFORM_CORE_PHASE_2B_FIREBASE_TEST_GATEWAY

## Purpose

Phase 2B adds the first Firebase test output gateway for Central Platform Core. It proves that an accepted test envelope can be converted into a Firestore-safe document shape without connecting any real public section.

## Test Collection

The only collection introduced in this phase is:

```text
core_test_signal_events
```

This collection is test-only and exists to validate the Central Platform Core code language and gateway behavior.

No production collections are created.

## Document Shape

Each test document contains exactly:

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

Required fixed values:

```text
environment: test
source: central_platform_core_phase_2b
schemaVersion: 1
```

`createdAt` is written by the Firebase gateway using `FieldValue.serverTimestamp()`. The local envelope `createdAt` remains available for local tests but is not used as the Firestore document timestamp.

The document ID is the envelope `signalId`.

## Firebase Gateway

`FirebaseCoreOutputGateway` implements `CoreOutputGateway`.

It:

- accepts only `CoreSignalEnvelope`
- rejects non-test envelopes
- validates safe context before write
- converts the envelope into a Firestore-safe map
- writes to `core_test_signal_events`
- uses `signalId` as the document ID
- never becomes the default gateway

`PlatformCore` still defaults to `NoopCoreOutputGateway`.

## Firestore Rules

The rule for `core_test_signal_events` is intentionally narrow:

- read is denied
- update is denied
- delete is denied
- create requires authentication
- create allows only the approved keys
- `environment` must equal `test`
- `source` must equal `central_platform_core_phase_2b`
- `schemaVersion` must equal `1`
- `createdAt` must equal `request.time`
- `context` must be a map

There is no public read surface, dashboard, route, or UI for this collection.

## accepted vs outputDelivered

Phase 2B separates core acceptance from gateway delivery:

```text
accepted: true
outputDelivered: true
reason: accepted
```

means the core accepted the signal and the gateway delivered it.

```text
accepted: true
outputDelivered: false
reason: gatewayFailure
```

means the core accepted the signal but the output gateway failed or rejected delivery.

Rejected signals before the gateway remain:

```text
accepted: false
outputDelivered: false
```

## Test Isolation

Unit tests use a fake `CoreFirestoreWriter`. They do not write to real Firebase, Firestore, emulator, or production services.

The gateway is injected explicitly only in tests or future approved harnesses.

## Runtime Boundary

No real public section is connected.

The following remain untouched:

```text
Residential
Commercial
Library
Routes
Startup
UI
Authentication
Storage
```

## Next Step

Next:

```text
Manual Firebase test write or review before first real optional signal.
```

No automatic Firebase write is performed by this phase.

