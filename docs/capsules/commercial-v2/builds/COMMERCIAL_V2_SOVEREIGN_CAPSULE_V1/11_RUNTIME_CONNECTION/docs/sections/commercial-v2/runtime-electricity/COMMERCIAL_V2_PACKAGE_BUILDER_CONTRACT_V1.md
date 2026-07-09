# COMMERCIAL_V2_PACKAGE_BUILDER_CONTRACT_V1

Status: RETIRED_FROM_ACTIVE_RUNTIME

Runtime File:

`lib/features/commercial_v2_web/signals/commercial_v2_package_builder.dart`

Runtime File Status:

REMOVED_DURING_PLATFORM_RUNTIME_PURIFICATION

## Builder Scope

The package builder may construct package-shaped objects only.

It must not:

- write to Firebase
- write to Firestore
- send network requests
- call Archive runtime
- call Library runtime
- call Publishing runtime

## Required Outgoing Address

| Field | Value |
|---|---|
| `source_section_code` | `SEC-CV2` |
| `source_outbox_plug` | `PLG-CV2-OUT` |
| `destination_section_code` | `SEC-ARC` |
| `destination_inbox_plug` | `PLG-ARC-IN` |

## Payload Fields

- `package_id`
- `source_section_code`
- `source_outbox_plug`
- `destination_section_code`
- `destination_inbox_plug`
- `destination_code`
- `archive_destination_code`
- `package_family`
- `primary_specialty_code`
- `display_section_codes`
- `magnet_code`
- `internal_distribution_code`
- `privacy_class`
- `retention_class`
- `created_at`

FINAL STATUS: COMMERCIAL_V2_PACKAGE_BUILDER_CONTRACT_RETIRED
