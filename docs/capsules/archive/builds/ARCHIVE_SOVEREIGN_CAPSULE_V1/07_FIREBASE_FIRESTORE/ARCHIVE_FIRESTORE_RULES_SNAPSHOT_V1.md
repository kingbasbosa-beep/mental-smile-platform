# ARCHIVE_FIRESTORE_RULES_SNAPSHOT_V1

| Collection | Owner | Purpose | Status |
|---|---|---|---|
| archive_signal_events | SEC-ARC | Governed anonymous signal event intake | ACTIVE |

Rules summary: create only for exact governed signal packages; reads restricted to Owner or Monitoring operator; updates denied; deletes denied; unknown collections denied; identity fields absent from allowed keys; payload_minimal limited to source_screen, source_widget, action, runtime_version.

Active branches: firstControlledArchiveSignalValid, firstResidentialToolArchiveSignalValid, firstLibraryHomeSignalValid, firstLibrarySpecialistsSignalValid, firstLibraryCentersSignalValid.

Firestore modified by capsule: NO
Rules broadened by capsule: NO
Deployment performed by capsule: NO

FINAL STATUS: ARCHIVE_FIRESTORE_RULES_SNAPSHOT_CREATED

