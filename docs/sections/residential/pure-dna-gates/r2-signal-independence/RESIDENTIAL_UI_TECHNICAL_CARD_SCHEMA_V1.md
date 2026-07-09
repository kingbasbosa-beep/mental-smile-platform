# RESIDENTIAL_UI_TECHNICAL_CARD_SCHEMA_V1

Status: ACTIVE

Gate: R2

---

## Purpose

Define the approved Residential UI Technical Card schema.

---

## Approved Fields

| Field | Required | Purpose |
|---|---|---|
| UI Card ID | YES | Unique UI card identifier. |
| Element ID | YES | UI element source identifier. |
| Display Name | YES | Short reference name. |
| Section | YES | Owning product section. |
| Screen | YES | Active surface. |
| Widget | YES | Widget or component reference. |
| UI Purpose | YES | What appears on screen. |
| Localization Key | YES/IF_VISIBLE_TEXT | Localization ownership. |
| Arabic | YES/IF_VISIBLE_TEXT | Arabic visible label reference. |
| English | YES/IF_VISIBLE_TEXT | English visible label reference. |
| Accessibility | YES | Whether accessibility guide/icon support is required. |
| Semantics | YES | Whether semantic labels/hints are required. |
| Related Signal Code | YES/IF_SIGNAL_CAPABLE | Future signal code reference. |
| Technical Owner | YES | UI / technical owner. |
| Review | YES | Review status. |
| Runtime | YES | Runtime status. |

---

## Forbidden Ownership

UI Technical Cards must not be treated as:

- Analytics source of truth.
- Strategic summary owner.
- Archive routing owner.
- Aggregation runtime owner.

Final Status: RESIDENTIAL_UI_TECHNICAL_CARD_SCHEMA_CREATED

