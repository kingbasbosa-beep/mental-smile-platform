# CHAT_ARCHIVE_CLASSIFICATION_CARD_V1

Card ID: LEGACY-CHAT-CARD-V1

Title: Legacy Support Chat

Status: SAFE_TO_ARCHIVE_LATER

Runtime Status: NOT_ACTIVE

Classification:

- LEGACY_SUPPORT_CHAT
- ARCHIVE_CANDIDATE
- SAFE_TO_REMOVE_FROM_ACTIVE_ROUTING

Files:

- `lib/features/chat/presentation/pages/chat_page.dart`
- `lib/features/chat/controller/chat_controller.dart`
- `lib/features/chat/data/models/*`
- `lib/features/chat/data/services/*`

Kept Active:

- `Routes.chatEscalations`
- `Routes.chatEscalationReport`

Reason:

Safety escalation reporting is a separate protected operational surface. It should be reviewed later independently from public/internal chat retirement.

Archive Recommendation:

Move legacy chat implementation to an approved archive location in a future explicit archive/removal operation. Do not silently delete.
