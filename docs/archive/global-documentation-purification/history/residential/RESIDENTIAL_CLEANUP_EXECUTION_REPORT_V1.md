# Residential Cleanup Execution Report V1

Record Classification: ARCHIVE_ONLY

This report preserves completed cleanup and governance-archive execution evidence. Its historical terminology does not define current Application classifications.

## Code Cleanup Execution Phase

Status: COMPLETED

Operation ID: OP-RESIDENTIAL-CLEANUP-EXECUTION-V1

Date: 2026-06-23

Final Verdict: RESIDENTIAL_CLEANUP_EXECUTION_COMPLETED

# Summary

Total Files Modified:

3

Warnings Removed:

4

Infos Removed:

2

Dead Code Blocks Removed:

0

Deprecated APIs Replaced:

1

# Detailed Cleanup Log

### RC-001

Type:
UNUSED_ELEMENT_PARAMETER_REMOVAL

File:
`lib/features/client/presentation/pages/client_room_page.dart`

Removed:

```dart
this.right,
final double? right;
right: placement.right,
```

Reason:
unused_element_parameter

Evidence:
Analyzer input reported: `A value for optional parameter 'right' isn't ever given` at `client_room_page.dart:169`.

Runtime Impact:
none

Behavior Change:
none

### RC-002

Type:
UNUSED_ELEMENT_PARAMETER_REMOVAL

File:
`lib/features/client/presentation/pages/client_room_page.dart`

Removed:

```dart
this.bottom,
final double? bottom;
bottom: placement.bottom,
```

Reason:
unused_element_parameter

Evidence:
Analyzer input reported: `A value for optional parameter 'bottom' isn't ever given` at `client_room_page.dart:170`.

Runtime Impact:
none

Behavior Change:
none

### RC-003

Type:
UNUSED_ELEMENT_PARAMETER_REMOVAL

File:
`lib/features/accessibility/presentation/pages/accessibility_room_page.dart`

Removed:

```dart
this.right,
final double? right;
right: placement.right,
right: widget.placement.right,
```

Reason:
unused_element_parameter

Evidence:
Analyzer input reported: `A value for optional parameter 'right' isn't ever given` at `accessibility_room_page.dart:411`.

Runtime Impact:
none

Behavior Change:
none

### RC-004

Type:
UNUSED_ELEMENT_PARAMETER_REMOVAL

File:
`lib/features/accessibility/presentation/pages/accessibility_room_page.dart`

Removed:

```dart
this.bottom,
final double? bottom;
bottom: placement.bottom,
bottom: widget.placement.bottom,
```

Reason:
unused_element_parameter

Evidence:
Analyzer input reported: `A value for optional parameter 'bottom' isn't ever given` at `accessibility_room_page.dart:412`.

Runtime Impact:
none

Behavior Change:
none

### RC-005

Type:
DEPRECATED_API_REPLACEMENT

File:
`lib/features/accessibility/presentation/pages/accessibility_room_page.dart`

Replaced:

```dart
.withOpacity(_isHovering ? 0.44 : 0.22)
```

With:

```dart
.withValues(alpha: _isHovering ? 0.44 : 0.22)
```

Reason:
deprecated_member_use

Evidence:
Analyzer input reported: `'withOpacity' is deprecated and shouldn't be used` at `accessibility_room_page.dart:605`.

Runtime Impact:
none

Behavior Change:
none

### RC-006

Type:
SAFE_CONST_OPTIMIZATION

File:
`lib/features/accessibility/presentation/pages/accessibility_links_page.dart`

Changed:

```dart
_LegendBlock(items: _legend)
```

To:

```dart
const _LegendBlock(items: _legend)
```

Reason:
prefer_const_constructors

Evidence:
Analyzer input reported: `Use 'const' with the constructor to improve performance` at `accessibility_links_page.dart:225`.

Runtime Impact:
none

Behavior Change:
none

# Analyzer Delta

Before:

Warnings: 4 Residential-scope warnings from the Owner-provided analyzer file

Infos: 2 Residential-scope infos from the Owner-provided analyzer file

After:

Warnings: 0 expected for the exact targeted Residential entries

Infos: 0 expected for the exact targeted Residential entries

Resolved:

- unused_element_parameter: 4
- deprecated_member_use: 1
- prefer_const_constructors: 1

Not Present In Residential Cleanup Input:

- unused_import: 0
- unused_local_variable: 0
- unused_element: 0
- dead_code: 0

Analyzer Execution:

Not run by Codex. Owner instructed Codex to use the attached analyzer result and not run analysis.

# Safety Verification

Runtime Changed:
NO

Routes Changed:
NO

Firebase Changed:
NO

Collections Changed:
NO

Signals Changed:
NO

Business Logic Changed:
NO

UI Behavior Changed:
NO

Cleanup Status:

PASS

Files Modified:

3

Warnings Removed:

4

Infos Removed:

2

Operations Logged:

YES

Registry Updated:

YES

Index Updated:

YES

Final Verdict:

RESIDENTIAL_CLEANUP_EXECUTION_COMPLETED

---

## Prior Section Governance Archive Cleanup Record

Status: COMPLETED

Operation ID: OP-RESIDENTIAL-SECTION-GOVERNANCE-ARCHIVE-CREATION-V1

Date: 2026-06-23

Final Verdict: RESIDENTIAL_SECTION_GOVERNANCE_ARCHIVE_CREATED

## What Was Reclassified To History

The old global governance model was frozen as history archive only.

History markers created:

- `docs/history/global-governance-v1/GLOBAL_GOVERNANCE_V1_FREEZE_MARKER.md`
- `docs/history/global-governance-v1/GLOBAL_GOVERNANCE_V1_HISTORY_ARCHIVE_INDEX.md`

The freeze covers old global governance families such as global guides, cards, registries, findings, memory records, archive records, and whole-system audits when they are used as universal doctrine.

## What Remained Active

The new active Residential archive is:

- `docs/sections/residential/RESIDENTIAL_CONSTITUTION_V1.md`
- `docs/sections/residential/RESIDENTIAL_RUNTIME_GUIDE_V1.md`
- `docs/sections/residential/RESIDENTIAL_CARD_GUIDE_V1.md`
- `docs/sections/residential/RESIDENTIAL_PROMPT_GUIDE_V1.md`
- `docs/sections/residential/RESIDENTIAL_SIGNAL_GUIDE_V1.md`
- `docs/sections/residential/RESIDENTIAL_REPORTING_GUIDE_V1.md`
- `docs/sections/residential/RESIDENTIAL_ARCHIVE_INDEX_V1.md`
- `docs/sections/residential/RESIDENTIAL_CLEANUP_EXECUTION_REPORT_V1.md`

## What Was Not Touched

No runtime code was changed.

No routes were changed.

No Firebase rules were changed.

No Firestore collections were changed.

No Storage paths were changed.

No warnings were fixed.

No features were created.

No Commercial V1, Commercial V2, Owner, Monitoring, Library, or Web Portal runtime was changed.

## Why Executed Operations Were Not Frozen

Executed Operations Registry and Executed Operations Index remain active because they are execution memory, not section governance doctrine.

They preserve the chronological record of what happened across the repository.

The following files remain live:

- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

They were updated only to record this operation.

## Cleanup Method

No dangerous deletion was performed.

No bulk move was performed because the older archive is cross-referenced and still needed as historical evidence.

The cleanup was performed by:

- freezing the old global governance model as history
- creating a standalone Residential section governance archive
- preserving active operations history
- avoiding runtime changes

## Residential Boundary Confirmed

Residential is not a Client Identity System.

Residential currently consists of:

- Client Room
- Accessibility Room

Residential does not own:

- booking
- payment
- case management
- diagnosis
- provider assignment
- client registration
- permanent client profile
