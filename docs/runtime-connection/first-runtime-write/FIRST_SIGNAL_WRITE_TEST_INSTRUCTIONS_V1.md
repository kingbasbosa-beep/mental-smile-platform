# First Signal Write Test Instructions V1

Status: READY_FOR_OWNER_MANUAL_TEST
Runtime effect: first controlled Archive signal write enabled

## Manual Test

Owner manual test steps:

1. Run the app with Firebase configured.
2. Open the Commercial V2 web showcase.
3. Tap the Library showcase card.
4. Confirm navigation continues to the existing Library showcase destination.
5. Open the browser console.
6. Confirm the pre-write payload appears:

```text
CV2_FIRST_WRITE_PAYLOAD event_id=...
```

7. Confirm either success or failure appears:

```text
CV2_FIRST_WRITE_SUCCESS event_id=... collection=archive_signal_events
```

or:

```text
CV2_FIRST_WRITE_FAILURE event_id=... collection=archive_signal_events error=...
```

8. If success appears, open Firestore.
9. Check collection `archive_signal_events`.
10. Confirm exactly one new document exists for the tap.
11. Confirm the document id equals `event_id`.
12. Confirm no document was written to any Library collection.
13. Confirm no direct section-to-section write occurred.

## Rules Deployment Check

If the console shows a Firestore permission-denied error while the local `firestore.rules` file contains the `archive_signal_events/{eventId}` create rule, deploy the local rules:

```text
firebase deploy --only firestore:rules
```

## Expected Firestore Result

Collection:

```text
archive_signal_events
```

Expected document fields:

- `event_id`
- `source_section_code`
- `source_outbox_plug`
- `destination_section_code`
- `destination_inbox_plug`
- `archive_destination_code`
- `package_family`
- `signal_code`
- `magnet_code`
- `privacy_class`
- `retention_class`
- `payload_minimal`
- `created_at`
- `guard_status`
- `quarantine_reason`
- `trace_id`

Expected values:

- `source_section_code = SEC-CV2`
- `source_outbox_plug = PLG-CV2-OUT`
- `destination_section_code = SEC-ARC`
- `destination_inbox_plug = PLG-ARC-IN`
- `archive_destination_code = ARC-SIG-CV2-SHOWCASE-001`
- `package_family = signal_event`
- `signal_code = CV2_SIG_OPEN_LIBRARY`
- `magnet_code = CV2-MAG-LIBRARY-INTEREST`
- `privacy_class = anonymous_navigation_signal`
- `retention_class = operational_summary`
- `guard_status = accepted`
- `quarantine_reason = NONE`

## Fields That Must Be Absent

- `uid`
- `email`
- `phone`
- IP address
- diagnosis
- free personal text
- credentials
- secret tokens
- route target
- screen target
- direct Library target
- direct Publishing target

## Fail-Safe Test

If Firestore is unavailable, misconfigured, offline, or denied by rules:

- Navigation must continue.
- The app must not block the tap.
- No fallback write to Library, Publishing, Residential, Administrative, routes, or Storage may occur.

FINAL STATUS: FIRST_SIGNAL_WRITE_TEST_INSTRUCTIONS_READY
