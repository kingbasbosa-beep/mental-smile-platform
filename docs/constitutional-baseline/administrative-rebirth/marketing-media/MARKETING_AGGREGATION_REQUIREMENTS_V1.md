# Marketing Aggregation Requirements V1

## Operation

OP-MARKETING-OPERATIONAL-PIPELINE-FOUNDATION-V1

## Status

FOUNDATION ONLY

NO IMPLEMENTATION

## Purpose

Define what Marketing and Media must aggregate before sending strategic summaries.

## Aggregation Inputs

| Input | Source | Required Metadata | Status |
|---|---|---|---|
| Publication Records | Marketing publication lifecycle | Channel, item ID, date, status | FOUNDATION_ONLY |
| Campaign Packages | Marketing output socket | Campaign ID, source profiles, asset types | FOUNDATION_ONLY |
| Promo Posts | Marketing generated outputs | Source profile, channel, copy/version | FOUNDATION_ONLY |
| Business Cards | Marketing generated outputs | Source profile, template, version | FOUNDATION_ONLY |
| CV/PDF Distribution Packages | Commercial and Marketing outputs | Profile ID, asset type, generation date | PARTIAL_SOURCE_EXISTS |
| Performance Observations | Future performance tracker | Channel, item, metric, date | MISSING |
| Archive References | Archive storage registry | Archive destination, classification, retention | FOUNDATION_ONLY |

## Required Aggregation Outputs

- Weekly Marketing Summary.
- Monthly Marketing Performance Summary.
- Campaign Performance Summary.
- Commercial Asset Usage Summary.
- Strategic Marketing Input Summary.

## Aggregation Rules

- Aggregation must not include private credentials.
- Aggregation must preserve source Commercial profile references.
- Aggregation must preserve publication destination.
- Aggregation must preserve archive reference.
- Aggregation must remain strategic and marketing-facing, not operational command.

