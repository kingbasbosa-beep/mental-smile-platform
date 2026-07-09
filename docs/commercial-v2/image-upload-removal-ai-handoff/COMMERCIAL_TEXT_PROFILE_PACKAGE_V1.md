# Commercial Text Profile Package V1

## Status

ACTIVE COMMERCIAL V2 TEXT PACKAGE

## Purpose

Define the text-only Commercial V2 package produced by the active runtime before any future AI generation, design, publication, Marketing automation, or Archive automation.

## Required Runtime Fields

| Field | Required | Source |
|---|---:|---|
| ownerUid | YES | Firebase Auth current user UID |
| publicProfileId | YES | Generated from profile name or owner UID fallback |
| name | YES | Commercial profile draft |
| category | YES | Commercial profile draft |
| subcategory | NO | Commercial profile draft |
| description | NO | Commercial profile draft |
| services | NO | Commercial profile draft |
| audiences | NO | Commercial profile draft |
| location | NO | Commercial profile draft |
| phone | YES | Commercial account/profile |
| whatsApp | NO | Commercial profile draft |
| links | NO | Commercial profile draft |
| customSections | NO | Commercial profile draft |
| conditionalSections | NO | Commercial profile draft |
| repeatableConditionalSections | NO | Commercial profile draft |
| styleInstruction | NO | Commercial profile draft |
| generationNotes | YES | Runtime package metadata |

## Image Rule

Image URL is not required.

Logo URL is not required.

Firebase Storage image loading is not part of the active Commercial V2 text package.

## Runtime Storage

When a Commercial Asset Package is built, the active runtime stores:

`commercialTextProfilePackage`

inside:

`commercial_v2_profiles/{uid}`

## Consumers

| Consumer | Status |
|---|---|
| Commercial CV generation | TEXT_ONLY_WITH_INITIALS_FALLBACK |
| Commercial business card generation | TEXT_ONLY_WITH_BRAND_PLACEHOLDER |
| Commercial promo post generation | TEXT_ONLY_WITH_BRAND_PLACEHOLDER |
| Future AI generator | FUTURE_HANDOFF_ONLY |
| Future Marketing & Media | FUTURE_HANDOFF_ONLY |

## Prohibitions

No Firebase image upload is required.

No Storage object is required.

No image URL is required.

No active AI API call is created by this package.

