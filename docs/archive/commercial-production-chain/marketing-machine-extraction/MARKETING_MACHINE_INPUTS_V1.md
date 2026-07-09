# Marketing Machine Inputs V1

## Operation

OP-MARKETING-MACHINE-EXTRACTION-AUDIT-V1

## Status

FORENSIC EXTRACTION ONLY

NO DEPARTMENT CREATION

## Input Inventory

| Input | Source | Current Status | Required Metadata | Archive Source / Destination | Notes |
|---|---|---|---|---|---|
| Published Profiles | Commercial V2 live profile | EXISTS | Profile ID, owner UID, public URL, category, subcategory, published status | Provider Portfolio Vault | Primary commercial marketing source. |
| Identity Images | Commercial V2 identity storage | EXISTS | Profile ID, image type, storage reference, usage rights | Provider Portfolio Vault / Marketing Asset Vault | Used for profile cards and campaign visuals. |
| Logos | Commercial V2 identity storage | EXISTS | Profile ID, logo reference, usage rights | Provider Portfolio Vault / Marketing Asset Vault | Used for entity campaigns and discovery cards. |
| Official Profile PDFs | Generated from published profile | PARTIAL | Profile ID, generation date, live profile version | Provider Portfolio Vault | Generated on demand, not automatically archived. |
| CV Assets | Generated from draft profile | PARTIAL | Profile ID, generation date, template, preview/final status | Provider Portfolio Vault / Marketing Content Library | Preview/PDF exists but no automated handoff. |
| Business Card Requests | Future Commercial generator | MISSING | Profile ID, template, identity assets, contact fields | Marketing Asset Vault | Generator missing. |
| Promo Post Requests | Future Commercial/Marketing generator | MISSING | Profile ID, campaign purpose, channel, copy, image | Marketing Content Library / Marketing Asset Vault | Generator missing. |
| Campaign Package Inputs | Commercial + Archive references | MISSING | Campaign goal, target channel, profile assets, timing | Marketing Content Library | Marketing Department not created. |
| Success Story Inputs | Commercial profile + future consent/legal context | MISSING | Story subject, consent status, legal review status | Marketing Content Library | Consent/legal path undefined. |
| Education Assets | Commercial V2 profile fields/custom sections | PARTIAL | Profile ID, education category, approved copy | Marketing Content Library / Provider Portfolio Vault | Needs classification. |
| Training Assets | Commercial V2 profile fields/custom sections | PARTIAL | Profile ID, training category, approved copy | Marketing Content Library / Provider Portfolio Vault | Needs classification. |
| Center Assets | Center-category Commercial V2 profiles | PARTIAL | Profile ID, center category, logo, services | Provider Portfolio Vault / Marketing Asset Vault | Needs discovery/campaign classification. |
| Association Assets | Organization/initiative profiles | PARTIAL | Profile ID, organization type, approved copy | Provider Portfolio Vault / Marketing Content Library | Needs classification. |
| Future Assets | Undefined | BLOCKED | Asset type, owner, source, destination | Classification-dependent | Cannot enter machine until classified. |

## Input Rule

Marketing Machine input begins only after Commercial output has a source, ownership metadata, archive destination, and publication intent.

