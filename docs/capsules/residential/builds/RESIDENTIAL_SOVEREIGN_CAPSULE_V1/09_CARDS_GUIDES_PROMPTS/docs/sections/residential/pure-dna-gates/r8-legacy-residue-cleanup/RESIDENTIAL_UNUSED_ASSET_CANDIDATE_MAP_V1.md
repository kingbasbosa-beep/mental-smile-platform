# RESIDENTIAL_UNUSED_ASSET_CANDIDATE_MAP_V1

Status: ACTIVE

Gate: R8

Runtime Status: DOCUMENTATION_ONLY

Purpose: Classify Residential-related asset candidates without deleting or moving assets.

---

## Asset Candidate Map

| Asset / Asset Group | Evidence | Classification | Reason | Later Action |
|---|---|---|---|---|
| `assets/backgrounds/residential_exit_social_portal.webp.png` | Registered in `pubspec.yaml`; active portal background | ACTIVE_PROTECTED | Current exit portal asset. | Do not touch. |
| `assets/icons/accessibility/ms_accessibility_guide.webp.png` | Registered in `pubspec.yaml`; global accessibility icon | ACTIVE_PROTECTED | Current accessibility guide icon. | Do not touch. |
| `assets/branding/rooms/client_room/client_room_background_desktop.png` | Client Room background family | ACTIVE_PROTECTED | Active room visual system. | Do not touch without visual asset audit. |
| `assets/branding/rooms/client_room/client_room_background_tablet.png` | Client Room background family | ACTIVE_PROTECTED | Active responsive room asset. | Do not touch. |
| `assets/branding/rooms/client_room/client_room_background_mobile.png` | Client Room background family | ACTIVE_PROTECTED | Active responsive room asset. | Do not touch. |
| `assets/branding/rooms/accessibility_room/client_room_background_desktop.png` | Accessibility room background family | ACTIVE_PROTECTED | Active accessibility room visual system. | Do not touch. |
| `assets/branding/rooms/accessibility_room/client_room_background_tablet.png` | Accessibility room background family | ACTIVE_PROTECTED | Active responsive accessibility asset. | Do not touch. |
| `assets/branding/rooms/accessibility_room/client_room_background_mobile.png` | Accessibility room background family | ACTIVE_PROTECTED | Active responsive accessibility asset. | Do not touch. |
| `assets/branding/rooms/client_room/accessibility_room_*` | Asset names appear cross-room | OWNER_DECISION_REQUIRED | Names look duplicated/cross-labeled but may be intentionally reused. | Dedicated asset naming audit later. |
| `assets/branding/rooms/accessibility_room/cards/*papyrus_background.png` | Card background assets | ACTIVE_PROTECTED | Active accessibility card visuals may depend on them. | Do not touch. |
| `assets/images/avatar_client*.png` and `assets/c5/avatars/avatar_client.png` | Multiple client/avatar assets | OWNER_DECISION_REQUIRED | Potential duplication; usage not proven inactive by R8. | Asset usage audit later. |
| `assets/images/cat_audio.png` and `assets/c6_library/categories/cat_audio.png` | Audio category assets duplicated by name | OWNER_DECISION_REQUIRED | Potential duplicated category art; may be library-owned. | Library/asset audit later. |

---

## Validation

No asset deleted: YES

No active asset marked archive-only without evidence: YES

Unknown residue: 0

Final Status: RESIDENTIAL_UNUSED_ASSET_CANDIDATE_MAP_CREATED

