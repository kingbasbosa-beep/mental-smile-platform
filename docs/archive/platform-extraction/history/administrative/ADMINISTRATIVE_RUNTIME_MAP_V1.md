# Administrative Runtime Map V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Factual Runtime Map

Only directly observable relationships are listed.

## Support Room

`SSupportRoomPage`

↓

`/s/support-room`

↓

Internal stream `_requestsStream()`

↓

Firestore collection `support_requests`

## Registry Room

`SRegistryRoomPage`

↓

`/s/registry-room`

↓

`DomainStatusService.watchDomainStatus(domain.key)`

↓

Firestore collection `system_domains`

## Declaration Review Room

`SDeclarationReviewRoomPage`

↓

`/s/declaration-review-room`

↓

`_watchCurrentStream()`

↓

Firestore collections:

- `clinicians`
- `centers`
- `clinician_profile_change_requests`
- `center_profile_change_requests`

## Owner District

`SOwnerDistrictPage`

↓

Owner routes:

- `/s/owner`
- `/s/owner/room`
- `/s/owner/sovereign-intelligence`
- `/s/owner/strategic-memory`
- `/s/owner/sovereign-vault`
- `/s/owner/constitutional-memory`
- `/s/owner/recovery-console`
- `/s/owner/capsules`
- `/s/owner/regeneration`

↓

No Firestore service observed in page file.

## Sovereign Construction Workbench

`SovereignConstructionWorkbenchPage`

↓

`/owner/os/construction-workbench`

↓

`ConstructionToolRegistry.entries`

↓

External URL / local path / reference values displayed or copied.

## Chat Escalations

`ChatEscalationsPage`

↓

`/chat/escalations`

↓

`ChatFirestoreService.streamEscalations()`

↓

Firestore collection `chat_escalations`

↓

`ChatFirestoreService.getThread(escalation.threadId)`

↓

Firestore collection `chat_threads`

## Chat Escalation Report

`ChatEscalationReportPage`

↓

`/chat/escalation/report`

↓

`ChatFirestoreService.getLatestReportForEscalation(escalationId)`

↓

Firestore path `chat_escalations/{escalationId}/reports`

## Route Access Gate

Administrative route

↓

`AppRouter._RouteAccessGate`

↓

`AccountAccessService.resolve(user)`

↓

Custom claims and Firestore collections:

- `clinicians`
- `centers`
