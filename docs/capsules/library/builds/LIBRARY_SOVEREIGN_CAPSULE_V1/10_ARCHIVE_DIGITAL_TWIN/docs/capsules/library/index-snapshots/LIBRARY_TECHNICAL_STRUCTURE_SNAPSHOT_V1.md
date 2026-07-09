# LIBRARY_TECHNICAL_STRUCTURE_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index the active Library technical structure.

## Source Folders / Files

| Source | Purpose | Capsule Action |
|---|---|---|
| `lib/features/library/presentation/pages/library_page.dart` | Library home and provider display entry UI | COPY |
| `lib/features/library/presentation/pages/library_provider_content_pages.dart` | Specialists/Centers provider branch pages | COPY |
| `lib/features/library/data/library_signal_metadata.dart` | Signal metadata used by Library runtime | COPY |
| `lib/features/library/signals/` | Library signal runtime | COPY |
| `lib/shared/accessibility/accessibility_guide_icon.dart` | Headphone/audio visual-support icon helper | COPY_IF_REFERENCED |
| `lib/shared/utils/asset_path_utils.dart` | Asset path utility used by Library UI | COPY_IF_REFERENCED |

## Active Codes / Routes / Signals

Codes: `SEC-LIB`, `SEC-LIB-SP`, `SEC-LIB-CTR`, `PLG-LIB-OUT`, `PLG-LIB-SP-OUT`, `PLG-LIB-CTR-OUT`.

Routes: `/web/library`, `/library/providers/specialists`, `/library/providers/centers`.

Signals: `L.S.001.VIEW`, `L.C.001.OPEN`, `L.S.003.VIEW`, `L.C.003.OPEN`, `L.S.004.VIEW`, `L.C.004.OPEN`.

## Future Capsule Must Copy

Copy active source files and referenced shared helpers/assets.

## Future Capsule Must Exclude

Deleted policy page runtime, old public portal aliases, placeholder screens, and retired support-section code.

Current status: ACTIVE TECHNICAL STRUCTURE SNAPSHOT.
