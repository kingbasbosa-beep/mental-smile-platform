# Master Archive Destination Resolution Guide V1

Status: ACTIVE
Operation: RUN-5 Archive Destination Resolution Foundation
Date: 2026-07-02

## Purpose

Archive Destination Resolution defines how Archive constitutionally decides where every accepted package belongs after validation and before future aggregation.

This is routing doctrine only. It does not implement runtime routing, Firestore collections, rules, signals, analytics, summaries, dashboards, or aggregation.

## Constitutional Flow

```text
Signal
  -> Validation
  -> Accepted
  -> Destination Resolution
  -> Archive Inbox
  -> Archive Destination
  -> Future Aggregation
```

## Defined Destination States

- Primary Destination
- Secondary Destination
- Rejected Destination
- Quarantine Destination
- Unknown Destination
- Missing Destination
- Fallback Destination
- Future Multi-Destination

## Resolution Order

1. Destination Code
2. Signal Family
3. Magnet
4. Package Family
5. Privacy
6. Retention
7. Archive Destination

