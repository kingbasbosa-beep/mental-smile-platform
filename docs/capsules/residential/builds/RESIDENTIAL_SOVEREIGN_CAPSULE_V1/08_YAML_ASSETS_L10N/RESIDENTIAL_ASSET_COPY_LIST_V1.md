# RESIDENTIAL_ASSET_COPY_LIST_V1

Status: SNAPSHOTTED

## Purpose

List active Residential assets copied into the capsule.

## Copied Asset Roots

| Source | Capsule Destination | Purpose |
|---|---|---|
| `assets/branding/rooms/client_room/` | `08_YAML_ASSETS_L10N/assets/branding/rooms/client_room/` | Client Room backgrounds and controls. |
| `assets/branding/rooms/accessibility_room/` | `08_YAML_ASSETS_L10N/assets/branding/rooms/accessibility_room/` | Accessibility Room backgrounds, card icons, and controls. |
| `assets/icons/accessibility/ms_accessibility_guide.webp.png` | `08_YAML_ASSETS_L10N/assets/icons/accessibility/ms_accessibility_guide.webp.png` | Shared accessibility/headphone guide icon. |
| `assets/backgrounds/residential_exit_social_portal.webp.png` | `08_YAML_ASSETS_L10N/assets/backgrounds/residential_exit_social_portal.webp.png` | Residential exit portal background. |

## YAML / L10N Source Copies

| Source | Capsule Destination |
|---|---|
| `pubspec.yaml` | `08_YAML_ASSETS_L10N/source/pubspec.yaml` |
| `l10n.yaml` | `08_YAML_ASSETS_L10N/source/l10n.yaml` |
| `lib/l10n/app_en.arb` | `08_YAML_ASSETS_L10N/source/app_en.arb` |
| `lib/l10n/app_ar.arb` | `08_YAML_ASSETS_L10N/source/app_ar.arb` |

## Required Pubspec Asset Entries

```yaml
assets:
  - assets/branding/rooms/client_room/
  - assets/branding/rooms/accessibility_room/
  - assets/branding/rooms/accessibility_room/cards/
  - assets/icons/accessibility/ms_accessibility_guide.webp.png
  - assets/backgrounds/residential_exit_social_portal.webp.png
```

FINAL STATUS: RESIDENTIAL_ASSETS_COPIED
