# CV2 Showcase Signal Traffic Card V1

Status: ACTIVE
Runtime effect: none

## Destination Identity

| Field | Value |
| --- | --- |
| Archive Destination Code | `ARC-SIG-CV2-SHOWCASE-001` |
| Human Title | Commercial V2 Showcase Signals |
| Archive Section | `ARC-SEC-CV2` |
| Archive Vault | Commercial V2 Signal Vault |
| AI Memory Destination | `ARC-AIM-RUN-001` |
| Owner | Commercial V2 Owner / Archive Owner |

## Accepted Traffic

| Field | Accepted Values |
| --- | --- |
| Section Code | `SEC-CV2` |
| Outbox Plug | `PLG-CV2-OUT` |
| Signal Families | Showcase navigation signals; Commercial V2 demand signals |
| Signal Codes | `CV2_SIG_OPEN_LIBRARY`, `CV2_SIG_OPEN_SPECIALISTS`, `CV2_SIG_OPEN_CENTERS` |
| Magnet Codes | `CV2-MAG-LIBRARY-INTEREST`, `CV2-MAG-SPECIALISTS-INTEREST`, `CV2-MAG-CENTERS-INTEREST` |
| Privacy Class | `anonymous_navigation_signal` |
| Retention Class | `operational_summary` |

## Generated Outputs

| Output Type | Output |
| --- | --- |
| Summary | Commercial V2 Demand Summary |
| Summary | Monitoring Summary |
| Summary | Owner Summary |
| Dispatch | Monitoring summary dispatch |
| Dispatch | Owner summary dispatch |
| Destination Inbox | `PLG-MON-IN` |
| Destination Inbox | `PLG-OWN-IN` |

## Blocked Targets

This destination does not permit:

- Library direct routes
- Library direct screens
- Library Firestore direct targets
- Publishing direct runtime
- Any direct section-to-section write
- Route/screen/collection used as a package target

## Traffic Sentence

```text
SEC-CV2 sends CV2 showcase navigation signal through PLG-CV2-OUT to Archive destination ARC-SIG-CV2-SHOWCASE-001 by matching CV2 showcase magnet, where Archive may summarize to Monitoring and Owner inboxes.
```

FINAL STATUS: CV2_SHOWCASE_SIGNAL_TRAFFIC_CARD_ACTIVE

