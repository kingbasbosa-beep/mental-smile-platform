# RESIDENTIAL_FIRESTORE_SIGNAL_DOCUMENT_SCHEMA_V1

## Purpose

Define the future Firestore document shape for Residential anonymous signal events.

No Firestore document is created in R12.

## Candidate Event Document Shape

```json
{
  "signalCode": "R.B.001.TAP",
  "signalFamily": "Button Intent",
  "sourceSection": "Residential",
  "sourceScreen": "Splash",
  "sourceWidget": "QuickAccessButton",
  "action": "navigate_client_room",
  "archiveMagnetCode": "RB20",
  "archiveDestination": "Button Intent Signals",
  "aggregationDestination": "Residential Button Intent Aggregation",
  "strategicSummaryDestination": "Residential Intent Summary",
  "privacyClass": "PUBLIC_UI_COUNT",
  "retentionClass": "STANDARD_OPERATIONAL",
  "timestamp": "server timestamp or trusted UTC",
  "runtimeVersion": "residential-r11-local-v1"
}
```

## Required Validation

Future Firestore write rules or server validation must:

- require all approved fields
- reject unknown fields
- reject identity fields
- reject free-text content fields
- reject image fields
- reject device/IP fields
- require known signal code prefix
- require approved privacy class
- require approved retention class

## Blocked Field List

- uid
- userId
- accountId
- email
- phone
- ip
- ipAddress
- deviceId
- installationId
- diagnosis
- symptomText
- notebookText
- suggestionText
- checkinAnswers
- imageBytes
- imageUrl
- imagePath
- imageMetadata
- profile

## Final Status

RESIDENTIAL_FIRESTORE_SIGNAL_DOCUMENT_SCHEMA_CREATED
