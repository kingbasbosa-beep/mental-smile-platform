# ARCHIVE_LANGUAGE_VALIDATION_RULES_V1

Status: ACTIVE VALIDATION RULES

## Purpose

Define the Archive Language Guard rejection rules. Any failure rejects the object from normal flow and sends it to `ARC-ERR-LANG-001`.

## Validation Rules

| Rule ID | Reject Or Quarantine If | Alarm Code |
|---|---|---|
| `ALG-RULE-001` | Unknown section code. | `LANG-ERR-UNKNOWN-SECTION` |
| `ALG-RULE-002` | Unknown plug code. | `LANG-ERR-UNKNOWN-PLUG` |
| `ALG-RULE-003` | Source outbox mismatch. | `LANG-ERR-OUTBOX-MISMATCH` |
| `ALG-RULE-004` | Destination inbox mismatch. | `LANG-ERR-INBOX-MISMATCH` |
| `ALG-RULE-005` | Unknown archive destination code. | `LANG-ERR-UNKNOWN-DESTINATION` |
| `ALG-RULE-006` | Unknown namespace. | `LANG-ERR-UNKNOWN-NAMESPACE` |
| `ALG-RULE-007` | Magnet does not match destination. | `LANG-ERR-MAGNET-MISMATCH` |
| `ALG-RULE-008` | Package family not accepted by destination. | `LANG-ERR-PACKAGE-FAMILY-MISMATCH` |
| `ALG-RULE-009` | Signal family not accepted by destination. | `LANG-ERR-SIGNAL-FAMILY-MISMATCH` |
| `ALG-RULE-010` | Privacy class missing. | `LANG-ERR-MISSING-PRIVACY` |
| `ALG-RULE-011` | Retention class missing. | `LANG-ERR-MISSING-RETENTION` |
| `ALG-RULE-012` | Owner missing. | `LANG-ERR-MISSING-OWNER` |
| `ALG-RULE-013` | Summary missing original archive destination code. | `LANG-ERR-SUMMARY-TRACE-FAIL` |
| `ALG-RULE-014` | Dispatch missing destination inbox. | `LANG-ERR-DISPATCH-INBOX-MISSING` |
| `ALG-RULE-015` | Route used as package target. | `LANG-ERR-ROUTE-AS-TARGET` |
| `ALG-RULE-016` | Screen used as package target. | `LANG-ERR-SCREEN-AS-TARGET` |
| `ALG-RULE-017` | Firestore collection used as package target. | `LANG-ERR-COLLECTION-AS-TARGET` |
| `ALG-RULE-018` | Direct section-to-section target detected. | `LANG-ERR-DIRECT-SECTION-TARGET` |
| `ALG-RULE-019` | Traffic sentence skips Archive. | `LANG-ERR-SKIPS-ARCHIVE` |
| `ALG-RULE-020` | Traffic sentence skips Magnet. | `LANG-ERR-SKIPS-MAGNET` |

## Validation Outcome

Pass: traffic may continue only when every required grammar field, language rule, namespace rule, plug rule, magnet rule, and destination rule passes.

Fail: traffic is rejected from normal flow and recorded in Archive Language Quarantine.

FINAL STATUS: ARCHIVE_LANGUAGE_VALIDATION_RULES_COMPLETE
