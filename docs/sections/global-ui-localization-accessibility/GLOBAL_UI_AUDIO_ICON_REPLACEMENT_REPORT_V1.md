# GLOBAL UI AUDIO ICON REPLACEMENT REPORT V1

## Summary
Replaced all direct speaker/headphone icons with the official `AccessibilityGuideIcon` standard to ensure consistency in listening/audio affordance UI.

## Replaced Occurrences
1. **Client Room**:
   - `_checkinCardIcon` Card
   - `_communityToolsCardIcon` Card
   - `_suggestionsCardIcon` Card
   - `_personalToolsCardIcon` Card
   - `_personalLinksCardIcon` Card
   - `_noteFeatherButton` Hover Button
   - `_youtubeButton` Room Button
   - `_photoButton` Room Button
   - `_exitCup` Room Button (Standard Guide Icon enabled)

2. **Accessibility Room & Pages**:
   - All wall cards updated to use `_CardSpeakableText` with `AccessibilityGuideIcon`.
   - `AccessibilityLinksPage`: Legend chips and individual link rows.
   - `AccessibilityToolsPage`: Section headers and tool rows.
   - `AccessibilityCheckinPage`: Section labels, question fields, and buttons.
   - `AccessibilitySuggestionsPage`: Labels, fields, and submit button.
   - `AccessibilityMessageOfDayPage`: Option rows.

3. **Commercial Room**:
   - `CommercialRoomUtilityTools`: Notebook button and exit cup.
   - Professional Profile/Library/Tools cards.

4. **Commercial Public Accounts**:
   - Top bar audio icon replaced.
   - Section titles and individual account chips.

## Standardized Behavior
- Tooltip on the icon itself is managed by the `AccessibilityGuideIcon` widget (image preview of the guide).
- `onSpeak` callbacks remain placeholders in this pass but are correctly wired to localized getters where available.
