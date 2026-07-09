# GLOBAL_SECTION_PACKAGE_CONTRACT_TEMPLATE_V1

Status: ACTIVE TEMPLATE

Use this template for every section-to-section package.

## Package Contract

| Field | Required | Notes |
|---|---|---|
| Package ID | YES | Stable unique package identity. |
| Package Version | YES | Versioned contract. |
| Source Section | YES | Origin section only. |
| Source Outbox | YES | Must be a governed outbox. |
| Destination Section | YES | Destination section only. |
| Destination Inbox | YES | Must be a governed inbox. |
| Package Type | YES | Example: publishing, archive, monitoring, report. |
| Package Purpose | YES | Why this package exists. |
| Routing Codes | YES | Codes used by destination internal network. |
| Allowed Fields | YES | Fields allowed to travel. |
| Blocked Fields | YES | Fields forbidden by privacy/governance. |
| Privacy Class | YES | Anonymous / operational / restricted. |
| Retention Class | YES | Temporary / operational / archive. |
| Archive Magnet | YES | Required for archival eligibility. |
| Owner | YES | Accountable owner. |
| Review Cycle | YES | Governance review interval. |
| Runtime Status | YES | Draft / Ready / Active / Retired. |

## Contract Rule

The package contract travels between sections. Internal section implementation details do not travel across the boundary.

FINAL STATUS: GLOBAL_SECTION_PACKAGE_CONTRACT_TEMPLATE_READY
