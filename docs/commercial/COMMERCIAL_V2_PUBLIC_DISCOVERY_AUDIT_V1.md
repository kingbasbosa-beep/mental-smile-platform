# Commercial V2 Public Discovery Audit V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24

## Public Discovery Checks

| Capability | Commercial V2 Runtime Status | Evidence |
|---|---:|---|
| Public Listing | PLACEHOLDER / MISSING | No Commercial V2 listing route found |
| Public Search | PLACEHOLDER / MISSING | No Commercial V2 search UI found |
| Public Profiles | ACTIVE | `/commercial-v2/p/{profileId}` |
| Filters | PLACEHOLDER / MISSING | `categoryKey`, `subcategoryKey`, and `categoryPath` are stored, but no filter UI found |
| Category Browsing | PLACEHOLDER / MISSING | No Commercial V2 category browse route found |

## User Questions

Can a user currently discover providers?  
Commercial V2: NO. Legacy specialist module can list clinicians, but that is not Commercial V2.

Can a user currently discover centers?  
Commercial V2: NO. Legacy center module can list centers, but that is not Commercial V2.

Can a user currently discover education entities?  
Commercial V2: NO. No Commercial V2 listing/filter/category surface found.

Can a user currently discover associations?  
Commercial V2: NO. No Commercial V2 listing/filter/category surface found.

Can a user open public profiles?  
YES, if they already have the direct `/commercial-v2/p/{profileId}` URL and the profile is published and not hidden.

## Legacy / Adjacent Discovery

Existing public/legacy discovery-like routes:

- `/module/specialists`
- `/module/specialists/list`
- `/module/specialists/details`
- `/module/centers`
- `/module/centers/list`
- `/module/centers/details`
- `/s/city/providers`
- `/s/city/centers`
- `/s/city/organizations`
- `/s/city/programs`
- `/s/city/marketplace`

These are not active Commercial V2 discovery routes.

## Discovery Conclusion

Commercial V2 public discovery is not implemented. Commercial V2 public visibility currently depends on direct profile URL access.

