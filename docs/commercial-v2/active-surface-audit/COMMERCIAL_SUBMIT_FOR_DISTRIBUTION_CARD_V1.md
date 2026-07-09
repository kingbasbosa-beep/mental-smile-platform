# Commercial Submit For Distribution Card V1

## Operation

OP-COMMERCIAL-V2-ACTIVE-SURFACE-EXTRACTION-AND-CARD-REGISTRY-AUDIT-V1

## Status

FORENSIC CARD ONLY

## Current Publish Behavior

| Item | Current Value |
|---|---|
| Current Label | Publish profile / publish action in owner actions. |
| Current Action | `_publish` validates form, checks name/category/contact, then calls `_CommercialV2Store.publish`. |
| Current Destination | Direct public profile at `/commercial-v2/p/{uid}` when published and not hidden. |
| Current Storage | `commercial_v2_profiles/{uid}.liveProfile`; root publication fields; previous live copied to `versions`. |
| Current Signals | None found. |

## Current Storage Writes

- `draftProfile`
- `liveProfile`
- `profileImageUrl`
- `logoImageUrl`
- `isPublished: true`
- `isHidden: false`
- `publicProfileId`
- `version`
- `publishedAt`
- `updatedAt`

## Future Target Behavior

| Future Target | Status |
|---|---|
| Asset Package Creation | MISSING |
| Archive Package Creation | MISSING |
| Marketing Intake Handoff | MISSING |
| Success Message | PARTIAL: current message says `Profile published. Public URL is ready.` |

## Required Changes

- Rename/align submit semantics if target is distribution, not only publish.
- Create asset package.
- Create archive package.
- Create Marketing intake handoff.
- Emit Commercial V2 publish/distribution signal.

## Status

EXISTS / CHANGE_REQUIRED

No runtime was modified.

