# Commercial V2 Discovery Foundation V1

Operation ID: OP-COMMERCIAL-V2-PURIFICATION-AND-DISCOVERY-FOUNDATION-V1  
Date: 2026-06-24  
Mode: Design only

## Purpose

Commercial V2 discovery must make published commercial profiles visible without ranking, recommendations, scoring, AI matching, paid placement, or provider preference.

Discovery is a simple public browsing layer over published Commercial V2 profiles.

## Allowed Discovery Capabilities

- Search
- Category Browsing
- Filters
- Public Profile Opening

## Forbidden Discovery Capabilities

- ranking
- recommendation engine
- scoring
- AI discovery
- paid placement
- provider preference
- booking routing
- payment routing
- verification hierarchy

## Supported Entity Types

- Specialist
- Center
- Education
- Association / NGO

## Discovery Categories

Initial categories should map to Commercial V2 profile category data:

- Specialist
- Center
- Educational
- Organization
- Initiative / NGO
- Wellness / Yoga / Meditation
- Accessibility Support
- Mental Health Tool
- Other

For client-facing discovery, grouped navigation may simplify this to:

- Specialists
- Centers
- Education
- Associations / NGOs

## Discovery Filters

Filters should use already stored or minimal profile fields:

- main category
- subcategory
- location
- services text
- audiences text
- contact availability
- identity image present
- published visibility state

Filters must not use:

- rank
- trust score
- recommendation score
- paid boost
- verification status unless a separate approved verification doctrine exists

## Discovery Entry Points

Potential future entry points:

1. Public Official Website
2. Library resource context links
3. Quick Access Links Card
4. Accessibility Room support/resource links
5. Direct route from Splash only if Owner approves a public discovery button later

Current official entry is not connected in runtime by this operation.

## Discovery Visibility Rules

A profile is discoverable only when:

- document exists in `commercial_v2_profiles`
- `isPublished == true`
- `isHidden != true`
- `liveProfile` exists
- live profile contains a publishable category
- profile is not blocked by a future approved safety rule

Draft profiles must not be discoverable.

Hidden profiles must not be discoverable.

Archived versions must not be discoverable.

## Public Profile Opening

Discovery should open:

- `/commercial-v2/p/{profileId}`

Public profile remains read-only.

## Data Boundary

Discovery should read published/live profile data only. It should not read draft-only fields or owner management state except minimal visibility flags needed to filter public records.

