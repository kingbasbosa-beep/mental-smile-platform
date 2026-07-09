# Global First Language Guard Runtime Plan V1

Status: GUARD_RUNTIME_PLAN_READY
Runtime effect: none

## Source Governance

This plan depends on the Archive Language Guard foundation:

- `docs/archive/language-guard/ARCHIVE_LANGUAGE_GUARD_GUIDE_V1.md`
- `docs/archive/language-guard/ARCHIVE_LANGUAGE_VALIDATION_RULES_V1.md`
- `docs/archive/language-guard/ARCHIVE_LANGUAGE_ALARM_CODE_REGISTRY_V1.md`
- `docs/archive/language-guard/ARCHIVE_LANGUAGE_QUARANTINE_DESTINATION_CARD_V1.md`

## First Runtime Guard Checks

The first signal object must be rejected or quarantined if any of these fail:

- Unknown section code
- Unknown plug code
- Source outbox mismatch
- Destination inbox mismatch
- Unknown archive destination code
- Unknown namespace
- Magnet does not match destination
- Signal family not accepted by destination
- Privacy class missing
- Retention class missing
- Owner missing when required by object type
- Route used as package target
- Screen used as package target
- Firestore collection used as package target
- Direct section-to-section target detected
- Traffic sentence skips Archive
- Traffic sentence skips Magnet

## First Alarm Candidates

| Failure | Alarm Code |
| --- | --- |
| Wrong source section | `LANG-ERR-UNKNOWN-SECTION` |
| Wrong outbox | `LANG-ERR-OUTBOX-MISMATCH` |
| Wrong destination inbox | `LANG-ERR-INBOX-MISMATCH` |
| Unknown destination | `LANG-ERR-UNKNOWN-DESTINATION` |
| Magnet mismatch | `LANG-ERR-MAGNET-MISMATCH` |
| Missing privacy | `LANG-ERR-MISSING-PRIVACY` |
| Missing retention | `LANG-ERR-MISSING-RETENTION` |
| Direct target | `LANG-ERR-DIRECT-SECTION-TARGET` |
| Skips Archive | `LANG-ERR-SKIPS-ARCHIVE` |
| Skips Magnet | `LANG-ERR-SKIPS-MAGNET` |

## Quarantine Destination

Quarantine destination:

```text
Archive Language Quarantine
ARC-ERR-LANG-001
archive_language_quarantine
```

