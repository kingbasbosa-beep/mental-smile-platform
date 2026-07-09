# ACTIVE_DOCUMENTS_ARCHIVE_GUIDE_V1

Status: ACTIVE_CURRENT

## Purpose

Define the Archive location that identifies which documents are current approved truth for future capsule work.

This guide does not copy source files and does not create capsules. It registers trusted document references.

## Active Documents Section

Root: `docs/archive/active-documents/`

Residential section: `docs/archive/active-documents/residential/`

## Authority Rule

Only documents registered as:

- `status = ACTIVE_CURRENT`
- `capsule_eligible = YES`

may be treated as current capsule source truth.

## Excluded From Active Truth

- `RETIRED`
- `HISTORICAL`
- `EVIDENCE_ONLY`
- `DRAFT`, unless explicitly approved in a later rule
- legacy cleanup reports unless marked as evidence only
- obsolete doctrine
- placeholder documents

## Current Registered Section

| Section | Section Code | Registry | Status |
|---|---|---|---|
| Residential | `SEC-RES` | `residential/RESIDENTIAL_ACTIVE_DOCUMENTS_REGISTRY_V1.md` | ACTIVE_CURRENT |

## Owner Notes

This registry is a trust lock, not a content archive. Current capsule builders should follow registry pointers to source documents and should not scan old documentation as active truth.

FINAL STATUS: ACTIVE_DOCUMENTS_ARCHIVE_GUIDE_CREATED
