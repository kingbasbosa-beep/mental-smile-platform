# RESIDENTIAL_UI_TECHNICAL_CARD_REGISTRY_V1

Status: ACTIVE

Gate: R2

Runtime Status: UI_ACTIVE_REFERENCE_ONLY

---

## Purpose

This registry preserves UI / technical ownership separately from Signal Cards.

It describes active Residential / Application UI elements and references related Signal Codes without owning analytics.

---

## UI Technical Registry

| UI Card ID | Element ID | Display Name | Section | Screen | Widget | UI Purpose | Localization Key | Arabic | English | Accessibility | Semantics | Related Signal Code | Technical Owner | Review | Runtime |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R2-UI-SCR-001 to R2-UI-SCR-010 | R-SCR-* | Active Residential Screens | Application / Residential / Accessibility | Splash, Client Room, Accessibility Room, inner pages, Exit Portal | Page widgets | Active screen presence | Existing localization keys | Arabic UI labels | English keys | YES | YES | R.S.001.VIEW to R.S.010.VIEW | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-BTN-001 to R2-UI-BTN-014 | R-BTN-* | Primary Buttons | Application / Residential | Splash, rooms, dialogs, exit | Button widgets | Navigation or action intent | Existing localization keys | Arabic button labels | English button labels | YES | YES | R.B.001.TAP to R.B.014.TAP | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-CRD-001 to R2-UI-CRD-014 | R-CRD-* | Room and Action Cards | Residential / Accessibility | Client Room and Accessibility Room | Card widgets | Open major support areas | Existing localization keys | Arabic card titles | English card titles | YES | YES | R.C.001.OPEN to R.C.014.OPEN | Residential UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-AUD-001 to R2-UI-AUD-018 | R-AUD-* | Accessibility Audio Icons | Application / Residential / Accessibility | Cards, titles, buttons, portal | AccessibilityGuideIcon / listen affordance | Future listening/audio support entry | applicationAccessibilityListenSupport / applicationAudioSoon | استماع أو دعم صوتي | Listening or audio support | YES | YES | R.A.001.PLAY to R.A.018.PLAY | Accessibility UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-TOL-001 to R2-UI-TOL-007 | R-TOL-* | Local Tools | Residential / Accessibility | Dialogs and accessibility tools | Tool rows/buttons | Open local support utilities | Existing localization keys | Arabic tool labels | English tool labels | YES | YES | R.T.001.OPEN to R.T.007.OPEN | Residential Tools UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-APP-001 to R2-UI-APP-005 | R-APP-* | External App Channels | Residential / Accessibility | YouTube, WhatsApp, external support/resource links | launchUrl actions | Open approved external channel | Existing localization keys | Arabic app labels | English app labels | YES | YES | R.Q.001.OPEN to R.Q.005.OPEN | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-LNK-001 to R2-UI-LNK-008 | R-LNK-* | Resource Links | Residential / Accessibility | Personal links, links page, check-in | Link rows | Open resource or internal public display route | Existing localization keys | Arabic link labels | English link labels | YES | YES | R.L.001.OPEN to R.L.008.OPEN | Residential Resource UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-NOT-001 to R2-UI-NOT-004 | R-NOT-* | Notebook Utilities | Residential / Accessibility | Room notebook dialogs | Text area / save / clear | Local private notes only | Existing localization keys | Arabic note labels | English note labels | YES | YES | R.N.001.SAVE to R.N.004.CLEAR | Residential Tools UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-IMG-001 to R2-UI-IMG-004 | R-IMG-* | Room Image Anchors | Residential / Accessibility | Room computer/personal image controls | Image picker/remove controls | Local room personalization image | Existing localization keys | Arabic image labels | English image labels | YES | YES | R.I.001.UPLOAD to R.I.004.REMOVE | Residential UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-MOT-001 to R2-UI-MOT-004 | R-MOT-* | Motivation Messages | Residential / Accessibility | Notebook and message of the day | Message option widgets | Select motivational/supportive text | Existing localization keys | Arabic motivation labels | English motivation labels | YES | YES | R.M.001.SELECT to R.M.004.SELECT | Residential Content UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-MIX-001 | R-SUG-001 | Suggestion Submit Surface | Accessibility | Suggestions | Suggestion form | Submit suggestion/supportive feedback | Existing localization keys | Arabic suggestion labels | English suggestion labels | YES | YES | R.G.001.SUBMIT | Accessibility UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-MIX-002 | R-SUP-001 | Support / Complaint Route | Residential / Accessibility | Support surfaces | Support action | Open support or complaint path | Existing localization keys | Arabic support labels | English support labels | YES | YES | R.P.001.OPEN | Support UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-MIX-003 | R-EXT-001 | Residential Exit Portal | Residential | Exit Portal | Exit action | Exit/return experience | Existing localization keys | خروج | Exit | YES | YES | R.X.001.EXIT | Residential UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R2-UI-MIX-004 | R-ERR-001 | Validation / Blocked State | Application / Residential | Forms and blocked states | Error/validation message | Display user-safe error or blocked state | Existing localization keys | Arabic safe error copy | English safe error copy | YES | YES | R.E.001.BLOCK | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |

---

## Validation

| Item | Count |
|---|---:|
| UI Technical Cards created | 92 |
| UI-to-Signal references created | 92 |
| Missing UI references | 0 |
| UI cards treated as analytics source of truth | 0 |

Final Status: RESIDENTIAL_UI_TECHNICAL_CARD_REGISTRY_CREATED

