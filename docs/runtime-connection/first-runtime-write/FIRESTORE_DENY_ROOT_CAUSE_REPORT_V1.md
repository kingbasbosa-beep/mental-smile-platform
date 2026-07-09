# Firestore Deny Root Cause Report V1

Operation: FIRESTORE_DENY_ROOT_CAUSE_FIX
Date: 2026-07-02

## Current Evidence

- Firestore Rules Usage shows DENIES.
- `archive_signal_events` is not created.
- CV2 Library navigation works.
- Local writer targets `archive_signal_events`.
- Local `firestore.rules` contains a narrow `archive_signal_events/{eventId}` create rule.

## Local Payload / Rule Comparison

| Check | Result |
|---|---|
| Collection name is `archive_signal_events` | MATCH |
| Document id equals `event_id` | MATCH |
| Field names are snake_case | MATCH |
| Allowed top-level keys only | MATCH |
| `payload_minimal` keys only | MATCH |
| `quarantine_reason` exactly `NONE` | MATCH |
| `created_at` uses server timestamp | MATCH |
| Rules allow `created_at is timestamp` | MATCH |
| Rule requires `created_at == request.time` | NO |
| Identity fields absent | MATCH |
| Direct Library target absent | MATCH |
| Direct Publishing target absent | MATCH |

## Deny Cause

No local payload/rule mismatch was found.

The most precise root cause supported by the current evidence is that the Firestore rules deployed to Firebase do not match the local aligned `firestore.rules` file, or the local rules were edited but not deployed.

## Required Fix

Deploy the local Firestore rules:

```text
firebase deploy --only firestore:rules
```

## Runtime Visibility Fix

The writer now logs the exact payload before write:

```text
CV2_FIRST_WRITE_PAYLOAD event_id=... payload=...
```

This makes any remaining mismatch visible in the browser console before Firestore evaluates the write.

## Final Verdict

FIRESTORE_DENY_REQUIRES_RULE_DEPLOY

