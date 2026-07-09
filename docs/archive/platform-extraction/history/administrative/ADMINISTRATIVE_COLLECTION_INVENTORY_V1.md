# Administrative Collection Inventory V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Collections

| Collection Name | Purpose | Read References | Write References | Related Files |
|---|---|---|---|---|
| `support_requests` | Structured support requests and support signals. | `SSupportRoomPage._requestsStream`, Firestore rules support observer/user read. | Firestore rules allow signed-in creator create with `source == structured_support`; runtime write source not inventoried in Administrative files. | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart`, `firestore.rules`. |
| `system_domains` | Domain status records for registry room visibility. | `DomainStatusService.watchDomainStatus`, `DomainStatusService.getDomainStatus`, Firestore rules owner/registry steward read. | Firestore rules `allow write: if false`; no Administrative runtime write observed. | `lib/core/system/domain_status_service.dart`, `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart`, `firestore.rules`. |
| `clinicians` | Clinician declaration/profile records. | `SDeclarationReviewRoomPage`, `AccountAccessService`, Firestore rules declaration reviewer/self/visibility read. | Firestore rules create/update through clinician validators; Administrative runtime write not observed. | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart`, `lib/core/auth/account_access_service.dart`, `firestore.rules`. |
| `centers` | Center declaration/profile records. | `SDeclarationReviewRoomPage`, `AccountAccessService`, Firestore rules declaration reviewer/self/visibility read. | Firestore rules create/update through center validators; Administrative runtime write not observed. | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart`, `lib/core/auth/account_access_service.dart`, `firestore.rules`. |
| `clinician_profile_change_requests` | Clinician profile update declarations. | `SDeclarationReviewRoomPage`, Firestore rules declaration reviewer/owner request read. | Firestore rules allow `profileRequestCreateValid('clinicianId')`; Administrative runtime write not observed. | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart`, `firestore.rules`. |
| `center_profile_change_requests` | Center profile update declarations. | `SDeclarationReviewRoomPage`, Firestore rules declaration reviewer/owner request read. | Firestore rules allow `profileRequestCreateValid('centerId')`; Administrative runtime write not observed. | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart`, `firestore.rules`. |
| `chat_threads` | Chat threads and support/safety source threads. | `ChatFirestoreService`, `ChatEscalationsPage` through service, Firestore rules support observer/participant read. | `ChatFirestoreService.createThread`, `sendMessage`, `updateThreadState`; Firestore rules allow signed-in participant create/update and support observer limited update. | `lib/features/chat/data/services/chat_firestore_service.dart`, `lib/features/safety/presentation/pages/chat_escalations_page.dart`, `firestore.rules`. |
| `chat_threads/{threadId}/messages` | Messages inside chat threads. | `ChatFirestoreService.streamMessages`, Firestore rules support observer/participant read. | `ChatFirestoreService.sendMessage`; Firestore rules allow signed-in create when parent thread exists. | `lib/features/chat/data/services/chat_firestore_service.dart`, `firestore.rules`. |
| `chat_escalations` | Safety escalation records. | `ChatFirestoreService.streamEscalations`, `streamRecommendedEscalations`, Firestore rules support observer/recommended clinician read. | `ChatFirestoreService.createEscalation`, `resolveEscalation`; Firestore rules allow signed-in create and support/recommended-clinician resolve-valid update. | `lib/features/chat/data/services/chat_firestore_service.dart`, `lib/features/safety/presentation/pages/chat_escalations_page.dart`, `firestore.rules`. |
| `chat_escalations/{escalationId}/reports` | Safety escalation reports. | `ChatFirestoreService.getLatestReportForEscalation`, `ChatEscalationReportPage`, Firestore rules support observer/recommended clinician read. | `ChatFirestoreService.createSafetyReport`; Firestore rules allow signed-in create. | `lib/features/chat/data/services/chat_firestore_service.dart`, `lib/features/chat/presentation/pages/chat_escalation_report_page.dart`, `firestore.rules`. |
| `provider_contact_requests` | Provider contact request records. | Firestore rules support observer/provider read. | Firestore rules session requester create. Administrative runtime reference not observed. | `firestore.rules`. |
| `center_contact_requests` | Center contact request records. | Firestore rules support observer/center read. | Firestore rules session requester create. Administrative runtime reference not observed. | `firestore.rules`. |

## Storage Rules References

| Storage Path | Purpose | Read References | Write References | Related Files |
|---|---|---|---|---|
| `centers/{uid}/{allPaths=**}` | Center private owner files. | `canReadPrivateOwnerFile(uid)` in storage rules. | Center owner safe upload in storage rules. | `storage.rules`. |
| `clinicians/{uid}/{allPaths=**}` | Clinician private owner files. | `canReadPrivateOwnerFile(uid)` in storage rules. | Clinician owner safe upload in storage rules. | `storage.rules`. |
| `identity/{uid}/{allPaths=**}` | Identity private owner files. | `canReadPrivateOwnerFile(uid)` in storage rules. | Owner safe upload in storage rules. | `storage.rules`. |
