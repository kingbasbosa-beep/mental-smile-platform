# Commercial V2 Card Approval Matrix V1

## Operation

OP-COMMERCIAL-V2-FINALIZATION-REVIEW-V1

## Status

REVIEW ONLY

NO RUNTIME CHANGES

NO IMPLEMENTATION

NO ARCHIVING

## Approval Matrix

| Card ID | Card Name | Decision | Approval Status | Rationale |
|---|---|---|---|---|
| CARD 001 | Commercial Registration | CHANGE | APPROVED_FOR_CHANGE | Current registration uses Email, Phone, Password; target is Phone, Password, Confirm Password. |
| CARD 002 | Authentication | KEEP | APPROVED_AS_ACTIVE_BASE | Authentication exists and supports owner access; must follow registration decision later. |
| CARD 003 | Business Card Core Information | KEEP | APPROVED_AS_ACTIVE_BASE | Core profile information is required for profile, CV, future card, and marketing assets. |
| CARD 004 | Optional Profile Fields | KEEP | APPROVED_AS_ACTIVE_BASE | Optional fields enrich profile and future campaign/discovery assets. |
| CARD 005 | Style Prompt Configuration | CHANGE | APPROVED_FOR_CHANGE | Current style configuration is partial/template-oriented; future behavior needs clearer generation role. |
| CARD 006 | Image Upload | CHANGE | APPROVED_FOR_FIX | Upload and profile display exist, but generated CV/PDF image issue requires correction. |
| CARD 007 | Profile Generation | KEEP | APPROVED_AS_ACTIVE_BASE | Draft/live profile and versioning are active core Commercial V2 behavior. |
| CARD 008 | CV Generation | CHANGE | APPROVED_FOR_FIX | CV generation exists partially; identity image display and package readiness need change. |
| CARD 009 | Business Card Generation | POSTPONE | APPROVED_FOR_FUTURE | Missing component; should follow registration/profile/CV/distribution stabilization. |
| CARD 010 | Promo Post Generation | POSTPONE | APPROVED_FOR_FUTURE | Missing component; depends on Marketing pipeline and asset package foundation. |
| CARD 011 | Preview System | KEEP | APPROVED_AS_ACTIVE_BASE | Preview system exists and supports pre-publication review. |
| CARD 012 | Submit For Distribution | CHANGE | APPROVED_FOR_CHANGE | Current publish creates live profile only; target requires asset/archive/marketing handoff. |
| CARD 013 | Commercial Asset Package | CHANGE | APPROVED_FOR_IMMEDIATE_SCOPE | Missing but required to connect Commercial V2 to Archive and Marketing pipeline. |
| CARD 014 | Commercial Signals | POSTPONE | APPROVED_FOR_FUTURE | Missing; important for aggregation and reporting, but can follow first distribution package. |

## Summary

KEEP: CARD 002, CARD 003, CARD 004, CARD 007, CARD 011

CHANGE: CARD 001, CARD 005, CARD 006, CARD 008, CARD 012, CARD 013

POSTPONE: CARD 009, CARD 010, CARD 014

REMOVE: None

