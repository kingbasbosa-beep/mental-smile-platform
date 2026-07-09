# Archive Signal Rejection Rules V1

Status: ACTIVE
Date: 2026-07-02

## Rejection Conditions

Reject or quarantine when any of the following occur:

- Unknown code
- Missing approved code
- Failed Code Gate
- Failed Archive Language Guard
- Invalid package shape
- Unknown destination
- Destination does not accept the source/signal/package/magnet
- Missing privacy class
- Missing retention class
- Forbidden identity fields
- Direct memory target
- Direct section-to-section target
- Route, screen, or collection used as package target
- Archive Inbox bypass attempt

## Rejected Package

A Rejected Package is an object that fails validation and does not enter Archive Inbox.

## Quarantine Package

A Quarantine Package is a rejected or suspicious object that must be retained for Owner review with failure reason, source, attempted destination, and suggested correction when possible.

