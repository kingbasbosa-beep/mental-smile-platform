# Marketing Input Socket V1

## Status

FOUNDATION SPECIFICATION ONLY

NO RUNTIME SOCKET CREATED

## Purpose

Define accepted inputs into Marketing and Media from extracted Commercial and Archive reality.

## Accepted Inputs

| Input | Source | Required Metadata | Status |
|---|---|---|---|
| Published Profiles | Commercial V2 live profile | Profile ID, owner UID, public URL, category, subcategory, published status | EXISTS |
| Identity Images | Commercial V2 identity storage | Profile ID, image type, storage reference, usage rights | EXISTS |
| Logos | Commercial V2 identity storage | Profile ID, logo reference, usage rights | EXISTS |
| Official Profile PDFs | Generated from published profile | Profile ID, generation date, live profile version | PARTIAL |
| CV Assets | Generated from draft profile | Profile ID, generation date, template, preview/final status | PARTIAL |
| Business Card Requests | Future generator | Profile ID, template, identity assets, contact fields | MISSING |
| Promo Post Requests | Future generator | Profile ID, campaign purpose, channel, copy, image | MISSING |
| Campaign Package Inputs | Commercial plus Archive references | Campaign goal, target channel, profile assets, timing | MISSING |
| Success Story Inputs | Commercial profile plus consent/legal context | Story subject, consent status, legal review status | MISSING |
| Education Assets | Commercial V2 profile fields/custom sections | Profile ID, education category, approved copy | PARTIAL |
| Training Assets | Commercial V2 profile fields/custom sections | Profile ID, training category, approved copy | PARTIAL |
| Center Assets | Center-category Commercial V2 profiles | Profile ID, center category, logo, services | PARTIAL |
| Association Assets | Organization/initiative profiles | Profile ID, organization type, approved copy | PARTIAL |

## Input Rules

- Input must identify source.
- Input must identify ownership.
- Input must identify archive destination.
- Input must identify publication intent.
- Input must not include unclassified future assets.
- Input must not create runtime processing.

