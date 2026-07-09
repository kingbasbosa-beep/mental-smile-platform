# Commercial V1 vs V2 Master Map V1

Operation ID: OP-COMMERCIAL-V1-VS-V2-CLASSIFICATION-AUDIT-V1  
Date: 2026-06-24

## Classification Rule

This map uses only the two requested values:

- COMMERCIAL_V1
- COMMERCIAL_V2

## Commercial V1 Map

| Name | Path | Type | Classification |
|---|---|---|---|
| Provider / Clinician / Center Registration Routes | `lib/app/router/routes.dart`, `lib/app/router/app_router.dart` | Route Group | COMMERCIAL_V1 |
| Web Registration Pages | `lib/features/web_registration/**` | Module | COMMERCIAL_V1 |
| Clinician Room And Related Screens | `lib/features/clinician/**`, `lib/features/chat/presentation/pages/clinician_chat_inbox_page.dart` | Module | COMMERCIAL_V1 |
| Center Dashboard And Center Room | `lib/features/centers/**` | Module | COMMERCIAL_V1 |
| Public Specialists Module | `lib/features/specialists/**` | Module | COMMERCIAL_V1 |
| Contact Request Records | `lib/features/contact_requests/**` | Module | COMMERCIAL_V1 |
| Provider And Center Signal Models | `lib/features/signals/domain/models/provider_signals.dart`, `lib/features/signals/domain/models/center_signals.dart` | Signal Files | COMMERCIAL_V1 |
| Commercial Monitoring Registry | `lib/features/monitoring/commercial/**`, `lib/features/monitoring/domain/registries/commercial_monitoring_category_registry.dart` | Monitoring Files | COMMERCIAL_V1 |
| Clinicians Collection | `firestore.rules` | Firebase Rules Reference | COMMERCIAL_V1 |
| Centers Collection | `firestore.rules` | Firebase Rules Reference | COMMERCIAL_V1 |
| Clinician Profile Change Requests Collection | `firestore.rules`, `firestore.indexes.json` | Firebase Rules / Index Reference | COMMERCIAL_V1 |
| Center Profile Change Requests Collection | `firestore.rules`, `firestore.indexes.json` | Firebase Rules / Index Reference | COMMERCIAL_V1 |
| Provider Contact Requests Collection | `firestore.rules` | Firebase Rules Reference | COMMERCIAL_V1 |
| Center Contact Requests Collection | `firestore.rules` | Firebase Rules Reference | COMMERCIAL_V1 |
| Clinician Storage Paths | `storage.rules` | Storage Rules Reference | COMMERCIAL_V1 |
| Center Storage Paths | `storage.rules` | Storage Rules Reference | COMMERCIAL_V1 |
| Web Registration Assets | `assets/branding/web_registration/**` | Asset Group | COMMERCIAL_V1 |
| Clinician / Center / Specialist Assets | `assets/branding/clinician_dashboard/**`, `assets/branding/center_dashboard/**`, `assets/images/centers/**`, `assets/images/specialists/**` | Asset Group | COMMERCIAL_V1 |
| Commercial V1 Documentation Set | `docs/archive/commercial/**`, `docs/constitutional-baseline/domain-audits/commercial/**`, `docs/constitutional-baseline/registries/COMMERCIAL_*` | Document / Report / Registry Group | COMMERCIAL_V1 |

## Commercial V2 Map

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V2 Route Group | `lib/app/router/routes.dart`, `lib/app/router/app_router.dart` | Route Group | COMMERCIAL_V2 |
| Commercial V2 Profile Engine | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Module | COMMERCIAL_V2 |
| Commercial V2 Start Page | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| Commercial V2 Owner Page | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| Commercial V2 Preview Page | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| Commercial V2 Public Profile Page | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| Commercial V2 Profile Collection | `firestore.rules` | Firebase Rules Reference | COMMERCIAL_V2 |
| Commercial V2 Version Subcollection | `firestore.rules` | Firebase Rules Reference | COMMERCIAL_V2 |
| Commercial V2 Identity Storage Paths | `storage.rules` | Storage Rules Reference | COMMERCIAL_V2 |
| Commercial V2 Logo Assets | `assets/branding/commercial_v2/**` | Asset Group | COMMERCIAL_V2 |
| Commercial V2 Documentation Set | `docs/commercial/COMMERCIAL_V2_*` | Document / Report / Index Group | COMMERCIAL_V2 |

## Source Inventory Files

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V1 Inventory | `docs/commercial/COMMERCIAL_V1_INVENTORY_V1.md` | Inventory | COMMERCIAL_V1 |
| Commercial V2 Inventory | `docs/commercial/COMMERCIAL_V2_INVENTORY_V1.md` | Inventory | COMMERCIAL_V2 |

## Final Map Result

Commercial V1 inventory is recorded in `COMMERCIAL_V1_INVENTORY_V1.md`.

Commercial V2 inventory is recorded in `COMMERCIAL_V2_INVENTORY_V1.md`.
