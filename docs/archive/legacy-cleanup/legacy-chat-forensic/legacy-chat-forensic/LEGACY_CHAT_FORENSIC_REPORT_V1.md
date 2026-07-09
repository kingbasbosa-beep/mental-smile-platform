# LEGACY_CHAT_FORENSIC_REPORT_V1

Status: COMPLETED

Question: Why does `lib/features/chat/presentation/pages/chat_page.dart` still exist?

Finding:

`ChatPage` is a legacy support chat surface from the older recovery/family support flow. Current Mental Smile direction does not keep internal chat/community interaction as an active product surface. Current support entry cards already point to `Routes.supportIssueSelector`, while Library/provider/center public display pages do not reference `ChatPage`.

Classification:

LEGACY_SUPPORT_CHAT

Evidence:

- `ChatPage` existed under `lib/features/chat/presentation/pages/chat_page.dart`.
- `/chat` was registered through `Routes.chat` and `app_router.dart`.
- `SupportEntryPage` no longer routes support cards to chat; it routes support to `Routes.supportIssueSelector`.
- Library pages do not import or navigate to `ChatPage`.
- Provider/center public display pages do not import or navigate to `ChatPage`.
- Accessibility/client pages do not import or navigate to `ChatPage`.

Action Taken:

- Removed active `/chat` route constant.
- Removed active `/chat` router case.
- Removed `ChatPage` import from active router.
- Removed old `Routes.chat` logging condition from `SupportEntryPage`.
- Disabled the legacy safety escalation “Conversation” button that previously attempted to reopen `Routes.chat`.

Not Deleted:

- `lib/features/chat/presentation/pages/chat_page.dart`

Reason:

The task explicitly requested forensic classification and safe active exposure removal, not file deletion. The file is now an archive candidate / safe-to-archive-later item.

Final Classification:

SAFE_TO_REMOVE_FROM_ACTIVE_ROUTING
