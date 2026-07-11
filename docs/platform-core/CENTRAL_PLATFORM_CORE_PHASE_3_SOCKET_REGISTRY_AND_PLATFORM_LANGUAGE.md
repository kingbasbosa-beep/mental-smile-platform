# CENTRAL_PLATFORM_CORE_PHASE_3_SOCKET_REGISTRY_AND_PLATFORM_LANGUAGE

## Purpose

Phase 3 creates the first socket registry and platform language foundation for Central Platform Core.

The goal is to turn the electrical-strip model into runtime structure: the core does not know section files, widgets, routes, or screens. It knows sockets, section identities, contracts, environments, code prefixes, and signal families.

## Electrical Strip Model

The platform exposes ten fixed sockets:

```text
SOCKET_01
SOCKET_02
SOCKET_03
SOCKET_04
SOCKET_05
SOCKET_06
SOCKET_07
SOCKET_08
SOCKET_09
SOCKET_10
```

Current connected sockets:

```text
SOCKET_01 -> Residential
SOCKET_02 -> Commercial
SOCKET_03 -> Library
```

Reserved sockets:

```text
SOCKET_04
SOCKET_05
SOCKET_06
SOCKET_07
SOCKET_08
SOCKET_09
SOCKET_10
```

Reserved sockets are not connected to any section.

## Why The Core Does Not Know Sections

Central Platform Core must not depend on section folders or public runtime routes.

It reads only:

```text
Socket Registry
Section Registry
Platform Language
```

This keeps the core stable when a section is purified, rebuilt, replaced, or tested through another adapter.

## Why A Section Does Not Know The Core

A section declares identity, not infrastructure.

The section language is:

```text
I am RES.
I use contract version 1.
I belong to SOCKET_01.
I support selected signal families.
```

It does not know Firebase, Firestore, the dock registry, or other sections.

## How Connection Works

The core receives a section socket declaration:

```text
Section = RES
Socket = SOCKET_01
Code = cl001bt
```

The Dock Registry validates:

```text
the socket exists
the socket is not reserved
the section belongs to that socket
the section is not already connected
the socket is not already occupied
```

Then signal resolution continues through the existing platform dictionary and output gateway.

## Why Fixed Sockets Matter

Fixed sockets give the platform stable attachment points. They prevent free-number allocation and make replacements deterministic.

This allows:

```text
replace a whole section without changing the core
install a future section in a reserved socket
test an experimental section with an explicit socket contract
detect wrong socket declarations before runtime output
```

## Platform Language vs Signal Language

Signal Language is the dictionary of signal codes:

```text
cl001bt
sp001bt
ct005sb
```

Platform Language is broader:

```text
Section Codes
Socket Codes
Signal Families
Contract Version
Environment
Code Prefixes
```

Signal Language says what event happened.

Platform Language says where the event is allowed to exist.

## Runtime Impact

```text
PUBLIC RUNTIME IMPACT:
NONE
```

No route, app startup, Firebase configuration, Storage rule, Authentication provider, Residential runtime, Commercial runtime, or Library runtime is changed in this phase.

## Files

Added:

```text
lib/core/platform_core/socket/platform_socket_registry.dart
lib/core/platform_core/registry/platform_section_registry.dart
lib/core/platform_core/language/platform_language.dart
test/core/platform_core/platform_socket_registry_test.dart
docs/platform-core/CENTRAL_PLATFORM_CORE_PHASE_3_SOCKET_REGISTRY_AND_PLATFORM_LANGUAGE.md
```

Modified:

```text
lib/core/platform_core/contracts/section_socket.dart
lib/core/platform_core/dock/dock_registry.dart
lib/core/platform_core/platform_core.dart
test/core/platform_core/platform_core_test.dart
```
