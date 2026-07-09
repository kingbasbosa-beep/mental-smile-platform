# ARCHIVE_LANGUAGE_QUARANTINE_RECORD_TEMPLATE_V1

Status: ACTIVE QUARANTINE RECORD TEMPLATE

## Purpose

Provide the required record shape for every invalid Archive traffic object sent to `ARC-ERR-LANG-001`.

## Template

```yaml
quarantine_id: ALG-QTN-YYYYMMDD-0001
alarm_code: LANG-ERR-CODE
severity: ERROR
source_section_code: SEC-UNKNOWN
source_outbox_plug: PLG-UNKNOWN-OUT
attempted_destination_code: ARC-UNKNOWN-001
attempted_destination_inbox: PLG-UNKNOWN-IN
magnet_code: MAG-UNKNOWN
package_family: UNKNOWN_OR_NONE
signal_family: UNKNOWN_OR_NONE
broken_sentence: "Original attempted traffic sentence."
failure_reason: "Why the Archive Language Guard rejected the object."
suggested_correction: "Suggested Archive destination, magnet, plug, namespace, or OWNER_REVIEW_REQUIRED."
review_owner: Archive Language Owner
review_status: PENDING_REVIEW
created_at: YYYY-MM-DDTHH:MM:SSZ
```

## Required Field Rule

No quarantine record is valid unless all template fields are present.

FINAL STATUS: ARCHIVE_LANGUAGE_QUARANTINE_RECORD_TEMPLATE_COMPLETE
