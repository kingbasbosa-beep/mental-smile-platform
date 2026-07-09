# RESIDENTIAL_CARD_LAYER_SEPARATION_GUIDE_V1

Status: ACTIVE

Gate: R2

---

## Purpose

This guide defines the separation between Residential UI / Technical Cards and Residential Minimal Signal Cards.

---

## Layer 1: UI / Technical Card

Purpose:

- Describe what the user sees.
- Describe the widget or component.
- Track localization readiness.
- Track accessibility readiness.
- Track visual and technical ownership.
- Reference related signal codes when signal-capable.

It does not own analytics.

---

## Layer 2: Minimal Signal Card

Purpose:

- Count a future user/system action.
- Route the count to archive magnets.
- Route the count to aggregation.
- Route reviewed output to Strategic summary.

It does not own UI.

---

## Layer 3: Archive Magnet Map

Purpose:

- Define archive package destinations.
- Keep signal families discoverable.
- Preserve historical routing.

It does not own UI or analytics rules.

---

## Layer 4: Strategic Summary Map

Purpose:

- Define where aggregated Residential counts become Strategic summaries.
- Define Owner-readiness and review requirements.

It does not collect signals.

---

## Separation Example

| User-facing item | UI Technical Card owns | Minimal Signal Card owns |
|---|---|---|
| Client Room check-in card | Label, widget, route, accessibility, localization | R.C.001.OPEN count and routing |
| Exit button | Visible exit action and semantics | R.X.001.EXIT count and routing |
| Listening icon | Icon placement and semantics | R.A.*.PLAY accessibility demand count |
| YouTube link | Link row and launch surface | R.Q.*.OPEN external app demand count |

---

## R2 Validation Rule

If a UI element is signal-capable:

- It must have a UI Technical Card.
- It must reference a Signal Code.
- Its Signal Code must exist in the Minimal Signal Card Registry.

Final Status: RESIDENTIAL_CARD_LAYER_SEPARATION_GUIDE_CREATED

