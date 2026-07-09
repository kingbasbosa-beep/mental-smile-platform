# RESIDENTIAL_FIRESTORE_RULE_CARD_REGISTRY_V1

## Purpose

Register Firestore rule cards for R12 collection candidates.

## Firestore Rule Card Registry

| Rule Card ID | Collection Candidate | Rule Purpose | Client Write | Server/Admin Write | Read Scope | Required Validation | Status |
|---|---|---|---|---|---|---|---|
| FRC-001 | `residential_signal_events` | Anonymous governed signal events | FUTURE_CONDITIONAL | YES | Owner / Monitoring / Strategic | Strict schema allowlist; no identity fields | READY_NOT_DEPLOYED |
| FRC-002 | `residential_signal_aggregates` | Aggregated signal counts | NO | YES | Owner / Strategic / Monitoring | Client write blocked; aggregate fields only | READY_NOT_DEPLOYED |
| FRC-003 | `residential_signal_archive_packages` | Archive-ready signal packages | NO | YES | Owner / Archive / Strategic | Archive writer only; no raw personal fields | READY_NOT_DEPLOYED |
| FRC-004 | `residential_strategic_summary_inputs` | Strategic summary inputs | NO | YES | Owner / Strategic | Strategic service only; no event identity | READY_NOT_DEPLOYED |

## Validation

Every Firebase/Firestore rule candidate has card: YES

Missing rule cards: 0

Firestore rules modified: NO

Rules deployed: NO

## Final Status

RESIDENTIAL_FIRESTORE_RULE_CARD_REGISTRY_CREATED
