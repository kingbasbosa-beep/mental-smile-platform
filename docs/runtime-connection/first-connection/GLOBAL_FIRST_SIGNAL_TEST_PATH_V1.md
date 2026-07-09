# Global First Signal Test Path V1

Status: RECOMMENDED_PATH_SELECTED
Runtime effect: none

## Selected First Signal

| Item | Value |
| --- | --- |
| Section | `SEC-CV2` |
| Source outbox | `PLG-CV2-OUT` |
| Signal code | `CV2_SIG_OPEN_LIBRARY` |
| Signal family | Commercial V2 Showcase Navigation |
| Magnet | `CV2-MAG-LIBRARY-INTEREST` |
| Privacy class | `anonymous_navigation_signal` |
| Retention class | `operational_summary` |
| Archive destination | `ARC-SIG-CV2-SHOWCASE-001` |
| Proposed collection | `archive_signal_events` |

## Local Runtime Evidence

Existing local files reviewed:

- `lib/features/commercial_v2_web/signals/commercial_v2_signal_emitter.dart`
- `lib/features/commercial_v2_web/signals/commercial_v2_signal_registry.dart`
- `lib/features/commercial_v2_web/signals/commercial_v2_signal_codes.dart`
- `lib/features/commercial_v2_web/signals/commercial_v2_aggregation_point.dart`
- `lib/features/commercial_v2_web/signals/commercial_v2_archive_signal_event_writer.dart`
- `lib/features/commercial_v2_web/signals/commercial_v2_inbox_outbox_interfaces.dart`

## Why Commercial V2 First

Commercial V2 showcase navigation is safer than Residential for the first live signal because it is anonymous, public-display adjacent, and does not involve client-room emotional text, medical content, accessibility support entries, or personal reflection.

`ARC-SIG-CV2-SHOWCASE-001` is the approved Archive Destination for this path. The accessibility/audio destination `ARC-SIG-ACC-AUD-001` must not be used for Commercial V2 showcase navigation.

## Deferred Paths

| Path | Status | Reason |
| --- | --- | --- |
| Residential tool signal | SECOND_WAVE | Client-facing area requires stricter privacy review. |
| Library display signal | SECOND_WAVE | Good candidate after first Archive collection and rules are verified. |
| Commercial V2 package-ready signal | LATER | Package payloads have broader implications than a navigation event. |
| Administrative operations note signal | LATER | Admin cockpit should not be first runtime writer. |
