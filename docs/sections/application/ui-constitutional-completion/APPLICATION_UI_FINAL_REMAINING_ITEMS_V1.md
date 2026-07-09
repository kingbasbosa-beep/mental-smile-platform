# APPLICATION UI FINAL REMAINING ITEMS V1

Status: EXPLICIT REMAINING ITEMS

Operation ID: OP-G2-UI-MICRO-PASS-2B-APPLICATION-UI-RESIDUE-CLOSURE-V1

## Exact Remaining Items

1. `lib/features/accessibility/presentation/pages/accessibility_room_page.dart`
   - Widget / function: `_RoomControlButton._showSpeechPlaceholder`
   - Remaining issue: old text-only audio SnackBar.
   - Reason: encoded text line requires command-assisted search or careful source inspection; commands are prohibited.

2. `lib/features/accessibility/presentation/pages/accessibility_room_page.dart`
   - Widget / area: repeated room helper speech placeholder functions
   - Remaining issue: possible old audio SnackBars.
   - Reason: requires explicit search for `SnackBar(` and audio placeholder text; commands are prohibited.

3. `lib/features/client/presentation/pages/client_room_page.dart`
   - Widget / area: Client Room dialogs
   - Remaining issue: hardcoded visible dialog text and partial semantic coverage.
   - Reason: requires focused dialog-only localization implementation.

4. `lib/features/client/presentation/pages/client_room_page.dart`
   - Widget / area: Links dialog
   - Remaining issue: link categories, labels, and action messages need localization keys.
   - Reason: static local content needs key expansion.

5. `lib/features/client/presentation/pages/client_room_page.dart`
   - Widget / area: Tools dialog and Feather / Notebook dialog
   - Remaining issue: visible local helper text and action labels may remain hardcoded.
   - Reason: needs source search and phrase-by-phrase migration.

6. `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart`
   - Widget / area: form fields and submit flow
   - Remaining issue: labels, helper text, validation, success/error messages need final localization/semantics pass.
   - Reason: form-specific work should be isolated.

7. `lib/features/accessibility/presentation/pages/accessibility_links_page.dart`
   - Widget / area: static resource list rows
   - Remaining issue: static content not fully moved to localization/registry.
   - Reason: large static content needs content registry strategy.

8. `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart`
   - Widget / area: static tool list rows
   - Remaining issue: static content not fully moved to localization/registry.
   - Reason: large static content needs content registry strategy.

9. `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart`
   - Widget / area: cards and visible guidance
   - Remaining issue: possible hardcoded text and partial semantics.
   - Reason: requires focused page inspection.

10. `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart`
    - Widget / area: message display
    - Remaining issue: possible hardcoded text and partial semantics.
    - Reason: requires focused page inspection.

11. `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart`
    - Widget / area: community tools cards/actions
    - Remaining issue: possible hardcoded text and partial semantics.
    - Reason: requires focused page inspection.

12. Localization generated files
    - Files:
      - `lib/l10n/app_localizations.dart`
      - `lib/l10n/app_localizations_ar.dart`
      - `lib/l10n/app_localizations_en.dart`
    - Remaining issue: manual generated edits from Wave 2 must be normalized by `flutter gen-l10n`.
    - Reason: Owner requested manual command execution.

Final Remaining Items Verdict: EXPLICIT RESIDUE OPEN

