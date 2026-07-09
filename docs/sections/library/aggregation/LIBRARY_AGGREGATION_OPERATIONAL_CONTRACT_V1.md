# LIBRARY AGGREGATION OPERATIONAL CONTRACT V1

Operation ID: OP-LIBRARY-AGGREGATION-AND-OPERATIONAL-FOUNDATION-BLOCK-V1

Status: OPERATIONAL_READY_DOCUMENTED

Runtime: NOT_CONNECTED

## Contract

Library Aggregation collects only summary counters.

Allowed buckets:

- hourly;
- manual dispatch range;
- daily rollup-ready;
- weekly rollup-ready.

## Allowed Metrics

- content opened count;
- category opened count;
- tool opened count;
- external link opened count;
- search used count only;
- suggestion started count;
- suggestion submitted category count;
- specialist content opened count;
- research reference opened count;
- VR specialist content opened count;
- official resource opened count;
- safety warning viewed count;
- diagnostic warning viewed count.

## Forbidden Payload

- uid;
- phone;
- email;
- search text;
- content body;
- suggestion body;
- diagnosis;
- personal note;
- medical history;
- uploaded file;
- user profile data;
- sensitive category inference.

## Manual Dispatch

Dispatch may be triggered manually in a future approved runtime.

Manual dispatch sends the same package to:

- Archive Receiver Copy;
- Strategic Planning Receiver Copy.

No automatic dispatch is created by this contract.
