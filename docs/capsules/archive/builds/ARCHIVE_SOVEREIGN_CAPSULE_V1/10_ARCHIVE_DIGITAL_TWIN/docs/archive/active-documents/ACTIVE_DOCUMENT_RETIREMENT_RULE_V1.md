# ACTIVE_DOCUMENT_RETIREMENT_RULE_V1

Status: ACTIVE_CURRENT

## Purpose

Define how active documents leave current truth.

## Retirement Triggers

A document becomes retired when:

- it is replaced by a newer approved version
- it no longer describes active runtime or active governance
- it points to removed runtime
- it becomes historical evidence only
- Owner removes capsule eligibility

## Required Retirement Fields

| Field | Required Value |
|---|---|
| `status` | `RETIRED` |
| `retirement_date` | filled with approved date |
| `superseded_by` | replacement code or `NONE` |
| `capsule_eligible` | `NO` |

## Historical Evidence Rule

Retired documents may remain as evidence, but they must not be used by capsule generation as active truth.

FINAL STATUS: ACTIVE_DOCUMENT_RETIREMENT_RULE_CREATED
