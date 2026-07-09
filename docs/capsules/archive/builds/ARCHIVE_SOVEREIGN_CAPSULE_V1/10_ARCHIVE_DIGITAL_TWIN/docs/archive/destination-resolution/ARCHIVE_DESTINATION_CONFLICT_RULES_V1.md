# Archive Destination Conflict Rules V1

Status: ACTIVE
Date: 2026-07-02

## Conflict Examples

| Conflict | Example | Resolution |
|---|---|---|
| Two destinations | Package claims two primary destination codes. | Reject until exactly one primary destination is selected. |
| Wrong destination | CV2 showcase signal targets accessibility/audio destination. | Reject or quarantine as destination mismatch. |
| Retired destination | Destination code exists historically but is retired. | Reject and request active destination. |
| Unknown destination | Destination code is not in registry. | Reject as Unknown Destination. |
| Quarantine destination | Package is invalid and must go to `ARC-ERR-LANG-001`. | Quarantine, not normal Archive Inbox. |
| Magnet conflict | Magnet does not match destination purpose. | Quarantine for correction. |
| Privacy conflict | Destination accepts signal but privacy class is missing or incompatible. | Reject until corrected. |
| Retention conflict | Destination accepts signal but retention class is missing or incompatible. | Reject until corrected. |

## Conflict Rule

When conflict exists, Archive must not silently choose a destination. It must reject, quarantine, or request Owner review.

