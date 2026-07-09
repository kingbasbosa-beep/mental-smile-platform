# ACTIVE_DOCUMENT_CODE_REGISTRY_V1

Status: ACTIVE_CURRENT

## Purpose

Register approved document codes used by the Active Documents Archive.

## Code Pattern

| Code Family | Meaning | Example |
|---|---|---|
| `RESIDENTIAL_*_V1` | Residential active capsule index document | `RESIDENTIAL_ROUTE_SNAPSHOT_V1` |

## Active Code Sources

| Section Code | Code Source | Registry | Status |
|---|---|---|---|
| `SEC-RES` | Residential capsule index snapshots | `residential/RESIDENTIAL_ACTIVE_DOCUMENTS_REGISTRY_V1.md` | ACTIVE_CURRENT |

## Required Fields

Every active document entry must include:

- `document_code`
- `document_title`
- `version`
- `approval_date`
- `source_path`
- `archive_active_path`
- `section_code`
- `owner`
- `status`
- `supersedes`
- `superseded_by`
- `retirement_date`
- `capsule_eligible`
- `certificate_reference`

## Validation

Missing codes: 0

FINAL STATUS: ACTIVE_DOCUMENT_CODE_REGISTRY_CREATED
