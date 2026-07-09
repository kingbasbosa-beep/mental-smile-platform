# GLOBAL_PACKAGE_ADDRESSING_STANDARD_V1

Status: ACTIVE GLOBAL STANDARD

## Required Address Fields

Every cross-section package must carry:

| Field | Required | Purpose |
|---|---|---|
| `source_section_code` | YES | Source section identity. |
| `source_outbox_plug` | YES | Governed outbox used by source. |
| `destination_section_code` | YES | Destination section identity. |
| `destination_inbox_plug` | YES | Governed inbox used by destination. |
| `destination_code` | YES | Package destination code. |
| `package_family` | YES | Package family/type. |
| `magnet_code` | YES | Archive or routing magnet. |
| `internal_distribution_code` | YES | Destination-owned internal routing code. |
| `privacy_class` | YES | Privacy boundary. |
| `retention_class` | YES | Retention boundary. |

## Addressing Prohibitions

| Target Type | Allowed? |
|---|---|
| Screen directly | NO |
| Route directly | NO |
| Collection directly | NO |
| Another section internal network directly | NO |
| Destination inbox plug | YES |

FINAL STATUS: GLOBAL_PACKAGE_ADDRESSING_STANDARD_ACTIVE
