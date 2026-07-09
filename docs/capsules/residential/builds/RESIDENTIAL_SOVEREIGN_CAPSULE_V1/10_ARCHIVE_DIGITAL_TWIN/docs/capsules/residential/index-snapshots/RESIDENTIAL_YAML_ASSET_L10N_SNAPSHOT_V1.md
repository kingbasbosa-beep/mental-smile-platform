# RESIDENTIAL_YAML_ASSET_L10N_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index Residential YAML, asset, and localization references.

## Source Folders / Files

| Source | Purpose | Capsule Action |
|---|---|---|
| `pubspec.yaml` | Asset/dependency authority | COPY_RELEVANT_REFERENCES_LATER |
| `l10n.yaml` | Localization generation authority | COPY_LATER |
| `lib/l10n/app_en.arb` | English localization source | COPY_RELEVANT_KEYS_LATER |
| `lib/l10n/app_ar.arb` | Arabic localization source | COPY_RELEVANT_KEYS_LATER |
| `lib/l10n/app_localizations*.dart` | Generated localization outputs | COPY_AS_GENERATED_OUTPUT_IF_FULL_SOURCE_COPY |
| `assets/branding/rooms/` | Active room visual assets | COPY_REFERENCED_ASSETS_LATER |
| `assets/icons/accessibility/` | Accessibility card icons | COPY_REFERENCED_ASSETS_LATER |
| `assets/backgrounds/` | Room/background assets if referenced | COPY_REFERENCED_ASSETS_LATER |

## Active Localization Areas

Residential capsule must include localization keys used by:

- Splash residential/client entry labels if owned by Residential route entry
- Client Room
- Accessibility Room
- Accessibility Links / Tools / Suggestions / Community Tools / Check-in / Message of the Day
- Residential Exit Portal
- Audio/headphone/accessibility guide labels

## Active Cards / Registries

- `docs/sections/residential/RESIDENTIAL_LOCALIZATION_REGISTRY_V1.md`
- `docs/sections/residential/pure-dna-gates/r5-digital-twin/RESIDENTIAL_MASTER_ASSET_INDEX_V1.md`
- `docs/sections/residential/pure-dna-gates/r5-digital-twin/RESIDENTIAL_MASTER_CONTENT_INDEX_V1.md`
- `docs/sections/residential/pure-dna-gates/r1-signal-code-system/RESIDENTIAL_AUDIO_SIGNAL_CARD_REGISTRY_V1.md`

## Future Capsule Must Copy

YAML authority files, active Residential localization keys, active generated outputs only when copying full buildable source, and every asset referenced by active Residential UI.

## Future Capsule Must Exclude

Unused assets, deleted room images, unreferenced generated localization keys, placeholder-only labels that do not have current card/route/signal authority.

Owner notes: Generated localization outputs should not be manually edited.

Current status: ACTIVE YAML/ASSET/L10N SNAPSHOT.
