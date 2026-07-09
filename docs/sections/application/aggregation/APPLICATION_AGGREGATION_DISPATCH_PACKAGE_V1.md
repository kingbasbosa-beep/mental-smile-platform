# APPLICATION AGGREGATION DISPATCH PACKAGE V1

Operation ID: OP-APPLICATION-AGGREGATION-OPERATIONAL-CLOSURE-V1

Status: PACKAGE_SHAPE_ONLY

Runtime dispatch created: NO

Automatic dispatch created: NO

Firebase changed: NO

## Purpose

Define the future dispatch package shape for Application Aggregation summary reports.

This file defines structure only.

It does not create runtime dispatch.

## Package Shape

```yaml
packageId: APPLICATION-SUMMARY-{timestamp-or-approved-id}
sectionId: APPLICATION
generatedAt: ISO-8601 timestamp
periodStart: ISO-8601 timestamp
periodEnd: ISO-8601 timestamp
bucketSize: hourly | manual_dispatch_range | daily_rollup_ready | weekly_rollup_ready
summaryFamilies:
  - routes
  - buttons
  - cards
  - language
  - website
  - exit
  - guidance
  - complaint_categories
  - whatsapp
archiveCopy:
  receiver: Archive Receiver
  payload: same counts-only package
strategicPlanningCopy:
  receiver: Strategic Planning Receiver
  payload: same counts-only package
payload:
  countsOnly: true
  rawEvents: false
  personalRecords: false
```

## Example Payload

12:00

```text
official_website_clicked: 122
client_room_opened: 55
accessibility_room_opened: 18
links_card_opened: 44
complaint_guidance_opened: 5
```

13:00

```text
official_website_clicked: 477
client_room_opened: 101
accessibility_room_opened: 36
links_card_opened: 63
complaint_guidance_opened: 9
```

## Manual Dispatch Rule

Dispatch may be triggered manually by an authorized operator.

Allowed examples:

- every 6 hours;
- daily;
- before report review;
- before section handoff;
- manually.

Manual dispatch sends the same package to:

1. Archive Receiver
2. Strategic Planning Receiver

If either receiver is unavailable, the package must remain recoverable from Archive once runtime exists.

## Forbidden Package Content

The dispatch package must not contain:

- raw events;
- identity;
- phone;
- email;
- uid;
- notebook text;
- suggestion text;
- complaint text;
- check-in answers;
- uploaded media;
- diagnosis;
- session details;
- booking/payment/case data.

Final Verdict:

APPLICATION_AGGREGATION_DISPATCH_PACKAGE_CREATED
