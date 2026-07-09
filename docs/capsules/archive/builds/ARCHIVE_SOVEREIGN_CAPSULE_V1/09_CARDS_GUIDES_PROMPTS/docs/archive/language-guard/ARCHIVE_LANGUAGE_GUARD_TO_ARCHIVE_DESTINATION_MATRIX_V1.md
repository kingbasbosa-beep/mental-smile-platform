# ARCHIVE_LANGUAGE_GUARD_TO_ARCHIVE_DESTINATION_MATRIX_V1

Status: ACTIVE GUARD TO DESTINATION MATRIX

## Purpose

Map guard outcomes to Archive destinations.

## Matrix

| Traffic Condition | Normal Destination Allowed | Quarantine Destination | Required Record |
|---|---|---|---|
| All grammar, language, namespace, plug, magnet, destination, privacy, retention, owner, summary, and dispatch checks pass. | Claimed Archive destination. | None. | Normal traffic card. |
| Any validation rule fails. | NO. | `ARC-ERR-LANG-001` | Quarantine record. |
| Route target detected. | NO. | `ARC-ERR-LANG-001` | Quarantine record and broken sentence report. |
| Screen target detected. | NO. | `ARC-ERR-LANG-001` | Quarantine record and broken sentence report. |
| Firestore collection target detected. | NO. | `ARC-ERR-LANG-001` | Quarantine record and broken sentence report. |
| Traffic skips Archive. | NO. | `ARC-ERR-LANG-001` | Quarantine record and broken sentence report. |
| Traffic skips Magnet. | NO. | `ARC-ERR-LANG-001` | Quarantine record and broken sentence report. |

## Destination Rule

`ARC-ERR-LANG-001` is the only valid Archive destination for failed guard traffic.

FINAL STATUS: ARCHIVE_LANGUAGE_GUARD_TO_ARCHIVE_DESTINATION_MATRIX_COMPLETE
