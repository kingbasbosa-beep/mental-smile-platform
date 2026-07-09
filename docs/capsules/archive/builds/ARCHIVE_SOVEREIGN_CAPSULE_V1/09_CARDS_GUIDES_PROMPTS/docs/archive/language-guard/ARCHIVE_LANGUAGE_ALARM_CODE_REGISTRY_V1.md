# ARCHIVE_LANGUAGE_ALARM_CODE_REGISTRY_V1

Status: ACTIVE ALARM CODE REGISTRY

## Purpose

Register every alarm code emitted by the Archive Language Guard when traffic violates Archive Grammar, Language Rules, Namespace Rules, Plug Rules, Magnet Rules, or Destination Rules.

## Alarm Codes

| Alarm Code | Default Severity | Trigger | Required Action |
|---|---|---|---|
| `LANG-ERR-UNKNOWN-SECTION` | `ERROR` | Source section code is not registered. | Quarantine and request section code correction. |
| `LANG-ERR-UNKNOWN-PLUG` | `ERROR` | Source outbox or destination inbox plug code is not registered. | Quarantine and request plug registry correction. |
| `LANG-ERR-OUTBOX-MISMATCH` | `BLOCKING` | Source section does not own the stated outbox plug. | Quarantine and correct source/outbox pair. |
| `LANG-ERR-INBOX-MISMATCH` | `BLOCKING` | Destination section does not own the stated inbox plug. | Quarantine and correct destination/inbox pair. |
| `LANG-ERR-UNKNOWN-DESTINATION` | `ERROR` | Archive destination code is not registered. | Quarantine and select a valid Archive destination. |
| `LANG-ERR-UNKNOWN-NAMESPACE` | `ERROR` | Namespace is unknown or outside Archive language. | Quarantine and map to a governed namespace. |
| `LANG-ERR-MAGNET-MISMATCH` | `BLOCKING` | Magnet code does not match attempted Archive destination. | Quarantine and select matching magnet or destination. |
| `LANG-ERR-PACKAGE-FAMILY-MISMATCH` | `ERROR` | Package family is not accepted by attempted destination. | Quarantine and route to an accepting destination. |
| `LANG-ERR-SIGNAL-FAMILY-MISMATCH` | `ERROR` | Signal family is not accepted by attempted destination. | Quarantine and route to an accepting destination. |
| `LANG-ERR-MISSING-PRIVACY` | `BLOCKING` | Privacy class is missing. | Quarantine until privacy class is assigned. |
| `LANG-ERR-MISSING-RETENTION` | `BLOCKING` | Retention class is missing. | Quarantine until retention class is assigned. |
| `LANG-ERR-MISSING-OWNER` | `BLOCKING` | Owner is missing. | Quarantine until review owner is assigned. |
| `LANG-ERR-SUMMARY-TRACE-FAIL` | `BLOCKING` | Summary lacks original Archive destination code. | Quarantine and restore traceability. |
| `LANG-ERR-DISPATCH-INBOX-MISSING` | `ERROR` | Dispatch lacks destination inbox. | Quarantine and assign destination inbox. |
| `LANG-ERR-ROUTE-AS-TARGET` | `SECURITY` | Package target is a route. | Quarantine and replace with Archive destination code. |
| `LANG-ERR-SCREEN-AS-TARGET` | `SECURITY` | Package target is a screen. | Quarantine and replace with Archive destination code. |
| `LANG-ERR-COLLECTION-AS-TARGET` | `SECURITY` | Package target is a Firestore collection. | Quarantine and replace with Archive destination code. |
| `LANG-ERR-DIRECT-SECTION-TARGET` | `SECURITY` | Traffic attempts section-to-section delivery without Archive destination. | Quarantine and rebuild sentence through Archive. |
| `LANG-ERR-SKIPS-ARCHIVE` | `SECURITY` | Traffic sentence skips Archive. | Quarantine and rebuild full grammar path. |
| `LANG-ERR-SKIPS-MAGNET` | `BLOCKING` | Traffic sentence skips Magnet. | Quarantine and assign matching magnet. |

## Registry Rule

Unknown alarm codes are invalid. Every rejected traffic unit must use one or more codes from this registry.

FINAL STATUS: ARCHIVE_LANGUAGE_ALARM_CODE_REGISTRY_COMPLETE
