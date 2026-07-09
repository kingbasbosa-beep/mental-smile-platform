# Archive Runtime Guard Alarm Matrix V1

Status: ACTIVE READINESS MATRIX
Date: 2026-07-02

## Alarm Mapping

| Runtime Condition | Alarm Code | Source | Output State |
|---|---|---|---|
| Unknown section code | `LANG-ERR-UNKNOWN-SECTION` | A3 existing | `NEEDS_CODE` |
| Unknown plug code | `LANG-ERR-UNKNOWN-PLUG` | A3 existing | `NEEDS_CODE` |
| Unknown code | `LANG-ERR-UNKNOWN-CODE` | RUN-4 readiness addition | `NEEDS_CODE` |
| Missing destination | `LANG-ERR-DESTINATION-MISSING` | RUN-4 readiness addition | `REJECTED` |
| Unknown destination | `LANG-ERR-UNKNOWN-DESTINATION` | A3 existing | `REJECTED` |
| Magnet mismatch | `LANG-ERR-MAGNET-MISMATCH` | A3 existing | `QUARANTINED` |
| Payload shape mismatch | `LANG-ERR-PAYLOAD-SHAPE` | RUN-4 readiness addition | `REJECTED` |
| Privacy missing | `LANG-ERR-MISSING-PRIVACY` | A3 existing | `REJECTED` |
| Privacy mismatch | `LANG-ERR-PRIVACY-MISSING` | RUN-4 readiness alias | `REJECTED` |
| Retention missing | `LANG-ERR-MISSING-RETENTION` | A3 existing | `REJECTED` |
| Retention mismatch | `LANG-ERR-RETENTION-MISSING` | RUN-4 readiness alias | `REJECTED` |
| Identity leakage | `LANG-ERR-IDENTITY-LEAKAGE` | RUN-4 readiness addition | `SECURITY_BLOCKED` |
| Philosophical noise | `LANG-ERR-PHILOSOPHICAL-NOISE` | RUN-4 readiness addition | `OWNER_REVIEW` |
| Uncoded object | `LANG-ERR-UNCODED-OBJECT` | RUN-4 readiness addition | `NEEDS_CODE` |
| Route used as target | `LANG-ERR-ROUTE-AS-TARGET` | A3 existing | `SECURITY_BLOCKED` |
| Screen used as target | `LANG-ERR-SCREEN-AS-TARGET` | A3 existing | `SECURITY_BLOCKED` |
| Firestore collection used as target | `LANG-ERR-COLLECTION-AS-TARGET` | A3 existing | `SECURITY_BLOCKED` |
| Direct section target | `LANG-ERR-DIRECT-SECTION-TARGET` | A3 existing | `SECURITY_BLOCKED` |
| Skips Archive | `LANG-ERR-SKIPS-ARCHIVE` | A3 existing | `SECURITY_BLOCKED` |
| Skips Magnet | `LANG-ERR-SKIPS-MAGNET` | A3 existing | `QUARANTINED` |

## Missing Alarm Mappings

0

