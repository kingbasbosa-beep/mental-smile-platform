# LIBRARY SIGNAL FAMILY MAP V1

Operation ID: OP-LIBRARY-AGGREGATION-AND-OPERATIONAL-FOUNDATION-BLOCK-V1

Status: ACTIVE_SIGNAL_FAMILY_MAP

Implementation status for all signal families: NOT_CONNECTED

## Signal Families

| Signal Family | Purpose | Status |
| --- | --- | --- |
| `library_content_opened` | Count content opens | NOT_CONNECTED |
| `library_category_opened` | Count category opens | NOT_CONNECTED |
| `library_tool_opened` | Count tool opens | NOT_CONNECTED |
| `library_external_link_opened` | Count external link opens | NOT_CONNECTED |
| `library_search_used` | Count search usage without storing search text | NOT_CONNECTED |
| `library_suggestion_started` | Count suggestion flow starts | NOT_CONNECTED |
| `library_suggestion_submitted` | Count suggestion submissions by category only | NOT_CONNECTED |
| `library_specialist_content_opened` | Count specialist-only material opens | NOT_CONNECTED |
| `library_research_reference_opened` | Count research reference opens | NOT_CONNECTED |
| `library_vr_specialist_content_opened` | Count VR specialist content opens | NOT_CONNECTED |
| `library_official_resource_opened` | Count official resource opens | NOT_CONNECTED |
| `library_safety_warning_viewed` | Count safety warning views | NOT_CONNECTED |
| `library_diagnostic_warning_viewed` | Count diagnostic warning views | NOT_CONNECTED |

## Forbidden Signal Payloads

Signals must not include:

- search text;
- user identity;
- diagnosis;
- medical details;
- suggestion body;
- sensitive identity;
- uploaded files.
