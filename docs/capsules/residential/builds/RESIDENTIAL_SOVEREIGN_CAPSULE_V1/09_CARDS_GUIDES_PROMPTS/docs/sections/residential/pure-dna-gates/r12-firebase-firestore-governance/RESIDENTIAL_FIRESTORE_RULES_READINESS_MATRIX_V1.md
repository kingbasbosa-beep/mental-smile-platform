# RESIDENTIAL_FIRESTORE_RULES_READINESS_MATRIX_V1

## Purpose

Define Firestore rules readiness for future Residential anonymous signal storage.

No Firestore rules are modified in R12.

## Rules Readiness Matrix

| Collection Candidate | Client Write | Server/Admin Write | Public Read | Owner Read | Required Rule |
|---|---|---|---|---|---|
| `residential_signal_events` | FUTURE_CONDITIONAL | YES | NO | YES | Strict schema allowlist, no identity fields |
| `residential_signal_aggregates` | NO | YES | NO | YES | Client write blocked |
| `residential_signal_archive_packages` | NO | YES | NO | YES | Archive writer only |
| `residential_strategic_summary_inputs` | NO | YES | NO | YES | Strategic service only |

## Minimum Future Rule Requirements

- deny unknown fields
- deny identity fields
- deny free-text user content
- deny image content and metadata
- validate signalCode format
- validate privacyClass
- validate retentionClass
- require timestamp
- require runtimeVersion

## R12 Decision

Rule modification required now: NO

Safe to defer rules: YES

Reason: no Firestore runtime connection exists in R12.

## Final Status

RESIDENTIAL_FIRESTORE_RULES_READINESS_MATRIX_CREATED
