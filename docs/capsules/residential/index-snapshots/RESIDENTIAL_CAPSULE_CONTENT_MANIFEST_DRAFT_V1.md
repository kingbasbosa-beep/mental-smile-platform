# RESIDENTIAL_CAPSULE_CONTENT_MANIFEST_DRAFT_V1

Status: DRAFT

## Purpose

Draft the future full Residential Capsule contents. This is a manifest only; no files are copied by this operation.

## 1. Technical Source Copy

- `lib/features/client/presentation/pages/client_room_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_*`
- `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart`
- Referenced shared UI/accessibility/wellbeing helpers

## 2. Runtime Signal Copy

- `lib/features/residential/signals/`
- RUN-6 package builder/writer/emitter/registry contracts

## 3. UI Copy

- Client Room UI
- Accessibility Room UI
- Accessibility child pages
- Residential Exit Portal
- Referenced active assets

## 4. Route Copy

- Relevant route constants from `lib/app/router/routes.dart`
- Relevant router cases from `lib/app/router/app_router.dart`
- Residential route card/navigation docs

## 5. Firebase / Firestore Rule Copy

- `archive_signal_events` Residential branch in `firestore.rules`
- Firestore/index/storage/firebase current state references
- Residential R12/R13 Firebase governance cards

## 6. YAML / Asset / Localization Copy

- `pubspec.yaml` active asset references
- `l10n.yaml`
- Residential localization keys from ARB files
- Generated localization outputs only as build artifacts in full source capsule
- Referenced assets

## 7. Cards / Guides / Prompts Copy

- Residential cards folder
- Residential guides
- `RESIDENTIAL_PROMPT_GUIDE_V1.md`
- R1-R13 pure-DNA gates

## 8. Archive / Digital Twin Copy

- Residential Digital Twin
- Archive destination/magnet/vault rows
- RUN-6 runtime connection docs
- Archive Intake/Guard/Resolution references

## 9. Tests / Analyzer Reports Copy

- Analyzer reports only if current and relevant to Residential certification.
- Do not generate new tests or analyzer output during index snapshot operation.

## 10. Recovery Instructions

- Start from Residential Digital Twin.
- Restore route constants and screens.
- Restore Residential signal runtime.
- Restore Firestore rule branch.
- Verify `SEC-RES -> archive_signal_events` tool write.
- Verify no identity, diagnosis, free personal text, credentials, or direct section write is introduced.

## Exclusions

No retired legacy files, no deleted pages, no placeholder pages, no old chat/contact request runtime, no Commercial V1/old Client confusion, no uncoded objects.

Current status: FUTURE CAPSULE MANIFEST DRAFT.
