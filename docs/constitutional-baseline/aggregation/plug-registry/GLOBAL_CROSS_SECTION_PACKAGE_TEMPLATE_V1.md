# GLOBAL_CROSS_SECTION_PACKAGE_TEMPLATE_V1

Status: ACTIVE TEMPLATE

## Cross-Section Package Template

```yaml
package_id: ""
package_version: "V1"
source_section_code: "SEC-XXX"
source_outbox_plug: "PLG-XXX-OUT"
destination_section_code: "SEC-YYY"
destination_inbox_plug: "PLG-YYY-IN"
destination_code: "DST-YYY-INBOX"
package_family: ""
magnet_code: ""
internal_distribution_code: ""
privacy_class: ""
retention_class: ""
payload_schema_version: "V1"
allowed_fields: []
blocked_fields: []
owner: ""
review_status: "DRAFT"
runtime_status: "NOT_CONNECTED"
```

## Template Rule

The package may address only a destination inbox plug. It must not address a route, screen, collection, or internal runtime component.

FINAL STATUS: GLOBAL_CROSS_SECTION_PACKAGE_TEMPLATE_READY
