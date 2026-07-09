# COMMERCIAL_V2_ARCHIVE_OUTBOX_ADDRESSING_CARD_V1

Status: ACTIVE ADDRESSING CARD

## Outbox Rule

Commercial V2 Outbox must address packages to Archive, not Library, not Publishing, not Firestore, and not Routes.

## Addressing

| Package Family | Archive Destination Code | Destination Section | Destination Inbox Plug |
|---|---|---|---|
| Registration package | `ARC-PKG-CV2-001` | `SEC-ARC` | `PLG-ARC-IN` |
| Commercial V2 publishing package | `ARC-PUB-CV2-001` | `SEC-ARC` | `PLG-ARC-IN` |
| Provider publishing queue package | `ARC-PUB-PROV-001` | `SEC-ARC` | `PLG-ARC-IN` |

## Display Section Rule

Display sections travel inside packages as `display_section_codes`.

They must not become direct Library routes.

They must not overwrite Primary Specialty.

FINAL STATUS: COMMERCIAL_V2_ARCHIVE_OUTBOX_ADDRESSING_CARD_ACTIVE
