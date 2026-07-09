# RESIDENTIAL_SOVEREIGN_CAPSULE_V1_MANIFEST

Status: CAPSULE_CREATED

## Purpose

List the contents of the Residential Sovereign Capsule V1.

## Folder Manifest

| Folder | Contents |
|---|---|
| `00_READ_ME/` | Capsule entry guide. |
| `01_MANIFEST/` | Capsule manifest and file map. |
| `02_CONSTRUCTIVE_PROMPT/` | Self-contained rebuild prompt for future Codex. |
| `03_TECHNICAL_SOURCE/` | Copied active Residential UI source and referenced shared helper source. |
| `04_UI/` | UI behavior map and rebuild notes. |
| `05_ROUTES/` | Residential route constants and router-case excerpts. |
| `06_SIGNALS_RUNTIME/` | Copied Residential signal runtime source and signal contract. |
| `07_FIREBASE_FIRESTORE/` | Residential Firestore/rules snapshot and Firebase ownership notes. |
| `08_YAML_ASSETS_L10N/` | YAML/ARB source copies, asset copies, and asset copy list. |
| `09_CARDS_GUIDES_PROMPTS/` | Residential section governance docs, cards, R1-R13 gates, guides, and prompts. |
| `10_ARCHIVE_DIGITAL_TWIN/` | Active docs registry, Residential index snapshots, and Archive/Digital Twin notes. |
| `11_RUNTIME_CONNECTION/` | Residential RUN-6 runtime connection docs. |
| `12_RECOVERY/` | Rebuild and recovery instructions. |
| `13_VALIDATION/` | Capsule validation report. |
| `14_OWNER_NOTES/` | Screenshot annotation plan and non-implemented suggestions. |
| `99_CERTIFICATE/` | Capsule certificate. |

## Copied Technical Source

- `lib/features/client/presentation/pages/client_room_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_room_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_links_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart`
- `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart`
- `lib/features/residential/signals/`
- `lib/shared/accessibility/`
- `lib/shared/wellbeing/`

## Copied Governance Sources

- `docs/sections/residential/`
- `docs/runtime-connection/residential/`
- `docs/archive/active-documents/residential/`
- `docs/capsules/residential/index-snapshots/`

## Copied YAML / Assets / L10N

- `pubspec.yaml`
- `l10n.yaml`
- `lib/l10n/app_en.arb`
- `lib/l10n/app_ar.arb`
- active Residential room assets under `assets/branding/rooms/`
- accessibility guide icon under `assets/icons/accessibility/`
- Residential exit background under `assets/backgrounds/`

## Exclusions

No build outputs, `.dart_tool`, `.git`, secrets, credentials, Firestore documents, runtime data, user data, retired docs, placeholder runtime, legacy runtime, or uncoded objects are included by design.

FINAL STATUS: RESIDENTIAL_SOVEREIGN_CAPSULE_MANIFEST_CREATED
