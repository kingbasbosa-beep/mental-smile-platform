# Commercial V2 Runtime Connection Matrix V1

Date: 2026-07-02
Mode: Investigation only

## Commercial V2 Signals

| Active Screen | Trigger | Signal Emitted | Aggregation Point | Archive Destination | Magnet | Package Family | Destination Code |
|---|---|---|---|---|---|---|---|
| `CommercialV2WebShowcasePage` | Library showcase card | `CV2_SIG_OPEN_LIBRARY` | `Commercial V2 Local Aggregation` via `CommercialV2AggregationPoint.collect` | `ARC-SIG-CV2-SHOWCASE-001` write attempted to `archive_signal_events` | `CV2-MAG-LIBRARY-INTEREST` | `signal_event` for Firestore writer | `ARC-SIG-CV2-SHOWCASE-001` |
| `CommercialV2WebShowcasePage` | Specialists showcase card | `CV2_SIG_OPEN_SPECIALISTS` | `Commercial V2 Local Aggregation` | registry destination text: Commercial V2 Specialists Showcase Interest; no Firestore writer branch observed | `CV2-MAG-SPECIALISTS-INTEREST` | local signal only in current writer | none active |
| `CommercialV2WebShowcasePage` | Centers showcase card | `CV2_SIG_OPEN_CENTERS` | `Commercial V2 Local Aggregation` | registry destination text: Commercial V2 Centers Showcase Interest; no Firestore writer branch observed | `CV2-MAG-CENTERS-INTEREST` | local signal only in current writer | none active |

## Future / Registry Signals

| Signal | Family | Magnet | Aggregation | Runtime Status |
|---|---|---|---|---|
| `CV2_SIG_BACK` | navigation control | `CV2-MAG-NAVIGATION` | local aggregation | registered, no active CV2 back button found in showcase page |
| `CV2_SIG_REGISTRATION_PACKAGE_READY` | registration package | `CV2-MAG-REGISTRATION-PACKAGE` | Commercial V2 Outbox Aggregation | registered for future package flow |
| `CV2_SIG_PROFILE_GENERATION_READY` | profile generation | `CV2-MAG-GENERATION-PACKAGE` | Commercial V2 Outbox Aggregation | registered for future package flow |
| `CV2_SIG_PUBLISHING_PACKAGE_READY` | publishing package | `CV2-MAG-PUBLISHING-PACKAGE` | Commercial V2 Outbox Aggregation | registered for future package flow |

## Plug / Archive Interface Evidence

- Source section: `SEC-CV2`
- Inbox plug: `PLG-CV2-IN`
- Outbox plug: `PLG-CV2-OUT`
- Archive section: `SEC-ARC`
- Archive inbox plug: `PLG-ARC-IN`
- First write collection: `archive_signal_events`
- Writer only attempts Firestore for `CV2_SIG_OPEN_LIBRARY`.

