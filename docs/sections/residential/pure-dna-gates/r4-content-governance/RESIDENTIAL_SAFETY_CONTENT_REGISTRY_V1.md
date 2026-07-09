# RESIDENTIAL_SAFETY_CONTENT_REGISTRY_V1

Status: ACTIVE

Gate: R4

Runtime Status: NOT CONNECTED

Purpose: Govern Residential safety, warning, support, educational, dialog, SnackBar and future AI boundary content.

---

## Safety and Support Content Cards

| Content Card | Content ID | Category | Purpose | Localization Key | Arabic | English | Appears In | Related UI Card | Related Signal Card | Review Cycle | Owner | Archive Destination | Strategic Importance | Future Update Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R4-SAFE-MC-001 | R-SAFE-001 | Warning | Govern warning and blocked-state copy. | Existing warning/error keys | Arabic warning copy | English warning copy | Forms / blocked states | R2-UI-MIX-004 | R2-SIG-092 / R.E.001.BLOCK | Monthly safety review | Safety Owner | Error State Signals | High | Must remain calm and non-punitive. |
| R4-SAFE-MC-002 | R-SAFE-002 | Safety Message | Govern user safety and support boundary copy. | Existing safety/support keys | Arabic safety copy | English safety copy | Suggestions / Check-in / Support | R2-UI-MIX-001 / R2-UI-MIX-002 | R2-SIG-089 / R2-SIG-090 | Monthly safety review | Support Owner | Suggestion / Complaint Support Signals | High | Future crisis text requires Owner review. |
| R4-SAFE-MC-003 | R-SAFE-003 | Educational Message | Govern educational helper content. | Existing resource/education keys | Arabic educational copy | English educational copy | Links / Tools / YouTube / Library links | R2-UI-LNK-* / R2-UI-APP-* | R.L.* / R.Q.* | Quarterly content review | Content Owner | Links / External App Signals | High | Avoid diagnosis/treatment promises. |
| R4-SAFE-MC-004 | R-SAFE-004 | Help Text | Govern helper text and field guidance. | Existing helper keys | Arabic helper text | English helper text | Dialogs / Tools / Suggestions | R2-UI-TOL-* / R2-UI-MIX-* | R.T.* / R.G.* | Quarterly UX review | Application UI Owner | Tool / Suggestion Signals | Medium | Keep clear and short. |
| R4-SAFE-MC-005 | R-SAFE-005 | Placeholder Text | Govern placeholder and empty-state copy. | Existing placeholder keys | Arabic placeholder text | English placeholder text | Forms / empty states / audio placeholders | R2-UI-AUD-* / R2-UI-MIX-* | R.A.* / R.E.* | Quarterly localization review | Application UI Owner | Audio / Error State Signals | Medium | Replace when runtime becomes live. |
| R4-SAFE-MC-006 | R-SAFE-006 | Titles | Govern page/card/dialog titles. | Existing title keys | Arabic title copy | English title copy | All active surfaces | R2-UI-SCR-* / R2-UI-CRD-* | R.S.* / R.C.* | Quarterly localization review | Product UI Owner | Screen / Card Signals | High | Maintain Arabic-first style. |
| R4-SAFE-MC-007 | R-SAFE-007 | Descriptions | Govern subtitles/descriptions. | Existing description keys | Arabic description copy | English description copy | Cards, dialogs, pages | R2-UI-CRD-* / R2-UI-TOL-* | R.C.* / R.T.* | Quarterly content review | Product UI Owner | Card / Tool Signals | Medium | Keep short and accessible. |
| R4-SAFE-MC-008 | R-SAFE-008 | Dialog Copy | Govern dialog body and action copy. | Existing dialog keys | Arabic dialog copy | English dialog copy | Client Room dialogs / tools / links | R2-UI-TOL-* / R2-UI-LNK-* | R.T.* / R.L.* | Monthly UX review | Application UI Owner | Tool / Link Signals | High | Preserve semantics for actions. |
| R4-SAFE-MC-009 | R-SAFE-009 | SnackBar Copy | Govern transient messages. | Existing snackbar keys | Arabic snackbar copy | English snackbar copy | Suggestions / actions / placeholders | R2-UI-MIX-* / R2-UI-AUD-* | R.G.* / R.A.* / R.E.* | Monthly UX/safety review | Application UI Owner | Suggestion / Audio / Error Signals | High | Avoid text-only audio placeholders later. |
| R4-SAFE-MC-010 | R-SAFE-010 | Support Message | Govern support submission/reassurance messages. | Existing support keys | Arabic support copy | English support copy | Suggestions / Support surfaces | R2-UI-MIX-001 / R2-UI-MIX-002 | R2-SIG-089 / R2-SIG-090 | Monthly support review | Support Owner | Support Signals | High | Must never imply emergency replacement. |
| R4-SAFE-MC-011 | R-SAFE-011 | AI Prompt Entry Copy | Govern future AI prompt entry wording. | applicationAudioSoon / future prompt keys | Arabic AI prompt boundary copy | English AI prompt boundary copy | Audio affordances / future prompt entry | R2-UI-AUD-* | R.A.* / future R.PR | Owner review before activation | Human-AI Governance Owner | Prompt Intent Signals | High | No AI execution in R4. |

---

## Validation

Every Safety/Warning/Support/Educational content group has Card: YES

Missing Safety Content Cards: 0

Final Status: RESIDENTIAL_SAFETY_CONTENT_REGISTRY_CREATED

