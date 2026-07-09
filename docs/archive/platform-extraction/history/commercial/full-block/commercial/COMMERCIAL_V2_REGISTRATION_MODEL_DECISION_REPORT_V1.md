# Commercial V2 Registration Model Decision Report V1

Operation ID: OP-COMMERCIAL-V2-PURIFICATION-AND-DISCOVERY-FOUNDATION-V1  
Date: 2026-06-24  
Mode: Analysis only

## Current Runtime Reality

Commercial V2 registration currently requires:

- Email
- Phone
- Password

Runtime behavior:

- uses Firebase Auth email/password
- phone is required for account creation
- phone is stored in profile shell/account phone
- no phone verification was found
- no separate provider/center registration workflow is used

## Current Owner Decisions Reflected In Runtime

Commercial V2 uses one universal profile owner entry flow:

- no separate specialist registration module
- no separate center registration module
- category/subcategory are profile fields
- profile is the dashboard

## Owner Target Model

The most consistent target model based on current Commercial V2 doctrine:

- one Commercial V2 account entry
- email/password authentication
- phone as required publish/contact data or required account contact data
- category selected inside profile
- no legacy provider/center registration flow

Owner decision still needed:

- Should phone remain required at account creation, or only required before publishing/contact visibility?
- Should email verification be required before publish?
- Should Commercial V2 continue using direct Firebase Auth email/password only?

## Migration Complexity

Low to medium if keeping Firebase Auth email/password.

Complexity increases if:

- phone verification is introduced
- old clinician/center accounts must migrate into Commercial V2
- existing `clinicians` and `centers` documents must be converted
- public legacy modules are redirected to Commercial V2

## Required Runtime Changes

If current model is kept:

- no immediate auth changes required
- future discovery route/page required
- future cleanup of legacy entry points required by owner approval

If phone moves from registration to publish requirement:

- start page validation must change
- profile publish validation must own phone requirement
- profile shell creation can allow empty phone

## Required Auth Changes

Current model:

- none

Potential future model:

- email verification before publish
- optional phone verification if owner requires high-trust contact channels

## Required Firebase Changes

Current model:

- Firestore rules for `commercial_v2_profiles` already exist
- Storage rules for `commercial_v2_identity` already exist

Potential future model:

- indexes for discovery search/filter if Firestore querying requires them
- rules for public discovery reads over published/visible profiles

## Decision Status

OWNER_REVIEW_REQUIRED

The current runtime is coherent enough to remain the active Commercial V2 registration model, but owner must decide whether phone belongs at account creation or publish/contact readiness.

