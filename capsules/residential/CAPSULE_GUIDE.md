# Residential Capsule Blueprint

## 1. Capsule Identity
Capsule ID: MS-CAPSULE-RES-R-1.07.2026. Repository ID: MS-PLATFORM-DNA-V1-PRO. Section ID: MS-SECTION-RESIDENTIAL. Current mode: BLUEPRINT.

## 2. Purpose
This package maps and materializes the current embedded Residential runtime as an isolated package, with a Central Runtime test port mount that does not replace the active Residential runtime.

## 3. Human Role
Residential is the client-facing human support runtime: entry, client room, accessibility support surfaces, local signal buffering, and connected speech support.

## 4. Included Sections
Residential, Client, Accessibility, Generation2 client, Generation2 friend, Residential exit, Residential speech, Residential local signals.

## 5. Excluded Sections
Commercial, Library, Platform Core implementation, Firebase contract mutation, Storage contract mutation, generated test copies.

## 6. Runtime Ownership
Ownership is recorded per file in CAPSULE_RUNTIME_MAP.json. Central imports are mapped as dependencies, not copied into the capsule.

## 7. Routes Summary
Residential route constants: 14. Router cases: 14. Unreachable routes: 0. All route boundary crossings use MS-LINE-ROUTE-01.

## 8. Signals Summary
Signal codes: 61. Core bridge signals: 3. Local buffered signals: 58. Local buffer TTL is 24 hours and max records per section is 200.

## 9. Firebase Summary
Direct Residential Firebase usages found: 0. PlatformCoreSignalBridge is mapped as a signal dependency, not as direct Firebase access.

## 10. Storage Summary
Direct Residential Firebase Storage paths found: 0.

## 11. Localization Summary
Owners mapped: ResidentialLocalizations, AccessibilityLocalizations, AppSectionLocalizations as central import, SharedLocalizations as central import. Total mapped keys: 238.

## 12. Assets Summary
Asset references mapped: 60. Capsule-owned references are distinguished from central imports. Missing active asset references recorded as blockers: 1.

## 13. Speech Summary
Visible speaker instances: 48. Connected speaker instances: 48. Direct flutter_tts calls inside Residential: 0. Fallback keys: 0. Mojibake speech sources: 0.

## 14. Canonical Port Lines
Used lines: MS-LINE-LIFECYCLE-01, MS-LINE-ROUTE-01, MS-LINE-SIGNAL-01, MS-LINE-LOCALIZATION-01, MS-LINE-ASSET-01, MS-LINE-EXTERNAL-ACTION-01, MS-LINE-ERROR-01. Reserved extension lines remain RESERVED_UNUSED.

## 15. Active/Test Port IDs
MS-PORT-RES-ACTIVE-01 remains DESIGNED_NOT_IMPLEMENTED. MS-PORT-RES-TEST-01 is implemented as a hidden, non-public, non-default test port mounted at /__capsule_test/residential.

## 16. Imports
Central imports are listed in CAPSULE_RUNTIME_MAP.json and CAPSULE_PORT_REGISTRY.json. Count: 15.

## 17. Exports
Capsule exports include route destinations, ResidentialSignalEmitter, ResidentialSectionAdapter, and ResidentialSpeechGenerator. Count: 17.

## 18. Dependencies
Current dependency classes include Flutter UI, shared_preferences local buffer, url_launcher through SafeExternalLinkLauncher, flutter_tts through shared speech engine, and localization delegates.

## 19. Forbidden Dependencies
No Commercial runtime implementation, no Library runtime implementation, no Platform Core modification, no direct Firebase contract mutation, no runtime copy during BLUEPRINT mode.

## 20. Tests
Mapped legacy tests: 3. Added test port tests cover compatibility gate rejection, mount/unmount isolation, package asset resolution, host localization, speech stop, public package import boundary, active route preservation, and Platform Core protection.

## 21. Build Requirements
Buildable is pending manual verification. The user must run the package, example, and root Flutter commands because automated Flutter/Dart verification is intentionally not executed in PART 10C-1.

## 22. Runtime Requirements
Residential runtime currently requires AppRouter, Platform Core signal bridge, local signal buffer, shared speech service, safe external link launcher, App/Shared/Residential/Accessibility localization, and registered assets.

## 23. Compatibility Requirements
Compatibility must preserve route paths, signal codes, local buffer identity, localization keys, speaker connectivity, and canonical line mapping.

## 24. Current Blockers
missing_active_asset_reference: assets/branding/guides/supporters_account_selection_mobile_guide.png
generation2_mobile_entry contains non-residential supporter/specialist/center branches; map only, do not split in 10B-0

## 25. Clone Rules
Clone only after runtime copy is authorized. Preserve stable codes in registries; do not invent routes, signals, assets, or localization keys.

## 26. Activation Rules
The test port may mount only after the Compatibility Gate passes. Active Residential is not replaced, no public navigation points to the test route, and no automatic startup mount is allowed.

## 27. Replacement Lifecycle
BLUEPRINT -> runtime copy -> test port implementation -> compatibility gate -> MOUNTED_TEST -> manual verification. Active replacement remains out of scope.

## 28. PART 10C-1 Status
RESIDENTIAL CAPSULE MOUNTED ON TEST PORT - MANUAL VERIFICATION PENDING.
