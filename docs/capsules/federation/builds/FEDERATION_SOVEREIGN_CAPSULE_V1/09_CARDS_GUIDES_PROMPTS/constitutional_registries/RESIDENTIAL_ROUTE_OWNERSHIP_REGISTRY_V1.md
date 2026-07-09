# RESIDENTIAL_ROUTE_OWNERSHIP_REGISTRY_V1

Status: ACTIVE_OWNERSHIP_REGISTRY
Phase: 8B
Runtime effect: none

| Entry | Owner | Consumers | Dependencies | Signals | Collections | Status | Lifecycle | Classification |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `/client/session-room` | Client/System | Historical client access | Removed from current router | none | none | REMOVED_FROM_RUNTIME | Runtime removed | SUPERSEDED_BY_CLIENT_ROOM |
| `/client/room` | Client/System | Public client access | Router | fresh session intent | none | ACTIVE | Runtime | ACCOUNT_FREE_CLIENT_ROOM |
| `/client/dashboard` | Client/System | Client Room, Personal Space | Auth, router, clients | clientSignals | `clients`, `saved_destinations` | ARCHIVED_PENDING_MANUAL_VERIFICATION | Runtime archive | CLIENT_LEGACY_REMOVED |
| `/s/personal-space` | Archive/System | Archived personal space | none | none | none | ARCHIVED_HARD_REMOVED | Runtime archive | PURE_CLIENT_IDENTITY_REMOVED |
| `/chat` | Client/System | Removed chat runtime | none | none | none | REMOVED_FROM_FIRESTORE_RULES | Runtime removed | CHAT_RUNTIME_REMOVED |
| `/s/support-room` | Support Observer/Owner | Support Observer, Monitoring | Role gate, support_requests | support/risk signals | `support_requests` | ACTIVE | Runtime | CROSS_DOMAIN |
| `/module/support-issue-selector` | Session/System | Session users, Support Room | Auth/session signals | support request signals | `support_requests` | ACTIVE | Runtime | SESSION_SCOPED |
| `/menu` | System | Historical public shell | Removed route and source | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_MENU_REMOVED |
| `/home` | System | Historical entry alias | Removed route and source | none | none | REMOVED_FROM_RUNTIME | Runtime removed | OLD_MENU_ALIAS_REMOVED |
| `/language` | Public/System | Historical registration entry | Removed route | none | none | REMOVED_FROM_RUNTIME | Runtime removed | LEGACY_REGISTRATION_REMOVED |
| `/app/exit-social-links` | System | Exit/social handoff | Router | exit intent | none | ACTIVE | Runtime | ACTIVE |
| `/account-blocked` | System/Monitoring | blocked users | Account access, visibility readiness | account safety state | role/account docs | ACTIVE | Runtime | CROSS_DOMAIN |
