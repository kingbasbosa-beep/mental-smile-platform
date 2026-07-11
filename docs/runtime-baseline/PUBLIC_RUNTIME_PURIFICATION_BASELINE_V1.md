# PUBLIC_RUNTIME_PURIFICATION_BASELINE_V1

## 1. Document Identity

Document:
PUBLIC_RUNTIME_PURIFICATION_BASELINE_V1

Status:
COMPLETED AND VALIDATED

Purpose:
Establish the clean public runtime baseline before Central Platform Core development.

Execution date:
2026-07-11

Repository:
mental-smile-platform

Workspace:
C:\mental_smile_workspace\app\mental-smile-platform

Branch:
residential-assets-purification-v1

Previous commit before baseline commit:
2caf2f78

New commit:
Recorded in the final operation summary after commit creation.

## 2. Executive Summary

The public platform previously carried internal runtime residue that no longer matched the final public operating model. The platform has been purified so the public application is dedicated to clients, specialists, centers, and public content consumers.

Final public runtime:

```text
PUBLIC PLATFORM RUNTIME

Residential
Commercial
Library
```

## 3. Architectural Decision

The public platform does not contain administration, owner operations, archive management, marketing management, monitoring, or internal tools.

Internal management systems will exist only on the owner's local computer and will interact with Firebase independently from the public platform when needed.

This is not:

```text
Freeze
Disable
Hide
Temporary Detachment
```

It is:

```text
Permanent removal from the public platform runtime.
```

## 4. Removed Runtime Areas

### Administrative

- Administrative had no active public runtime section.
- Name and reference residue that implied an Administrative runtime was removed.

Final state:

```text
Administrative Runtime = DOES NOT EXIST
```

### Owner

- Owner pages, rooms, routes, role routing, and internal operational surfaces were removed from the public runtime.
- Owner-only localization and runtime references were removed.

### Archive

- Archive page and route residue were removed.
- Archive signal writers/builders and active public Archive wiring were removed.
- `archive_signal_events` active public runtime wiring was removed.
- Archive runtime documentation residue was removed where it represented the public runtime.

### Marketing / Promotion

- Marketing room, route placeholders, domain residue, and exclusive marketing runtime assets were removed.
- `marketing_assets` public Storage rule residue was removed.

### Internal Runtime

Internal and development-only runtime families were removed where present, including:

```text
monitoring
s_owner
s_capital
s_city
s_support_room
s_registry_room
s_declaration_review_room
s_web_surfaces
sovereign_construction
assistant
os_generation_1_kernel
presentation_gallery
```

## 5. Why These Components Were Removed

- The public platform is not an administration console.
- Public users should not reach administration, archive, monitoring, review, or internal operations systems.
- Future administration will read from Firebase directly through local owner-side systems.
- Archive memory exists outside the public platform as external memory or preserved history.
- Marketing and development tools are local operational tools, not user runtime.
- Removing these components reduces routing noise, role-gate complexity, stale writers, and obsolete ownership assumptions.
- The Central Platform Core can now start without inheriting old routing, writers, role gates, or internal runtime surfaces.

## 6. Preserved Public Runtime

### Residential

- Client surfaces.
- Accessibility surfaces.
- Public client experience.
- Client-local temporary data behavior.
- Approved public actions.

### Commercial

- Specialist and center authentication.
- Specialist and center registration.
- Provider-facing public/runtime surfaces.
- Persistent specialist and center Firebase profiles.

### Library

- Public knowledge/content.
- Specialists display.
- Centers display.
- Provider discovery.
- Related public content.

### Shared Public Foundation

The following shared platform foundations remain because they support Residential, Commercial, and Library:

```text
App startup
Firebase initialization
Public authentication
Splash and entry
Localization
Trust and safety
Contact requests
Saved destinations
Recommendations
Web portal/public landing
Shared public signal shell
```

## 7. Data Boundary After Purification

### Clients

Client-local temporary data includes:

```text
Client image
Selected note
Temporary preferences
Session state
```

This data remains local to the client experience and is cleared by exit or page lifecycle behavior unless a future Central Platform Core contract explicitly approves a signal or Firebase write.

### Specialists and Centers

Specialist and center data remains persistent on Firebase because it is required by Commercial and Library:

```text
Account data
Public profiles
Qualifications
Specializations
Contact information
Published content
Center information
```

### Administration

Administration does not read from public platform runtime. Future local administration systems will read from Firebase directly and remain outside the public runtime.

## 8. Removed Archive Signal Flow

The old flows have ended:

```text
Residential -> Archive
Library -> Archive
```

Archive writers were not replaced with another legacy writer.

There is no:

```text
Archive fallback
Legacy signal bridge
Automatic migration to signal_events
```

The new signal language will be created later through Central Platform Core.

## 9. Validation Results

Owner/manual validation results for this purified baseline:

```text
flutter gen-l10n
PASSED - completed using l10n.yaml configuration

flutter analyze
PASSED - No issues found

flutter test
PASSED - All tests passed

flutter build web --release --base-href /mental-smile-platform/
PASSED - Built build\web
```

Additional notes:

- `flutter analyze` was confirmed clean more than once.
- Web build output was generated under `build/web`.
- Wasm dry run succeeded during web build.
- No deployment was performed.

## 10. Non-Blocking Dependency Notices

The following dependency notices are non-blocking and were not addressed in this operation:

- One package is discontinued: `flutter_markdown`.
- 56 packages have newer versions incompatible with current dependency constraints.
- No dependency upgrades were performed.
- These notices did not block localization generation, analyzer, tests, or web release build.

## 11. Final Baseline State

```text
PUBLIC RUNTIME PURIFIED TO:

RESIDENTIAL
COMMERCIAL
LIBRARY
```

```text
OWNER RUNTIME = REMOVED
ADMINISTRATIVE RUNTIME = REMOVED
ARCHIVE RUNTIME = REMOVED
MARKETING RUNTIME = REMOVED
MONITORING RUNTIME = REMOVED
INTERNAL OPERATIONAL RUNTIME = REMOVED
```

## 12. Next Development Stage

Next stage:

```text
CENTRAL PLATFORM CORE - PHASE 1
```

It will start in an isolated namespace without:

- Firebase production wiring.
- Modifying the three public sections.
- Modifying public routes.
- Replacing current runtime.

Initial future components:

```text
Core Runtime Facade
Dock Registry
Section Socket Contract
Local Code Registry
Signal Resolver
No-op / Local Memory Gateway
Isolated Test Harness
```

Do not implement Central Platform Core in this baseline operation.
