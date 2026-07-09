# Commercial V2 Signal Preparation Map V1

Operation ID: OP-COMMERCIAL-V2-PURIFICATION-AND-DISCOVERY-FOUNDATION-V1  
Date: 2026-06-24  
Mode: Preparation only

## Rule

No runtime signal was connected in this operation.

All signal families in this document have status:

PREPARED_NOT_CONNECTED

## Prepared Signal Families

| Signal | Source | Purpose | Data Boundary | Status |
|---|---|---|---|---|
| `commercial_profile_opened` | Public profile route | count public profile opens | profile id/category only; no personal viewer identity | PREPARED_NOT_CONNECTED |
| `commercial_search_used` | Future discovery search | count search usage | search category/count only; no raw personal profile | PREPARED_NOT_CONNECTED |
| `commercial_filter_used` | Future discovery filters | count filter usage | filter key only | PREPARED_NOT_CONNECTED |
| `commercial_directory_opened` | Future directory page | count directory opens | directory type only | PREPARED_NOT_CONNECTED |
| `commercial_registration_started` | Commercial V2 start | count registration starts | no password, no raw phone/email | PREPARED_NOT_CONNECTED |
| `commercial_registration_completed` | Commercial V2 account shell created | count completed registrations | owner id only if approved; no credentials | PREPARED_NOT_CONNECTED |
| `commercial_profile_generated` | CV/PDF generation action | count generation use | output type only | PREPARED_NOT_CONNECTED |
| `commercial_profile_published` | Publish action | count published profiles | profile id/category only | PREPARED_NOT_CONNECTED |
| `commercial_profile_hidden` | Hide action | count profile hide events | profile id/category only | PREPARED_NOT_CONNECTED |
| `commercial_identity_image_uploaded` | Identity upload action | count identity media updates | image type only; no image payload in signal | PREPARED_NOT_CONNECTED |

## Forbidden Signal Payloads

Future Commercial V2 signals must not include:

- password
- email text unless explicitly approved
- phone number text unless explicitly approved
- raw profile description
- custom section content
- uploaded image data
- private draft content
- hidden profile content
- payment/booking/session data

## Aggregation Boundary

Commercial V2 signal preparation does not create aggregation runtime. Any future aggregation must be created in a separate approved operation.

