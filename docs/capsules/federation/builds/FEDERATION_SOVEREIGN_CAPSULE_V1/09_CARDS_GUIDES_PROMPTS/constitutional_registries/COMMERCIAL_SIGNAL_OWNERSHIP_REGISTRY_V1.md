# COMMERCIAL_SIGNAL_OWNERSHIP_REGISTRY_V1

Status: ACTIVE_OWNERSHIP_REGISTRY
Phase: 8B
Runtime effect: none

| Entry | Owner | Consumers | Dependencies | Signals | Collections | Status | Lifecycle | Classification |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Provider capability signals | Clinician/System | Historical specialists list/details | removed old specialists runtime | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_DISCOVERY_REMOVED |
| Provider contact started | Commercial/System | Historical contact requests | removed ContactRequestRepository | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_DISCOVERY_CONTACT_REMOVED |
| Center contact started | Commercial/System | Historical contact requests | removed ContactRequestRepository | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_DISCOVERY_CONTACT_REMOVED |
| Center discovery signals | Center/System | Historical centers list/details | removed old centers runtime | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_DISCOVERY_REMOVED |
| Tool usage signals | Owner/System | Future tools/monitoring | Tool Registry | tool usage | `tool_registry` | UNKNOWN | Future | UNKNOWN |
| Marketplace signals | Owner/System | Future marketplace/monitoring | Domain Boundary Registry | marketplace intent | unknown | UNKNOWN | Future | UNKNOWN |

## Phase 9 Accessibility Signal Entries

| Entry | Owner | Consumers | Dependencies | Signals | Collections | Status | Lifecycle | Classification |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Accessible provider contact selected | Accessibility/Commercial/System | Historical provider details/contact requests | removed old provider details and ContactRequestRepository | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_ACCESSIBLE_CONTACT_REMOVED |
| Accessible center contact selected | Accessibility/Commercial/System | Historical center details/contact requests | removed old center details and ContactRequestRepository | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_ACCESSIBLE_CONTACT_REMOVED |
