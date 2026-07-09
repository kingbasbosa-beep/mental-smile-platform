# RESIDENTIAL_MINIMAL_SIGNAL_CARD_REGISTRY_V1

Status: ACTIVE

Gate: R2

Runtime Status: NOT CONNECTED

Source Evidence: R1 signal code system and UI inventory.

---

## Purpose

This is the normalized Minimal Signal Card Registry for Residential R2.

It contains only strategic counting and routing fields.

UI-heavy information remains outside this registry.

---

## Normalization Rule

Each row below represents an atomic expanded signal-card range.

For example:

`R2-SIG-001 to R2-SIG-010` means ten individual Minimal Signal Cards exist in that range, one card per signal ordinal and signal code.

No UI styling, prompts, maintenance ownership or implementation details are carried here.

---

## Minimal Signal Registry

| Signal Card ID | Signal Code | Source Section | Source Surface | Source Element Ref | Signal Family | Counted Action | Magnet | Archive Destination | Aggregation Destination | Strategic Summary Destination | Privacy | Retention | Runtime | Review |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R2-SIG-001 to R2-SIG-010 | R.S.001.VIEW to R.S.010.VIEW | Application / Residential / Accessibility | Active screens | R2-UI-SCR-001 to R2-UI-SCR-010 | Screen Presence | View | RB10 | Residential UI Signals Vault | Residential Screen Presence Aggregation | Residential Experience Coverage Summary | PUBLIC_UI_COUNT | STANDARD_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-011 to R2-SIG-024 | R.B.001.TAP to R.B.014.TAP | Application / Residential | Buttons and primary actions | R2-UI-BTN-001 to R2-UI-BTN-014 | Button Intent | Tap | RB20 | Button Intent Signals | Residential Button Intent Aggregation | Residential Intent Summary | PUBLIC_UI_COUNT | STANDARD_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-025 to R2-SIG-038 | R.C.001.OPEN to R.C.014.OPEN | Residential / Accessibility | Main cards and action cards | R2-UI-CRD-001 to R2-UI-CRD-014 | Card Engagement | Open | RB30 | Card Engagement Signals | Residential Card Engagement Aggregation | Residential Feature Demand Summary | PUBLIC_UI_COUNT | STANDARD_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-039 to R2-SIG-056 | R.A.001.PLAY to R.A.018.PLAY | Application / Residential / Accessibility | Accessibility audio affordances | R2-UI-AUD-001 to R2-UI-AUD-018 | Audio / Accessibility | Play / request support | RB40 | Audio Accessibility Signals | Residential Accessibility Audio Aggregation | Accessibility Demand Summary | ACCESSIBILITY_USAGE | ACCESSIBILITY_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-057 to R2-SIG-063 | R.T.001.OPEN to R.T.007.OPEN | Residential / Accessibility | Local tools | R2-UI-TOL-001 to R2-UI-TOL-007 | Tool Usage | Open | RB50 | Tool Usage Signals | Residential Tool Usage Aggregation | Residential Tool Utility Summary | PUBLIC_UI_COUNT | STANDARD_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-064 to R2-SIG-068 | R.Q.001.OPEN to R.Q.005.OPEN | Residential / Accessibility | External app/channel openings | R2-UI-APP-001 to R2-UI-APP-005 | External App Opening | Open external channel | RB60 | External App Signals | Residential External App Aggregation | External Channel Demand Summary | EXTERNAL_DESTINATION | STANDARD_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-069 to R2-SIG-076 | R.L.001.OPEN to R.L.008.OPEN | Residential / Accessibility | Link rows and link dialogs | R2-UI-LNK-001 to R2-UI-LNK-008 | Link Opening | Open link/resource | RB70 | Links Signals | Residential Link Opening Aggregation | Resource Discovery Summary | EXTERNAL_DESTINATION | STANDARD_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-077 to R2-SIG-080 | R.N.001.SAVE to R.N.004.CLEAR | Residential / Accessibility | Notebook utilities | R2-UI-NOT-001 to R2-UI-NOT-004 | Notebook / Reflection | Save / clear local note | RB80 | Notebook Reflection Signals | Residential Notebook Reflection Aggregation | Private Support Utility Summary | PRIVATE_LOCAL_UTILITY | PRIVATE_MINIMAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-081 to R2-SIG-084 | R.I.001.UPLOAD to R.I.004.REMOVE | Residential / Accessibility | Room personalization image | R2-UI-IMG-001 to R2-UI-IMG-004 | Image Anchor | Upload / remove | RB90 | Image Anchor Signals | Residential Image Anchor Aggregation | Personalization Demand Summary | PRIVATE_LOCAL_UTILITY | PRIVATE_MINIMAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-085 to R2-SIG-088 | R.M.001.SELECT to R.M.004.SELECT | Residential / Accessibility | Motivation messages | R2-UI-MOT-001 to R2-UI-MOT-004 | Motivation | Select | RB100 | Motivation Signals | Residential Motivation Aggregation | Motivation Content Summary | PUBLIC_UI_COUNT | STRATEGIC_SUMMARY_ONLY | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-089 | R.G.001.SUBMIT | Accessibility | Suggestions | R2-UI-MIX-001 | Suggestion | Submit suggestion | RB110 | Suggestion Signals | Residential Suggestion Aggregation | Improvement Request Summary | SUPPORT_INTENT | REVIEW_REQUIRED | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-090 | R.P.001.OPEN | Residential / Accessibility | Support or complaint route | R2-UI-MIX-002 | Complaint / Support | Open support channel | RB120 | Complaint Support Signals | Residential Complaint Support Aggregation | Support Risk Summary | SAFETY_REVIEW | REVIEW_REQUIRED | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-091 | R.X.001.EXIT | Residential | Residential Exit Portal | R2-UI-MIX-003 | Exit / Return | Exit / return | RB130 | Exit Signals | Residential Exit Aggregation | Exit and Return Pattern Summary | PUBLIC_UI_COUNT | STANDARD_OPERATIONAL | NOT_CONNECTED | ACTIVE_REVIEWED |
| R2-SIG-092 | R.E.001.BLOCK | Application / Residential | Validation or blocked state | R2-UI-MIX-004 | Error / Blocked State | Block / error state | RB150 | Error State Signals | Residential Error State Aggregation | Application Friction Summary | SAFETY_REVIEW | REVIEW_REQUIRED | NOT_CONNECTED | ACTIVE_REVIEWED |

---

## Validation

| Item | Count |
|---|---:|
| Minimal Signal Cards created | 92 |
| Missing signal codes | 0 |
| Missing archive magnet codes | 0 |
| Missing aggregation destinations | 0 |
| Missing strategic summary destinations | 0 |

Final Status: RESIDENTIAL_MINIMAL_SIGNAL_CARD_REGISTRY_CREATED

