# Firestore First Write Rule Alignment Fix V1

Date: 2026-07-02

## Rules Changed

NO

## Why Rules Were Not Changed

The local rule already permits only the exact first controlled write:

- collection: `archive_signal_events`
- create only
- update/delete denied
- reads restricted to Owner or Monitoring Operator
- `source_section_code = SEC-CV2`
- `source_outbox_plug = PLG-CV2-OUT`
- `signal_code = CV2_SIG_OPEN_LIBRARY`
- `archive_destination_code = ARC-SIG-CV2-SHOWCASE-001`
- `magnet_code = CV2-MAG-LIBRARY-INTEREST`
- identity fields absent by exact `hasOnly`

## Writer Changed

YES

The writer now prints the exact payload map before attempting the write.

## Deploy Required

YES, if the Firebase console still shows permission-denied while local rules contain the aligned rule.

Exact deploy command:

```text
firebase deploy --only firestore:rules
```

## Safety

| Check | Result |
|---|---|
| Broad writes opened | NO |
| Identity fields still blocked | YES |
| Update/delete denied | YES |
| Reads restricted | YES |
| Only SEC-CV2 first write allowed | YES |

