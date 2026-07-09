# Global First Archive Intake Plan V1

Status: ARCHIVE_INTAKE_PLAN_READY
Runtime effect: none

## Intake Route

```text
SEC-CV2 -> PLG-CV2-OUT -> SEC-ARC -> PLG-ARC-IN -> DST-ARC-INBOX
```

## Intake Responsibilities

| Stage | Responsibility |
| --- | --- |
| Source section | Emit only known signal code and safe minimal payload. |
| Source outbox | Address Archive, not another section. |
| Archive inbox | Receive proposed object into Archive-owned collection. |
| Language Guard | Validate grammar, namespace, plugs, magnet, destination, privacy, retention, and owner metadata. |
| Quarantine | Hold invalid objects with alarm and review status. |
| Summary/Dispatch | Deferred until first write and guard behavior are proven. |

## Accepted First Object Type

First accepted object type:

```text
SIGNAL_EVENT_ONLY
```

Not accepted in first write:

- provider registration package
- provider profile generation package
- publishing package
- summary event
- dispatch package
- section inbox delivery

## Guard Status Flow

```text
PENDING_GUARD -> ACCEPTED
PENDING_GUARD -> QUARANTINED
```

## Archive Intake Readiness

Archive intake documentation ready: YES
Archive intake runtime implemented in this operation: NO
Live intake ready now: NO

