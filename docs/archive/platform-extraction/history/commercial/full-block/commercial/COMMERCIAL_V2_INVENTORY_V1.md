# Commercial V2 Inventory V1

Operation ID: OP-COMMERCIAL-V1-VS-V2-CLASSIFICATION-AUDIT-V1  
Date: 2026-06-24

## Rule

Every row in this inventory uses only one classification value:

COMMERCIAL_V2

## Routes

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V2 Start | `/commercial-v2/start` | Route | COMMERCIAL_V2 |
| Commercial V2 Owner | `/commercial-v2/owner` | Route | COMMERCIAL_V2 |
| Commercial V2 Preview | `/commercial-v2/preview` | Route | COMMERCIAL_V2 |
| Commercial V2 Public Profile Prefix | `/commercial-v2/p` | Route Prefix | COMMERCIAL_V2 |
| Commercial V2 Public Profile Dynamic Route | `/commercial-v2/p/{profileId}` | Dynamic Route | COMMERCIAL_V2 |

## Pages / Widgets / Modules

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V2 Profile Engine Page File | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Runtime File | COMMERCIAL_V2 |
| CommercialV2StartPage | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| CommercialV2OwnerProfilePage | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| CommercialV2PreviewPage | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| CommercialV2PublicProfilePage | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Page | COMMERCIAL_V2 |
| _CommercialV2Store | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Store Helper | COMMERCIAL_V2 |
| _CommercialV2PdfBuilder | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | PDF Builder | COMMERCIAL_V2 |
| _CommercialV2MedicalWhitePdfBuilder | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | PDF Builder | COMMERCIAL_V2 |
| _CommercialV2IdentityImage | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Widget | COMMERCIAL_V2 |
| _GeneratedCvPreview | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Widget | COMMERCIAL_V2 |
| _PublicProfileView | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Widget | COMMERCIAL_V2 |
| _ProfilePayload | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Model | COMMERCIAL_V2 |
| _ProfilePayload conditional sections | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Model Area | COMMERCIAL_V2 |
| _ProfilePayload repeatable conditional sections | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Model Area | COMMERCIAL_V2 |
| _CommercialV2Shell | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Shell Widget | COMMERCIAL_V2 |
| _CommercialV2Background | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Background Widget | COMMERCIAL_V2 |
| _CommercialV2MainCategories | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Category Data | COMMERCIAL_V2 |
| _CommercialV2Subcategories | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Category Data | COMMERCIAL_V2 |
| _CommercialV2CategoryPricingMetadata | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Category Metadata | COMMERCIAL_V2 |
| _CommercialV2SubcategoryPricingMetadata | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Category Metadata | COMMERCIAL_V2 |

## Collections

| Name | Path | Type | Classification |
|---|---|---|---|
| commercial_v2_profiles | `firestore.rules` | Firestore Collection Reference | COMMERCIAL_V2 |
| commercial_v2_profiles/{profileId}/versions | `firestore.rules` | Firestore Subcollection Reference | COMMERCIAL_V2 |
| commercial_v2_profiles | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Firestore Collection Usage | COMMERCIAL_V2 |
| versions | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Firestore Subcollection Usage | COMMERCIAL_V2 |

## Firebase Rules References

| Name | Path | Type | Classification |
|---|---|---|---|
| commercial_v2_profiles rules | `firestore.rules` | Rule Block | COMMERCIAL_V2 |
| commercial_v2 profile create rule | `firestore.rules` | Rule Area | COMMERCIAL_V2 |
| commercial_v2 profile update rule | `firestore.rules` | Rule Area | COMMERCIAL_V2 |
| commercial_v2 public read rule | `firestore.rules` | Rule Area | COMMERCIAL_V2 |
| commercial_v2 profile versions rules | `firestore.rules` | Rule Block | COMMERCIAL_V2 |

## Storage Rules References

| Name | Path | Type | Classification |
|---|---|---|---|
| commercial_v2_identity profile photo | `storage.rules` | Storage Path Rule | COMMERCIAL_V2 |
| commercial_v2_identity logo | `storage.rules` | Storage Path Rule | COMMERCIAL_V2 |
| commercial_v2_identity upload usage | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Storage Usage | COMMERCIAL_V2 |

## Signals

| Name | Path | Type | Classification |
|---|---|---|---|
| commercial_profile_opened | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_search_used | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_filter_used | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_directory_opened | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_registration_started | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_registration_completed | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_profile_generated | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_profile_published | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_profile_hidden | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |
| commercial_identity_image_uploaded | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Prepared Signal Name | COMMERCIAL_V2 |

## Assets

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V2 Silver Logo | `assets/branding/commercial_v2/ms_logo_silver.png` | Asset File | COMMERCIAL_V2 |
| Commercial V2 Gold Logo | `assets/branding/commercial_v2/ms_logo_gold.png` | Asset File | COMMERCIAL_V2 |
| Commercial V2 Branding Folder | `assets/branding/commercial_v2/` | Asset Folder | COMMERCIAL_V2 |
| Commercial V2 Asset Bundle Entry | `pubspec.yaml` | YAML Asset Entry | COMMERCIAL_V2 |

## Localization Keys

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V2 Start visible labels | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Inline Localization Group | COMMERCIAL_V2 |
| Commercial V2 Owner visible labels | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Inline Localization Group | COMMERCIAL_V2 |
| Commercial V2 Public Profile labels | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Inline Text Group | COMMERCIAL_V2 |
| Commercial V2 PDF labels | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | Inline Text Group | COMMERCIAL_V2 |

## Documents / Guides / Reports / Registries

| Name | Path | Type | Classification |
|---|---|---|---|
| Commercial V2 Foundation Design | `docs/commercial/COMMERCIAL_V2_FOUNDATION_DESIGN.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Profile Engine Design | `docs/commercial/COMMERCIAL_V2_PROFILE_ENGINE_DESIGN.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Block A Execution Report | `docs/commercial/COMMERCIAL_V2_BLOCK_A_EXECUTION_REPORT.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Identity Media Doctrine | `docs/commercial/COMMERCIAL_V2_IDENTITY_MEDIA_VS_MARKETING_MEDIA_DOCTRINE.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Surface Inventory | `docs/commercial/COMMERCIAL_V2_SURFACE_INVENTORY_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Route Forensic Map | `docs/commercial/COMMERCIAL_V2_ROUTE_FORENSIC_MAP_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 User Flow Audit | `docs/commercial/COMMERCIAL_V2_USER_FLOW_AUDIT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Registration Audit | `docs/commercial/COMMERCIAL_V2_REGISTRATION_AUDIT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Profile Generation Audit | `docs/commercial/COMMERCIAL_V2_PROFILE_GENERATION_AUDIT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Public Discovery Audit | `docs/commercial/COMMERCIAL_V2_PUBLIC_DISCOVERY_AUDIT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Signal And Aggregation Forensic Audit | `docs/commercial/COMMERCIAL_V2_SIGNAL_AND_AGGREGATION_FORENSIC_AUDIT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Legacy And Archive Audit | `docs/commercial/COMMERCIAL_V2_LEGACY_AND_ARCHIVE_AUDIT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Client Visibility Report | `docs/commercial/COMMERCIAL_V2_CLIENT_VISIBILITY_REPORT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Operational Forensic Report | `docs/commercial/COMMERCIAL_V2_OPERATIONAL_FORENSIC_REPORT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Official Runtime Declaration | `docs/commercial/COMMERCIAL_V2_OFFICIAL_RUNTIME_DECLARATION_V1.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Legacy Purification Map | `docs/commercial/COMMERCIAL_V2_LEGACY_PURIFICATION_MAP_V1.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Discovery Foundation | `docs/commercial/COMMERCIAL_V2_DISCOVERY_FOUNDATION_V1.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Client Discovery Entry Decision | `docs/commercial/COMMERCIAL_V2_CLIENT_DISCOVERY_ENTRY_DECISION_V1.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Registration Model Decision Report | `docs/commercial/COMMERCIAL_V2_REGISTRATION_MODEL_DECISION_REPORT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V2 Discovery Visibility Matrix | `docs/commercial/COMMERCIAL_V2_DISCOVERY_VISIBILITY_MATRIX_V1.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Signal Preparation Map | `docs/commercial/COMMERCIAL_V2_SIGNAL_PREPARATION_MAP_V1.md` | Document | COMMERCIAL_V2 |
| Commercial V2 Clean Foundation Index | `docs/commercial/COMMERCIAL_V2_CLEAN_FOUNDATION_INDEX_V1.md` | Index | COMMERCIAL_V2 |
| Commercial V2 Purification And Discovery Foundation Report | `docs/commercial/COMMERCIAL_V2_PURIFICATION_AND_DISCOVERY_FOUNDATION_REPORT_V1.md` | Report | COMMERCIAL_V2 |
| Commercial V1 vs V2 Classification Audit Files | `docs/commercial/COMMERCIAL_V1_VS_V2_*` | Report Set | COMMERCIAL_V2 |

