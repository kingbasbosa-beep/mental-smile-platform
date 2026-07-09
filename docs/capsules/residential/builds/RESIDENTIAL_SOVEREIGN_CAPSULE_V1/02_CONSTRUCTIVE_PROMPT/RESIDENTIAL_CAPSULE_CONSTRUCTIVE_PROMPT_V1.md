# RESIDENTIAL_CAPSULE_CONSTRUCTIVE_PROMPT_V1

Status: REBUILD_PROMPT_READY

## Role

You are Codex rebuilding the Mental Smile Residential section from `RESIDENTIAL_SOVEREIGN_CAPSULE_V1`.

Use this capsule as the source of truth. Do not infer active Residential truth from old labels, old folders, legacy docs, placeholder files, or historical philosophy.

## What Mental Smile Residential Is

Residential is the governed client/residential support surface for Mental Smile. It contains:

- Client Room
- Accessibility Room
- Accessibility Links
- Accessibility Tools
- Accessibility Suggestions
- Accessibility Community Tools
- Accessibility Check-in
- Accessibility Message of the Day
- Residential Exit Portal
- Residential tool signal runtime

Residential section code: `SEC-RES`

Residential outbox plug: `PLG-RES-OUT`

Archive destination: `ARC-SIG-RES-TOOLS-001`

Magnet: `RES-MAG-TOOLS`

Firestore target: `archive_signal_events`

## Files To Create

Create these source files from capsule copies:

- `lib/features/client/presentation/pages/client_room_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_room_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_links_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart`
- `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart`
- `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart`
- `lib/features/residential/signals/residential_signal_codes.dart`
- `lib/features/residential/signals/residential_signal_payload.dart`
- `lib/features/residential/signals/residential_signal_registry.dart`
- `lib/features/residential/signals/residential_signal_emitter.dart`
- `lib/features/residential/signals/residential_aggregation_point.dart`
- `lib/features/residential/signals/residential_archive_signal_package_builder.dart`
- `lib/features/residential/signals/residential_archive_signal_event_writer.dart`
- `lib/shared/accessibility/accessibility_guide_icon.dart`
- `lib/shared/wellbeing/shared_wellbeing_room_card.dart`

## Routes To Add

Add route constants:

- `/client/room`
- `/accessibility/room`
- `/accessibility/links`
- `/accessibility/tools`
- `/accessibility/suggestions`
- `/accessibility/community-tools`
- `/accessibility/checkin`
- `/accessibility/message-of-the-day`
- `/residential/exit-social-links`

Use the exact route constants and router cases in `05_ROUTES/RESIDENTIAL_ROUTE_EXCERPTS_V1.md`.

## Firebase Rules To Add

Add only the narrow Residential `archive_signal_events` create branch from:

`07_FIREBASE_FIRESTORE/RESIDENTIAL_FIRESTORE_RULES_SNAPSHOT_V1.md`

Keep:

- create only
- update/delete denied
- reads restricted
- exact allowed fields
- identity fields blocked
- only `SEC-RES`, `PLG-RES-OUT`, `ARC-SIG-RES-TOOLS-001`, `RES-MAG-TOOLS`

Do not create Residential-owned durable cross-section storage.

## Assets To Copy

Copy asset files from:

`08_YAML_ASSETS_L10N/assets/`

Restore asset entries shown in:

`08_YAML_ASSETS_L10N/RESIDENTIAL_ASSET_COPY_LIST_V1.md`

## Localization Keys To Create

Use:

- `08_YAML_ASSETS_L10N/source/l10n.yaml`
- `08_YAML_ASSETS_L10N/source/app_en.arb`
- `08_YAML_ASSETS_L10N/source/app_ar.arb`

Regenerate generated localization outputs through the normal Flutter localization workflow. Do not manually edit generated localization Dart files unless the host project already requires generated files to be committed.

## Signal Runtime To Implement

Implement Residential signals using the copied files in:

`06_SIGNALS_RUNTIME/lib/features/residential/signals/`

The runtime flow is:

Residential Tool UI
-> Residential Signal Emitter
-> Residential Aggregation Point
-> Package Builder
-> Archive Signal Event Writer
-> Firestore `archive_signal_events`
-> Archive Intake

Payload must remain anonymous UI interaction only.

## What Not To Include

Do not include:

- legacy Residential runtime
- placeholder pages
- old chat/contact request runtime
- uncoded objects
- retired documents
- historical docs as active truth
- identity fields
- diagnosis fields
- free personal text in Archive payload
- credentials
- secrets
- Firebase private keys
- Firestore documents
- runtime data
- user uploaded images
- direct section-to-section writes
- direct Library writes
- direct Publishing writes

## How To Verify

Manual route verification:

- `/client/room`
- `/accessibility/room`
- `/accessibility/links`
- `/accessibility/tools`
- `/accessibility/suggestions`
- `/accessibility/community-tools`
- `/accessibility/checkin`
- `/accessibility/message-of-the-day`
- `/residential/exit-social-links`

Manual signal verification:

- Open Residential tool cards.
- Confirm `archive_signal_events` receives a document only through the governed writer.
- Confirm payload fields match `RESIDENTIAL_SIGNAL_RUNTIME_CONTRACT_V1.md`.
- Confirm navigation still works if Firestore is unavailable.

Manual rules verification:

- Create allowed for the exact Residential branch only.
- Update/delete denied.
- Reads restricted.
- Identity fields denied.

## Code Gate And Active Documents

Active truth must come from:

- `docs/archive/active-documents/residential/RESIDENTIAL_ACTIVE_DOCUMENTS_REGISTRY_V1.md`
- documents marked `ACTIVE_CURRENT`
- `capsule_eligible = YES`

Textual markers and old folder names do not create runtime authority.

## Legacy / Placeholder / Philosophical Noise Guard

If a file or document is not represented by current code, route, registry, card, digital twin, or active document entry, do not import it as Residential truth.

FINAL STATUS: RESIDENTIAL_CONSTRUCTIVE_PROMPT_READY
