# LIBRARY CARD GUIDE V1

Operation ID: OP-LIBRARY-CARD-SYSTEM-AND-INTERNAL-NETWORK-BLOCK-V1

Status: ACTIVE_LIBRARY_CARD_GOVERNANCE

Runtime effect: none

## Purpose

This guide defines the Library card governance system.

Every Library content item, source, prompt-generated item, category, link, localization label, and signal family must be card-governed before it becomes active Library material.

## Required Card Families

| Card Family | Required For | Status |
| --- | --- | --- |
| Content Card | Every Library content item | ACTIVE |
| Category Card | Every Library category/subcategory | ACTIVE |
| Source Card | Every external source/resource | ACTIVE |
| Prompt Card | Every Mental Smile original or AI-assisted content item | ACTIVE |
| Localization Card | Every visible Library label | ACTIVE |
| Signal Card | Every Library signal family | ACTIVE_DOCUMENTED_NOT_CONNECTED |

## Card Coverage Rule

No Library item may be considered governed unless the relevant card exists.

Minimum coverage:

- content card;
- source card if external;
- prompt card if AI-assisted or Mental Smile original;
- localization card if visible text exists;
- signal card if interactions are expected to be summarized later.

## Recommendation Metadata Rule

Cards may include recommendation tags only as metadata.

Allowed tags:

- interest;
- topic;
- learning goal;
- content type.

Forbidden tags:

- diagnosis;
- disorder;
- addiction status;
- trauma status;
- crisis status;
- sensitive identity.

No recommendation runtime is created by this guide.

## Runtime Boundary

Runtime changed:

NO

Firebase changed:

NO

Signals connected:

NO

Aggregation runtime connected:

NO
