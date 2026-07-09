# Archive Destination Resolution V1

Status: ACTIVE
Date: 2026-07-02

## Purpose

Destination Resolution confirms that an incoming package is addressed to a known Archive destination and that the destination accepts this type of traffic.

## Resolution Order

1. Read `archive_destination_code`.
2. Confirm destination exists in current Archive destination registry.
3. Confirm source section is accepted.
4. Confirm source outbox plug is accepted.
5. Confirm package family is accepted.
6. Confirm signal family/code is accepted.
7. Confirm magnet matches destination.
8. Confirm privacy and retention classes are allowed.
9. Admit to Archive Inbox.

## Unknown Destination

Unknown Destination means the destination code is missing or not registered. Unknown Destination packages cannot enter Archive Inbox.

## Current First Destination

`ARC-SIG-CV2-SHOWCASE-001` is the first governed showcase signal destination for Commercial V2 Library interest.

