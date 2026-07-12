# Central Platform Core Phase 6 Production Finalization

## Production Architecture

Phase 6 moves Central Platform Core from verified test delivery to explicit production signal destinations. Public runtime sections still know only their section identity and socket contract. Collection routing is owned by the core production gateway.

Active public sections:

- Residential
- Commercial
- Library

No Administrative, Owner, Archive, or Monitoring runtime is introduced.

## Production Collections

Production signals are split by logical family:

- `login` -> `core_login_signals`
- `logout` -> `core_logout_signals`
- `survey` -> `core_survey_signals`
- `feedback` -> `core_feedback_signals`
- `application` -> `core_application_signals`

The test collection `core_test_signal_events` remains available only for test tools.

## Test vs Production Gateways

- Test gateway: `FirebaseCoreOutputGateway`
- Production gateway: `ProductionFirebaseCoreOutputGateway`
- Unit tests: memory/fake writers

Runtime bridges use production sockets and the production gateway by default. Probe and unit-test flows inject their gateway explicitly.

## Production Document Shape

Each production document contains only:

- `signalId`
- `code`
- `family`
- `eventName`
- `logicalTarget`
- `sourceSectionId`
- `environment`
- `schemaVersion`
- `createdAt`
- `context`
- `source`

Production values:

- `environment`: `production`
- `source`: `central_platform_core`
- `createdAt`: server timestamp

No business data, client image, note body, email, phone, UID, password, token, file, bytes, answer text, or free-form content is allowed in signal context.

## Runtime Production Codes

Production runtime codes activated in this phase:

- `cl012sb` -> Residential survey/check-in submit
- `cl014sb` -> Residential feedback/suggestion submit
- `cl016bt` -> Residential client logout/exit completion
- `sp010bt` -> Commercial specialist login success
- `sp014sb` -> Commercial specialist application submit
- `ct010bt` -> Commercial center login success
- `ct014sb` -> Commercial center application submit

Probe-only/test codes remain test-only and are not accepted by the production gateway.

## Client Local Session Store

Temporary client data is local only through:

`lib/core/platform_core/session/client_local_session_store.dart`

Allowed local fields:

- selected image reference/path
- selected predefined note text
- temporary small preferences
- temporary session flags

Forbidden local fields:

- password
- auth token
- email
- phone
- UID/userId
- provider data
- center data
- survey text
- suggestion text
- complaint text

The store persists locally until explicit logout/exit, then clears automatically. Session data is never copied into signal context.

## Logout Cleanup Sequence

Client logout/exit flow now performs:

1. Existing functional exit/navigation.
2. Local session clear.
3. Fail-soft production logout signal through the core.

If local session clear fails, the flow is not blocked.

## Specialist and Center Persistence Boundary

Specialist and center profile data remains in the existing Firebase business collections. Phase 6 does not move provider data into the session store or signal collections.

## Legacy Signal Cleanup

Removed duplicate probe tools:

- `tool/library_platform_core_adapter_probe.dart`
- `tool/platform_three_section_adapter_probe.dart`
- `tool/platform_real_signal_group_probe.dart`

Retained tools:

- `tool/platform_core_phase_2c_probe.dart` for test collection verification.
- `tool/platform_core_production_probe.dart` for production collection verification.

Business writers and runtime emitters that still cover non-core events were retained.

## Firestore Rules Summary

Added create-only rules for:

- `core_login_signals`
- `core_logout_signals`
- `core_survey_signals`
- `core_feedback_signals`
- `core_application_signals`

Public reads are denied. Updates and deletes are denied. Each collection accepts only matching family/logical target production documents.

## Verification Status

Implementation completed locally. Manual validation remains owner-run:

- `dart format lib test tool docs/platform-core`
- `flutter analyze`
- `flutter test`
- `firebase use`
- `firebase deploy --only firestore:rules`
- `flutter run -d chrome -t tool/platform_core_production_probe.dart`

Manual production signal IDs should be recorded after the owner runs the production probe.

## Final System State

Central Platform Core has explicit production signal destinations, a client-local temporary session store, production runtime bridge defaults, and guarded privacy boundaries. Public runtime impact is limited to signal delivery and local session cleanup; no UI, route, or business schema redesign was introduced.
