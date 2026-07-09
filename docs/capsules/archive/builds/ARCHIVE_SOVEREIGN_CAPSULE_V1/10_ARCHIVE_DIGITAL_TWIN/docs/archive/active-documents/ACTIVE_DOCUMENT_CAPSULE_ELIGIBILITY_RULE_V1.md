# ACTIVE_DOCUMENT_CAPSULE_ELIGIBILITY_RULE_V1

Status: ACTIVE_CURRENT

## Purpose

Define which documents future capsules may trust.

## Capsule Read Permission

Capsules may read only:

- `status = ACTIVE_CURRENT`
- `capsule_eligible = YES`

## Capsule Read Denial

Capsules may not read documents marked:

- `RETIRED`
- `HISTORICAL`
- `EVIDENCE_ONLY`
- `DRAFT`, unless explicitly approved
- `LEGACY`
- `PLACEHOLDER`

## Residential Capsule Source

Residential capsule source documents are listed in:

`residential/RESIDENTIAL_ACTIVE_DOCUMENTS_CAPSULE_SOURCE_MAP_V1.md`

FINAL STATUS: ACTIVE_DOCUMENT_CAPSULE_ELIGIBILITY_RULE_CREATED
