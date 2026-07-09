# RESIDENTIAL_NAVIGATION_SIGNAL_REFERENCE_MAP_V1

Status: ACTIVE

Gate: R6

Runtime Status: DOCUMENTED_ONLY

Purpose: Map navigation actions to Residential Signal Cards and signal routing.

---

## Navigation Signal Reference Map

| Navigation Group | Source | Destination | Signal Code | Signal Card | Signal Family | Archive Magnet | Archive Destination | Aggregation Destination | Strategic Summary Destination | Privacy | Review |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Entry: Splash to Client Room | Splash | Client Room | R.B.001.TAP | R2-SIG-011 | Button Intent | RB20 | Button Intent Signals | Residential Button Intent Aggregation | Residential Intent Summary | PUBLIC_UI_COUNT | ACTIVE_REVIEWED |
| Entry: Splash to Accessibility Room | Splash | Accessibility Room | R.B.002.TAP | R2-SIG-012 | Button Intent | RB20 | Button Intent Signals | Residential Button Intent Aggregation | Accessibility Demand Summary | PUBLIC_UI_COUNT | ACTIVE_REVIEWED |
| Client quick access cards | Client Room | Check-in / Community / Suggestions | R.C.001 to R.C.003 | R2-SIG-025 to R2-SIG-027 | Card Engagement | RB30 | Card Engagement Signals | Residential Card Engagement Aggregation | Residential Feature Demand Summary | PUBLIC_UI_COUNT | ACTIVE_REVIEWED |
| Accessibility room cards | Accessibility Room | Links / Tools / Suggestions / Community / Check-in | R.C.005 to R.C.010 | R2-SIG-029 to R2-SIG-034 | Card Engagement | RB30 | Card Engagement Signals | Residential Card Engagement Aggregation | Residential Feature Demand Summary | PUBLIC_UI_COUNT | ACTIVE_REVIEWED |
| Accessibility links navigation | Accessibility Links / Check-in | Resource/public destinations | R.L.004 to R.L.007 | R2-SIG-072 to R2-SIG-075 | Link Opening | RB70 | Links Signals | Residential Link Opening Aggregation | Resource Discovery Summary | EXTERNAL_DESTINATION | ACTIVE_REVIEWED |
| Accessibility tool navigation | Accessibility Tools / Community Tools | Tool/resource destinations | R.T.003 / R.T.004 / R.T.006 / R.T.007 | R2-SIG-059 / R2-SIG-060 / R2-SIG-062 / R2-SIG-063 | Tool Usage | RB50 | Tool Usage Signals | Residential Tool Usage Aggregation | Residential Tool Utility Summary | PUBLIC_UI_COUNT | ACTIVE_REVIEWED |
| Suggestion/support navigation | Suggestions / Support adjacency | Suggestion/support channel | R.G.001 / R.P.001 | R2-SIG-089 / R2-SIG-090 | Suggestion / Complaint Support | RB110 / RB120 | Suggestion / Complaint Support Signals | Suggestion / Support Aggregation | Improvement / Support Risk Summary | SUPPORT_INTENT | ACTIVE_REVIEWED |
| Exit navigation | Client/Accessibility Room | Exit Portal | R.X.001.EXIT | R2-SIG-091 | Exit / Return | RB130 | Exit Signals | Residential Exit Aggregation | Exit and Return Pattern Summary | PUBLIC_UI_COUNT | ACTIVE_REVIEWED |
| Exit return navigation | Residential Exit Portal | Splash / return path | R.L.008.OPEN | R2-SIG-076 | Link Opening / Exit | RB130 | Exit Signals | Exit Aggregation | Exit Summary | PUBLIC_UI_COUNT | ACTIVE_REVIEWED |

---

## Validation

Missing signal references: 0

Broken navigation signal references: 0

Final Status: RESIDENTIAL_NAVIGATION_SIGNAL_REFERENCE_MAP_CREATED

