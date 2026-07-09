# RESIDENTIAL_STORAGE_RULES_READINESS_MATRIX_V1

## Purpose

Define whether Firebase Storage is required for Residential runtime signals.

## Decision

Residential anonymous signal packages do not require Firebase Storage.

## Storage Readiness Matrix

| Storage Use Case | Required for R12 | Future Eligible | Rule Needed Now | Decision |
|---|---|---|---|---|
| Signal event storage | NO | NO | NO | Use Firestore candidate only |
| Aggregated signal storage | NO | NO | NO | Use Firestore candidate only |
| Archive package files | NO | MAYBE | NO | Future archive writer decision |
| Uploaded personal room images | NO | NO | NO | Must not be stored as signal data |
| Notebook content files | NO | NO | NO | Prohibited |

## Storage Privacy Rule

Residential signal runtime must not upload:

- image bytes
- image metadata
- notebook text
- suggestion text
- check-in answers
- diagnosis data

## R12 Decision

Storage rules modification required now: NO

Storage changed: NO

## Final Status

RESIDENTIAL_STORAGE_RULES_READINESS_MATRIX_CREATED
