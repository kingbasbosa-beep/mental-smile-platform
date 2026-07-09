# Administrative Dependency Inventory V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Dependencies

| Item | Depends On | Used By | Referenced By |
|---|---|---|---|
| Administrative route guards | Firebase Auth, `AccountAccessService`, `RoleNames` | Administrative protected routes | `lib/app/router/app_router.dart` |
| Owner routes | `SOwnerDistrictPage`, route constants, owner role | Owner district surfaces | `lib/app/router/routes.dart`, `lib/app/router/app_router.dart`, `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` |
| Support Room | Firestore `support_requests`, support request internal model | `/s/support-room` | `AppRouter`, `MenuPage`, login role resolution |
| Registry Room | `domainRegistry`, `DomainStatusService`, Firestore `system_domains` | `/s/registry-room` | `AppRouter`, `MenuPage`, login role resolution |
| Declaration Review Room | Firestore `clinicians`, `centers`, `clinician_profile_change_requests`, `center_profile_change_requests`; center pricing/document helpers | `/s/declaration-review-room` | `AppRouter`, `MenuPage`, login role resolution |
| Safety Escalation Observatory | `ChatFirestoreService`, `ChatEscalationModel`, Firebase Auth | `/chat/escalations` | `AppRouter`, `ChatEscalationsPage` |
| Safety Escalation Report | `ChatFirestoreService`, Firestore report subcollection | `/chat/escalation/report` | `AppRouter`, `ChatEscalationsPage` |
| Sovereign Construction Workbench | `ConstructionToolRegistry`, `url_launcher`, Clipboard | `/owner/os/construction-workbench` | `AppRouter`, owner navigation |
| DomainStatusService | Firestore `system_domains`, `DomainStatus`, `DomainKey` | Registry Room | `lib/core/system/domain_status_service.dart` |
| AccountAccessService | Firebase Auth user, Firestore `clinicians`, `centers`, custom claims | Route access and role gateways | `AppRouter`, `RoleAccessGateway` |
| Firestore rules | Custom claim roles, collection validators | Administrative reads/writes authorization | `firestore.rules` |
| Storage rules | Custom claim owner, clinician/center document role checks | Owner/private file access | `storage.rules` |
