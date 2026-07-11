# CENTRAL_PLATFORM_CORE_PHASE_1_FOUNDATION

## Purpose

Phase 1 creates an isolated Central Platform Core foundation. It proves that a fake section can connect to a local dock, emit a registered code, receive a standard signal envelope, and send that envelope to a local output gateway without touching the public runtime.

## Created Files

```text
lib/core/platform_core/platform_core.dart
lib/core/platform_core/platform_core_facade.dart
lib/core/platform_core/contracts/section_socket.dart
lib/core/platform_core/contracts/core_signal_request.dart
lib/core/platform_core/contracts/core_signal_envelope.dart
lib/core/platform_core/dock/dock_registry.dart
lib/core/platform_core/registry/core_code_registry.dart
lib/core/platform_core/resolver/core_signal_resolver.dart
lib/core/platform_core/gateway/core_output_gateway.dart
test/core/platform_core/platform_core_test.dart
docs/platform-core/CENTRAL_PLATFORM_CORE_PHASE_1_FOUNDATION.md
```

## Boundaries

The core is Dart-only and isolated. It does not import or depend on UI, routes, Firebase, authentication, Riverpod, localization, assets, Residential, Commercial, or Library runtime code.

The public sections were not modified:

```text
Residential
Commercial
Library
```

Firebase, Firestore, Storage, app startup, and public routes were not modified.

## Implemented Components

- `PlatformCore`: facade for connecting sections, disconnecting sections, and emitting signal requests.
- `SectionSocket`: minimal fake-section contract with ID, code, environment, gates, and code prefixes.
- `DockSlot`: in-memory slot representation for a connected section.
- `DockRegistry`: in-memory dock with duplicate-section protection and a configurable slot limit.
- `CoreCodeDefinition`: one code definition in the local test code language.
- `CoreCodeRegistry`: in-memory code registry with register, resolve, contains, and disable support.
- `CoreSignalRequest`: minimal incoming request from a section.
- `CoreSignalEnvelope`: standard accepted signal envelope.
- `CoreSignalResolver`: validates section connection, code state, environment, section allowance, gate compatibility, prefix compatibility, and safe context.
- `CoreOutputGateway`: output interface for accepted envelopes.
- `NoopCoreOutputGateway`: accepts envelopes and writes nothing.
- `MemoryCoreOutputGateway`: stores envelopes in memory for tests and supports clearing.

## Not Implemented

- No Firebase gateway.
- No Firestore collections.
- No authentication.
- No routes.
- No UI.
- No Riverpod providers.
- No section adapters.
- No real capsule connection.
- No real production signal code dictionary.
- No client local storage.
- No deployment or GitHub Pages changes.

## Flow

```text
SectionSocket
-> DockRegistry
-> PlatformCore
-> CoreCodeRegistry
-> CoreSignalResolver
-> MemoryCoreOutputGateway / NoopCoreOutputGateway
```

## Fail-Soft Rule

Signal failure must never break section runtime. Unknown codes, missing sections, disabled codes, disallowed sections, environment mismatch, unsafe context, and gateway failures return rejected results instead of throwing through the public API.

## Tests

The unit tests use only fake section sockets and local test codes. They cover:

- valid fake section connection
- duplicate connection rejection
- disconnection
- accepted registered code
- missing and unknown code rejection
- disconnected section rejection
- section allowance rejection
- disabled code rejection
- environment mismatch rejection
- gate and prefix rejection
- unsafe context rejection
- memory gateway storage and clearing
- noop gateway behavior
- gateway failure fail-soft behavior
- dock slot limit

## Phase 2

Phase 2 may define a reviewed code language and prepare an experimental Firebase gateway only after Phase 1 is reviewed and approved. Phase 2 must remain separate from the public runtime until explicitly connected by an approved operation.

