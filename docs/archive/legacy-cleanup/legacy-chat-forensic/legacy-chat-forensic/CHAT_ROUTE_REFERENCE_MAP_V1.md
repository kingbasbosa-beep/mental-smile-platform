# CHAT_ROUTE_REFERENCE_MAP_V1

Status: ACTIVE_REFERENCE_MAP

| Reference | Previous State | Current State | Decision |
|---|---|---|---|
| `Routes.chat` | `/chat` active constant | Removed | Old chat route retired |
| `app_router.dart` `/chat` case | Built `ChatPage` | Removed | No active chat page exposure |
| `ChatPage` router import | Active import | Removed | Analyzer no longer reaches file through router |
| `SupportEntryPage` | Had defensive `Routes.chat` analytics branch | Removed | Support entry uses support issue selector |
| `ChatEscalationsPage` conversation button | Navigated to `Routes.chat` by thread id | Disabled | Prevents legacy conversation reopening |
| `Routes.chatEscalations` | Active protected safety route | Kept | Separate safety/admin surface |
| `Routes.chatEscalationReport` | Active protected report route | Kept | Separate safety/admin report |

Direct `/chat` active route: NO

Active `ChatPage` import from router: NO

Active Library reference: NO

Active Residential reference: NO

Active Provider/Center display reference: NO
