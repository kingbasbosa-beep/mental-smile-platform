# LEGACY_CHAT_AND_LIBRARY_ALIAS_FULL_ACTIVE_REMOVAL_REPORT_V1

Status: FULL ACTIVE REMOVAL

Operation ID: OP-LEGACY-CHAT-AND-LIBRARY-ALIAS-FULL-ACTIVE-REMOVAL-V1

Operation Date: 2026-06-30

## Purpose

Remove confirmed legacy runtime residue from the active system and prevent old chat or old module-style library routing from remaining reachable.

## Removed From Active Runtime

| Item | Action |
|---|---|
| `Routes.library` | Removed from `routes.dart` |
| `/module/library` route case | Removed from `app_router.dart` |
| Support entry library cards using `Routes.library` | Removed |
| Accessibility check-in library button using `Routes.library` | Removed |
| `lib/features/chat/` | Deleted from active runtime tree |
| `lib/dev/ai_policy_seeder.dart` | Deleted as old chat AI policy seeder residue |
| Chat domain registry entry | Removed |
| Chat Firestore collection labels from registry room | Removed |
| Chat localization getters and ARB keys | Removed |
| Library policy visible button | Removed from Library Home UI |
| Old `docs/sections/menu-showcase/` report folder | Deleted after archive move was denied, per Owner instruction |
| Stale active documentation route references | Corrected in Library and Residential docs |

## Not Converted

Legacy references were not redirected or converted to new routes.

Policy followed: old legacy links were removed from active UI/router instead of being preserved through aliases.

## Current Active Library Entry Points

- `/library`
- `/web/library`
- `/library/providers/specialists`
- `/library/providers/centers`
- Library provider category routes under `/library/providers/...`

## Validation Evidence

Targeted search over `lib/` and `docs/sections/` found no active matches for:

- `Routes.library`
- `/module/library`
- `Routes.chat`
- `chatPage`
- `features/chat`
- `ChatPage`
- `chatEscal`
- `chat_threads`
- `chat_escalations`

## Boundaries

Firebase changed: NO

Firestore changed: NO

Storage changed: NO

AI connected: NO

New chat route created: NO

Legacy route conversion: NO

Runtime behavior intentionally changed only by removing legacy active access: YES

## Result

Legacy chat and the old module-style library alias are no longer active inside `lib/` or active section documentation.

Legacy details remain only under `docs/archive/legacy-cleanup/`.

FINAL VERDICT: LEGACY_CHAT_AND_LIBRARY_ALIAS_FULL_ACTIVE_REMOVAL_COMPLETED
