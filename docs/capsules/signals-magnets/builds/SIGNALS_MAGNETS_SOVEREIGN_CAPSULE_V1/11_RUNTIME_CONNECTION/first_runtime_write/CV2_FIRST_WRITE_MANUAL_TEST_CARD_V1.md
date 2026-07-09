# CV2 First Write Manual Test Card V1

Date: 2026-07-02

## Manual Test Steps

1. Open the app in web mode.
2. Open the browser developer console.
3. Navigate to `/commercial-v2/web`.
4. Press the Library card.
5. Confirm navigation continues to `/web/library`.
6. In the console, look for either:
   - `CV2_FIRST_WRITE_SUCCESS event_id=... collection=archive_signal_events`
   - `CV2_FIRST_WRITE_FAILURE event_id=... collection=archive_signal_events error=...`
7. If success appears, open Firestore and check collection `archive_signal_events`.
8. Confirm the document id equals the `event_id` printed in the console.
9. Confirm the document contains only the approved fields.

## Expected Firestore Result

A new document in:

`archive_signal_events/{event_id}`

with:

- `signal_code = CV2_SIG_OPEN_LIBRARY`
- `archive_destination_code = ARC-SIG-CV2-SHOWCASE-001`
- `magnet_code = CV2-MAG-LIBRARY-INTEREST`
- `guard_status = accepted`

## Failure Interpretation

If the document is not created, the console should now expose the exact Firestore error and stack trace instead of silently swallowing the failure.

