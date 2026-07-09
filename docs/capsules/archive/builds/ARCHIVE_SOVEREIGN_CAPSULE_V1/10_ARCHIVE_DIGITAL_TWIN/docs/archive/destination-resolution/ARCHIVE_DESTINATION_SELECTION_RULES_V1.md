# Archive Destination Selection Rules V1

Status: ACTIVE
Date: 2026-07-02

## Primary Destination

The Primary Destination is the registered Archive destination explicitly addressed by `archive_destination_code`.

## Secondary Destination

The Secondary Destination is a future optional destination for derived summaries, dispatches, or parallel storage after the primary destination accepts the package.

## Future Multi-Destination

Future Multi-Destination means one accepted package may feed multiple governed destinations only after primary resolution succeeds and a multi-destination rule exists.

## Selection Requirements

Destination selection requires:

- active destination code
- accepted source section
- accepted source outbox plug
- accepted signal family/code
- accepted magnet
- accepted package family
- allowed privacy class
- allowed retention class

## Current First Signal Example

`CV2_SIG_OPEN_LIBRARY` resolves to `ARC-SIG-CV2-SHOWCASE-001` because the destination is registered for Commercial V2 showcase navigation signals, matching `CV2-MAG-LIBRARY-INTEREST`.

