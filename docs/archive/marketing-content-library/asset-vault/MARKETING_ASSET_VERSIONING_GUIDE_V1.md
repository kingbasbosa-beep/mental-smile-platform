# Marketing Asset Versioning Guide V1

Operation ID: OP-ARCHIVE-MARKETING-ASSET-VAULT-FOUNDATION-V1  
Date: 2026-06-25

## Purpose

This guide defines how Marketing Asset Vault versions should be preserved.

## Version Rules

Each source asset must have a version.

The active version must be clearly marked.

Previous versions must remain archived.

Replacement requires a new operation record.

Runtime deployment copies must reference the active approved source version where possible.

## Version Fields

- Asset ID
- Version
- Source Path
- Runtime Copy Path
- Status
- Created Date
- Last Updated
- Replaced By
- Replacement Reason
- Related Operation

## Replacement Flow

Owner approves replacement.

Archive registers new source version.

Asset card records replacement history.

Registry marks previous version as replaced.

Technical receives a new deployment copy.

Runtime uses deployment copy only.

## Prohibited Versioning Behavior

Do not overwrite an existing source asset silently.

Do not treat runtime assets as source versions.

Do not delete old versions as part of normal replacement.
