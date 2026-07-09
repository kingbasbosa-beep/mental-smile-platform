# COMMERCIAL_V2_PURE_DNA_GUIDE_V1

Status: ACTIVE FOUNDATION GUIDE

Section Code: `SEC-CV2`

Inbox Plug: `PLG-CV2-IN`

Outbox Plug: `PLG-CV2-OUT`

Destination Code: `DST-CV2-INBOX`

## Purpose

Commercial V2 is the governed future commercial web and registration layer for Mental Smile.

This guide documents Commercial V2 exactly as it exists today:

- Clean Commercial V2 Web section
- Public showcase placeholders
- Library / Specialists / Centers destination cards
- No direct runtime connection to Library
- No Firebase / Firestore / Storage writes
- No active provider publishing pipeline

## Pure DNA Rule

Commercial V2 owns only its internal network.

Commercial V2 communicates externally only through:

- `PLG-CV2-IN`
- `PLG-CV2-OUT`

Everything leaving Commercial V2 must pass through the Commercial V2 Outbox Aggregation Point.

FINAL STATUS: COMMERCIAL_V2_PURE_DNA_GUIDE_ACTIVE
