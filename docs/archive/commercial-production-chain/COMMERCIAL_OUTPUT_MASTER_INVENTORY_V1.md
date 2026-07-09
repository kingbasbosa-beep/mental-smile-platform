# Commercial Output Master Inventory V1

## Operation

OP-ARCHIVE-COMMERCIAL-PRODUCTION-CHAIN-AUDIT-V1

## Status

FORENSIC AUDIT ONLY

## Scope

Inventory every asset Commercial V2 can produce or is expected to produce in the Commercial V2 to Archive to Future Marketing and Media production chain.

## Master Inventory

| Commercial Output | Current Status | Storage Source | Archive Destination | Publication Destination | Lifecycle |
|---|---|---|---|---|---|
| Published Profiles | EXISTS | `commercial_v2_profiles/{uid}.liveProfile`; direct `/commercial-v2/p/{uid}` URL | Provider Portfolio Vault; Archive Strategic Planning Vault for strategic summaries | Commercial V2 public profile; future discovery; future Marketing campaigns | Draft -> publish -> live profile -> versioned history -> archive reference |
| Identity Images | EXISTS | `commercial_v2_identity/{uid}/profile_photo` | Provider Portfolio Vault; Marketing Asset Vault when campaign-ready | Public profile; future profile cards; future campaign visuals | Upload -> profile reference -> portfolio asset -> marketing copy if approved |
| Logos | EXISTS | `commercial_v2_identity/{uid}/logo` | Provider Portfolio Vault; Marketing Asset Vault | Public profile; future discovery cards; future campaign visuals | Upload -> profile reference -> portfolio asset -> marketing copy if approved |
| CV Assets | PARTIAL | Generated on demand from Commercial V2 draft profile | Provider Portfolio Vault; Marketing Content Library when approved | Manual download/share; future campaign package | Draft -> generated preview/PDF -> manual export -> archive if registered |
| PDF Assets | EXISTS / PARTIAL | Generated on demand from published live profile | Provider Portfolio Vault | Manual download/share; future profile distribution | Live profile -> PDF generation -> manual export -> archive if registered |
| Business Cards | MISSING | None | Marketing Asset Vault; Provider Portfolio Vault | Print/share/social/public campaign | Not started |
| Promo Posts | MISSING | None | Marketing Content Library; Marketing Asset Vault | Social channels; future campaign runtime | Not started |
| Campaign Packages | MISSING | None | Marketing Content Library | Future Marketing Department campaign runtime | Not started |
| Success Stories | MISSING | None | Marketing Content Library | Future Marketing and Media channels | Not started |
| Education Assets | PARTIAL | Commercial V2 profile category/custom sections | Marketing Content Library; Provider Portfolio Vault | Education discovery; educational campaigns | Profile content -> review -> archive classification -> future publication |
| Training Assets | PARTIAL | Commercial V2 profile category/custom sections | Marketing Content Library; Provider Portfolio Vault | Training discovery; training campaigns | Profile content -> review -> archive classification -> future publication |
| Center Assets | PARTIAL | Center-category Commercial V2 profile content/logo | Provider Portfolio Vault; Marketing Asset Vault | Center discovery; center campaigns | Profile publish -> portfolio archive -> future marketing |
| Association Assets | PARTIAL | Organization/initiative Commercial V2 profile content/logo | Provider Portfolio Vault; Marketing Content Library | Association discovery; association campaigns | Profile publish -> archive classification -> future marketing |
| Future Assets | BLOCKED | Not defined | Destination depends on classification | Future Marketing and Media | Requires asset type, contract, registry, and archive classification |

## Inventory Finding

Commercial V2 can currently produce profile-centered assets and generated profile/CV PDFs. Campaign-native assets are missing.

