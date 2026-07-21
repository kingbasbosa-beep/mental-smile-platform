# PLATFORM CORE FREEZE INSPECTION

Inspection date: 2026-07-15

Scope inspected:
- `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\`
- Direct runtime consumers under `lib\features\*/platform_core\`
- Direct tests under `C:\mental_smile_workspace\app\mental-smile-platform\test\core\platform_core\`
- Direct references in `lib\core` and direct feature callers found by import/reference search.

Execution constraints observed:
- Read-only source inspection.
- No build executed.
- No tests executed.
- No source file modification, deletion, rename, move, refactor, or code generation performed.

## Folder Tree

```text
lib/core/platform_core/
  platform_core.dart
  platform_core_facade.dart
  bridge/
    platform_core_signal_bridge.dart
  contracts/
    core_signal_envelope.dart
    core_signal_request.dart
    platform_section_adapter.dart
    section_socket.dart
  dictionary/
    core_code_pattern.dart
    core_dictionary_types.dart
    platform_dictionary_v1.dart
    platform_dictionary_validation_result.dart
  dock/
    dock_registry.dart
  gateway/
    core_output_gateway.dart
    firebase_core_output_gateway.dart
    production_firebase_core_output_gateway.dart
  language/
    platform_language.dart
  registry/
    core_code_registry.dart
    platform_adapter_registry.dart
    platform_section_registry.dart
  resolver/
    core_signal_resolver.dart
  session/
    client_local_session_store.dart
  socket/
    platform_socket_registry.dart
```

## Folder Analysis

| Folder | Purpose | Important Files | Runtime Role |
|---|---|---|---|
| `lib/core/platform_core/` | Public barrel and facade entrypoint. | `platform_core.dart`, `platform_core_facade.dart` | Exposes Platform Core API and composes dock, code registry, resolver, output gateway. |
| `bridge/` | Runtime adapter-to-core bridge. | `platform_core_signal_bridge.dart` | Connects section adapter once, validates approved context keys, emits requests into `PlatformCore`. |
| `contracts/` | Data and interface contracts. | `SectionSocket`, `PlatformSectionAdapter`, `CoreSignalRequest`, `CoreSignalEnvelope` | Defines socket identity, adapter contract, inbound request, resolved outbound envelope. |
| `dictionary/` | Signal code dictionary and validation. | `PlatformDictionaryV1`, `CoreCodePattern`, enum types | Supplies default code definitions, allowed families/environments, code validation. |
| `dock/` | Runtime section mounting. | `DockRegistry`, `DockSlot`, connection enums/result | Mounts section sockets into fixed platform sockets and tracks connected slots. |
| `gateway/` | Output delivery. | `CoreOutputGateway`, `FirebaseCoreOutputGateway`, `ProductionFirebaseCoreOutputGateway` | Writes accepted envelopes to memory/noop/test Firestore/production Firestore collections. |
| `language/` | Cross-registry language validation. | `PlatformLanguage` | Validates socket/section/dictionary vocabulary consistency. |
| `registry/` | Static and runtime lookup registries. | `CoreCodeRegistry`, `PlatformSectionRegistry`, `PlatformAdapterRegistry` | Registers signal codes, platform sections, and section adapters. |
| `resolver/` | Signal acceptance and envelope creation. | `CoreSignalResolver`, `CoreEmitResult`, `CoreEmitReason` | Performs request validation against dock/code/socket rules and creates envelope. |
| `session/` | Local client session state. | `ClientLocalSessionStore` | Stores local client-only session state and prevents private fields entering signal context. |
| `socket/` | Platform socket definitions. | `PlatformSocketRegistry`, `PlatformSocketIds`, `PlatformSocketDefinition` | Defines fixed sockets 01-10 and connected/reserved socket status. |

## File Inventory

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\platform_core.dart`
- Purpose: Public barrel export for Platform Core.
- Classes: None.
- Functions: None.
- Public API: Exports all platform core contracts, bridge, dictionary, dock, gateway, language, facade, registry, resolver, session, socket files.
- Imports: None.
- Exports: 21 exports, including `platform_core_facade.dart`, `dock_registry.dart`, `platform_socket_registry.dart`, `core_signal_resolver.dart`.
- Reverse references: Imported by tests, feature adapters, runtime bridges, and client/accessibility pages.
- Runtime consumer: Feature platform-core adapters/bridges and pages importing session store.
- Evidence: Export list at lines 1-21; direct imports found in `lib\features\commercial\platform_core`, `lib\features\residential\platform_core`, `lib\features\library\platform_core`, and `test\core\platform_core`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\platform_core_facade.dart`
- Purpose: Main composition facade.
- Classes: `PlatformCore`.
- Functions/methods: constructor, `resolver` getter, `connectSection`, `disconnectSection`, `emit`.
- Public API: `dockRegistry`, `codeRegistry`, `outputGateway`, `resolver`, section connect/disconnect, emit request.
- Imports: `CoreSignalRequest`, `SectionSocket`, `PlatformDictionaryV1`, `DockRegistry`, `CoreOutputGateway`, `CoreCodeRegistry`, `CoreSignalResolver`.
- Exports: None.
- Reverse references: Exported by barrel; used by tests, `PlatformCoreSignalBridge`, and feature tests.
- Runtime consumer: `PlatformCoreSignalBridge` constructs a default `PlatformCore`; tests instantiate it directly.
- Evidence: Default composition creates `DockRegistry`, `CoreCodeRegistry(PlatformDictionaryV1.definitions)`, `NoopCoreOutputGateway`; `emit` resolves then sends envelope to gateway and returns fail-soft `gatewayFailure` on exception.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\bridge\platform_core_signal_bridge.dart`
- Purpose: Runtime bridge from a `PlatformSectionAdapter` to `PlatformCore`.
- Classes: `PlatformCoreSignalBridge`.
- Functions/methods: constructor, `emit`, private `_connectOnce`, private `_isApprovedRuntimeContext`.
- Public API: `emit({required code, required context})`.
- Imports: `CoreSignalRequest`, `PlatformSectionAdapter`, `CoreOutputGateway`, Firebase gateway writer, production gateway, `PlatformCore`, resolver result/reason.
- Exports: None.
- Reverse references: Exported by barrel; instantiated by residential, commercial, library runtime bridges and bridge tests.
- Runtime consumer: `ResidentialRuntimeSignalBridge`, `CommercialRuntimeSignalBridge`, `LibraryRuntimeSignalBridge`.
- Evidence: Constructor defaults to `ProductionFirebaseCoreOutputGateway(FirebaseCoreFirestoreWriter())`; `_connectOnce` calls `_core.connectSection(_adapter.createSocket())`; `emit` rejects unapproved context keys before emitting.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\contracts\core_signal_envelope.dart`
- Purpose: Resolved output signal payload.
- Classes: `CoreSignalEnvelope`.
- Functions: None.
- Public API: immutable fields `signalId`, `code`, `family`, `eventName`, `logicalTarget`, `sourceSectionId`, `environment`, `schemaVersion`, `createdAt`, `context`.
- Imports: None.
- Exports: None.
- Reverse references: Used by `CoreOutputGateway`, Firebase gateways, production gateway, resolver.
- Runtime consumer: Gateway implementations receive this from `PlatformCore.emit`.
- Evidence: Resolver constructs envelope after all checks pass; gateways serialize it for output.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\contracts\core_signal_request.dart`
- Purpose: Inbound core signal request.
- Classes: `CoreSignalRequest`.
- Functions: None.
- Public API: `sectionId`, `code`, `context`.
- Imports: None.
- Exports: None.
- Reverse references: Used by `PlatformCore.emit`, `CoreSignalResolver.resolve`, tests, and `PlatformCoreSignalBridge`.
- Runtime consumer: Runtime bridges create requests indirectly through `PlatformCoreSignalBridge.emit`.
- Evidence: Bridge constructs `CoreSignalRequest(sectionId: adapter socket sectionId, code, context)`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\contracts\platform_section_adapter.dart`
- Purpose: Adapter contract for platform sections.
- Classes: `PlatformSectionAdapter` abstract interface.
- Functions/methods: `createSocket`.
- Public API: getters `adapterDefaultSocketId`, `adapterTestCode`; method `createSocket`.
- Imports: `section_socket.dart`.
- Exports: None.
- Reverse references: Implemented by `ResidentialSectionAdapter`, `CommercialSectionAdapter`, `LibrarySectionAdapter`; consumed by `PlatformAdapterRegistry` and `PlatformCoreSignalBridge`.
- Runtime consumer: Feature adapters implement it; runtime bridges pass adapters to `PlatformCoreSignalBridge`.
- Evidence: `PlatformAdapterRegistry.register` calls `adapter.createSocket`; `PlatformCoreSignalBridge` stores a `PlatformSectionAdapter`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\contracts\section_socket.dart`
- Purpose: Runtime socket identity and gate/prefix allowance contract.
- Classes: `SectionSocket`.
- Functions/methods: `allowsGate`, `allowsCodePrefix`.
- Public API: `sectionId`, `sectionCode`, `contractVersion`, `environment`, `allowedGates`, `allowedCodePrefixes`, optional `socketId`.
- Imports: None.
- Exports: None.
- Reverse references: Used by dock, adapter registry, section adapters, resolver through dock slot, tests.
- Runtime consumer: Feature adapters create sockets; `DockRegistry.connect` mounts them.
- Evidence: Resolver checks `slot.socket.environment`, `slot.socket.sectionCode`, `allowsGate`, and `allowsCodePrefix`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\dictionary\core_code_pattern.dart`
- Purpose: Validates signal code syntax.
- Classes: `CoreCodePattern`.
- Functions/methods: static `validate`, static `matches`.
- Public API: `validate(String code)`, `matches(String code)`.
- Imports: `PlatformDictionaryValidationResult`.
- Exports: None.
- Reverse references: Used by `PlatformDictionaryV1.validate` and dictionary tests.
- Runtime consumer: Static dictionary validation path.
- Evidence: Pattern requires lowercase 7-character `aa999tt` shape.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\dictionary\core_dictionary_types.dart`
- Purpose: Enumerates core family/target/environment vocabulary.
- Classes/enums: `CoreSignalFamily`, `CoreLogicalTarget`, `CoreCodeEnvironment`.
- Functions: enum value constructors.
- Public API: enum `value` fields for login/logout/survey/feedback/application and test/production.
- Imports: None.
- Exports: None.
- Reverse references: Used by dictionary, language, section registry.
- Runtime consumer: Validation vocabulary for dictionary and section definitions.
- Evidence: `PlatformDictionaryV1.validate`, `PlatformLanguage.validate`, and `PlatformSectionRegistry.validateLanguage` read these enum values.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\dictionary\platform_dictionary_v1.dart`
- Purpose: Central code dictionary.
- Classes: `PlatformDictionaryV1`.
- Functions/methods: static `validate`.
- Public API: `schemaVersion`, `maxCodeCount`, `definitions`, `validate`.
- Imports: `CoreCodeRegistry` definitions, code pattern, dictionary types, validation result.
- Exports: None.
- Reverse references: Used by `PlatformCore` default `CoreCodeRegistry`, `PlatformLanguage`, dictionary tests.
- Runtime consumer: Default runtime code registry and resolver acceptance path.
- Evidence: Contains 20 definitions; includes production runtime codes `cl012sb`, `cl014sb`, `cl016bt`, `sp010bt`, `sp014sb`, `ct010bt`, `ct014sb`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\dictionary\platform_dictionary_validation_result.dart`
- Purpose: Validation result value object.
- Classes: `PlatformDictionaryValidationResult`.
- Functions/getters: `isValid`.
- Public API: `errors`, `isValid`.
- Imports: None.
- Exports: None.
- Reverse references: Used by code pattern and dictionary validation.
- Runtime consumer: Static validation/tests.
- Evidence: `isValid` is `errors.isEmpty`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\dock\dock_registry.dart`
- Purpose: Dock and module/socket mounting registry.
- Classes/enums: `DockSlotStatus`, `DockConnectionReason`, `DockConnectionResult`, `DockSlot`, `DockRegistry`.
- Functions/methods: `slots`, `contains`, `slotFor`, `slotForSocket`, `connect`, `disconnect`, `setStatus`.
- Public API: Dock slot listing, lookup, connect/disconnect/status mutation.
- Imports: `SectionSocket`, `PlatformSectionRegistry`, `PlatformSocketRegistry`.
- Exports: None.
- Reverse references: Used by `PlatformCore`, `CoreSignalResolver`, tests, section adapter tests.
- Runtime consumer: `PlatformCore.connectSection`, `PlatformCore.disconnectSection`, `CoreSignalResolver.resolve`.
- Evidence: `connect` rejects duplicate sections, full dock, unknown/reserved/wrong/occupied sockets, then stores slots by section and socket.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\gateway\core_output_gateway.dart`
- Purpose: Output gateway abstraction and in-memory/noop implementations.
- Classes: `CoreOutputGateway`, `NoopCoreOutputGateway`, `MemoryCoreOutputGateway`.
- Functions/methods: `emit`, `envelopes`, `clear`.
- Public API: `Future<void> emit(CoreSignalEnvelope envelope)`.
- Imports: `CoreSignalEnvelope`.
- Exports: None.
- Reverse references: Used by `PlatformCore`, bridge, Firebase gateways, tests.
- Runtime consumer: `PlatformCore.emit` emits into configured gateway.
- Evidence: Default `PlatformCore` uses `NoopCoreOutputGateway`; tests use `MemoryCoreOutputGateway`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\gateway\firebase_core_output_gateway.dart`
- Purpose: Test-phase Firestore gateway.
- Classes: `CoreFirestoreWriter`, `FirebaseCoreFirestoreWriter`, `FirebaseCoreOutputGateway`.
- Functions/methods: writer `write`, gateway `emit`, private `_toFirestoreData`, private `_isSafeContext`.
- Public API: writer abstraction, Firestore writer, gateway with `collectionName = core_test_signal_events`, `source = central_platform_core_phase_2b`.
- Imports: `cloud_firestore`, `CoreSignalEnvelope`, `CoreOutputGateway`.
- Exports: None.
- Reverse references: Used by tests, library test gateway path, and production gateway imports writer abstraction.
- Runtime consumer: Test/probe delivery path; not the default production bridge.
- Evidence: Gateway accepts only `environment == 'test'` and rejects unsafe context before writer call.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\gateway\production_firebase_core_output_gateway.dart`
- Purpose: Production Firestore gateway.
- Classes: `ProductionSignalCollections`, `ProductionFirebaseCoreOutputGateway`.
- Functions/methods: collection `resolve`, gateway `emit`, private `_toFirestoreData`, private `_isSafeContext`.
- Public API: production collection constants and `CoreOutputGateway.emit`.
- Imports: `cloud_firestore`, `CoreSignalEnvelope`, `CoreOutputGateway`, `CoreFirestoreWriter`.
- Exports: None.
- Reverse references: Used by `PlatformCoreSignalBridge`, production gateway tests, bridge tests.
- Runtime consumer: Default gateway for runtime bridges through `PlatformCoreSignalBridge`.
- Evidence: Maps logical targets to `core_login_signals`, `core_logout_signals`, `core_survey_signals`, `core_feedback_signals`, `core_application_signals`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\language\platform_language.dart`
- Purpose: Platform vocabulary consistency checker.
- Classes: `PlatformLanguage`.
- Functions/methods: static getters `signalFamilies`, `environments`; static `validate`.
- Public API: `contractVersion`, section/socket/code prefix sets, validation.
- Imports: dictionary types, dictionary v1, section registry, socket registry.
- Exports: None.
- Reverse references: Used by socket registry tests and three-section tests.
- Runtime consumer: Validation layer, not found in direct production runtime emission path.
- Evidence: `validate` combines socket errors, section language validation, socket count, known sections/sockets, code prefixes/families/environments.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\registry\core_code_registry.dart`
- Purpose: Signal definition registration and lookup.
- Classes: `CoreCodeDefinition`, `CoreCodeRegistry`.
- Functions/methods: `contains`, `register`, `registerAll`, `resolve`, `disable`, `testDefaults`, `copyWith`.
- Public API: code definition model and mutable registry operations.
- Imports: None.
- Exports: None.
- Reverse references: Used by `PlatformCore`, `CoreSignalResolver`, `PlatformDictionaryV1`, tests.
- Runtime consumer: Resolver lookup via `codeRegistry.resolve`.
- Evidence: Default `PlatformCore` loads `PlatformDictionaryV1.definitions`; resolver rejects unknown/disabled codes.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\registry\platform_adapter_registry.dart`
- Purpose: Adapter registration separate from dock mounting.
- Classes/enums: `PlatformAdapterRegistrationReason`, `PlatformAdapterRegistrationResult`, `PlatformAdapterRegistry`.
- Functions/methods: `adapters`, `length`, `register`, `adapterForSectionId`, `adapterForSectionCode`, `createSockets`.
- Public API: Adapter registration and lookup by section ID/code plus socket creation.
- Imports: `PlatformSectionAdapter`, `SectionSocket`, `PlatformSocketRegistry`, `PlatformSectionRegistry`.
- Exports: None.
- Reverse references: Tested in `three_section_adapter_layer_test.dart`; not found wired into `PlatformCore` facade.
- Runtime consumer: Not verified in production runtime path; tested registration layer.
- Evidence: Tests register all three adapters; `PlatformCore` does not depend on `PlatformAdapterRegistry`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\registry\platform_section_registry.dart`
- Purpose: Section identity registry.
- Classes: `PlatformSectionDefinition`, `PlatformSectionRegistry`.
- Functions/methods: `allSectionCodes`, `matchesSectionCode`, `errors`, `isValid`, `definitions`, `containsSectionId`, `containsSectionCode`, `definitionForId`, `definitionForCode`, `validateLanguage`.
- Public API: Phase 3 definitions and lookups.
- Imports: dictionary types, socket registry.
- Exports: None.
- Reverse references: Used by `DockRegistry`, `PlatformAdapterRegistry`, `PlatformLanguage`, tests.
- Runtime consumer: Dock connect validation and adapter registration validation.
- Evidence: Defines RES, COM, LIB with socket 01/02/03 and aliases `RES_TEST`, `COM_TEST`, `LIB_TEST`.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\resolver\core_signal_resolver.dart`
- Purpose: Resolve requests into accepted/rejected emit results.
- Classes/enums/typedefs: `CoreClock`, `CoreSignalIdFactory`, `CoreEmitReason`, `CoreEmitResult`, `CoreSignalResolver`.
- Functions/methods: `resolve`, result factories `accepted`, `rejected`, `outputFailed`, private `_isSafeContext`.
- Public API: Resolver constructor with dock/code registry, `resolve(CoreSignalRequest)`, result and reason types.
- Imports: `CoreSignalEnvelope`, `CoreSignalRequest`, `DockRegistry`, `CoreCodeRegistry`.
- Exports: None.
- Reverse references: Used by `PlatformCore`, bridge for result/reason, tests.
- Runtime consumer: `PlatformCore.emit`.
- Evidence: Rejects missing code, unsafe context, disconnected/disabled section, unknown/disabled code, environment mismatch, section/gate/prefix mismatch; creates envelope on success.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\session\client_local_session_store.dart`
- Purpose: Local client session persistence with privacy filtering.
- Classes: `ClientLocalSessionState`, `ClientLocalSessionStorage`, `SharedPreferencesClientLocalSessionStorage`, `ClientLocalSessionStore`.
- Functions/methods: storage read/write/remove, session start/save/read/clear, `safeSignalContext`, `isForbiddenFieldName`.
- Public API: session state, storage abstraction, SharedPreferences implementation, store methods.
- Imports: `dart:convert`, `shared_preferences`.
- Exports: None.
- Reverse references: Imported by barrel; used by client/accessibility/generation2 pages and tests.
- Runtime consumer: `client_room_page.dart`, `accessibility_room_page.dart`, `generation2_mobile_client_room_page.dart`.
- Evidence: `safeSignalContext` returns empty map; forbidden field names include password/token/email/phone/uid/userId.

### `C:\mental_smile_workspace\app\mental-smile-platform\lib\core\platform_core\socket\platform_socket_registry.dart`
- Purpose: Fixed platform socket registry.
- Classes/enums: `PlatformSocketIds`, `PlatformSocketStatus`, `PlatformSocketDefinition`, `PlatformSocketRegistry`.
- Functions/methods: `errors`, `isValid`, `definitions`, `connectedSockets`, `reservedSockets`, `contains`, `definitionFor`.
- Public API: socket constants 01-10, phase 3 definitions, lookup and validation state.
- Imports: None.
- Exports: None.
- Reverse references: Used by dock, adapter registry, section registry, language, feature adapters, tests.
- Runtime consumer: `DockRegistry.connect` and section adapters.
- Evidence: Sockets 01-03 connected to Residential/Commercial/Library; sockets 04-10 reserved.

## Socket Analysis

Socket Layer exists: Yes.

- Socket classes/interfaces:
  - `SectionSocket`
  - `PlatformSocketIds`
  - `PlatformSocketDefinition`
  - `PlatformSocketRegistry`
  - `PlatformSocketStatus`
- Socket registry:
  - `PlatformSocketRegistry` owns fixed socket definitions.
  - `PlatformSocketRegistry.socketCount` is 10.
  - Phase 3 definitions connect SOCKET_01/02/03 and reserve SOCKET_04 through SOCKET_10.
- Socket lifecycle:
  - Static socket definitions exist.
  - Runtime section connection is represented by `DockRegistry.connect`.
  - Runtime disconnection is represented by `DockRegistry.disconnect`.
  - No explicit socket initialization hook found beyond registry construction.
  - No explicit socket shutdown hook found.
- Socket initialization:
  - `DockRegistry` constructs a default `PlatformSocketRegistry`.
  - `PlatformCore` constructs a default `DockRegistry`.
  - Feature adapters create `SectionSocket` instances.
- Socket shutdown:
  - Not verified as a socket-level API.
  - Section-level removal exists through `DockRegistry.disconnect` and `PlatformCore.disconnectSection`.
- Who uses it:
  - `DockRegistry`, `PlatformAdapterRegistry`, `PlatformSectionRegistry`, `PlatformLanguage`, feature section adapters, tests.
- Who registers in it:
  - Static definitions in `PlatformSocketRegistry.phase3Definitions`.
  - No mutable socket registration API found.
- Who reads from it:
  - `DockRegistry.connect`, `PlatformAdapterRegistry.register`, `PlatformLanguage.validate`, tests.

## Dock Analysis

Dock system exists: Yes.

- Dock classes:
  - `DockRegistry`
  - `DockSlot`
  - `DockConnectionResult`
  - `DockSlotStatus`
  - `DockConnectionReason`
- Dock registration:
  - Section sockets mount via `DockRegistry.connect(SectionSocket socket)`.
  - `PlatformCore.connectSection` delegates to `DockRegistry.connect`.
- Mounted modules:
  - Residential -> SOCKET_01
  - Commercial -> SOCKET_02
  - Library -> SOCKET_03
- Runtime mounting flow:
  - Feature adapter creates `SectionSocket`.
  - `PlatformCoreSignalBridge._connectOnce` calls `PlatformCore.connectSection`.
  - `DockRegistry.connect` validates section code, default socket, socket status, duplicates, slot capacity.
  - Successful connection creates `DockSlot(status: DockSlotStatus.connected)`.
- More than one Dock:
  - One `DockRegistry` class found.
  - Each `PlatformCore` instance owns one dock registry unless injected.
- How sections are mounted:
  - By direct socket connect, not by automatic discovery.

## Registry Analysis

Registries:
- `PlatformSocketRegistry`
- `PlatformSectionRegistry`
- `CoreCodeRegistry`
- `PlatformAdapterRegistry`
- `DockRegistry` also functions as a runtime mounted-slot registry.

Registration flow:
- Socket registry: static constructor load from `phase3Definitions`.
- Section registry: static constructor load from `phase3Definitions`.
- Code registry: constructor/register/registerAll; default PlatformCore loads `PlatformDictionaryV1.definitions`.
- Adapter registry: `register(PlatformSectionAdapter)` validates section, socket, duplicate section ID/code/socket.
- Dock registry: `connect(SectionSocket)` validates then stores dock slots.

Lookup flow:
- Socket: `contains`, `definitionFor`.
- Section: `containsSectionId`, `containsSectionCode`, `definitionForId`, `definitionForCode`.
- Code: `contains`, `resolve`.
- Adapter: `adapterForSectionId`, `adapterForSectionCode`, `createSockets`.
- Dock: `contains`, `slotFor`, `slotForSocket`, `slots`.

Removal flow:
- Dock: `disconnect(sectionId)` removes from both section and socket maps.
- Code: `disable(code)` mutates enabled status; no remove API found.
- Adapter: no removal API found.
- Socket/Section: no removal API found.

Consumers:
- `PlatformCore`: dock, code registry.
- `CoreSignalResolver`: dock and code registry.
- `DockRegistry`: socket and section registries.
- `PlatformAdapterRegistry`: socket and section registries.
- `PlatformLanguage`: socket, section, dictionary.

Reverse references:
- Registry classes are directly tested under `test/core/platform_core`.
- Adapter registry reverse reference is primarily tests, not the runtime facade.

## Contracts Analysis

Contract definitions:
- `CoreSignalRequest`: inbound section/code/context.
- `CoreSignalEnvelope`: resolved output event.
- `PlatformSectionAdapter`: adapter interface.
- `SectionSocket`: socket identity and allowed gates/prefixes.
- `CoreOutputGateway`: output interface.
- `ClientLocalSessionStorage`: session storage interface.

Interfaces / abstract classes:
- `PlatformSectionAdapter`
- `CoreOutputGateway`
- `CoreFirestoreWriter`
- `ClientLocalSessionStorage`

Consumers:
- Feature section adapters implement `PlatformSectionAdapter`.
- `PlatformCoreSignalBridge` consumes `PlatformSectionAdapter`.
- `DockRegistry` consumes `SectionSocket`.
- `CoreSignalResolver` consumes `CoreSignalRequest` and emits `CoreSignalEnvelope`.
- Gateways consume `CoreSignalEnvelope`.

Runtime usage:
- Runtime bridges emit approved signal codes with safe metadata.
- Facade resolves request and calls configured gateway.

## Gateway Analysis

Gateways:
- `NoopCoreOutputGateway`
- `MemoryCoreOutputGateway`
- `FirebaseCoreOutputGateway`
- `ProductionFirebaseCoreOutputGateway`

Direction:
- Outbound only: resolved core envelope -> gateway -> memory/noop/Firestore writer.

Call flow:
1. Runtime bridge calls `PlatformCoreSignalBridge.emit`.
2. Bridge creates `CoreSignalRequest`.
3. `PlatformCore.emit` calls resolver.
4. If rejected, no gateway call.
5. If accepted, `outputGateway.emit(envelope)` is called.
6. Gateway exception is converted to `CoreEmitResult.outputFailed`.

Consumers:
- `PlatformCore` consumes `CoreOutputGateway`.
- `PlatformCoreSignalBridge` defaults to production Firebase gateway.
- Tests inject memory/fake/failing gateways.

## Resolver Analysis

Resolver classes:
- `CoreSignalResolver`
- `CoreEmitResult`
- `CoreEmitReason`

Resolution flow:
1. Reject missing code.
2. Reject unsafe context.
3. Require connected, non-disabled dock slot.
4. Resolve code definition.
5. Reject unknown/disabled code.
6. Require code environment to match socket environment.
7. Require section code allowed by definition.
8. Require socket gate allowed.
9. Require code prefix allowed.
10. Create `CoreSignalEnvelope`.

Runtime entry:
- `PlatformCore.emit(CoreSignalRequest request)`.

Consumers:
- `PlatformCore`.
- Tests directly and indirectly through facade/bridge.

## Bridge Analysis

Bridges:
- Core bridge: `PlatformCoreSignalBridge`.
- Runtime feature bridges:
  - `ResidentialRuntimeSignalBridge`
  - `CommercialRuntimeSignalBridge`
  - `LibraryRuntimeSignalBridge`

Source:
- Section adapters and feature runtime event emitters/services.

Destination:
- `PlatformCore.emit`.
- Default destination gateway is production Firestore through `ProductionFirebaseCoreOutputGateway`.

Runtime usage:
- Residential signal emitter calls residential runtime bridge for approved core signals.
- Commercial auth service calls commercial runtime bridge after successful login/registration.
- Library runtime bridge exposes a bridge but no direct runtime caller was verified in inspected references.

## Runtime Composition

Composition found:
- `PlatformCore` composes:
  - `DockRegistry`
  - `CoreCodeRegistry`
  - `CoreOutputGateway`
  - lazy `CoreSignalResolver`
- `PlatformCoreSignalBridge` composes:
  - `PlatformSectionAdapter`
  - `PlatformCore`
  - default production output gateway
- Feature runtime bridges compose:
  - concrete section adapter
  - `PlatformCoreSignalBridge`

Module registration:
- `PlatformAdapterRegistry` exists and validates adapters.
- It is covered by tests.
- It is not wired into `PlatformCore` facade in inspected source.

Module mounting:
- Active mounting exists through `DockRegistry.connect`.
- Runtime bridge performs connect-once before emitting.

Module discovery:
- Not verified.
- No scanner or discovery bootstrap found in inspected scope.

Lifecycle:
- Connect lifecycle exists: `connectSection` / `DockRegistry.connect`.
- Disconnect lifecycle exists: `disconnectSection` / `DockRegistry.disconnect`.
- Status lifecycle exists: `DockRegistry.setStatus`.
- Explicit startup/bootstrap/shutdown lifecycle was not found.

Bootstrap:
- Constructor-based bootstrap exists through default constructors.
- No named bootstrap entrypoint found in inspected scope.

Initialization:
- Registry initialization is constructor-driven.
- Runtime bridge initializes core and gateway lazily as static final feature bridge fields.

Dependency graph:
```text
Feature caller
  -> Residential/Commercial/LibraryRuntimeSignalBridge
  -> PlatformCoreSignalBridge
  -> PlatformSectionAdapter.createSocket()
  -> PlatformCore.connectSection()
  -> DockRegistry.connect()
  -> PlatformSocketRegistry + PlatformSectionRegistry
  -> PlatformCore.emit()
  -> CoreSignalResolver.resolve()
  -> CoreCodeRegistry + DockRegistry slot
  -> CoreSignalEnvelope
  -> CoreOutputGateway
  -> Firebase writer / memory / noop
```

## Testing Review

Tests inspected only; not executed.

Files under `test/core/platform_core/`:
- `platform_core_test.dart`
  - Tests connect/disconnect, duplicate connection, missing/unknown code, not connected section, section not allowed, disabled code, environment mismatch, gate/prefix rejection, unsafe context, noop/memory gateways, gateway fail-soft, dock limit.
- `platform_socket_registry_test.dart`
  - Tests fixed 10 sockets, connected/reserved socket split, duplicate socket detection, lookup, section identity, aliases, dock unknown/reserved/wrong/occupied socket rejection, disconnect/reconnect, language validation.
- `three_section_adapter_layer_test.dart`
  - Tests Residential/Commercial/Library adapters, adapter registry, simultaneous three-section connection, signal delivery, fake Firestore writer target, wrong section/unknown code, fail-soft gateway, dictionary/language consistency.
- `library_section_adapter_test.dart`
  - Tests Library socket identity, correct/wrong socket connection, duplicate connection, accepted/rejected library code, Firestore document shape.
- `platform_dictionary_v1_test.dart`
  - Tests code count, families, pattern, duplicates, family/target equality, probe/runtime environment split, forbidden families, descriptions, self-validation, registry loading, resolver path, runtime codes.
- `firebase_core_output_gateway_test.dart`
  - Tests test Firestore gateway collection, document ID, fields, source, environment, production rejection by gateway, unsafe context, writer fail-soft, rejected code/wrong section no writer, memory/noop gateways.
- `production_firebase_core_output_gateway_test.dart`
  - Tests production family-to-collection mapping, document shape/source, probe-only rejection, unknown target fail-soft, writer fail-soft.
- `platform_core_signal_bridge_test.dart`
  - Tests bridge accepted write, wrong section no writer, unknown code no writer, gateway fail-soft, approved metadata, PII/content context rejection.
- `client_local_session_store_test.dart`
  - Tests session start/save/reload/clear, clear failure, empty safe signal context, forbidden field names.
- `platform_core_phase_2c_probe_test.dart`
  - Tests UI probe output states through `tool/platform_core_phase_2c_probe.dart`.

Coverage by component:
- Socket: Present in `platform_socket_registry_test.dart`, adapter tests, three-section tests.
- Dock: Present in `platform_core_test.dart`, `platform_socket_registry_test.dart`, adapter tests, three-section tests.
- Registry: Present for socket, section, code, adapter registries.
- Contracts: Present indirectly through adapter/socket/request/envelope assertions.
- Resolver: Present in `platform_core_test.dart`, dictionary tests, gateway tests.
- Gateway: Present in Firebase, production Firebase, platform core, bridge tests.
- Bridge: Present in `platform_core_signal_bridge_test.dart` and feature runtime bridge references.

## Freeze Evaluation

NOT READY FOR FREEZE

Technical reasons:
- Static inspection verifies active Socket, Dock, Registry, Contracts, Gateway, Resolver, Bridge, and runtime composition paths, but tests/build were not executed by task rule, so runtime verification is not complete.
- Explicit bootstrap, module discovery, and shutdown lifecycle APIs were not found in inspected scope.
- `PlatformAdapterRegistry` exists and is tested, but is not verified as wired into the `PlatformCore` runtime facade.
- Runtime mounting is active through direct `SectionSocket` connection and bridge connect-once behavior, but centralized adapter discovery/mount orchestration is not verified.

## Final Component Status Table

| Component | Exists | Runtime Consumer | Reverse References | Public API | Status |
|---|---|---|---|---|---|
| Socket | Yes | `DockRegistry`, feature section adapters | Dock, adapter registry, section registry, language, tests | `PlatformSocketRegistry`, `SectionSocket`, socket ids/status/definitions | ACTIVE |
| Dock | Yes | `PlatformCore`, `CoreSignalResolver`, bridge connect-once | Platform core tests, socket registry tests, adapter tests | `connect`, `disconnect`, `setStatus`, `slotFor`, `slotForSocket`, `slots` | ACTIVE |
| Registry | Yes | `PlatformCore`, resolver, dock, adapter registry | Tests and validation files | code/socket/section/adapter register and lookup APIs | ACTIVE |
| Contracts | Yes | Feature adapters, core bridge, resolver, gateways | Feature adapters, tests, gateway/resolver files | request/envelope/socket/adapter/output/storage contracts | ACTIVE |
| Gateway | Yes | `PlatformCore`, `PlatformCoreSignalBridge` | Gateway tests, bridge tests, platform core tests | `CoreOutputGateway.emit`, Firebase/production/noop/memory implementations | ACTIVE |
| Resolver | Yes | `PlatformCore.emit` | Platform core tests, dictionary tests, gateway tests | `CoreSignalResolver.resolve`, `CoreEmitResult`, `CoreEmitReason` | ACTIVE |
| Bridge | Yes | Residential/commercial/library runtime bridges | Bridge tests, feature runtime bridge files | `PlatformCoreSignalBridge.emit` | ACTIVE |
| Runtime composition | Yes | Feature event emitters/services | Residential signal emitter, commercial auth service, tests | `PlatformCore`, runtime bridge statics | ACTIVE |
| Module mounting | Yes | Bridge connect-once and direct core connect | Dock tests, three-section tests | `connectSection`, `DockRegistry.connect` | ACTIVE |
| Module registration | Yes | Tests; runtime wiring not verified | `three_section_adapter_layer_test.dart` | `PlatformAdapterRegistry.register`, lookups, `createSockets` | NOT VERIFIED |
| Module discovery | No verified discovery API | Not verified | No direct discovery references found | None found | NOT VERIFIED |
| Runtime lifecycle | Partial | `connectSection`, `disconnectSection`, `setStatus` | Core/dock tests | connect/disconnect/status APIs | NOT VERIFIED |
| Session store | Yes | Client/accessibility/generation2 pages | Session tests and page references | `startSession`, save/read/clear, `safeSignalContext` | ACTIVE |
