# Commercial V2 User Flow Audit V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24

## Flow A - Visitor Flow

Observed runtime:

External Visitor  
-> direct route `/commercial-v2/p/{profileId}`  
-> `CommercialV2PublicProfilePage`  
-> Firestore document `commercial_v2_profiles/{profileId}`  
-> page appears only if `isPublished == true`, `isHidden != true`, and `liveProfile` exists.

There is no verified Commercial V2 public index, listing, search, or filter path from which the visitor can discover a profile.

## Flow B - Client Discovery Flow

Client  
-> no Commercial V2 discovery entry found  
-> no Commercial V2 listing/search/filter found  
-> profile can only be opened by direct public URL.

Commercial Discovery Status: missing for Commercial V2.

Legacy discovery surfaces exist:

- `/module/specialists`
- `/module/centers`
- `/s/city/providers`
- `/s/city/centers`

These are not Commercial V2 profile discovery surfaces.

## Flow C - Provider / Commercial Owner Flow

Splash  
-> Provider / Center / Owner Access  
-> `/commercial-v2/start`  
-> create account or login with email/password  
-> `_CommercialV2Store.ensureProfileShell` creates/loads `commercial_v2_profiles/{uid}`  
-> `/commercial-v2/owner`  
-> edit draft profile  
-> preview draft at `/commercial-v2/preview`  
-> publish profile  
-> public URL `/commercial-v2/p/{uid}` becomes available.

Actual registration model is Commercial V2 profile-owner account creation, not legacy provider declaration registration.

## Flow D - Center Flow

Commercial V2 center flow uses the same universal Commercial V2 owner flow:

Splash  
-> `/commercial-v2/start`  
-> account create/login  
-> `/commercial-v2/owner`  
-> choose Main Category `Center` and optional subcategory  
-> optional conditional sections appear based on metadata  
-> publish  
-> `/commercial-v2/p/{uid}`

Legacy center flow still exists separately:

`/web/center/register` -> web center registration steps -> `centers/{uid}` -> protected `/center/dashboard` / `/center/room`.

## Flow E - Education Flow

Commercial V2 education flow uses the same universal profile engine:

Start  
-> Owner Profile  
-> Main Category `Educational`  
-> optional subcategory and programs/fees block  
-> publish  
-> direct public profile URL.

No separate educational discovery/listing route exists in Commercial V2.

## Flow F - Association / NGO Flow

Commercial V2 association/NGO flow uses the same universal profile engine:

Start  
-> Owner Profile  
-> Main Category `Initiative / NGO` or `Organization` with NGO-style subcategory  
-> publish  
-> direct public profile URL.

No separate association/NGO discovery/listing route exists in Commercial V2.

## Flow Conclusion

Commercial V2 supports account -> profile draft -> preview -> publish -> direct public profile. Commercial V2 does not yet support public discovery or category browsing.

