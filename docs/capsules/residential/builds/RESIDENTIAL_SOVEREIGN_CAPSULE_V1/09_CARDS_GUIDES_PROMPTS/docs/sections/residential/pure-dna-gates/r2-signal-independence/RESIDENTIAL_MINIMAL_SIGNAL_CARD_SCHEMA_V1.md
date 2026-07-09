# RESIDENTIAL_MINIMAL_SIGNAL_CARD_SCHEMA_V1

Status: ACTIVE

Gate: R2

---

## Purpose

Define the approved Residential Minimal Signal Card schema.

---

## Approved Fields Only

| Field | Required | Purpose |
|---|---|---|
| Signal Card ID | YES | Unique signal card identifier. |
| Signal Code | YES | Countable code. |
| Source Section | YES | Source product section. |
| Source Surface | YES | Source UI surface or runtime area. |
| Source Element Ref | YES | Reference to UI card or element. |
| Signal Family | YES | Signal category. |
| Counted Action | YES | Action counted by the signal. |
| Magnet | YES | Archive magnet code. |
| Archive Destination | YES | Archive destination. |
| Aggregation Destination | YES | Aggregation destination. |
| Strategic Summary Destination | YES | Strategic destination. |
| Privacy | YES | Privacy class. |
| Retention | YES | Retention class. |
| Runtime | YES | Runtime connection status. |
| Review | YES | Review status. |

---

## Forbidden Fields

Minimal Signal Cards must not contain:

- UI color.
- UI layout.
- Widget styling.
- Detailed copy.
- Prompt text.
- Maintenance notes.
- Marketing owner.
- Implementation code.

---

## Privacy Classes

| Class | Meaning |
|---|---|
| PUBLIC_UI_COUNT | Non-private visible UI count. |
| ACCESSIBILITY_USAGE | Accessibility affordance demand. |
| SUPPORT_INTENT | Support or help-seeking intent. |
| PRIVATE_LOCAL_UTILITY | Local private utility interaction; no content capture. |
| EXTERNAL_DESTINATION | External link/app opening category. |
| SAFETY_REVIEW | Complaint, error or blocked-state class requiring review. |

---

## Retention Classes

| Class | Meaning |
|---|---|
| STANDARD_OPERATIONAL | Normal count retention. |
| ACCESSIBILITY_OPERATIONAL | Accessibility demand retention. |
| PRIVATE_MINIMAL | Minimal count only; no content retention. |
| REVIEW_REQUIRED | Retained only after review policy. |
| STRATEGIC_SUMMARY_ONLY | Aggregated summary only. |

Final Status: RESIDENTIAL_MINIMAL_SIGNAL_CARD_SCHEMA_CREATED

