# GLOBAL_ARCHIVE_PACKAGE_STORAGE_STANDARD_V1

Status: ACTIVE STORAGE STANDARD

## Storage Requirements

Every cross-section package stored behind a plug must be stored in Archive-owned storage and must include:

- Package ID
- Source section code
- Source outbox plug
- Archive destination code
- Destination section code
- Destination inbox plug
- Package family
- Magnet code
- Privacy class
- Retention class
- Audit trace ID
- Package history pointer
- Dispatch status

## Prohibited Storage Targets

| Target | Status |
|---|---|
| Source feature folder durable storage | PROHIBITED |
| Destination feature folder durable storage | PROHIBITED |
| Direct section-to-section Firestore target | PROHIBITED |
| Plug storage inside feature folders | PROHIBITED |
| Section-owned durable cross-section package storage | PROHIBITED |

FINAL STATUS: GLOBAL_ARCHIVE_PACKAGE_STORAGE_STANDARD_ACTIVE
