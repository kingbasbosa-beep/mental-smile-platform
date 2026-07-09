# APPLICATION UI RESIDUE CLOSURE MATRIX V1

Status: ACTIVE RESIDUE MATRIX

Operation ID: OP-G2-UI-MICRO-PASS-2B-APPLICATION-UI-RESIDUE-CLOSURE-V1

## Matrix

| File | Widget / Area | Residue | Closure Status | Reason |
|---|---|---|---|---|
| `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | `_RoomControlButton._showSpeechPlaceholder` | Old text-only audio SnackBar remains from Wave 2 residue. | OPEN | The exact encoded line resisted safe patching in Wave 2; command search is currently forbidden. |
| `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | Room action helper functions around repeated audio placeholders | Multiple old audio placeholder SnackBars may remain. | OPEN | Requires targeted source search and exact replacement. Commands are forbidden in Micro Pass 2B. |
| `lib/features/client/presentation/pages/client_room_page.dart` | Client Room dialogs / local tools | Hardcoded dialog/tool text remains. | OPEN | Needs phrase-by-phrase localization pass; broad refactor prohibited. |
| `lib/features/client/presentation/pages/client_room_page.dart` | Tools dialog | Visible dialog labels and helper text may remain hardcoded. | OPEN | Requires source search; commands forbidden. |
| `lib/features/client/presentation/pages/client_room_page.dart` | Links dialog | Static link category titles and action labels may remain hardcoded. | OPEN | Requires localization-key expansion and widget wiring. |
| `lib/features/client/presentation/pages/client_room_page.dart` | Feather / Notebook dialog | Local note/motivational text may remain hardcoded. | OPEN | Needs focused dialog-only localization pass. |
| `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart` | Suggestion form | Form labels, validation, success/error messages may remain hardcoded. | OPEN | Requires form-specific localization and semantics wiring. |
| `lib/features/accessibility/presentation/pages/accessibility_links_page.dart` | Static resource rows | Static local content remains difficult to fully localize without a content registry. | OPEN | Needs content registry/localization model or explicit static key expansion. |
| `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart` | Static tool rows | Static local content remains difficult to fully localize without a content registry. | OPEN | Needs content registry/localization model or explicit static key expansion. |
| `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart` | Cards / guide text | Static labels may remain hardcoded. | OPEN | Requires search and focused page pass. |
| `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart` | Message display / audio placeholders | Static labels may remain hardcoded. | OPEN | Requires search and focused page pass. |
| `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart` | Cards / actions | Static labels may remain hardcoded. | OPEN | Requires search and focused page pass. |

## Closed In Prior Wave 2

| File | Area | Status |
|---|---|---|
| `lib/features/splash/presentation/pages/splash_page.dart` | Main action labels and old headphone icons | IMPROVED |
| `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart` | Central title, message, exit action | IMPROVED |

Final Matrix Verdict: OPEN RESIDUE REMAINS

