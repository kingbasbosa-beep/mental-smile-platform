# RESIDENTIAL_ENTRY_EXIT_FLOW_MAP_V1

Status: ACTIVE

Gate: R6

Runtime Status: DOCUMENTED_ONLY

Purpose: Document the Residential entry and exit flow.

---

## Entry Flow

| Step | Source | Action | Destination | Route Path | UI Reference | Signal Reference | Owner |
|---|---|---|---|---|---|---|---|
| 1 | App startup / return | Show Splash | Splash | /splash | R2-UI-SCR-001 | R.S.001.VIEW / R2-SIG-001 | Application UI Owner |
| 2 | Splash | Select Residential/client entry | Client Room | /client/room | R2-UI-BTN-001 | R.B.001.TAP / R2-SIG-011 | Application UI Owner |
| 3 | Splash | Select Accessibility entry | Accessibility Room | /accessibility/room | R2-UI-BTN-002 | R.B.002.TAP / R2-SIG-012 | Accessibility Owner |

---

## Residential Room Internal Flow

| Step | Source | Action | Destination | Route Path | UI Reference | Signal Reference | Owner |
|---|---|---|---|---|---|---|---|
| 1 | Client Room | Open check-in | Accessibility Check-in | /accessibility/checkin | R2-UI-CRD-001 | R.C.001.OPEN / R2-SIG-025 | Accessibility Owner |
| 2 | Client Room | Open community tools | Accessibility Community Tools | /accessibility/community-tools | R2-UI-CRD-002 | R.C.002.OPEN / R2-SIG-026 | Accessibility Owner |
| 3 | Client Room | Open suggestions | Accessibility Suggestions | /accessibility/suggestions | R2-UI-CRD-003 | R.C.003.OPEN / R2-SIG-027 | Support Owner |
| 4 | Accessibility Room | Open links/tools/suggestions/community/check-in | Accessibility inner pages | /accessibility/* | R2-UI-CRD-005 to R2-UI-CRD-010 | R.C.005 to R.C.010 | Accessibility Owner |

---

## Exit Flow

| Step | Source | Action | Destination | Route Path | UI Reference | Signal Reference | Owner |
|---|---|---|---|---|---|---|---|
| 1 | Client Room | Exit action | Residential Exit Portal | /residential/exit-social-links | R2-UI-MIX-003 | R.X.001.EXIT / R2-SIG-091 | Residential UI Owner |
| 2 | Accessibility Room | Exit action | Residential Exit Portal | /residential/exit-social-links | R2-UI-MIX-003 | R.X.001.EXIT / R2-SIG-091 | Residential UI Owner |
| 3 | Residential Exit Portal | Return action if used | Splash | /splash | R2-UI-LNK-008 | R.L.008.OPEN / R2-SIG-076 | Residential UI Owner |

---

## Support Adjacency

| Source | Destination | Route | Status |
|---|---|---|---|
| Support route-proven flow | Support Issue Selector | /module/support-issue-selector | ACTIVE_SUPPORT_ADJACENCY |
| Support route-proven flow | Chat | /chat | ACTIVE_SUPPORT_ADJACENCY |

---

## Validation

Entry flow documented: YES

Exit flow documented: YES

Broken entry/exit references: 0

Final Status: RESIDENTIAL_ENTRY_EXIT_FLOW_MAP_CREATED

