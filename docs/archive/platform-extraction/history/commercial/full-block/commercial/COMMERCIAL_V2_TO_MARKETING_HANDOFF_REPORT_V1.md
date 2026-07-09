# Commercial V2 To Marketing Handoff Report V1

## Operation

OP-COMMERCIAL-V2-FINAL-FORENSIC-INVENTORY-AND-PRODUCT-CLOSURE-AUDIT-V1

## Status

FORENSIC AUDIT ONLY

## Marketing Handoff Matrix

| Input | Format | Current Storage Location | Archive Destination | Publication Destination | Status |
|---|---|---|---|---|---|
| Published Profile | `liveProfile` map + public URL | `commercial_v2_profiles/{uid}` | Provider Portfolio Vault | Commercial discovery / marketing campaigns | EXISTS |
| Profile Identity Image | Storage URL/reference | `commercial_v2_identity/{uid}/profile_photo` or `logo` | Provider Portfolio Vault / Marketing Asset Vault | Profile card / campaign visuals | EXISTS |
| Official PDF | Generated PDF output | Generated on demand, not automatically stored | Provider Portfolio Vault | Share/download/manual distribution | PARTIAL |
| CV Asset | Generated preview/PDF | Generated on demand, not automatically stored | Provider Portfolio Vault / Marketing Content Library | Manual distribution | PARTIAL |
| Business Card | Not available | None | Marketing Asset Vault | Print/social/share | MISSING |
| Promo Post | Not available | None | Marketing Content Library / Marketing Asset Vault | Social campaign channels | MISSING |
| Campaign Package | Not available | None | Marketing Content Library | Campaign runtime | MISSING |
| Announcement | Not available | None | Marketing Content Library | Social/public channels | MISSING |
| Success Story | Not available | None | Marketing Content Library | Campaign/public channels | MISSING |
| Education Asset | Profile fields/custom sections | `commercial_v2_profiles/{uid}` | Marketing Content Library | Education discovery/campaigns | PARTIAL |
| Training Asset | Profile fields/custom sections | `commercial_v2_profiles/{uid}` | Marketing Content Library | Training discovery/campaigns | PARTIAL |
| Center Asset | Center category profile content | `commercial_v2_profiles/{uid}` | Provider Portfolio Vault | Center discovery/campaigns | PARTIAL |
| Association Asset | Organization/initiative profile content | `commercial_v2_profiles/{uid}` | Provider Portfolio Vault / Marketing Content Library | Association discovery/campaigns | PARTIAL |

## Handoff Requirements

- Profile ID.
- Owner UID.
- Public URL.
- Category and subcategory.
- Published visibility status.
- Approved public copy.
- Identity media reference.
- Generated asset type.
- Archive target.
- Publication target.

## Verdict

Marketing can receive manual profile and asset references now.

Marketing cannot receive automated campaign-ready packages until Marketing Department, post generation, business card generation, and publication pipeline exist.

