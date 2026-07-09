# Entry/Auth Firebase Rule Cards V1

Operation: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Date: 2026-06-23

## EA-FB-001 - Custom Claim Role Helpers

- Rule path / helper: `hasRole`, `isOwner`, `isMonitoringOperator`, `isRegistrySteward`, `isDeclarationReviewer`, `isSupportObserver`, `isClinician`, `isCenter`
- Why Entry/Auth needs it: Login uses role claims through `AccountAccessService` before routing users to protected role surfaces.
- Read or write? Claim evaluation only.
- Used by Login? Indirectly, through Auth token claim role.
- Used by Commercial V2 Start? No direct rule dependency.
- Protected? Yes
- Public? No
- Extra? No
- Missing? No
- Mismatch? No
- Evidence: `firestore.rules` defines custom claim helpers; `AccountAccessService._roleFromClaims` reads token claims.
- Status: VERIFIED

## EA-FB-002 - Clinicians Collection Read Dependency

- Rule path: `/clinicians/{clinicianId}`
- Why Entry/Auth needs it: Login role resolution reads clinician account documents by UID and attempts email query fallback.
- Read or write? Read for Entry/Auth.
- Used by Login? Yes, via `AccountAccessService`.
- Used by Commercial V2 Start? No
- Protected? Partially: own document, declaration reviewer, or visibility-ready public read.
- Public? Visibility-ready reads are allowed.
- Extra? No
- Missing? No
- Mismatch? No active Entry/Auth mismatch after Unified Start migration.
- Evidence: Rule allows read when `(signedIn() && clinicianId == uid())` or `visibilityReady()`. Service also calls `_safeQueryByEmail('clinicians', email)`.
- Status: ARCHIVE_ONLY

## EA-FB-003 - Centers Collection Read Dependency

- Rule path: `/centers/{centerId}`
- Why Entry/Auth needs it: Login role resolution reads center account documents by UID and attempts email query fallback.
- Read or write? Read for Entry/Auth.
- Used by Login? Yes, via `AccountAccessService`.
- Used by Commercial V2 Start? No
- Protected? Partially: own document, declaration reviewer, or visibility-ready public read.
- Public? Visibility-ready reads are allowed.
- Extra? No
- Missing? No
- Mismatch? No active Entry/Auth mismatch after Unified Start migration.
- Evidence: Rule allows read when `(signedIn() && centerId == uid())` or `visibilityReady()`. Service also calls `_safeQueryByEmail('centers', email)`.
- Status: ARCHIVE_ONLY

## EA-FB-004 - Commercial V2 Profile Shell Dependency

- Rule path: `/commercial_v2_profiles/{profileId}`
- Why Entry/Auth needs it: Splash Provider / Center Access opens Commercial V2 Start, which creates/loads commercial profile shell after account actions.
- Read or write? Get/list/create/update for Commercial V2 account owner and public published profiles.
- Used by Login? No
- Used by Commercial V2 Start? Yes
- Protected? Owner writes require signed-in user and matching UID.
- Public? Published, unhidden public profile reads are allowed.
- Extra? No
- Missing? No
- Mismatch? No
- Evidence: Rule allows create when `profileId == uid()`, `ownerUid == uid()`, public id matches, unpublished and hidden shell state.
- Status: VERIFIED

## EA-FB-005 - Blocked Account Fields

- Rule path / helper: `protectedAccountFields`, clinician/center data fields
- Why Entry/Auth needs it: Login routes blocked or not-ready clinician/center accounts to `/account-blocked`.
- Read or write? Read for Entry/Auth, protected write semantics in rules.
- Used by Login? Yes, `SignedInAccessState.isBlocked`, `blockReason`, `visibilityReadiness`.
- Used by Commercial V2 Start? No direct dependency.
- Protected? Yes for write restrictions.
- Public? No direct public auth purpose.
- Extra? No
- Missing? No
- Mismatch? No
- Evidence: Login `_resolve` checks `a.isBlocked` and readiness; service reads values from role documents.
- Status: VERIFIED

## EA-FB-006 - Firebase Auth Dependency

- Rule path: Firebase Auth, not a Firestore rule path
- Why Entry/Auth needs it: Login requires existing Firebase user. Commercial V2 Start uses account creation/login.
- Read or write? Auth sign-in / account creation outside Firestore rules.
- Used by Login? Yes
- Used by Commercial V2 Start? Yes
- Protected? Yes, by Firebase Auth provider configuration.
- Public? Auth entry screen is public.
- Extra? No
- Missing? No
- Mismatch? No local rule mismatch found.
- Evidence: `LoginPage` calls `FirebaseAuth.instance.signInWithEmailAndPassword`.
- Status: VERIFIED
