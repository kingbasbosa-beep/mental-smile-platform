# RESIDENTIAL_FIRESTORE_COLLECTION_CANDIDATE_CARDS_V1

## Purpose

Define future Firestore collection candidates for Residential anonymous signals.

No collection is created by R12.

## Collection Candidate 1

### Collection

`residential_signal_events`

### Purpose

Store individual anonymous governed signal packages.

### Allowed Fields

- signalCode
- signalFamily
- sourceSection
- sourceScreen
- sourceWidget
- action
- archiveMagnetCode
- archiveDestination
- aggregationDestination
- strategicSummaryDestination
- privacyClass
- retentionClass
- timestamp
- runtimeVersion

### Blocked Fields

- uid
- email
- phone
- IP
- device identifier
- diagnosis
- notebook free text
- uploaded image content
- personal image metadata
- suggestion text
- check-in answers

### Write Source

Future ResidentialSignalEmitter / approved server-side relay only.

### Read Scope

Owner / Monitoring / Strategic summaries only.

### Retention

STANDARD_OPERATIONAL or REVIEW_REQUIRED according to payload class.

### Rules Requirement

Anonymous writes must allow only strict schema validation.

No arbitrary fields.

No personal identity fields.

### Archive Destination

Signal-family archive destinations from R7.

### Strategic Destination

Strategic summary destinations from R7.

### Owner

Residential / Governance Owner.

---

## Collection Candidate 2

### Collection

`residential_signal_aggregates`

### Purpose

Store aggregated counts by signal family, date bucket, archive magnet and strategic destination.

### Allowed Fields

- signalFamily
- signalCode
- archiveMagnetCode
- aggregationDestination
- strategicSummaryDestination
- count
- period
- generatedAt
- runtimeVersion

### Blocked Fields

All identity and raw content fields.

### Write Source

Future aggregation service only.

### Read Scope

Owner / Strategic / Monitoring dashboards.

### Retention

STRATEGIC_SUMMARY_ONLY or STANDARD_OPERATIONAL.

### Rules Requirement

Client writes should be blocked unless explicitly approved.

### Archive Destination

Residential aggregation archive.

### Strategic Destination

Residential strategic summaries.

### Owner

Strategic / Monitoring Owner.

---

## Collection Candidate 3

### Collection

`residential_signal_archive_packages`

### Purpose

Store approved archive-ready signal packages.

### Allowed Fields

- packageId
- signalFamilies
- archiveMagnetCodes
- archiveDestination
- aggregationSummary
- strategicSummaryDestination
- period
- createdAt
- approvedByRole
- runtimeVersion

### Blocked Fields

All user identity, raw text, image and diagnosis fields.

### Write Source

Future archive writer only.

### Read Scope

Owner / Archive / Strategic governance.

### Retention

ARCHIVE_GOVERNED.

### Rules Requirement

Direct client write should be blocked.

### Archive Destination

Residential archive vault.

### Strategic Destination

Owner archive and strategic review.

### Owner

Archive Owner.

---

## Collection Candidate 4

### Collection

`residential_strategic_summary_inputs`

### Purpose

Store anonymized strategic summary inputs generated from Residential aggregated signals.

### Allowed Fields

- summaryInputId
- strategicSummaryDestination
- signalFamilies
- period
- aggregateFindings
- ownerVisibility
- reportEligibility
- createdAt
- runtimeVersion

### Blocked Fields

All individual event identity, personal text, raw notebook data, image data and diagnosis fields.

### Write Source

Future strategic summary service only.

### Read Scope

Owner / Strategic only.

### Retention

STRATEGIC_SUMMARY_ONLY.

### Rules Requirement

Direct client write should be blocked.

### Archive Destination

Strategic summary input archive.

### Strategic Destination

Residential strategic reporting.

### Owner

Strategic Owner.

## Final Status

RESIDENTIAL_FIRESTORE_COLLECTION_CANDIDATE_CARDS_CREATED
