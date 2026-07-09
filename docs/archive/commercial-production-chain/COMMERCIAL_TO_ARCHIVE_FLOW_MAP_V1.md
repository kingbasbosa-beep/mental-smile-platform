# Commercial To Archive Flow Map V1

## Operation

OP-ARCHIVE-COMMERCIAL-PRODUCTION-CHAIN-AUDIT-V1

## Status

FORENSIC AUDIT ONLY

## Flow Map

| Asset | Source | Archive Destination | Retention | Reader | Future Publisher |
|---|---|---|---|---|---|
| Published Profile | `commercial_v2_profiles/{uid}.liveProfile`; public URL | Provider Portfolio Vault | Long-term profile evidence while published/versioned | Archive, Owner, Commercial, future Marketing | Future Marketing and Media; Commercial discovery |
| Profile Version Snapshot | `commercial_v2_profiles/{uid}/versions` | Provider Portfolio Vault | Long-term version history | Archive, Owner, Commercial | Future portfolio/history reference |
| Identity Image | `commercial_v2_identity/{uid}/profile_photo` | Provider Portfolio Vault; Marketing Asset Vault if campaign-used | Long-term while referenced by profile/campaign | Archive, Commercial, future Marketing | Public profile; future campaign |
| Logo | `commercial_v2_identity/{uid}/logo` | Provider Portfolio Vault; Marketing Asset Vault if campaign-used | Long-term while referenced by profile/campaign | Archive, Commercial, future Marketing | Public profile; future campaign |
| Official Profile PDF | Generated from published live profile | Provider Portfolio Vault | Long-term if exported and registered | Archive, Owner, Commercial, future Marketing | Manual distribution; future portfolio package |
| CV Asset | Generated from draft profile | Provider Portfolio Vault; Marketing Content Library if approved | Long-term if exported and registered | Archive, Commercial, future Marketing | Manual distribution; future campaign |
| Business Card | Not produced | Marketing Asset Vault; Provider Portfolio Vault | Not applicable until created | Future Marketing, Archive | Print/share/social |
| Promo Post | Not produced | Marketing Content Library; Marketing Asset Vault | Not applicable until created | Future Marketing, Archive, Owner if reviewed | Social/public channels |
| Campaign Package | Not produced | Marketing Content Library | Not applicable until created | Future Marketing, Owner, Archive | Campaign runtime |
| Success Story | Not produced | Marketing Content Library | Not applicable until created | Future Marketing, Legal if required, Archive | Public storytelling channels |
| Education Asset | Profile fields/custom sections | Marketing Content Library; Provider Portfolio Vault | Long-term when reviewed and classified | Future Marketing, Strategic Planning, Archive | Education discovery/campaigns |
| Training Asset | Profile fields/custom sections | Marketing Content Library; Provider Portfolio Vault | Long-term when reviewed and classified | Future Marketing, Strategic Planning, Archive | Training discovery/campaigns |
| Center Asset | Center-category profile content/logo | Provider Portfolio Vault; Marketing Asset Vault | Long-term while active/versioned | Future Marketing, Commercial, Archive | Center discovery/campaigns |
| Association Asset | Organization/initiative profile content/logo | Provider Portfolio Vault; Marketing Content Library | Long-term when reviewed and classified | Future Marketing, Archive, Owner if elevated | Association discovery/campaigns |
| Future Asset | Undefined | Classification-dependent | Undefined | Undefined | Undefined |

## Flow Finding

The current flow is manually mappable but not executable. Commercial V2 lacks automatic archive package creation, asset cards, and destination registries for most output types.

