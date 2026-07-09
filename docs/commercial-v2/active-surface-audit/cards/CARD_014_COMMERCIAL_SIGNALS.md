# CARD 014 Commercial Signals

| Field | Value |
|---|---|
| Card ID | CARD 014 |
| Card Name | Commercial Signals |
| Purpose | Emit Commercial V2 activity signals for monitoring, aggregation, reporting, and Strategic handoff. |
| Current Behavior | Local Commercial V2 signal foundation exists in profile engine and stores lifecycle signals on the Commercial V2 profile document. Global monitoring remains disconnected. |
| Expected Behavior | Emit reviewed signals for publish, profile open, search/filter, asset generation, and distribution. |
| Inputs | Commercial actions. |
| Outputs | Local signal history and signal registry. |
| Dependencies | Commercial V2 profile document. |
| Signals | `commercial_created`, `commercial_updated`, `commercial_generated`, `commercial_submitted`, `commercial_archived`. |
| Storage | `commercial_v2_profiles/{ownerUid}.commercialSignals`; `commercialSignalRegistry`. |
| Collections | Future `signal_events`; `signal_aggregates`. |
| Known Issues | Strategic reporting and monitoring cannot consume these signals until future aggregation/monitoring connection exists. |
| Required Changes | Future global signal aggregation connection only. |
| Status | IMPLEMENTED_FOUNDATION |
