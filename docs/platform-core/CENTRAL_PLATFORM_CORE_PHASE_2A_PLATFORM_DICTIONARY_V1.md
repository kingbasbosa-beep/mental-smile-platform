# CENTRAL_PLATFORM_CORE_PHASE_2A_PLATFORM_DICTIONARY_V1

## Purpose

Phase 2A creates `PLATFORM DICTIONARY V1`, the first official code language for Central Platform Core.

The dictionary defines signal families, logical targets, code shape, acceptance rules, test-only environments, and the first minimal set of official core codes. It remains isolated from the public runtime.

## Platform Dictionary

The dictionary belongs to Central Platform Core. A section sends only:

```text
sectionId
code
context
```

The core resolves that code into:

```text
family
eventName
logicalTarget
environment
schemaVersion
```

No Firebase collection names exist in the dictionary.

## Families

The first official families are:

```text
login
logout
survey
feedback
application
```

The following families are intentionally excluded from Phase 2A:

```text
analytics
monitoring
archive
marketing
owner
admin
navigation
content
profile
system
```

## Logical Targets

Logical targets match the five official families:

```text
login
logout
survey
feedback
application
```

These are logical targets only. They are not collection names.

## Code Pattern

Approved code pattern:

```text
AA999TT
```

Rules:

- lowercase only
- exactly 7 characters
- first 2 characters are letters
- middle 3 characters are digits
- last 2 characters are letters
- no spaces
- no symbols
- no uppercase

Examples:

```text
cl001bt
sp001bt
ct005sb
```

## Official V1 Codes

All V1 codes are test-only.

| Code | Family | Event name | Logical target | Allowed sections |
|---|---|---|---|---|
| `cl001bt` | login | client_login_entry_tap | login | RES_TEST |
| `sp001bt` | login | specialist_login_entry_tap | login | COM_TEST |
| `cl002bt` | logout | client_logout_tap | logout | RES_TEST |
| `sp002bt` | logout | specialist_logout_tap | logout | COM_TEST |
| `cl003sb` | survey | client_survey_submit | survey | RES_TEST |
| `sp003sb` | survey | specialist_survey_submit | survey | COM_TEST |
| `cl004sb` | feedback | client_feedback_submit | feedback | RES_TEST |
| `sp004sb` | feedback | specialist_feedback_submit | feedback | COM_TEST |
| `sp005sb` | application | specialist_application_submit | application | COM_TEST |
| `ct005sb` | application | center_application_submit | application | COM_TEST |

## allowedSections

`allowedSections` is a fake-section compatibility gate for Phase 2A. It does not connect real Residential, Commercial, or Library runtime.

Allowed test section codes:

```text
RES_TEST
COM_TEST
LIB_TEST
```

## Environment

Every V1 dictionary code uses:

```text
environment: test
```

No production code is active in Phase 2A.

## Validation Rules

The dictionary validates that:

- code count is 10 or fewer
- every official family exists
- every code matches `AA999TT`
- no duplicate code exists
- no duplicate `eventName` exists inside the same family
- family equals logical target
- all codes are test environment
- forbidden internal families are absent
- every code has allowed sections
- schema version is greater than zero

## Integration With Phase 1

`CoreCodeRegistry` can load all entries from `PlatformDictionaryV1`.

`PlatformCore` now defaults to `PlatformDictionaryV1.definitions` while preserving Phase 1 fail-soft behavior, dock behavior, resolver behavior, `NoopCoreOutputGateway`, and `MemoryCoreOutputGateway`.

## Firebase and Runtime Boundary

Firebase is not present in Phase 2A.

No Firestore collections are created or named.

No real public section is connected.

No routes, UI, authentication, local storage, startup files, or section runtime files are modified.

## Phase 2B

Phase 2B may introduce a Firebase Test Gateway only. It must remain test-scoped and must not connect real public runtime sections until explicitly approved.

