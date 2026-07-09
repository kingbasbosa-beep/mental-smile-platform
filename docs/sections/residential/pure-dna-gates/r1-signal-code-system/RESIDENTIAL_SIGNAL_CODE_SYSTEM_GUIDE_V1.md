# RESIDENTIAL SIGNAL CODE SYSTEM GUIDE V1

Status: ACTIVE FOUNDATION

Operation ID: OP-RESIDENTIAL-R1-SIGNAL-CODE-SYSTEM-UI-ELEMENT-CARD-FOUNDATION-V1

## Purpose

This guide defines the permanent Residential signal coding language for signal-capable UI elements in the active Residential / Application / Client / Accessibility surfaces.

No runtime signals are connected by this guide.

No Firebase collections are created.

No archive writer is created.

## Stable Code Format

`R.<CATEGORY>.<NUMBER>.<ACTION>`

Example:

- `R.B.001.TAP`
- `R.A.001.PLAY`
- `R.L.001.OPEN`
- `R.N.001.WRITE`
- `R.I.001.UPLOAD`
- `R.X.001.EXIT`

## Prefix Rules

| Prefix | Meaning |
|---|---|
| R | Residential source |
| S | Screens |
| B | Buttons |
| C | Cards |
| A | Audio / Accessibility Guide Icons |
| T | Tools |
| Q | External Applications |
| L | Links |
| N | Notebook / Reflection |
| I | Image Anchor / Uploaded Image |
| M | Motivational Messages |
| F | Forms |
| X | Exit / External Navigation |
| G | Groups / Communities |
| P | Prompts / AI Support |
| E | Errors / Empty States / Safety Notices |

## Number Governance

- Numbers are permanent.
- Numbers must never be reused.
- Removed items must be marked `ARCHIVED`.
- New elements receive the next available number within their category.

## Review Governance

Default owner: Residential / Application UI Owner.

Review status values:

- ACTIVE_REVIEWED
- ACTIVE_NEEDS_RUNTIME_CONNECTION
- ACTIVE_UI_ONLY
- ARCHIVED
- BLOCKED

## Signal Creation Rule

A UI element is signal-capable if it can represent:

- User intent
- Navigation intent
- Accessibility/listening request
- External opening
- Suggestion or feedback
- Tool usage
- Notebook/reflection usage
- Image personalization
- Exit event
- Error/empty/safety event

Final Status: RESIDENTIAL_SIGNAL_CODE_SYSTEM_DEFINED

