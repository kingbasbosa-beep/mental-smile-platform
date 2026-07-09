# LIBRARY SIGNAL CARD GUIDE V1

Operation ID: OP-LIBRARY-CARD-SYSTEM-AND-INTERNAL-NETWORK-BLOCK-V1

Status: ACTIVE_LIBRARY_CARD_GUIDE

Implementation status for all signal families:

NOT_CONNECTED

## Signal Card Rule

Every Library signal family must have a signal card before runtime connection.

## Candidate Signal Families

| Signal Family | Purpose | Implementation Status |
| --- | --- | --- |
| `library_content_opened` | Count content opens | NOT_CONNECTED |
| `library_category_opened` | Count category opens | NOT_CONNECTED |
| `library_tool_opened` | Count tool opens | NOT_CONNECTED |
| `library_external_link_opened` | Count external link opens | NOT_CONNECTED |
| `library_search_used` | Count search usage | NOT_CONNECTED |
| `library_suggestion_started` | Count suggestion starts | NOT_CONNECTED |
| `library_specialist_content_opened` | Count specialist-only content opens | NOT_CONNECTED |
| `library_research_reference_opened` | Count research reference opens | NOT_CONNECTED |
| `library_vr_specialist_content_opened` | Count VR specialist content opens | NOT_CONNECTED |
| `library_official_resource_opened` | Count official resource opens | NOT_CONNECTED |
| `library_safety_warning_viewed` | Count safety warning views | NOT_CONNECTED |
| `library_diagnostic_warning_viewed` | Count diagnostic warning views | NOT_CONNECTED |

## Forbidden Payloads

Library signals must not contain:

- client identity;
- search text;
- diagnosis;
- personal notes;
- medical details;
- suggestion content;
- profile data;
- sensitive inferred state.

## Aggregation Boundary

Signals may only feed summary counters after a future approved runtime implementation.

Runtime connected:

NO

Reference:

- `../aggregation/LIBRARY_SIGNAL_FAMILY_MAP_V1.md`
