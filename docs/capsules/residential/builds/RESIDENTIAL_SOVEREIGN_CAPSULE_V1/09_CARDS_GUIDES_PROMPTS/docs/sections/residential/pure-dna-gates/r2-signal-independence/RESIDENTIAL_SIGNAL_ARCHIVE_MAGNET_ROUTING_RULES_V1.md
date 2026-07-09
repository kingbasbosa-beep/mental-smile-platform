# RESIDENTIAL_SIGNAL_ARCHIVE_MAGNET_ROUTING_RULES_V1

Status: ACTIVE

Gate: R2

Source Magnet Map: `../r1-signal-code-system/RESIDENTIAL_ARCHIVE_MAGNET_CODE_MAP_V1.md`

---

## Purpose

Define how Residential Minimal Signal Cards route to archive magnets without creating an archive writer.

---

## Routing Rules

1. Every Minimal Signal Card must carry exactly one archive magnet code.
2. Archive magnet codes are owned by Archive Governance.
3. Signal Cards may reference archive destinations but may not rewrite them.
4. Private local utility signals must not archive user content by default.
5. External app/link signals archive destination category only, not private browsing behavior.
6. Complaint/support signals require review before archive package promotion.
7. Error and blocked-state signals require safety review before Strategic use.

---

## Magnet Routing Table

| Magnet | Signal Family | Archive Destination | Privacy Requirement |
|---|---|---|---|
| RB10 | Screen Presence | Residential UI Signals Vault | Count only |
| RB20 | Button Intent | Button Intent Signals | Count only |
| RB30 | Card Engagement | Card Engagement Signals | Count only |
| RB40 | Audio / Accessibility | Audio Accessibility Signals | Accessibility usage only |
| RB50 | Tool Usage | Tool Usage Signals | Count only |
| RB60 | External App Opening | External App Signals | Destination category only |
| RB70 | Link Opening | Links Signals | Resource category only |
| RB80 | Notebook / Reflection | Notebook Reflection Signals | No note content |
| RB90 | Image Anchor | Image Anchor Signals | No image content |
| RB100 | Motivation | Motivation Signals | Selected content category only |
| RB110 | Suggestion | Suggestion Signals | Review required |
| RB120 | Complaint / Support | Complaint Support Signals | High review |
| RB130 | Exit / Return | Exit Signals | Count only |
| RB140 | Prompt / Message Intent | Prompt Intent Signals | No prompt execution |
| RB150 | Error / Blocked State | Error State Signals | Safety review |

---

## Validation

| Item | Status |
|---|---|
| Missing archive magnet codes | 0 |
| Missing archive destinations | 0 |
| Archive writer created | NO |
| Runtime archive connection | NOT_CONNECTED |

Final Status: RESIDENTIAL_SIGNAL_ARCHIVE_MAGNET_ROUTING_RULES_CREATED

