# RESIDENTIAL_STORAGE_RULE_CARD_REGISTRY_V1

## Purpose

Register Storage rule cards for Residential signal readiness.

## Storage Rule Card Registry

| Storage Rule Card ID | Storage Use Case | Required for Signals | Future Eligible | Rule Needed Now | Decision | Status |
|---|---|---|---|---|---|---|
| SRC-001 | Signal event storage | NO | NO | NO | Use Firestore candidate only | NOT_REQUIRED |
| SRC-002 | Aggregated signal storage | NO | NO | NO | Use Firestore candidate only | NOT_REQUIRED |
| SRC-003 | Archive package files | NO | MAYBE | NO | Future archive writer decision | FUTURE_REVIEW |
| SRC-004 | Uploaded personal room images | NO | NO | NO | Must not be stored as signal data | PROHIBITED_FOR_SIGNALS |
| SRC-005 | Notebook content files | NO | NO | NO | Prohibited | PROHIBITED_FOR_SIGNALS |

## Validation

Every Storage rules candidate has card: YES

Missing Storage rule cards: 0

Storage rules modified: NO

## Final Status

RESIDENTIAL_STORAGE_RULE_CARD_REGISTRY_CREATED
