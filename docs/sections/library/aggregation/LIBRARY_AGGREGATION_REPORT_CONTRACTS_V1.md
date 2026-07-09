# LIBRARY AGGREGATION REPORT CONTRACTS V1

Operation ID: OP-LIBRARY-AGGREGATION-AND-OPERATIONAL-FOUNDATION-BLOCK-V1

Status: ACTIVE_REPORT_CONTRACTS

Runtime connected: NO

Destination for all reports:

LOCAL_SECTION_ONLY

No analysis inside Library.

## Report Contracts

| Report Contract | Destination | Payload |
| --- | --- | --- |
| LIBRARY_DAILY_SUMMARY_REPORT | LOCAL_SECTION_ONLY | Counts only |
| LIBRARY_WEEKLY_SUMMARY_REPORT | LOCAL_SECTION_ONLY | Counts only |
| LIBRARY_CATEGORY_INTERACTION_SUMMARY | LOCAL_SECTION_ONLY | Category totals |
| LIBRARY_CONTENT_TYPE_SUMMARY | LOCAL_SECTION_ONLY | Content type totals |
| LIBRARY_EXTERNAL_LINK_SUMMARY | LOCAL_SECTION_ONLY | External link totals |
| LIBRARY_TOOL_INTERACTION_SUMMARY | LOCAL_SECTION_ONLY | Tool totals |
| LIBRARY_SPECIALIST_CONTENT_SUMMARY | LOCAL_SECTION_ONLY | Specialist-only access totals |
| LIBRARY_SAFETY_WARNING_SUMMARY | LOCAL_SECTION_ONLY | Safety/diagnostic warning totals |
| LIBRARY_SIGNAL_HEALTH_SUMMARY | LOCAL_SECTION_ONLY | Signal family health counts only |

## Forbidden In Reports

Reports must not include:

- search text;
- user identity;
- diagnosis;
- suggestion body;
- personal notes;
- profile data;
- uploaded content.
