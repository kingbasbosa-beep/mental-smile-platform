# Global First Runtime Connection Plan V1

Status: PLAN_CREATED_BLOCKED_BEFORE_LIVE_WRITE
Operation: GLOBAL FIRST RUNTIME CONNECTION FIREBASE / RULES / YAML / FIRST SIGNAL PLAN
Block: RUN-1
Date: 2026-07-01
Runtime effect: none

## Purpose

Create the first safe runtime connection plan for Mental Smile Firebase/Firestore signal testing without changing Flutter, routes, live rules, storage rules, Firebase configuration, or generated localization.

## Certified Sections Reviewed

| Section | Code | Runtime Readiness | Notes |
| --- | --- | --- | --- |
| Residential | SEC-RES | LOCAL_SIGNALS_READY | Local emitter and aggregation point exist, but client-facing surfaces carry higher privacy sensitivity. |
| Library | SEC-LIB | LOCAL_SIGNALS_READY | Local public display signals exist. |
| Commercial V2 | SEC-CV2 | LOCAL_SIGNALS_AND_PACKAGE_BUILDER_READY | Safest first path for anonymous showcase navigation. |
| Administrative / Operations Room | SEC-ADM | GOVERNED_UI_READY | Operational cockpit only; not first runtime signal writer. |
| Archive | SEC-ARC | GOVERNANCE_READY | Must own durable cross-section storage and quarantine. |

## First Recommended Runtime Path

Recommended first controlled signal path:

```text
SEC-CV2
PLG-CV2-OUT
CV2_SIG_OPEN_LIBRARY
CV2-MAG-LIBRARY-INTEREST
ARC-SIG-CV2-SHOWCASE-001
archive_signal_events
```

Reason:

- It is an anonymous showcase navigation signal.
- It already has local emitter and aggregation coverage.
- It already carries `privacyClass` and `retentionClass`.
- It now has a semantically correct Archive Destination: `ARC-SIG-CV2-SHOWCASE-001`.
- It avoids provider identity, client identity, medical content, credentials, free personal text, and route-as-package targeting.
- It can validate the Archive intake shape before package or dispatch traffic is enabled.

## Controlled Write Boundary

This plan does not authorize live writes yet.

Live write becomes eligible only after:

- Firestore rules are implemented from the proposal.
- Owner manually confirms YAML/assets/l10n health.
- Owner manually runs chosen verification commands.
- First write payload is reviewed against the schema.
- Archive Language Guard runtime acceptance/quarantine behavior is implemented or simulated with explicit `guard_status`.

## Final Plan State

Plan created: YES
Runtime changed: NO
Firebase changed: NO
Firestore rules changed: NO
Storage rules changed: NO
Routes changed: NO
Ready for first runtime write: NO
