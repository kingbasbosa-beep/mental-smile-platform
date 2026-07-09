# ACTIVE_DOCUMENT_VERSION_REGISTRY_V1

Status: ACTIVE_CURRENT

## Purpose

Define version status for active documents.

## Version Rule

`V1` is active until an approved replacement is registered with:

- a new document code or version
- `status = ACTIVE_CURRENT`
- capsule eligibility transferred
- prior document retired

## Current Version Matrix

| Section Code | Document Family | Current Version | Status |
|---|---|---|---|
| `SEC-RES` | Residential capsule index snapshots | `V1` | ACTIVE_CURRENT |

## Supersession Rule

When a replacement is approved, the old entry must set:

- `status = RETIRED`
- `retirement_date`
- `superseded_by`
- `capsule_eligible = NO`

FINAL STATUS: ACTIVE_DOCUMENT_VERSION_REGISTRY_CREATED
