# APPLICATION UI MISSING ITEMS REPORT V1

Status: MISSING ITEMS REGISTER

Operation ID: OP-G2-UI-WAVE-1-APPLICATION-UI-ACCESSIBILITY-LOCALIZATION-COMPLETION-AUDIT-V1

## Missing / Incomplete Items

1. Hardcoded visible text remains in active Application pages.
2. Generated localization Dart files were not regenerated after ARB updates.
3. New ARB keys are not yet wired into every widget.
4. Old `Icons.volume_up_rounded` usages remain in Client and Accessibility pages.
5. Old `Icons.headphones_rounded` usages remain in Splash and old exit pages.
6. Text-based audio placeholder SnackBars remain.
7. Some Flutter `Tooltip` usages may still show text instead of image-only accessibility preview.
8. Residential Exit portal central message and exit button need accessibility icon and semantics completion.
9. Accessibility Suggestions form fields need full localization and semantic mapping.
10. Accessibility Links/Tools rows need unified icon placement and localization wiring.
11. Client Room dialogs need full localization and icon pass.
12. Legacy `language_page.dart` and `login_page.dart` remain as source files and must be classified as inactive residue or cleaned in a separate operation.
13. Existing Arabic localization content requires encoding verification before broad rewrite.
14. ARB metadata comments are missing for the newly added Application keys.
15. Dynamic labels and route-driven missing route states need complete localization alignment.

## Explicit Non-Changes

- No Firebase changes.
- No Firestore changes.
- No signal connection.
- No AI provider connection.
- No runtime behavior changes.
- No archive runtime creation.

## Required Follow-Up

Create a surgical implementation wave for active Application pages only:

1. Regenerate localization files.
2. Replace hardcoded labels with localization getters.
3. Replace old audio icons with official Accessibility Guide widget.
4. Add semantics from localization keys.
5. Confirm no active UI item remains text-only.

Final Missing Items Verdict: OPEN

