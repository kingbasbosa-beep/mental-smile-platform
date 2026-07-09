# COMMERCIAL_V2_PACKAGE_CONNECTION_MATRIX_V1

Status: FINAL PACKAGE CONNECTION MATRIX

## Package Families

| Package Family | Source Section | Source Outbox | Destination Section | Destination Inbox | Destination Code | Archive Destination Code | Required Fields | Allowed Display Section Codes | Primary Specialty Rule | Privacy Class | Retention Class | Runtime Status |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Registration Package | `SEC-CV2` | `PLG-CV2-OUT` | `SEC-ARC` | `PLG-ARC-IN` | `DST-ARC-INBOX` | `ARC-PKG-CV2-001` | Provider identity, primary specialty, display sections, package metadata | `DSP-LIBRARY`, `DSP-SPECIALISTS`, `DSP-CENTERS` | Preserved as identity | governed_provider_package | archive_ready | BUILDER_READY_NOT_DISPATCHED |
| Publishing Package | `SEC-CV2` | `PLG-CV2-OUT` | `SEC-ARC` | `PLG-ARC-IN` | `DST-ARC-INBOX` | `ARC-PUB-CV2-001` | Generated output metadata, display codes, approval state | `DSP-LIBRARY`, `DSP-SPECIALISTS`, `DSP-CENTERS` | Preserved as identity | governed_publishing_package | archive_ready | BUILDER_READY_NOT_DISPATCHED |
| Provider Publishing Queue Package | `SEC-CV2` | `PLG-CV2-OUT` | `SEC-ARC` | `PLG-ARC-IN` | `DST-ARC-INBOX` | `ARC-PUB-PROV-001` | Provider package metadata, publishing queue metadata | `DSP-LIBRARY`, `DSP-SPECIALISTS`, `DSP-CENTERS` | Preserved as identity | governed_publishing_package | archive_ready | BUILDER_READY_NOT_DISPATCHED |

## Validation

Broken package addresses: 0

Direct Library destination: NO

Direct Publishing destination: NO

Direct Firestore destination: NO

FINAL STATUS: COMMERCIAL_V2_PACKAGE_CONNECTION_MATRIX_COMPLETE
