# Commercial V2 Discovery Visibility Matrix V1

Operation ID: OP-COMMERCIAL-V2-PURIFICATION-AND-DISCOVERY-FOUNDATION-V1  
Date: 2026-06-24  
Mode: Matrix only

## Visibility Rules

All discoverability assumes:

- published profile
- not hidden
- live profile exists
- no future safety block
- public profile route opens read-only

## Matrix

| Entity Type | Public | Client | Specialist | Center | Internal |
|---|---|---|---|---|---|
| Specialist | discoverable, searchable, filterable, profile viewable | discoverable, searchable, filterable, profile viewable | profile viewable; own profile editable only when owner | profile viewable | profile visible to authorized governance/runtime only if approved later |
| Center | discoverable, searchable, filterable, profile viewable | discoverable, searchable, filterable, profile viewable | profile viewable | profile viewable; own profile editable only when owner | profile visible to authorized governance/runtime only if approved later |
| Education | discoverable, searchable, filterable, profile viewable | discoverable, searchable, filterable, profile viewable | profile viewable | profile viewable | profile visible to authorized governance/runtime only if approved later |
| Association / NGO | discoverable, searchable, filterable, profile viewable | discoverable, searchable, filterable, profile viewable | profile viewable | profile viewable | profile visible to authorized governance/runtime only if approved later |

## Notes

Public and client discovery must not imply:

- recommendation
- ranking
- verification
- booking
- payment
- provider assignment

Specialist and Center columns do not create privileged discovery. They can view public profiles like any public user unless they own the profile.

Internal visibility must be separately governed before any monitoring, aggregation, owner, or administrative use.

