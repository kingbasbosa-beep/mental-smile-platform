# RESIDENTIAL_ARCHIVE_DESTINATION_CARD_V1

Status: ACTIVE

## Destination

| Field | Value |
|---|---|
| Archive Destination Code | `ARC-SIG-RES-TOOLS-001` |
| Human Title | Residential Tool Signals |
| Archive Section | `ARC-SEC-RES` |
| Source Section | `SEC-RES` |
| Source Outbox Plug | `PLG-RES-OUT` |
| Destination Section | `SEC-ARC` |
| Destination Inbox Plug | `PLG-ARC-IN` |
| Accepted Package Family | `signal_event` |
| Accepted Signal Family | Tool Usage |
| Magnet Code | `RES-MAG-TOOLS` |
| Privacy Class | `anonymous_navigation_signal` |
| Retention Class | `operational_summary` |
| Owner | Residential Owner / Archive Owner |

## Blocked Paths

- Direct Library writes.
- Direct Commercial V2 writes.
- Direct Administrative writes.
- Direct section-to-section writes.
- Storage writes.
- Identity-bearing packages.

## Final Status

RESIDENTIAL_ARCHIVE_DESTINATION_CARD_CREATED
