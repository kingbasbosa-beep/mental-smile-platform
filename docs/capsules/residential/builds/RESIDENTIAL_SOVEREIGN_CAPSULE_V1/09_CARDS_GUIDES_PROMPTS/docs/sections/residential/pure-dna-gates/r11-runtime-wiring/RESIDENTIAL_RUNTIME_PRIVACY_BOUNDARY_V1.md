# RESIDENTIAL_RUNTIME_PRIVACY_BOUNDARY_V1

## Purpose

Document the R11 Residential runtime privacy boundary.

## Allowed

R11 may collect:

- signal code
- signal family
- source section
- source screen
- source widget
- action type
- archive magnet code
- archive destination
- aggregation destination
- strategic summary destination
- privacy class
- retention class
- timestamp
- runtime version

## Prohibited

R11 must not collect:

- user ID
- account ID
- email
- phone
- IP address
- device ID
- uploaded image bytes
- uploaded image path
- notebook message text
- suggestion form text
- check-in answers
- diagnosis
- medication details
- personal profile

## Implemented Safeguard

Signal calls emit only action metadata.

Submitted suggestion/check-in text is not passed into the signal payload.

Selected notebook/motivation message text is not passed into the signal payload.

Selected image bytes are not passed into the signal payload.

External URLs are not passed into the signal payload.

## Final Status

RESIDENTIAL_RUNTIME_PRIVACY_BOUNDARY_CREATED
