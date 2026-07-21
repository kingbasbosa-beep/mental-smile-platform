# PART 9E - Canonical Port Language And Reserved Extension Lines

This report is design and classification only. It does not create runtime ports,
capsules, sockets, handlers, imports, routes, Firebase rules, or Platform Core
changes.

Reference inputs:

- `PROJECT_INVENTORY_PART_9C_RUNTIME_BOUNDARIES.md`
- PART 9D static result: `Central port blockers remaining: 149`
- Current read-only blocker recheck, excluding Platform Core contracts

## 1. Canonical Line Registry

All Central Runtime endpoints and Capsule endpoints must use identical line
codes, contract IDs, contract versions, request schemas, response schemas, and
error codes. If `lineCode`, `contractVersion`, `sectionId`, or `capability`
differs, the connection result is `CONNECTION_DENIED`.

| Line Code | Contract ID | Version | Direction | Capability | Central Side | Capsule Side |
| --- | --- | --- | --- | --- | --- | --- |
| `MS-LINE-LIFECYCLE-01` | `MS-CONTRACT-LIFECYCLE-01` | `1.0.0` | `BIDIRECTIONAL` | Lifecycle entry, shared scaffold, shared UI utility, mode handoff | Owns lifecycle gate, app-level entry, central/shared runtime surface | Requests or receives lifecycle composition without importing another section implementation |
| `MS-LINE-ROUTE-01` | `MS-CONTRACT-ROUTE-01` | `1.0.0` | `BIDIRECTIONAL` | Route declaration, route resolution, route destination mounting | Owns router registration and route resolution | Declares route intent and receives route destination entry |
| `MS-LINE-AUTH-01` | `MS-CONTRACT-AUTH-01` | `1.0.0` | `CAPSULE_TO_CENTRAL` | Auth identity, role, account access, blocked-account status | Owns Firebase/Auth/account access gateway | Requests identity, role, access state, and auth actions |
| `MS-LINE-DATA-READ-01` | `MS-CONTRACT-DATA-READ-01` | `1.0.0` | `CAPSULE_TO_CENTRAL` | Read-only remote data query | Owns read gateway and source adapter | Requests scoped read data |
| `MS-LINE-DATA-WRITE-01` | `MS-CONTRACT-DATA-WRITE-01` | `1.0.0` | `CAPSULE_TO_CENTRAL` | Remote data mutation | Owns write gateway and write identity validation | Requests scoped create/update/delete |
| `MS-LINE-STORAGE-01` | `MS-CONTRACT-STORAGE-01` | `1.0.0` | `CAPSULE_TO_CENTRAL` | Storage upload/download/delete | Owns storage gateway and file policy validation | Requests scoped object operation |
| `MS-LINE-SIGNAL-01` | `MS-CONTRACT-SIGNAL-01` | `1.0.0` | `BIDIRECTIONAL` | Signal emit, archive, buffer, package | Owns signal buffer/archive entry and central dispatch | Emits or receives section-owned signal payloads |
| `MS-LINE-LOCALIZATION-01` | `MS-CONTRACT-LOCALIZATION-01` | `1.0.0` | `BIDIRECTIONAL` | Localization delegate, locale lookup, shared copy lookup | Owns delegate registry and locale selection | Requests section/shared localized copy by key |
| `MS-LINE-ASSET-01` | `MS-CONTRACT-ASSET-01` | `1.0.0` | `CAPSULE_TO_CENTRAL` | Asset path, asset family, responsive variant lookup | Owns asset registry and resolved asset path | Requests a registered asset or responsive variant |
| `MS-LINE-EXTERNAL-ACTION-01` | `MS-CONTRACT-EXTERNAL-ACTION-01` | `1.0.0` | `CAPSULE_TO_CENTRAL` | Safe link launch and external action | Owns safe external action policy | Requests URL/action launch |
| `MS-LINE-ERROR-01` | `MS-CONTRACT-ERROR-01` | `1.0.0` | `BIDIRECTIONAL` | Error envelope and compatibility failure | Owns canonical error classification | Emits or receives canonical failure result |

Current blocker distribution by canonical line:

| Line Code | Current Blockers |
| --- | ---: |
| `MS-LINE-LIFECYCLE-01` | 54 |
| `MS-LINE-ROUTE-01` | 54 |
| `MS-LINE-AUTH-01` | 4 |
| `MS-LINE-DATA-READ-01` | 3 |
| `MS-LINE-DATA-WRITE-01` | 2 |
| `MS-LINE-STORAGE-01` | 1 |
| `MS-LINE-SIGNAL-01` | 5 |
| `MS-LINE-LOCALIZATION-01` | 15 |
| `MS-LINE-ASSET-01` | 0 |
| `MS-LINE-EXTERNAL-ACTION-01` | 11 |
| `MS-LINE-ERROR-01` | 0 |

## 2. Contract Registry

Canonical envelope fields shared by all base contracts:

| Field | Required | Applies To |
| --- | --- | --- |
| `lineCode` | YES | Request and response |
| `contractId` | YES | Request and response |
| `contractVersion` | YES | Request and response |
| `requestId` | YES | Request and response |
| `sectionId` | YES | Request and response |
| `capsuleId` | YES | Request and response |
| `capsuleMode` | YES | Request and response |
| `capabilityCode` | YES | Request and response |
| `payload` | YES | Request |
| `result` | YES | Response |
| `errorCode` | NO | Response failure |
| `errorMessage` | NO | Response failure |

| Contract ID | Line Code | Request Schema | Response Schema | Error Codes |
| --- | --- | --- | --- | --- |
| `MS-CONTRACT-LIFECYCLE-01` | `MS-LINE-LIFECYCLE-01` | envelope + `entryId`, `surfaceId`, `mode`, `arguments` | envelope + `accepted`, `surfaceState`, `mountToken` | `CONNECTION_DENIED`, `SECTION_DENIED`, `MODE_DENIED`, `CAPABILITY_DENIED` |
| `MS-CONTRACT-ROUTE-01` | `MS-LINE-ROUTE-01` | envelope + `routeName`, `arguments`, `returnRoute` | envelope + `resolved`, `destinationId`, `routeState` | `ROUTE_DENIED`, `ROUTE_NOT_FOUND`, `SECTION_DENIED` |
| `MS-CONTRACT-AUTH-01` | `MS-LINE-AUTH-01` | envelope + `authAction`, `identity`, `role`, `claimSet` | envelope + `allowed`, `accountState`, `roleSet` | `AUTH_DENIED`, `ROLE_DENIED`, `ACCOUNT_BLOCKED` |
| `MS-CONTRACT-DATA-READ-01` | `MS-LINE-DATA-READ-01` | envelope + `resource`, `query`, `scope` | envelope + `records`, `readState`, `cursor` | `READ_DENIED`, `RESOURCE_DENIED`, `QUERY_DENIED` |
| `MS-CONTRACT-DATA-WRITE-01` | `MS-LINE-DATA-WRITE-01` | envelope + `resource`, `mutation`, `writeIdentity` | envelope + `written`, `writeState`, `resourceVersion` | `WRITE_DENIED`, `IDENTITY_DENIED`, `RESOURCE_DENIED` |
| `MS-CONTRACT-STORAGE-01` | `MS-LINE-STORAGE-01` | envelope + `storagePath`, `operation`, `metadata`, `contentDescriptor` | envelope + `accepted`, `downloadUrl`, `storageState` | `STORAGE_DENIED`, `PATH_DENIED`, `CONTENT_DENIED` |
| `MS-CONTRACT-SIGNAL-01` | `MS-LINE-SIGNAL-01` | envelope + `signalCode`, `signalPayload`, `archivePolicy` | envelope + `accepted`, `signalState`, `archiveState` | `SIGNAL_DENIED`, `BUFFER_DENIED`, `ARCHIVE_DENIED` |
| `MS-CONTRACT-LOCALIZATION-01` | `MS-LINE-LOCALIZATION-01` | envelope + `locale`, `key`, `namespace`, `fallbackPolicy` | envelope + `text`, `localeUsed`, `fallbackUsed` | `LOCALE_DENIED`, `KEY_NOT_FOUND`, `NAMESPACE_DENIED` |
| `MS-CONTRACT-ASSET-01` | `MS-LINE-ASSET-01` | envelope + `assetId`, `familyId`, `variant`, `breakpoint` | envelope + `assetPath`, `resolvedVariant`, `assetState` | `ASSET_DENIED`, `VARIANT_NOT_FOUND`, `FAMILY_DENIED` |
| `MS-CONTRACT-EXTERNAL-ACTION-01` | `MS-LINE-EXTERNAL-ACTION-01` | envelope + `actionType`, `target`, `policyContext` | envelope + `launched`, `actionState`, `normalizedTarget` | `ACTION_DENIED`, `TARGET_DENIED`, `POLICY_DENIED` |
| `MS-CONTRACT-ERROR-01` | `MS-LINE-ERROR-01` | envelope + `sourceLine`, `sourceContract`, `failure` | envelope + `classified`, `canonicalError`, `recoveryState` | `ERROR_UNCLASSIFIED`, `VERSION_MISMATCH`, `CONNECTION_DENIED` |

ACTIVE and TEST use the same contract schema for every base line.

## 3. Blocker-To-Line Mapping

The 149 Central Port Blockers are grouped by function and contract, not by
individual import.

| Blocker | Owner | Current Connection | Canonical Line | Contract | Handler Required | State |
| --- | --- | --- | --- | --- | --- | --- |
| App localization delegate imports to Commercial localization | CENTRAL_RUNTIME -> COMMERCIAL | `lib/app/app.dart` imports `l10n/commercial` | `MS-LINE-LOCALIZATION-01` | `MS-CONTRACT-LOCALIZATION-01` | YES | CLASSIFIED, count 1 |
| AppRouter Commercial route destinations | CENTRAL_RUNTIME -> COMMERCIAL | `lib/app/router/app_router.dart` imports Commercial pages | `MS-LINE-ROUTE-01` | `MS-CONTRACT-ROUTE-01` | YES | CLASSIFIED, count 15 |
| App localization delegate import to Library localization | CENTRAL_RUNTIME -> LIBRARY | `lib/app/app.dart` imports `l10n/library` | `MS-LINE-LOCALIZATION-01` | `MS-CONTRACT-LOCALIZATION-01` | YES | CLASSIFIED, count 1 |
| AppRouter Library route destinations | CENTRAL_RUNTIME -> LIBRARY | `lib/app/router/app_router.dart` imports Library pages | `MS-LINE-ROUTE-01` | `MS-CONTRACT-ROUTE-01` | YES | CLASSIFIED, count 7 |
| Generation2 central entry to Residential/Client pages | CENTRAL_RUNTIME -> RESIDENTIAL | `generation2_mobile_entry` imports Client-owned pages | `MS-LINE-LIFECYCLE-01` | `MS-CONTRACT-LIFECYCLE-01` | YES | CLASSIFIED, count 2 |
| App localization delegate imports to Residential/Accessibility localization | CENTRAL_RUNTIME -> RESIDENTIAL | `lib/app/app.dart` imports `l10n/accessibility`, `l10n/residential` | `MS-LINE-LOCALIZATION-01` | `MS-CONTRACT-LOCALIZATION-01` | YES | CLASSIFIED, count 2 |
| AppRouter Residential route destinations | CENTRAL_RUNTIME -> RESIDENTIAL | `lib/app/router/app_router.dart` imports Residential/Client/Accessibility pages | `MS-LINE-ROUTE-01` | `MS-CONTRACT-ROUTE-01` | YES | CLASSIFIED, count 10 |
| Splash page residential signal imports | CENTRAL_RUNTIME -> RESIDENTIAL | `lib/features/splash/presentation/pages/splash_page.dart` imports Residential signal files | `MS-LINE-SIGNAL-01` | `MS-CONTRACT-SIGNAL-01` | YES | CLASSIFIED, count 2 |
| Commercial account access service dependency | COMMERCIAL -> CENTRAL_RUNTIME | `commercial_auth_service.dart` imports central account access | `MS-LINE-AUTH-01` | `MS-CONTRACT-AUTH-01` | YES | CLASSIFIED, count 1 |
| Commercial V2 central app state dependency | COMMERCIAL -> CENTRAL_RUNTIME | `commercial_v2_web_showcase_page.dart` imports app locale/runtime state | `MS-LINE-LIFECYCLE-01` | `MS-CONTRACT-LIFECYCLE-01` | YES | CLASSIFIED, count 2 |
| Commercial direct route constants | COMMERCIAL -> CENTRAL_RUNTIME | Commercial pages import `app/router/routes.dart` | `MS-LINE-ROUTE-01` | `MS-CONTRACT-ROUTE-01` | YES | CLASSIFIED, count 14 |
| Commercial V2 local signal buffer | COMMERCIAL -> CENTRAL_RUNTIME | Commercial V2 signal writer imports local signal buffer | `MS-LINE-SIGNAL-01` | `MS-CONTRACT-SIGNAL-01` | YES | CLASSIFIED, count 1 |
| Commercial Firebase Auth imports | COMMERCIAL -> FIREBASE | Commercial auth files import Firebase Auth | `MS-LINE-AUTH-01` | `MS-CONTRACT-AUTH-01` | YES | CLASSIFIED, count 3 |
| Commercial Firestore write imports | COMMERCIAL -> FIREBASE | Commercial auth/profile repository imports Firestore | `MS-LINE-DATA-WRITE-01` | `MS-CONTRACT-DATA-WRITE-01` | YES | CLASSIFIED, count 2 |
| Commercial Firebase Storage import | COMMERCIAL -> FIREBASE | Provider profile repository imports Firebase Storage | `MS-LINE-STORAGE-01` | `MS-CONTRACT-STORAGE-01` | YES | CLASSIFIED, count 1 |
| Commercial safe external actions | COMMERCIAL -> SHARED | Commercial pages import safe external link launcher | `MS-LINE-EXTERNAL-ACTION-01` | `MS-CONTRACT-EXTERNAL-ACTION-01` | YES | CLASSIFIED, count 4 |
| Commercial shared runtime/UI utilities | COMMERCIAL -> SHARED | Commercial rooms/pages import shared guide/scaffold/provider utilities | `MS-LINE-LIFECYCLE-01` | `MS-CONTRACT-LIFECYCLE-01` | YES | CLASSIFIED, count 26 |
| Commercial shared localization imports | COMMERCIAL -> SHARED | Commercial pages import shared localization | `MS-LINE-LOCALIZATION-01` | `MS-CONTRACT-LOCALIZATION-01` | YES | CLASSIFIED, count 2 |
| Library direct route constants | LIBRARY -> CENTRAL_RUNTIME | Library pages import `app/router/routes.dart` | `MS-LINE-ROUTE-01` | `MS-CONTRACT-ROUTE-01` | YES | CLASSIFIED, count 3 |
| Library local signal buffer | LIBRARY -> CENTRAL_RUNTIME | Library signal writer imports local signal buffer | `MS-LINE-SIGNAL-01` | `MS-CONTRACT-SIGNAL-01` | YES | CLASSIFIED, count 1 |
| Library Firestore read imports | LIBRARY -> FIREBASE | Library signal package builder imports Firestore | `MS-LINE-DATA-READ-01` | `MS-CONTRACT-DATA-READ-01` | YES | CLASSIFIED, count 2 |
| Library safe external actions | LIBRARY -> SHARED | Knowledge article viewer imports safe external link launcher | `MS-LINE-EXTERNAL-ACTION-01` | `MS-CONTRACT-EXTERNAL-ACTION-01` | YES | CLASSIFIED, count 1 |
| Library shared runtime/UI utilities | LIBRARY -> SHARED | Library pages/widgets import shared guide and shared UI utilities | `MS-LINE-LIFECYCLE-01` | `MS-CONTRACT-LIFECYCLE-01` | YES | CLASSIFIED, count 9 |
| Residential direct route constants | RESIDENTIAL -> CENTRAL_RUNTIME | Residential/Client/Accessibility pages import `app/router/routes.dart` | `MS-LINE-ROUTE-01` | `MS-CONTRACT-ROUTE-01` | YES | CLASSIFIED, count 5 |
| Residential local signal buffer | RESIDENTIAL -> CENTRAL_RUNTIME | Residential signal writer imports local signal buffer | `MS-LINE-SIGNAL-01` | `MS-CONTRACT-SIGNAL-01` | YES | CLASSIFIED, count 1 |
| Residential Firestore read imports | RESIDENTIAL -> FIREBASE | Residential signal package builder imports Firestore | `MS-LINE-DATA-READ-01` | `MS-CONTRACT-DATA-READ-01` | YES | CLASSIFIED, count 1 |
| Residential safe external actions | RESIDENTIAL -> SHARED | Client/Accessibility pages import safe external link launcher | `MS-LINE-EXTERNAL-ACTION-01` | `MS-CONTRACT-EXTERNAL-ACTION-01` | YES | CLASSIFIED, count 6 |
| Residential shared runtime/UI utilities | RESIDENTIAL -> SHARED | Residential/Client/Accessibility pages import shared guide and shared UI utilities | `MS-LINE-LIFECYCLE-01` | `MS-CONTRACT-LIFECYCLE-01` | YES | CLASSIFIED, count 15 |
| Residential shared localization imports | RESIDENTIAL -> SHARED | Residential/Client/Accessibility pages import shared localization | `MS-LINE-LOCALIZATION-01` | `MS-CONTRACT-LOCALIZATION-01` | YES | CLASSIFIED, count 9 |

Direction totals:

| Direction | Current Blockers |
| --- | ---: |
| `CAPSULE_TO_CENTRAL` | 109 |
| `CENTRAL_TO_CAPSULE` | 40 |
| `BIDIRECTIONAL` | 0 direct blocker rows; used only where both directional groups exist for the same line |

## 4. Active/Test Port ID Registry

| Port ID | Section | Mode | Allowed Lines | State |
| --- | --- | --- | --- | --- |
| `MS-PORT-RES-ACTIVE-01` | `RESIDENTIAL` | `ACTIVE` | All base lines except reserved extension lines unless explicitly promoted | RESERVED_DESIGN_ONLY |
| `MS-PORT-RES-TEST-01` | `RESIDENTIAL` | `TEST` | All base lines plus registered extension capabilities | RESERVED_DESIGN_ONLY |
| `MS-PORT-COM-ACTIVE-01` | `COMMERCIAL` | `ACTIVE` | All base lines except reserved extension lines unless explicitly promoted | RESERVED_DESIGN_ONLY |
| `MS-PORT-COM-TEST-01` | `COMMERCIAL` | `TEST` | All base lines plus registered extension capabilities | RESERVED_DESIGN_ONLY |
| `MS-PORT-LIB-ACTIVE-01` | `LIBRARY` | `ACTIVE` | All base lines except reserved extension lines unless explicitly promoted | RESERVED_DESIGN_ONLY |
| `MS-PORT-LIB-TEST-01` | `LIBRARY` | `TEST` | All base lines plus registered extension capabilities | RESERVED_DESIGN_ONLY |

Switching rules recorded for design only:

- ACTIVE Capsule is not modified.
- TEST Capsule can be modified.
- ACTIVE and TEST use the same Canonical Line Language.
- TEST can use an extension capability before promotion.
- TEST cannot become ACTIVE until Compatibility Gate passes.
- Old runtime is not disconnected before the new runtime succeeds.
- ACTIVE and TEST cannot use the same write identity at the same time.
- ACTIVE and TEST do not share local state.
- ACTIVE and TEST do not share Capsule ID.
- ACTIVE and TEST do not share Port ID.

## 5. Reserved Extension Registry

Extension lines are reserved only. No current blocker requires an extension
line.

Extension envelope fields:

| Field | Required |
| --- | --- |
| `lineCode` | YES |
| `capabilityCode` | YES |
| `contractVersion` | YES |
| `capsuleId` | YES |
| `sectionId` | YES |
| `capsuleMode` | YES |
| `requestId` | YES |
| `payload` | YES |

Allowed `capsuleMode` values:

| Mode | State |
| --- | --- |
| `ACTIVE` | ALLOWED |
| `TEST` | ALLOWED |

| Extension Line | Capability Registry | Allowed Mode | Current Consumer | State |
| --- | --- | --- | --- | --- |
| `MS-LINE-EXT-01` | Registered capability only | `ACTIVE`, `TEST` | NONE | RESERVED |
| `MS-LINE-EXT-02` | Registered capability only | `ACTIVE`, `TEST` | NONE | RESERVED |
| `MS-LINE-EXT-03` | Registered capability only | `ACTIVE`, `TEST` | NONE | RESERVED |

## 6. Compatibility Error Codes

| Error Code | Trigger |
| --- | --- |
| `CONNECTION_DENIED` | `lineCode`, `contractVersion`, `sectionId`, or `capability` mismatch |
| `CAPABILITY_DENIED` | `capabilityCode` is not registered |
| `VERSION_MISMATCH` | Contract version is incompatible |
| `SECTION_DENIED` | Section does not match the contract endpoint |
| `MODE_DENIED` | `capsuleMode` is not allowed |
| `ROUTE_DENIED` | Route capability is not registered or not allowed |
| `ROUTE_NOT_FOUND` | Route destination is not registered |
| `AUTH_DENIED` | Auth identity or state cannot be accepted |
| `ROLE_DENIED` | Required role is absent |
| `ACCOUNT_BLOCKED` | Account access service denies runtime access |
| `READ_DENIED` | Data read capability is not allowed |
| `WRITE_DENIED` | Data write capability is not allowed |
| `IDENTITY_DENIED` | Write identity is invalid or shared incorrectly |
| `STORAGE_DENIED` | Storage operation is not allowed |
| `PATH_DENIED` | Storage path is outside registered scope |
| `CONTENT_DENIED` | Storage content descriptor is not allowed |
| `SIGNAL_DENIED` | Signal capability is not registered |
| `BUFFER_DENIED` | Signal buffer operation is not allowed |
| `ARCHIVE_DENIED` | Signal archive operation is not allowed |
| `LOCALE_DENIED` | Locale is not supported by the contract |
| `KEY_NOT_FOUND` | Localization key is missing in registered namespace |
| `NAMESPACE_DENIED` | Localization namespace is not allowed |
| `ASSET_DENIED` | Asset capability is not registered |
| `VARIANT_NOT_FOUND` | Requested asset variant is missing |
| `FAMILY_DENIED` | Asset family is not registered for the capsule |
| `ACTION_DENIED` | External action is not allowed |
| `TARGET_DENIED` | External target is not allowed |
| `POLICY_DENIED` | External action policy blocks the request |
| `ERROR_UNCLASSIFIED` | Failure cannot be mapped to a canonical error |

## 7. Versioning Rules

Initial contract version:

| Version | State |
| --- | --- |
| `1.0.0` | INITIAL |

Change rules:

| Change Type | Rule |
| --- | --- |
| Patch | Internal change that does not change schema |
| Minor | Adds optional capability or optional field |
| Major | Breaks the previous contract schema |

No version migration is executed in this part.

## 8. Unmapped Blockers

| Category | Count |
| --- | ---: |
| Central port blockers classified | 149 |
| Canonical base lines | 11 |
| Reserved extension lines | 3 |
| Unmapped blockers | 0 |
| One-off lines created | 0 |
| Central/capsule code mismatches | 0 |
| Contract schema mismatches | 0 |
| Platform Core modified | 0 |
| Runtime files modified | 0 |

