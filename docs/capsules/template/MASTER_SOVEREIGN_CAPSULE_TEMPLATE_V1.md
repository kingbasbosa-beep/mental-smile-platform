# MASTER_SOVEREIGN_CAPSULE_TEMPLATE_V1

Status: ACTIVE_TEMPLATE

## Purpose

Define the standard structure every future Mental Smile Sovereign Capsule must follow.

Residential, Library, Commercial V2, Administrative, Monitoring, Owner, Archive, and future sections inherit this template.

## Required Folder Structure

| Folder | Required Purpose |
|---|---|
| `00_READ_ME/` | Capsule README, identity, dependency graph, evolution policy. |
| `01_MANIFEST/` | Complete capsule manifest and copied/snapshotted content map. |
| `02_CONSTRUCTIVE_PROMPT/` | Self-contained future Codex rebuild prompt. |
| `03_TECHNICAL_SOURCE/` | Technical source copies or safe snapshots. |
| `04_UI/` | UI behavior map and UI source notes. |
| `05_ROUTES/` | Route constants, router cases, and route map. |
| `06_SIGNALS_RUNTIME/` | Signal codes, emitters, builders, writers, and contract. |
| `07_FIREBASE_FIRESTORE/` | Firestore/Firebase/rules/indexes/storage excerpts relevant to the section. |
| `08_YAML_ASSETS_L10N/` | YAML, asset, and localization snapshots or copies. |
| `09_CARDS_GUIDES_PROMPTS/` | Current cards, guides, prompts, registries, and section docs. |
| `10_ARCHIVE_DIGITAL_TWIN/` | Archive destinations, magnets, digital twins, active documents, and capsule source maps. |
| `11_RUNTIME_CONNECTION/` | Runtime connection docs and manual test cards. |
| `12_RECOVERY/` | Recovery and rebuild instructions. |
| `13_VALIDATION/` | Validation report. |
| `14_OWNER_NOTES/` | Owner notes, screenshot annotation plans, and non-implemented suggestions. |
| `98_OWNER_DECISIONS/` | Owner decisions log and discovered improvements. |
| `99_CERTIFICATE/` | Capsule certificate and quality score. |

## Required Documents

Every capsule must include:

- `00_READ_ME/README_<CAPSULE_CODE>.md`
- `00_READ_ME/CAPSULE_IDENTITY_V1.md`
- `00_READ_ME/CAPSULE_DEPENDENCY_GRAPH_V1.md`
- `00_READ_ME/CAPSULE_EVOLUTION_POLICY_V1.md`
- `01_MANIFEST/<CAPSULE_CODE>_MANIFEST.md`
- `02_CONSTRUCTIVE_PROMPT/<SECTION>_CAPSULE_CONSTRUCTIVE_PROMPT_V1.md`
- `12_RECOVERY/<SECTION>_CAPSULE_RECOVERY_INSTRUCTIONS_V1.md`
- `13_VALIDATION/<SECTION>_CAPSULE_VALIDATION_REPORT_V1.md`
- `14_OWNER_NOTES/<SECTION>_SCREENSHOT_ANNOTATION_PLAN_V1.md`
- `98_OWNER_DECISIONS/OWNER_DECISIONS_LOG_V1.md`
- `98_OWNER_DECISIONS/CAPSULE_DISCOVERED_IMPROVEMENTS_V1.md`
- `99_CERTIFICATE/<CAPSULE_CODE>_CERTIFICATE.md`
- `99_CERTIFICATE/CAPSULE_QUALITY_SCORE_V1.md`

## Required Identity Fields

- Capsule Name
- Capsule Code
- Section Code
- Section Name
- Generation
- Capsule Version
- Approval Date
- Built From
- Built By
- Platform
- Minimum Runtime
- Minimum Firebase
- Compatibility
- Authority
- Capsule Eligible
- Supersedes
- Superseded By
- Retirement Date
- Status

## Required Governance Rules

- Use Active Documents Registry as active truth.
- Include only `ACTIVE_CURRENT` and `capsule_eligible = YES` documents as active authority.
- Do not include secrets, credentials, user data, Firestore documents, runtime data, or private keys.
- Do not treat legacy, placeholder, retired, historical, or uncoded material as active truth.
- Suggestions are recorded in `98_OWNER_DECISIONS/` and are not implemented automatically.
- Certified capsule contents are immutable; later changes create a patch or a new capsule version.

## Future Section Inheritance

| Section | Requirement |
|---|---|
| Residential | Must inherit this structure. |
| Library | Must inherit this structure. |
| Commercial V2 | Must inherit this structure. |
| Administrative | Must inherit this structure. |
| Monitoring | Must inherit this structure. |
| Owner | Must inherit this structure. |
| Archive | Must inherit this structure. |
| Future sections | Must inherit this structure before capsule certification. |

FINAL STATUS: MASTER_SOVEREIGN_CAPSULE_TEMPLATE_ESTABLISHED
