# Commercial V1 Inventory V1

Operation ID: OP-COMMERCIAL-V1-VS-V2-CLASSIFICATION-AUDIT-V1  
Date: 2026-06-24

## Rule

Every row in this inventory uses only one classification value:

COMMERCIAL_V1

## Routes

| Name | Path | Type | Classification |
|---|---|---|---|
| Portal Provider Register | `/register/provider` | Route | COMMERCIAL_V1 |
| Clinician Register | `/register/clinician` | Route | COMMERCIAL_V1 |
| Center Register | `/register/center` | Route | COMMERCIAL_V1 |
| Web Clinician Register | `/web/clinician/register` | Route | COMMERCIAL_V1 |
| Web Clinician Profile | `/web/clinician/profile` | Route | COMMERCIAL_V1 |
| Web Clinician Documents | `/web/clinician/documents` | Route | COMMERCIAL_V1 |
| Web Center Register | `/web/center/register` | Route | COMMERCIAL_V1 |
| Web Center Profile | `/web/center/profile` | Route | COMMERCIAL_V1 |
| Web Center Media | `/web/center/media` | Route | COMMERCIAL_V1 |
| Web Center Pricing | `/web/center/pricing` | Route | COMMERCIAL_V1 |
| Web Center Documents | `/web/center/documents` | Route | COMMERCIAL_V1 |
| Clinician Room | `/clinician/room` | Route | COMMERCIAL_V1 |
| Clinician Profile Edit Request | `/clinician/profile-edit-request` | Route | COMMERCIAL_V1 |
| Clinician Chat Inbox | `/clinician/chat-inbox` | Route | COMMERCIAL_V1 |
| Center Dashboard | `/center/dashboard` | Route | COMMERCIAL_V1 |
| Center Room | `/center/room` | Route | COMMERCIAL_V1 |
| Center Profile Edit Request | `/center/profile-edit-request` | Route | COMMERCIAL_V1 |
| S City Providers | `/s/city/providers` | Route | COMMERCIAL_V1 |
| S City Centers | `/s/city/centers` | Route | COMMERCIAL_V1 |
| Specialists Module | `/module/specialists` | Route | COMMERCIAL_V1 |
| Specialists List | `/module/specialists/list` | Route | COMMERCIAL_V1 |
| Specialist Details | `/module/specialists/details` | Route | COMMERCIAL_V1 |
| Centers Module | `/module/centers` | Route | COMMERCIAL_V1 |
| Centers List | `/module/centers/list` | Route | COMMERCIAL_V1 |
| Center Details | `/module/centers/details` | Route | COMMERCIAL_V1 |

## Pages

| Name | Path | Type | Classification |
|---|---|---|---|
| Web Registration Background | `lib/features/web_registration/presentation/web_registration_background.dart` | Widget/Page Support | COMMERCIAL_V1 |
| Web Registration Success Page | `lib/features/web_registration/presentation/pages/web_registration_success_page.dart` | Page | COMMERCIAL_V1 |
| Web Clinician Register Portal Page | `lib/features/web_registration/presentation/pages/web_clinician_register_portal_page.dart` | Page | COMMERCIAL_V1 |
| Web Clinician Profile Page | `lib/features/web_registration/presentation/pages/web_clinician_profile_page.dart` | Page | COMMERCIAL_V1 |
| Web Clinician Documents Page | `lib/features/web_registration/presentation/pages/web_clinician_documents_page.dart` | Page | COMMERCIAL_V1 |
| Web Center Register Portal Page | `lib/features/web_registration/presentation/pages/web_center_register_portal_page.dart` | Page | COMMERCIAL_V1 |
| Web Center Profile Page | `lib/features/web_registration/presentation/pages/web_center_profile_page.dart` | Page | COMMERCIAL_V1 |
| Web Center Media Page | `lib/features/web_registration/presentation/pages/web_center_media_page.dart` | Page | COMMERCIAL_V1 |
| Web Center Pricing Page | `lib/features/web_registration/presentation/pages/web_center_pricing_page.dart` | Page | COMMERCIAL_V1 |
| Web Center Documents Page | `lib/features/web_registration/presentation/pages/web_center_documents_page.dart` | Page | COMMERCIAL_V1 |
| Clinician Room Page | `lib/features/clinician/presentation/pages/clinician_room_page.dart` | Page | COMMERCIAL_V1 |
| Clinician Chat Inbox Page | `lib/features/chat/presentation/pages/clinician_chat_inbox_page.dart` | Page | COMMERCIAL_V1 |
| Center Dashboard Page | `lib/features/centers/presentation/pages/center_dashboard_page.dart` | Page | COMMERCIAL_V1 |
| Center Room Page | `lib/features/centers/presentation/pages/center_room_page.dart` | Page | COMMERCIAL_V1 |
| Centers Landing Page | `lib/features/centers/presentation/pages/centers_landing_page.dart` | Page | COMMERCIAL_V1 |
| Centers List Page | `lib/features/centers/presentation/pages/centers_list_page.dart` | Page | COMMERCIAL_V1 |
| Center Details Page | `lib/features/centers/presentation/pages/center_details_page.dart` | Page | COMMERCIAL_V1 |
| Specialists Categories Page | `lib/features/specialists/presentation/specialists_categories_page.dart` | Page | COMMERCIAL_V1 |
| Specialists List Page | `lib/features/specialists/presentation/specialists_list_page.dart` | Page | COMMERCIAL_V1 |
| Specialist Details Page | `lib/features/specialists/presentation/specialist_details_page.dart` | Page | COMMERCIAL_V1 |

## Modules

| Name | Path | Type | Classification |
|---|---|---|---|
| Web Registration Module | `lib/features/web_registration/**` | Module | COMMERCIAL_V1 |
| Clinician Module | `lib/features/clinician/**` | Module | COMMERCIAL_V1 |
| Centers Module | `lib/features/centers/**` | Module | COMMERCIAL_V1 |
| Specialists Module | `lib/features/specialists/**` | Module | COMMERCIAL_V1 |
| Contact Requests Module | `lib/features/contact_requests/**` | Module | COMMERCIAL_V1 |
| Trust Provider Summary Module | `lib/features/trust/domain/**` | Module | COMMERCIAL_V1 |
| Commercial Monitoring Module | `lib/features/monitoring/commercial/**` | Module | COMMERCIAL_V1 |
| Commercial Monitoring Category Registry | `lib/features/monitoring/domain/registries/commercial_monitoring_category_registry.dart` | Registry | COMMERCIAL_V1 |

## Collections

| Name | Path | Type | Classification |
|---|---|---|---|
| clinicians | `firestore.rules` | Firestore Collection Reference | COMMERCIAL_V1 |
| centers | `firestore.rules` | Firestore Collection Reference | COMMERCIAL_V1 |
| clinician_profile_change_requests | `firestore.rules` | Firestore Collection Reference | COMMERCIAL_V1 |
| center_profile_change_requests | `firestore.rules` | Firestore Collection Reference | COMMERCIAL_V1 |
| provider_contact_requests | `firestore.rules` | Firestore Collection Reference | COMMERCIAL_V1 |
| center_contact_requests | `firestore.rules` | Firestore Collection Reference | COMMERCIAL_V1 |
| clinician_profile_change_requests Index | `firestore.indexes.json` | Firestore Index Reference | COMMERCIAL_V1 |
| center_profile_change_requests Index | `firestore.indexes.json` | Firestore Index Reference | COMMERCIAL_V1 |

## Firebase Rules References

| Name | Path | Type | Classification |
|---|---|---|---|
| isClinician | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| isCenter | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| clinicianCreateValid | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| clinicianSelfRegistrationFields | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| clinicianSelfUpdateValid | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| centerCreateValid | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| centerSelfRegistrationFields | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| centerSelfUpdateValid | `firestore.rules` | Rule Function | COMMERCIAL_V1 |
| clinician profile change request rules | `firestore.rules` | Rule Block | COMMERCIAL_V1 |
| center profile change request rules | `firestore.rules` | Rule Block | COMMERCIAL_V1 |
| provider contact request rules | `firestore.rules` | Rule Block | COMMERCIAL_V1 |
| center contact request rules | `firestore.rules` | Rule Block | COMMERCIAL_V1 |

## Storage Rules References

| Name | Path | Type | Classification |
|---|---|---|---|
| clinician storage authority | `storage.rules` | Storage Rule Function | COMMERCIAL_V1 |
| center storage authority | `storage.rules` | Storage Rule Function | COMMERCIAL_V1 |
| centers storage path | `storage.rules` | Storage Path Rule | COMMERCIAL_V1 |
| clinicians storage path | `storage.rules` | Storage Path Rule | COMMERCIAL_V1 |

## Signals

| Name | Path | Type | Classification |
|---|---|---|---|
| provider_contact_started | `lib/features/signals/domain/registries/signal_type_registry.dart` | Signal | COMMERCIAL_V1 |
| center_contact_started | `lib/features/signals/domain/registries/signal_type_registry.dart` | Signal | COMMERCIAL_V1 |
| provider_profile_opened | `lib/features/signals/domain/registries/signal_type_registry.dart` | Signal | COMMERCIAL_V1 |
| center_profile_opened | `lib/features/signals/domain/registries/signal_type_registry.dart` | Signal | COMMERCIAL_V1 |
| Provider Signals Model | `lib/features/signals/domain/models/provider_signals.dart` | Signal Model | COMMERCIAL_V1 |
| Center Signals Model | `lib/features/signals/domain/models/center_signals.dart` | Signal Model | COMMERCIAL_V1 |
| Provider Contact Factory | `lib/features/signals/domain/factories/signal_package_factory.dart` | Signal Factory | COMMERCIAL_V1 |
| Center Contact Factory | `lib/features/signals/domain/factories/signal_package_factory.dart` | Signal Factory | COMMERCIAL_V1 |
| Commercial Monitoring Registry Signals | `lib/features/monitoring/commercial/registry/commercial_monitoring_registry.dart` | Signal Registry | COMMERCIAL_V1 |
| Commercial Signal Aggregate | `lib/features/monitoring/commercial/aggregates/commercial_signal_aggregate.dart` | Signal Aggregate | COMMERCIAL_V1 |

## Assets

| Name | Path | Type | Classification |
|---|---|---|---|
| Web Registration Clinician Assets | `assets/branding/web_registration/clinicians/**` | Asset Folder | COMMERCIAL_V1 |
| Web Registration Center Assets | `assets/branding/web_registration/centers/**` | Asset Folder | COMMERCIAL_V1 |
| Web Registration Clinician Assets | `assets/branding/web/registration/clinicians/**` | Asset Folder | COMMERCIAL_V1 |
| Web Registration Center Assets | `assets/branding/web/registration/centers/**` | Asset Folder | COMMERCIAL_V1 |
| Clinician Dashboard Action Assets | `assets/images/clinicians_dashboard/actions/**` | Asset Folder | COMMERCIAL_V1 |
| Center Dashboard Action Assets | `assets/images/center_dashboard/actions/**` | Asset Folder | COMMERCIAL_V1 |
| Centers Images | `assets/images/centers/**` | Asset Folder | COMMERCIAL_V1 |
| Specialists Images | `assets/images/specialists/**` | Asset Folder | COMMERCIAL_V1 |
| Specialists Backgrounds | `assets/images/backgrounds/specialists_bg_*` | Asset Files | COMMERCIAL_V1 |
| Clinician Avatar Images | `assets/images/avatar_clinician_*` | Asset Files | COMMERCIAL_V1 |
| C5 Clinician Avatars | `assets/c5/avatars/avatar_clinician_*` | Asset Files | COMMERCIAL_V1 |
| C6 Locked Clinicians | `assets/c6_library/states/locked_clinicians.png` | Asset File | COMMERCIAL_V1 |

## Localization Keys

| Name | Path | Type | Classification |
|---|---|---|---|
| moduleSpecialists | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key | COMMERCIAL_V1 |
| moduleCenters | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key | COMMERCIAL_V1 |
| menuSpecialists | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key | COMMERCIAL_V1 |
| menuCenters | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key | COMMERCIAL_V1 |
| center* keys | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key Group | COMMERCIAL_V1 |
| webCenter* keys | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key Group | COMMERCIAL_V1 |
| webClinician* keys | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key Group | COMMERCIAL_V1 |
| clinician* keys | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key Group | COMMERCIAL_V1 |
| statusCenter* keys | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key Group | COMMERCIAL_V1 |
| statusClinician* keys | `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` | Localization Key Group | COMMERCIAL_V1 |

## Documents / Guides / Reports / Registries

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V1 Archive Marker | `docs/archive/commercial/COMMERCIAL_V1_ARCHIVE_MARKER.md` | Document | COMMERCIAL_V1 |
| Commercial Domain Audit | `docs/constitutional-baseline/topology/COMMERCIAL_DOMAIN_AUDIT_REPORT_V1.md` | Report | COMMERCIAL_V1 |
| Commercial Signal Ownership Registry | `docs/constitutional-baseline/registries/COMMERCIAL_SIGNAL_OWNERSHIP_REGISTRY_V1.md` | Registry | COMMERCIAL_V1 |
| Commercial Route Ownership Registry | `docs/constitutional-baseline/registries/COMMERCIAL_ROUTE_OWNERSHIP_REGISTRY_V1.md` | Registry | COMMERCIAL_V1 |
| Commercial Collection Ownership Registry | `docs/constitutional-baseline/registries/COMMERCIAL_COLLECTION_OWNERSHIP_REGISTRY_V1.md` | Registry | COMMERCIAL_V1 |
| Commercial Architecture Report | `docs/constitutional-baseline/domain-audits/commercial/COMMERCIAL_ARCHITECTURE_REPORT_V1.md` | Report | COMMERCIAL_V1 |
| Commercial Asset Usage Report | `docs/constitutional-baseline/domain-audits/commercial/COMMERCIAL_ASSET_USAGE_REPORT_V1.md` | Report | COMMERCIAL_V1 |
| Commercial Collection Health Report | `docs/constitutional-baseline/domain-audits/commercial/COMMERCIAL_COLLECTION_HEALTH_REPORT_V1.md` | Report | COMMERCIAL_V1 |
| Commercial Findings Report | `docs/constitutional-baseline/domain-audits/commercial/COMMERCIAL_FINDINGS_REPORT_V1.md` | Report | COMMERCIAL_V1 |
| Commercial Health Scorecard | `docs/constitutional-baseline/domain-audits/commercial/COMMERCIAL_HEALTH_SCORECARD_V1.md` | Report | COMMERCIAL_V1 |
| Commercial Route Health Report | `docs/constitutional-baseline/domain-audits/commercial/COMMERCIAL_ROUTE_HEALTH_REPORT_V1.md` | Report | COMMERCIAL_V1 |
| Commercial Signal Flow Report | `docs/constitutional-baseline/domain-audits/commercial/COMMERCIAL_SIGNAL_FLOW_REPORT_V1.md` | Report | COMMERCIAL_V1 |
| Provider vs Clinician Card | `docs/constitutional-baseline/cards/archive/ARCHIVE_CARD_PROVIDER_VS_CLINICIAN_V1.md` | Card | COMMERCIAL_V1 |

