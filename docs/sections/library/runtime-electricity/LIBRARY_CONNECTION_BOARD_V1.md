# LIBRARY_CONNECTION_BOARD_V1

Status: ACTIVE

| UI Action | Route / Screen | UI Card | Signal Code | Runtime Emitter | Aggregation Point | Archive Magnet | Future Collection |
|---|---|---|---|---|---|---|---|
| Open Library Home | `/library`, `/web/library` | Library Home Card | L.S.001.VIEW | `LibrarySignalEmitter` | `LibraryAggregationPoint` | LB10 | `library_signal_events` |
| Open Category | Library Home | Main Category Card | L.C.001.OPEN | `LibrarySignalEmitter` | `LibraryAggregationPoint` | LB20 | `library_signal_events` |
| Carousel Next | Library Home | Carousel Controls | L.B.001.TAP | `LibrarySignalEmitter` | `LibraryAggregationPoint` | LB100 | `library_signal_events` |
| Carousel Previous | Library Home | Carousel Controls | L.B.002.TAP | `LibrarySignalEmitter` | `LibraryAggregationPoint` | LB100 | `library_signal_events` |
| Open Specialists Branch | `/library/providers/specialists` | Provider Content Card | L.C.003.OPEN | `LibrarySignalEmitter` | `LibraryAggregationPoint` | LB30 | `library_signal_events` |
| Open Centers Branch | `/library/providers/centers` | Provider Content Card | L.C.004.OPEN | `LibrarySignalEmitter` | `LibraryAggregationPoint` | LB30 | `library_signal_events` |
| Open Provider Category | Provider Branch Pages | Provider Category Card | L.C.005.OPEN | `LibrarySignalEmitter` | `LibraryAggregationPoint` | LB30 | `library_signal_events` |

Missing Connection Cards: 0
