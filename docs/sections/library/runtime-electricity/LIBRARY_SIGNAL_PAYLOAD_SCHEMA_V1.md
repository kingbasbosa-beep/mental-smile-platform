# LIBRARY_SIGNAL_PAYLOAD_SCHEMA_V1

Status: ACTIVE

Required payload fields:

- `signalCode`
- `signalFamily`
- `sourceSection`
- `sourceScreen`
- `sourceWidget`
- `action`
- `archiveMagnetCode`
- `archiveDestination`
- `aggregationDestination`
- `strategicSummaryDestination`
- `privacyClass`
- `retentionClass`
- `timestamp`
- `runtimeVersion`

Blocked fields:

- uid
- email
- phone
- IP address
- device identifier
- personal profile fields
- diagnosis
- free-text registration data
- uploaded image bytes
- uploaded document bytes
- provider/center private identity metadata

Runtime schema file:

- `lib/features/library/signals/library_signal_payload.dart`

Privacy model:

Library signals are public discovery and intent signals only. They describe UI demand and feature interaction, not personal identity.
