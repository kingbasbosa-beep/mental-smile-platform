# COMMERCIAL_V2_PACKAGE_CONTRACT_V1

Status: FOUNDATION PACKAGE CONTRACT

## Required Package Fields

| Field | Required | Notes |
|---|---|---|
| `source_section_code` | YES | Must be `SEC-CV2` for outgoing CV2 packages. |
| `source_outbox_plug` | YES | Must be `PLG-CV2-OUT` for outgoing CV2 packages. |
| `destination_section_code` | YES | Destination section code. |
| `destination_inbox_plug` | YES | Destination inbox plug. |
| `destination_code` | YES | Destination inbox code. |
| `package_family` | YES | Registration / generation / publishing dispatch. |
| `primary_specialty_code` | YES when provider identity is included | Identity only. |
| `display_section_codes` | YES when display routing is included | Routing only. |
| `magnet_code` | YES | Archive/routing magnet. |
| `internal_distribution_code` | YES | Destination-owned routing hint. |
| `privacy_class` | YES | Privacy classification. |
| `retention_class` | YES | Retention classification. |

## Prohibited Fields

- Direct route path as package destination
- Direct Library screen reference
- Direct Firestore collection target
- Identity overwrite instructions
- Unapproved publishing instruction

FINAL STATUS: COMMERCIAL_V2_PACKAGE_CONTRACT_READY
