# CV2 First Write Console Output Guide V1

Date: 2026-07-02

## Success Output

Expected success marker:

```text
CV2_FIRST_WRITE_SUCCESS event_id=cv2_open_library_... collection=archive_signal_events
```

Use the printed `event_id` as the Firestore document id.

## Failure Output

Expected failure marker:

```text
CV2_FIRST_WRITE_FAILURE event_id=cv2_open_library_... collection=archive_signal_events error=...
```

The stack trace is printed immediately after the failure marker.

## Navigation Behavior

Console failure does not block navigation. The app should still navigate to:

`/web/library`

## What To Report If Failure Appears

Copy the failure marker and the first stack trace block. The most useful fields are:

- `event_id`
- `collection`
- Firestore error code/message
- first stack frame

