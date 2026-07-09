# Archive Runtime Guard Manual Test Plan V1

Status: READINESS TEST PLAN
Date: 2026-07-02

## Manual Readiness Review

1. Confirm `archive_signal_events` contains the first CV2 signal event.
2. Confirm the event has `guard_status = accepted`.
3. Compare the event against the first signal validation card.
4. Confirm no identity fields exist.
5. Confirm destination and magnet match.
6. Confirm privacy and retention classes exist.
7. Confirm no route, screen, collection, direct Library, or direct Publishing target exists.

## Future Runtime Test

When guard runtime is implemented, submit controlled invalid events for:

- unknown code
- missing destination
- magnet mismatch
- payload mismatch
- privacy missing
- retention missing
- identity leakage
- philosophical noise
- uncoded object

Each must produce the expected output state and alarm mapping.

