# LIBRARY REPORTING AND AGGREGATION DOCTRINE V1

Operation ID: OP-LIBRARY-CONSTITUTION-AND-GOVERNANCE-BLOCK-V1

Status: ACTIVE_LIBRARY_DOCTRINE

Runtime effect: none

## Core Rule

Library aggregation may collect summary counters only.

This block does not connect runtime aggregation.

## Allowed Summary Counters

Allowed Library summary counters:

- content opened count;
- category opened count;
- external link opened count;
- tool opened count;
- search used count;
- suggestion submitted count;
- specialist-only material opened count.

## Signal Card Requirement

Every future Library signal family must have a Signal Card before runtime connection.

Initial documented signal families:

- `library_content_opened`;
- `library_category_opened`;
- `library_tool_opened`;
- `library_external_link_opened`;
- `library_search_used`;
- `library_suggestion_started`;
- `library_specialist_content_opened`.

Implementation status:

NOT_CONNECTED

## Forbidden Aggregation

Library aggregation must not collect:

- client identity;
- search text;
- diagnosis;
- personal notes;
- medical details;
- content of suggestions;
- user profile data;
- uploaded documents;
- sensitive inferred state.

## Dual Output Rule

Library follows the same dual output concept:

- Archive Receiver Copy;
- Strategic Planning Receiver Copy.

The package contains summary counters only.

No analysis occurs inside Library aggregation.

## Runtime Boundary

Runtime connected:

NO

Firebase collection created:

NO

Monitoring connected:

NO

Administrative connected:

NO

## Future Runtime Requirement

Any future Library aggregation runtime requires:

- Owner approval;
- operation record;
- collection/rules review;
- privacy review;
- localization/reporting documentation update.

## Operational Foundation Link

The Library Aggregation Operational Foundation is now documented under:

- `aggregation/LIBRARY_AGGREGATION_POINT_STRUCTURE_V1.md`
- `aggregation/LIBRARY_AGGREGATION_OPERATIONAL_CONTRACT_V1.md`
- `aggregation/LIBRARY_AGGREGATION_DISPATCH_PACKAGE_V1.md`
- `aggregation/LIBRARY_AGGREGATION_DUAL_OUTPUT_DOCTRINE_V1.md`
- `aggregation/LIBRARY_AGGREGATION_BOUNDARY_RULES_V1.md`

Operational status:

OPERATIONAL_READY_DOCUMENTED

Runtime status:

NOT_CONNECTED
