# Commercial Capsule Blueprint

## 1. Capsule Identity
Capsule ID: MS-CAPSULE-COM-BLUEPRINT. FINAL_CAPSULE_ID_PENDING_CREATION_DATE_APPROVAL. Repository: MS-PLATFORM-DNA-V1-PRO. Mode: BLUEPRINT.

## 2. Purpose
Materialized Commercial capsule package connected to a hidden Central Runtime test port. Active Commercial remains direct legacy runtime and untouched.

## 3. Human Role
Provider-facing specialist and center access, registration, rooms, profiles, public profile publishing, Commercial V2 web, and provider account surfaces.

## 4. Included Commercial Surfaces
Access/login/register, specialist/center rooms, professional profiles/libraries, assistive tools, public accounts, Commercial V2 web, Generation2 specialist/center rooms, provider profile contracts, signals, Firebase/Storage, localization, assets, tests.

## 5. Excluded Surfaces
Residential, Client, Accessibility, Library content, booking, payment, ranking, recommendation, admin queues, monitoring, Owner/Admin runtime.

## 6. Runtime Ownership
See CAPSULE_RUNTIME_MAP.json.

## 7. Routes Summary
Route constants: 17. Router cases: 17. Direct root entry: 1. Registry routes: 18. Unreachable: 0.

## 8. Signals Summary
Core signals: 4. Local signals: 7. Local buffer TTL 24h, max 200. Writer accepts CV2_SIG_OPEN_LIBRARY and skips six current CV2 codes.

## 9. Firebase Summary
Mapped Firebase usages: 5. Collections: 4.

## 10. Storage Summary
Mapped Storage paths: 2.

## 11. Localization Summary
Commercial keys plus Shared speech central import. Keys: 47.

## 12. Assets Summary
Asset references: 39. Missing: 0.

## 13. Speech Status
Commercial generator pending. Current shared wiring controls: 17 total, 2 connected, 15 unconnected/default icons.

## 14. Canonical Port Lines
11 base lines used. Reserved extension lines unused.

## 15. Active/Test Port IDs
MS-PORT-COM-ACTIVE-01 remains DESIGNED_NOT_IMPLEMENTED. MS-PORT-COM-TEST-01 is implemented as a hidden, non-public, non-default test port at /__capsule_test/commercial.

## 16. Imports
Central imports: 17.

## 17. Exports
Exports: 20.

## 18. Dependencies
Flutter, Firebase Auth/Firestore/Storage, shared_preferences, url_launcher, flutter_tts, image_picker.

## 19. Forbidden Dependencies
No Residential runtime, Library content, booking/payment/ranking/recommendation, admin queues, monitoring, or Commercial speech generator creation in blueprint.

## 20. Tests
Mapped legacy tests: 2. Added package descriptor/boundary tests and Central test-port compatibility/isolation tests.

## 21. Build Requirements
Buildable is pending manual verification. Flutter/Dart commands are intentionally left for the user.

## 22. Runtime Requirements
Router, Firebase bootstrap, AccountAccessService, PlatformCoreSignalBridge, LocalSectionSignalBuffer, provider profile contracts, shared speech, Commercial localization, safe links, registered assets, storage rules.

## 23. Compatibility Requirements
Preserve routes, signal codes, storage paths, Firestore collections, localization keys, provider projection, canonical lines.

## 24. Current Blockers
commercial_speech_generator_pending
commercial_v2_local_signal_writer_accepts_only_CV2_SIG_OPEN_LIBRARY

## 25. Clone Rules
Clone only after authorized runtime copy.

## 26. Activation Rules
Requires compatibility gate pass, route registration, Firebase/Storage host-contract isolation, and speech completion before any future active promotion. Current speech state is PARTIAL_TEST_ONLY.

## 27. Replacement Lifecycle
BLUEPRINT -> runtime copy -> test port implementation -> compatibility gate -> MOUNTED_TEST -> manual verification. Active replacement is out of scope.

## 28. PART 10C-2 Status
COMMERCIAL CAPSULE MOUNTED ON TEST PORT - MANUAL VERIFICATION PENDING.
