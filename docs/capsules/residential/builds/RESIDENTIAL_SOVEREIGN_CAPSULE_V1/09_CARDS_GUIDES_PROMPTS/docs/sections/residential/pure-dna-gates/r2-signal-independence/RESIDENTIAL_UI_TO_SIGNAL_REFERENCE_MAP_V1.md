# RESIDENTIAL_UI_TO_SIGNAL_REFERENCE_MAP_V1

Status: ACTIVE

Gate: R2

Source Evidence: `docs/sections/residential/pure-dna-gates/r1-signal-code-system/`

---

## Purpose

Map active Residential UI / Application elements to the corrected Minimal Signal Card layer.

This document proves that UI cards reference Signal Cards without becoming Signal Cards.

---

## Reference Map

| UI Reference Group | UI Card Range | Signal Code Range | Minimal Signal Card Range | Count | Source R1 Evidence |
|---|---|---|---|---:|---|
| Screen Presence | R2-UI-SCR-001 to R2-UI-SCR-010 | R.S.001.VIEW to R.S.010.VIEW | R2-SIG-001 to R2-SIG-010 | 10 | Signal-capable UI inventory |
| Button Intent | R2-UI-BTN-001 to R2-UI-BTN-014 | R.B.001.TAP to R.B.014.TAP | R2-SIG-011 to R2-SIG-024 | 14 | UI element signal card registry |
| Card Engagement | R2-UI-CRD-001 to R2-UI-CRD-014 | R.C.001.OPEN to R.C.014.OPEN | R2-SIG-025 to R2-SIG-038 | 14 | UI element signal card registry and inventory-derived references |
| Audio / Accessibility | R2-UI-AUD-001 to R2-UI-AUD-018 | R.A.001.PLAY to R.A.018.PLAY | R2-SIG-039 to R2-SIG-056 | 18 | Audio signal card registry |
| Tool Usage | R2-UI-TOL-001 to R2-UI-TOL-007 | R.T.001.OPEN to R.T.007.OPEN | R2-SIG-057 to R2-SIG-063 | 7 | Link/tool/app signal registry |
| External App Opening | R2-UI-APP-001 to R2-UI-APP-005 | R.Q.001.OPEN to R.Q.005.OPEN | R2-SIG-064 to R2-SIG-068 | 5 | Link/tool/app signal registry |
| Link Opening | R2-UI-LNK-001 to R2-UI-LNK-008 | R.L.001.OPEN to R.L.008.OPEN | R2-SIG-069 to R2-SIG-076 | 8 | Link/tool/app signal registry |
| Notebook / Reflection | R2-UI-NOT-001 to R2-UI-NOT-004 | R.N.001.SAVE to R.N.004.CLEAR | R2-SIG-077 to R2-SIG-080 | 4 | Notebook/image/motivation registry |
| Image Anchor | R2-UI-IMG-001 to R2-UI-IMG-004 | R.I.001.UPLOAD to R.I.004.REMOVE | R2-SIG-081 to R2-SIG-084 | 4 | Notebook/image/motivation registry |
| Motivation | R2-UI-MOT-001 to R2-UI-MOT-004 | R.M.001.SELECT to R.M.004.SELECT | R2-SIG-085 to R2-SIG-088 | 4 | Notebook/image/motivation registry |
| Suggestion / Support / Exit / Prompt / Error | R2-UI-MIX-001 to R2-UI-MIX-004 | R.G.001.SUBMIT, R.P.001.OPEN, R.X.001.EXIT, R.E.001.BLOCK | R2-SIG-089 to R2-SIG-092 | 4 | Signal category dictionary and inventory-derived references |

---

## Validation

| Validation Item | Status |
|---|---|
| Every R1 signal-capable element reviewed | YES |
| Every normalized UI reference has a signal range | YES |
| Every signal range has a Minimal Signal Card range | YES |
| Missing UI references | 0 |
| Missing Signal Codes | 0 |

Final Status: RESIDENTIAL_UI_TO_SIGNAL_REFERENCE_MAP_CREATED

