# RESIDENTIAL_ACTIVE_DOCUMENTS_CAPSULE_SOURCE_MAP_V1

Status: ACTIVE_CURRENT

## Purpose

Map Residential active documents to future capsule use.

## Capsule Source Map

| Capsule Area | Active Document Source | Include Later In Full Capsule | Exclude Rule |
|---|---|---|---|
| Overview | `docs/capsules/residential/index-snapshots/RESIDENTIAL_CAPSULE_INDEX_OVERVIEW_V1.md` | YES | Exclude older overview docs. |
| Text Snapshot | `docs/capsules/residential/index-snapshots/RESIDENTIAL_TEXT_SNAPSHOT_V1.md` | YES | Exclude historical truth drafts. |
| Technical Structure | `docs/capsules/residential/index-snapshots/RESIDENTIAL_TECHNICAL_STRUCTURE_SNAPSHOT_V1.md` | YES | Exclude deleted or placeholder runtime files. |
| Routes | `docs/capsules/residential/index-snapshots/RESIDENTIAL_ROUTE_SNAPSHOT_V1.md` | YES | Exclude old route aliases. |
| Firebase / Firestore | `docs/capsules/residential/index-snapshots/RESIDENTIAL_FIREBASE_FIRESTORE_RULES_SNAPSHOT_V1.md` | YES | Exclude legacy collection references. |
| YAML / Assets / L10N | `docs/capsules/residential/index-snapshots/RESIDENTIAL_YAML_ASSET_L10N_SNAPSHOT_V1.md` | YES | Exclude stale asset and localization references. |
| Cards / Guides / Prompts | `docs/capsules/residential/index-snapshots/RESIDENTIAL_CARD_GUIDE_PROMPT_SNAPSHOT_V1.md` | YES | Exclude uncarded documents. |
| UI Widgets | `docs/capsules/residential/index-snapshots/RESIDENTIAL_UI_WIDGET_SNAPSHOT_V1.md` | YES | Exclude obsolete UI surfaces. |
| Signal Runtime | `docs/capsules/residential/index-snapshots/RESIDENTIAL_SIGNAL_RUNTIME_SNAPSHOT_V1.md` | YES | Exclude unused emitters/builders/writers. |
| Archive Destinations | `docs/capsules/residential/index-snapshots/RESIDENTIAL_ARCHIVE_DESTINATION_SNAPSHOT_V1.md` | YES | Exclude retired destinations. |
| Runtime Connection | `docs/capsules/residential/index-snapshots/RESIDENTIAL_RUNTIME_CONNECTION_SNAPSHOT_V1.md` | YES | Exclude non-governed writes. |
| Governance Docs | `docs/capsules/residential/index-snapshots/RESIDENTIAL_GOVERNANCE_DOCS_SNAPSHOT_V1.md` | YES | Exclude historical evidence unless registered. |
| Manifest Draft | `docs/capsules/residential/index-snapshots/RESIDENTIAL_CAPSULE_CONTENT_MANIFEST_DRAFT_V1.md` | YES | Exclude generated capsule artifacts until later block. |
| Completion Report | `docs/capsules/residential/index-snapshots/RESIDENTIAL_CAPSULE_INDEX_COMPLETION_REPORT_V1.md` | YES | Exclude failed or superseded reports. |

## Capsule Eligibility Rule

Future capsule creation may use this map only when the referenced document is also listed in `RESIDENTIAL_ACTIVE_DOCUMENTS_REGISTRY_V1.md` as `ACTIVE_CURRENT` and `capsule_eligible = YES`.

FINAL STATUS: RESIDENTIAL_ACTIVE_DOCUMENTS_CAPSULE_SOURCE_MAP_CREATED
