# Commercial V2 Official Runtime Declaration V1

Operation ID: OP-COMMERCIAL-V2-PURIFICATION-AND-DISCOVERY-FOUNDATION-V1  
Date: 2026-06-24  
Mode: Documentation only

## Declaration

Commercial V2 is the official commercial runtime for Mental Smile commercial publishing work.

Commercial V2 is the official runtime for:

- commercial account entry
- commercial profile owner login
- commercial profile draft creation
- commercial profile preview
- commercial profile publishing/hiding
- commercial public profile direct URL
- commercial identity image upload
- commercial live-profile PDF generation
- commercial draft CV preview/PDF generation

## Official Commercial Surface

Official Commercial V2 runtime file:

- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

Official Commercial V2 routes:

- `/commercial-v2/start`
- `/commercial-v2/owner`
- `/commercial-v2/preview`
- `/commercial-v2/p/{profileId}`

## Official Registration Flow

Current official Commercial V2 registration flow:

Commercial entry  
-> `/commercial-v2/start`  
-> email + phone + password  
-> Firebase Auth email/password account creation  
-> `commercial_v2_profiles/{uid}` profile shell  
-> `/commercial-v2/owner`

Phone is captured as profile/account contact data. No Commercial V2 phone verification flow was found in the forensic audit.

## Official Login Flow

Current official Commercial V2 login flow:

Commercial entry  
-> `/commercial-v2/start`  
-> email + password  
-> Firebase Auth sign-in  
-> `commercial_v2_profiles/{uid}` shell ensured  
-> `/commercial-v2/owner`

## Official Profile Flow

Current official Commercial V2 profile flow:

Owner dashboard  
-> edit draft profile  
-> upload identity image if needed  
-> preview draft  
-> publish  
-> live profile replaces previous live profile  
-> previous live profile is preserved under `versions`

## Official Public Profile Flow

Current official public profile flow:

Direct public URL  
-> `/commercial-v2/p/{profileId}`  
-> reads `commercial_v2_profiles/{profileId}`  
-> displays `liveProfile` only if:

- `isPublished == true`
- `isHidden != true`
- `liveProfile` exists

## Commercial V1 Status

Commercial V1 is no longer the official commercial runtime.

Commercial V1 is currently a legacy/archived reference layer with route-resolvable remnants. The Commercial V1 archive marker states:

- `FROZEN_ARCHIVED_REFERENCE_ONLY`

Commercial V1 and adjacent legacy commercial surfaces must not be treated as the official Commercial runtime for new commercial work.

## Runtime Impact

Runtime changed: NO  
Routes changed: NO  
Firebase changed: NO

