# RESIDENTIAL_TECHNICAL_STRUCTURE_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index the active Residential technical structure for a future full capsule copy.

## Source Folders / Files

| Source | Purpose | Capsule Action |
|---|---|---|
| `lib/features/client/presentation/pages/client_room_page.dart` | Client Room / Quick Access Room UI | COPY_LATER |
| `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | Accessibility Room UI | COPY_LATER |
| `lib/features/accessibility/presentation/pages/accessibility_links_page.dart` | Accessibility Links page | COPY_LATER |
| `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart` | Accessibility Tools page | COPY_LATER |
| `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart` | Accessibility Suggestions page | COPY_LATER |
| `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart` | Accessibility Community Tools page | COPY_LATER |
| `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart` | Accessibility Check-in page | COPY_LATER |
| `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart` | Accessibility Message of the Day page | COPY_LATER |
| `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart` | Residential Exit Portal | COPY_LATER |
| `lib/features/residential/signals/` | Residential signal runtime | COPY_LATER |
| `lib/shared/accessibility/` | Shared visual/audio accessibility helpers if referenced by active Residential UI | COPY_IF_REFERENCED |
| `lib/shared/wellbeing/` | Shared wellbeing UI/helpers if referenced by active Residential UI | COPY_IF_REFERENCED |

## Active Codes / Routes / Signals

Codes: `SEC-RES`, `PLG-RES-OUT`, `RES-MAG-TOOLS`, `ARC-SIG-RES-TOOLS-001`.

Routes: `/client/room`, `/accessibility/*`, `/residential/exit-social-links`.

Signals: `R.S.*` screen views and `R.T.*` tool signals, with governed Archive write only for tool signals.

## Active Firebase / Rules References

`firestore.rules` has a narrow `SEC-RES` / `PLG-RES-OUT` / `ARC-SIG-RES-TOOLS-001` / `RES-MAG-TOOLS` branch under `archive_signal_events`.

## Future Capsule Must Copy

Copy active Residential technical source files and the exact referenced shared helpers/assets only after this index is promoted to a real capsule operation.

## Future Capsule Must Exclude

Do not copy deleted Residential pages, old chat/contact request runtime, Commercial V1 files, or docs marked historical/retired.

Owner notes: Technical source copy must remain reproducible and minimal.

Current status: ACTIVE STRUCTURE INDEX.
