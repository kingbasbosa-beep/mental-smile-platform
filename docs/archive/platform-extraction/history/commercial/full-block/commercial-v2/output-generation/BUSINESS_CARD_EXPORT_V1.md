# BUSINESS_CARD_EXPORT_V1

Status: IMPLEMENTED

## Purpose

Export the generated Business Card as a PDF artifact.

## Runtime Action

`_exportBusinessCardPdf`

## Export Format

PDF

## Signal

Emits `commercial_generated` with:

- `assetType`: `businessCard`
- `action`: `export_pdf`

