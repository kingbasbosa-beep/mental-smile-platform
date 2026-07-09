# BUSINESS_CARD_TEMPLATES_V1

Status: IMPLEMENTED

## Constitutional Home

Commercial V2 / Output Generation

## Templates

| Template ID | Name | Status | Purpose |
|---|---|---|---|
| BUSINESS_CARD_TEMPLATE_CLASSIC_GOLD_V1 | Classic Gold Business Card | ACTIVE | Generate a compact provider/entity card from Commercial V2 profile data. |

## Inputs

- Profile name
- Category label
- Phone
- WhatsApp
- Location
- Identity image or logo

## Output

Business Card PDF export and in-runtime preview.

## Runtime Binding

`_CommercialV2BusinessCardPdfBuilder`

## Storage Rule

Generated metadata is stored on the Commercial V2 profile document under `commercialOutputs.businessCard`.

