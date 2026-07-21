# Library Capsule Materialized Test Capsule

## 1. Capsule identity
MS-CAPSULE-LIB-BLUEPRINT / PORT_MOUNTED / FINAL_CAPSULE_ID_PENDING_CREATION_DATE_APPROVAL.

## 2. Purpose
Isolated Library Flutter package and central test port for active Library surfaces only.

## 3. Human role
Public knowledge, article, and provider-content discovery library.

## 4. Included Library surfaces
Library entry, knowledge cards, article viewer, provider specialists, provider centers, public provider cards, Library signals, Library localization, Library assets, and current speech wiring.

## 5. Excluded surfaces
Residential, Client, Accessibility ownership, Commercial login/registration/rooms, booking, payment, ranking, recommendation engine, verification superiority, Admin, Monitoring, Owner, and legacy inactive content.

## 6. Runtime ownership
Library owns feature runtime and content registry. Router, Firestore, local signal buffer, Platform Core adapter contract, shared speech, shared links, shared provider contracts, and shared asset utilities are central imports.

## 7. Routes summary
5 reachable Library routes. 0 unreachable routes.

## 8. Signals summary
1 Platform Core test-required adapter code. 22 Library local signal definitions, with 6 persisted through the current local buffer route.

## 9. Firebase summary
2 active Firestore read collections: public_specialist_profiles and public_center_profiles.

## 10. Storage summary
No direct Library Storage path is used.

## 11. Localization summary
LibraryLocalizations owns 14 keys. App/Shared localization is not copied into this blueprint.

## 12. Assets summary
32 active asset paths are mapped. Provider category backgrounds are central imported from the shared provider category registry.

## 13. Speech status
25 visible Library speaker/guide instances are mapped. 2 are connected to localized speech. Dedicated Library speech generator is pending.

## 14. Canonical port lines
Active lines: lifecycle, route, data-read, signal, localization, asset, external-action, error. Extension lines are reserved unused.

## 15. Active/Test port IDs
MS-PORT-LIB-TEST-01 is mounted in MOUNTED_TEST. MS-PORT-LIB-ACTIVE-01 remains DESIGNED_NOT_IMPLEMENTED.

## 16. Imports
17 central imports are registered.

## 17. Exports
12 public exports are registered.

## 18. Dependencies
Flutter asset bundle, Cloud Firestore reads, LibraryLocalizations, shared speech action, safe external link launcher, shared provider profile contracts, Platform Core adapter contract.

## 19. Forbidden dependencies
Residential runtime, Client runtime, Accessibility ownership, Commercial login/registration, booking, payment, recommendation, Admin, Owner, Monitoring.

## 20. Tests
6 Library-related tests are mapped, including package descriptor, package boundary, and central test-port compatibility coverage.

## 21. Build requirements
Package is intended buildable after manual Flutter verification.

## 22. Runtime requirements
Original runtime remains in place. Runtime mirrors are copied under capsules/library/package/lib/src/runtime_mirror with contract-rewired markers.

## 23. Compatibility requirements
Central imports, canonical line contracts, speech state, content boundaries, read-only Firebase contracts, and zero unmapped items must stay compatible before activation.

## 24. Current blockers
Library speech generator pending. Provider category assets are central imported from shared Commercial asset registry.

## 25. Clone rules
Clone from capsules/library/package only; do not move or delete original runtime.

## 26. Activation rules
Activation requires approved final capsule ID, active port implementation, manual verification, and speech completion or an explicit active-promotion exception.

## 27. Replacement lifecycle
Current runtime remains authoritative until a future approved capsule replacement.

## 28. Content governance boundary
Runtime content is limited to enabled metadata and rendered markdown. Coming-soon metadata is not completed functionality.

## 29. Runtime content vs editorial source boundary
The answer markdown is runtime content. Arabic, English, and global reference tabs are editorial sources.

## 30. Package path
capsules/library/package

## 31. Test port route
/__capsule_test/library
