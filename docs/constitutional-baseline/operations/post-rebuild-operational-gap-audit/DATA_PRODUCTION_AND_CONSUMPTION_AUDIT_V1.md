# Data Production And Consumption Audit V1

## Operation

OP-POST-REBUILD-OPERATIONAL-GAP-AUDIT-V1

## Status

FORENSIC AUDIT ONLY

## Legend

YES = observed active support.

NO = not observed.

PARTIAL = some support observed but incomplete or disconnected.

DOCUMENTATION ONLY = documented but no active executable support observed.

## Department And Section Matrix

| Department / Section | Produces Data | Consumes Data | Produces Reports | Consumes Reports | Produces Summaries | Consumes Summaries | Produces Intelligence | Consumes Intelligence | Produces Strategic Inputs | Consumes Strategic Outputs |
|---|---|---|---|---|---|---|---|---|---|---|
| Archive | DOCUMENTATION ONLY | PARTIAL | DOCUMENTATION ONLY | YES | NO | PARTIAL | NO | YES | NO | PARTIAL |
| Administrative Rebirth | NO | NO | DOCUMENTATION ONLY | NO | NO | NO | NO | NO | NO | NO |
| Strategic Planning and Intelligence | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | NO |
| Owner | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | DOCUMENTATION ONLY | NO | DOCUMENTATION ONLY | NO | DOCUMENTATION ONLY | NO | DOCUMENTATION ONLY |
| Residential | PARTIAL | PARTIAL | DOCUMENTATION ONLY | NO | DOCUMENTATION ONLY | NO | NO | NO | DOCUMENTATION ONLY | NO |
| Commercial | YES | YES | PARTIAL | NO | PARTIAL | NO | PARTIAL | NO | PARTIAL | NO |
| Marketing | NO | NO | NO | NO | NO | NO | NO | NO | NO | NO |
| Legal | NO | NO | NO | NO | NO | NO | NO | NO | NO | NO |
| Accounting | NO | NO | NO | NO | NO | NO | NO | NO | NO | NO |
| Technical Operations | NO | PARTIAL | NO | NO | NO | NO | NO | PARTIAL | NO | NO |
| Monitoring | PARTIAL | YES | PARTIAL | NO | PARTIAL | YES | PARTIAL | NO | PARTIAL | NO |

## Evidence Notes

- Residential has documented aggregation and active residential/monitoring code, but no confirmed live Residential Summary Package production.
- Commercial V2 produces actual profile data through `commercial_v2_profiles`, but its signal and aggregation layer is disconnected.
- Monitoring contains builders, registries, routers, and models for Residential and Commercial monitoring, but connection to Strategic Planning and Intelligence is not active.
- Strategic Planning and Intelligence has intake, classification, analysis, and report generation documents, but no executable processing code.
- Owner and Archive destinations exist as documents, not active delivery systems.

