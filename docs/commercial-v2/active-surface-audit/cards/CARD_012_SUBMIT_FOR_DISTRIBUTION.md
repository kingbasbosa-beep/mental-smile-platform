# CARD 012 Submit For Distribution

| Field | Value |
|---|---|
| Card ID | CARD 012 |
| Card Name | Submit For Distribution |
| Purpose | Publish profile and prepare future distribution path. |
| Current Behavior | Current action label is updated to Submit For Distribution; it writes live profile and shows the new completion message. |
| Expected Behavior | Submit for Distribution should create asset package, archive package, marketing intake handoff, and success message. |
| Inputs | Valid profile payload. |
| Outputs | Current: live profile and completion message. Target later: distribution package. |
| Dependencies | `_publish`; `_CommercialV2Store.publish`; Firestore; future Archive/Marketing contracts. |
| Signals | None found. |
| Storage | None directly. |
| Collections | `commercial_v2_profiles/{uid}`, `versions`. |
| Known Issues | Distribution package does not exist yet by instruction. |
| Required Changes | Add asset/archive/marketing package behavior only in future approved operation. |
| Status | LABELS_UPDATED / PACKAGE_POSTPONED |
