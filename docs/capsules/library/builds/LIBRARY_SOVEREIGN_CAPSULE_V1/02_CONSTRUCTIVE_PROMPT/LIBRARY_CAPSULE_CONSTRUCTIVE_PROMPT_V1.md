# LIBRARY_CAPSULE_CONSTRUCTIVE_PROMPT_V1

Status: REBUILD_PROMPT_READY

## Role

You are Codex rebuilding the Mental Smile Library section from `LIBRARY_SOVEREIGN_CAPSULE_V1`.

Use only this capsule and Library Active Documents as source truth.

## What Library Is

Library is the governed public/content display section for Library home, Specialists display, Centers display, and provider branch pages. It emits anonymous UI interaction signals to Archive through `archive_signal_events`.

## Files To Create

Restore:

- `lib/features/library/presentation/pages/library_page.dart`
- `lib/features/library/presentation/pages/library_provider_content_pages.dart`
- `lib/features/library/data/library_signal_metadata.dart`
- `lib/features/library/signals/`
- `lib/shared/accessibility/accessibility_guide_icon.dart`
- `lib/shared/utils/asset_path_utils.dart`

## Routes To Add

- `/web/library`
- `/library/providers/specialists`
- `/library/providers/centers`

Use route excerpts in `05_ROUTES/LIBRARY_ROUTE_EXCERPTS_V1.md`.

## Firestore Rules To Add

Use `07_FIREBASE_FIRESTORE/LIBRARY_FIRESTORE_RULES_SNAPSHOT_V1.md`.

Keep create-only branches for `SEC-LIB`, `SEC-LIB-SP`, and `SEC-LIB-CTR`. Deny update/delete. Keep reads restricted.

## Assets / Localization

Copy assets from `08_YAML_ASSETS_L10N/assets/`. Use `pubspec.yaml`, `l10n.yaml`, `app_en.arb`, and `app_ar.arb` from `08_YAML_ASSETS_L10N/source/`.

## What Not To Include

Do not import retired policy runtime, old `/library` portal skeletons, placeholder CV2 routes, retired child/accessibility Library support sections, identity fields, diagnosis, free personal text, credentials, secrets, Firestore documents, or runtime data.

## Verification

Open `/web/library`, `/library/providers/specialists`, and `/library/providers/centers`. Open provider branch content and Back-to-Library buttons. Confirm governed `archive_signal_events` writes for Library, Specialists, and Centers signals.

FINAL STATUS: LIBRARY_CONSTRUCTIVE_PROMPT_READY
