# RESIDENTIAL_SIGNAL_AGGREGATION_DESTINATION_MAP_V1

Status: ACTIVE

Gate: R1

Scope: Residential / Application / Client / Accessibility UI signal-capable surfaces.

Runtime Status: NOT CONNECTED

Purpose: Define where every future Residential signal family will aggregate when runtime signal writing is approved.

---

## Aggregation Principle

This map does not create runtime aggregation.

It defines the future aggregation destinations for Residential UI signals so every card, icon, action, link, tool, note, image and exit element has a governed destination before any signal connection exists.

---

## Signal Family Aggregation Map

| Signal Family | Code Prefix | Magnet | Future Aggregation Destination | Aggregation Purpose | Archive Destination |
|---|---|---|---|---|---|
| Screen Presence | R.S | RB10 | Residential Screen Presence Aggregation | Measure visited active Application screens. | Residential UI Signals Vault |
| Button Intent | R.B | RB20 | Residential Button Intent Aggregation | Measure core navigation and action intent. | Button Intent Signals |
| Card Engagement | R.C | RB30 | Residential Card Engagement Aggregation | Measure room card attention and selection. | Card Engagement Signals |
| Audio / Accessibility | R.A | RB40 | Residential Accessibility Audio Aggregation | Measure listening/accessibility affordance demand. | Audio Accessibility Signals |
| Tool Usage | R.T | RB50 | Residential Tool Usage Aggregation | Measure use of local support tools. | Tool Usage Signals |
| External App Opening | R.Q | RB60 | Residential External App Aggregation | Measure external channel demand. | External App Signals |
| Link Opening | R.L | RB70 | Residential Link Opening Aggregation | Measure resource and link demand. | Links Signals |
| Notebook / Reflection | R.N | RB80 | Residential Notebook Reflection Aggregation | Measure private note and reflection usage. | Notebook Reflection Signals |
| Image Anchor | R.I | RB90 | Residential Image Anchor Aggregation | Measure personalization image usage. | Image Anchor Signals |
| Motivation | R.M | RB100 | Residential Motivation Aggregation | Measure motivational content selection. | Motivation Signals |
| Suggestion | R.G | RB110 | Residential Suggestion Aggregation | Measure suggestions and improvement themes. | Suggestion Signals |
| Complaint / Support | R.P | RB120 | Residential Complaint Support Aggregation | Measure complaints and support issues. | Complaint Support Signals |
| Exit / Return | R.X | RB130 | Residential Exit Aggregation | Measure exit and return flow intent. | Exit Signals |
| Prompt / Message Intent | R.PR | RB140 | Residential Prompt Intent Aggregation | Measure prompt/message intent without executing AI. | Prompt Intent Signals |
| Error / Blocked State | R.E | RB150 | Residential Error State Aggregation | Measure UI blocked, validation, or safety states. | Error State Signals |

---

## Surface Aggregation Destinations

| Surface | Included Signal Families | Future Aggregation Destination | Notes |
|---|---|---|---|
| Splash | R.S, R.B, R.A | Application Entry Aggregation | Tracks entry intent only. |
| Client Room | R.S, R.C, R.A, R.T, R.L, R.N, R.I, R.M, R.X | Client Room Experience Aggregation | Main Residential user experience source. |
| Accessibility Room | R.S, R.C, R.A, R.T, R.L, R.N, R.I, R.M, R.X | Accessibility Room Experience Aggregation | Main accessibility support source. |
| Accessibility Links | R.S, R.L, R.A, R.Q | Accessibility Resource Aggregation | Resource discovery demand. |
| Accessibility Tools | R.S, R.T, R.A, R.Q | Accessibility Tool Aggregation | Tool and assistive resource demand. |
| Accessibility Suggestions | R.S, R.G, R.A, R.Q | Accessibility Suggestion Aggregation | Suggestion and channel demand. |
| Accessibility Check-in | R.S, R.B, R.L, R.A | Check-in Support Aggregation | Support direction demand. |
| Message of the Day | R.S, R.M, R.A | Motivation Content Aggregation | Motivational selection demand. |
| Community Tools | R.S, R.T, R.A, R.Q | Community Support Aggregation | Community helper demand. |
| Residential Exit Portal | R.S, R.X, R.A | Residential Exit Aggregation | Goodbye/return intent. |

---

## Aggregation Rules

1. No runtime signal is written by this document.
2. Every future signal must carry a signal code, element id, magnet code and destination.
3. Signals must never include private note content unless explicitly approved by future privacy governance.
4. Accessibility/audio events are capability demand signals, not proof that audio playback occurred.
5. External link events must record destination category, not user private context.
6. Exit signals must remain supportive and non-punitive.
7. Aggregation must feed Strategic summaries only after review.

---

## Completion Status

Total archive magnets mapped: 15

Missing aggregation destinations: 0

Final Status: RESIDENTIAL_SIGNAL_AGGREGATION_DESTINATION_MAP_CREATED

