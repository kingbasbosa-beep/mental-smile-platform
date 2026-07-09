# RESIDENTIAL_SIGNAL_PAYLOAD_SCHEMA_V1

## Purpose

Define the local Residential signal payload schema used by R11.

## Required Payload Fields

| Field | Status | Notes |
|---|---|---|
| signalCode | REQUIRED | Certified R1/R2 code |
| signalFamily | REQUIRED | Certified R2 family |
| sourceSection | REQUIRED | Always Residential |
| sourceScreen | REQUIRED | Active screen name |
| sourceWidget | REQUIRED | UI action source |
| action | REQUIRED | Safe action descriptor |
| archiveMagnetCode | REQUIRED | R7 magnet |
| archiveDestination | REQUIRED | R7 archive destination |
| aggregationDestination | REQUIRED | R7 aggregation destination |
| strategicSummaryDestination | REQUIRED | R7 strategic summary |
| privacyClass | REQUIRED | R2 privacy class |
| retentionClass | REQUIRED | R2 retention class |
| timestamp | REQUIRED | UTC runtime timestamp |
| runtimeVersion | REQUIRED | `residential-r11-local-v1` |

## Prohibited Payload Fields

The R11 payload must not include:

- user identity
- email
- phone
- device ID
- IP address
- personal profile
- diagnosis
- free-text notebook content
- uploaded image bytes
- personal image metadata
- raw URL query data

## Privacy Classes Used

| Privacy Class | Usage |
|---|---|
| PUBLIC_UI_COUNT | UI/navigation/action counts |
| ACCESSIBILITY_USAGE | Accessibility icon/listening requests |
| EXTERNAL_DESTINATION | External channel or link opening class only |
| PRIVATE_LOCAL_UTILITY | Notebook/image local utility without content |
| SUPPORT_INTENT | Suggestion/support intent without submitted text |
| SAFETY_REVIEW | Complaint/support/error class without personal details |

## Final Status

RESIDENTIAL_SIGNAL_PAYLOAD_SCHEMA_CREATED
