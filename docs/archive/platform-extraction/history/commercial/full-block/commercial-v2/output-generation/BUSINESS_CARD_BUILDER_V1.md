# BUSINESS_CARD_BUILDER_V1

Status: IMPLEMENTED

## Purpose

Build a business card output from the active Commercial V2 draft payload.

## Runtime Builder

`_CommercialV2BusinessCardPdfBuilder`

## Builder Rules

- Use draft profile data.
- Use resolved identity image when available.
- Export as PDF through the existing printing pipeline.
- Do not publish to Marketing automatically.
- Register generated output metadata in the Commercial V2 profile document.

## Output Type

`businessCard`

