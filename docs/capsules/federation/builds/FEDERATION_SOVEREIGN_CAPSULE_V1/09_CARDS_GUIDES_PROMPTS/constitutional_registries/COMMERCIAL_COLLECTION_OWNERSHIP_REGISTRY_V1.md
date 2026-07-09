# COMMERCIAL_COLLECTION_OWNERSHIP_REGISTRY_V1

Status: ACTIVE_OWNERSHIP_REGISTRY
Phase: 8B
Runtime effect: none

| Entry | Owner | Consumers | Dependencies | Signals | Collections | Status | Lifecycle | Classification |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `clinicians` | Clinician/System | Declaration review/account access only | Firestore outside old discovery | none from old discovery | `clinicians` | ACTIVE_NON_DISCOVERY | Runtime | OLD_DISCOVERY_REMOVED |
| `centers` | Center/System | Declaration review/account access only | Firestore outside old discovery | none from old discovery | `centers` | ACTIVE_NON_DISCOVERY | Runtime | OLD_DISCOVERY_REMOVED |
| `provider_contact_requests` | Commercial/System | Historical specialist details contact flow | Removed ContactRequestRepository | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_DISCOVERY_CONTACT_REMOVED |
| `center_contact_requests` | Commercial/System | Historical center details contact flow | Removed ContactRequestRepository | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_DISCOVERY_CONTACT_REMOVED |
| `saved_destinations` | Archive/System | Archived discovery save actions | OP-SAVED-DESTINATIONS-EXTRACTION-V1 | none | none | REMOVED_FROM_RUNTIME | Runtime archive | FRESH_SIGNALS_DOCTRINE_REMOVAL |
| `tool_registry` | Owner/System | Future tools | Governance decision | future tool signals | `tool_registry` | UNKNOWN | Future | UNKNOWN |
