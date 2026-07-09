# COMMERCIAL_ROUTE_OWNERSHIP_REGISTRY_V1

Status: ACTIVE_OWNERSHIP_REGISTRY
Phase: 8B
Runtime effect: none

| Entry | Owner | Consumers | Dependencies | Signals | Collections | Status | Lifecycle | Classification |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `/module/specialists` | System | Historical discovery | Removed router case and source | none | none | REMOVED_FROM_RUNTIME | Runtime removed | SUPERSEDED_BY_LIBRARY_PROVIDER_CONTENT |
| `/module/specialists/list` | System | Historical discovery | Removed specialists runtime | none | none | REMOVED_FROM_RUNTIME | Runtime removed | SUPERSEDED_BY_LIBRARY_PROVIDER_CONTENT |
| `/module/specialists/details` | System | Historical contact/details | Removed ContactRequestRepository and specialists runtime | none | none | REMOVED_FROM_RUNTIME | Runtime removed | SUPERSEDED_BY_LIBRARY_PROVIDER_CONTENT |
| `/module/centers` | System | Historical discovery | Removed router case and source | none | none | REMOVED_FROM_RUNTIME | Runtime removed | SUPERSEDED_BY_LIBRARY_PROVIDER_CONTENT |
| `/module/centers/list` | System | Historical discovery | Removed centers runtime | none | none | REMOVED_FROM_RUNTIME | Runtime removed | SUPERSEDED_BY_LIBRARY_PROVIDER_CONTENT |
| `/module/centers/details` | System | Historical contact/details | Removed ContactRequestRepository and centers runtime | none | none | REMOVED_FROM_RUNTIME | Runtime removed | SUPERSEDED_BY_LIBRARY_PROVIDER_CONTENT |
| `/commercial/access` | Commercial/System | Public commercial entrants | Router skeleton | none | none | ACTIVE | Runtime | COMMERCIAL_ENTRY_SPLIT |
| `/commercial/specialist/login` | Commercial/System | Specialist entrants | Placeholder login | none | none | ACTIVE | Runtime | PLACEHOLDER_NO_FIREBASE |
| `/commercial/center/login` | Commercial/System | Center entrants | Placeholder login | none | none | ACTIVE | Runtime | PLACEHOLDER_NO_FIREBASE |
| `/commercial/admin/login` | Owner/System | Owner/admin entrants | Placeholder login | none | none | ACTIVE | Runtime | PLACEHOLDER_NO_FIREBASE |
| `/commercial/room` | Commercial/System | Specialist room | Empty room shell | none | none | ACTIVE | Runtime | EMPTY_ROOM_READY |
| `/commercial/center/room` | Commercial/System | Center room | Empty room shell | none | none | ACTIVE | Runtime | EMPTY_ROOM_READY |
| `/commercial/admin/room` | Owner/System | Owner visual operational room | Visual gateway cards | none | none | ACTIVE | Runtime | VISUAL_OWNER_GATEWAY |
| `/s/city/tools` | Owner/System | Public city users | Router placeholder | future tool signals | `tool_registry` | UNKNOWN | Future | UNKNOWN |
| `/s/city/marketplace` | Owner/System | Public city users | Router placeholder | future marketplace signals | unknown | UNKNOWN | Future | UNKNOWN |
| `/register/provider` | Public/System | Public registration | Router | provider registration intent | `clinicians` | PRESENT | Transitional | LEGACY |
