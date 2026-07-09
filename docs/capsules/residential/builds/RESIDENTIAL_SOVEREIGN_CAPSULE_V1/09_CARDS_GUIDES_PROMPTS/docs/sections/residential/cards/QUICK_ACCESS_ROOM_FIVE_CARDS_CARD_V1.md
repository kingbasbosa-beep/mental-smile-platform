# Quick Access Room Five Cards Card V1

Operation ID: OP-QUICK-ACCESS-ROOM-FIVE-CARDS-COMPLETION-V1
Date: 2026-06-23
Section: Residential
Surface: Quick Access Room / Client Room
Route: `/client/room`

## Room Structure

The Quick Access wall frame contains five fixed cards from right to left:

| Order | Card | Purpose | Destination |
|---|---|---|---|
| 1 | طمّنا عليك | Open the existing reassurance and check-in flow | `/accessibility/checkin` |
| 2 | تطبيقات وأدوات | Open the existing community tools surface | `/accessibility/community-tools` |
| 3 | شاركنا باقتراح | Open the existing suggestion flow | `/accessibility/suggestions` |
| 4 | أدواتك | Explain the future personal tools space | Local informational dialog |
| 5 | لينكاتك | Open five organized categories of useful external links | Categorized local dialog |

No new route was created. The first three cards reuse general Residential resources already active under the Accessibility route namespace. `أدواتك` remains a local informational dialog. `لينكاتك` is now a categorized local directory that opens verified external links.

## Visual And Audio Markers

Every wall card includes:

- a visual icon;
- a clear Arabic label;
- a speaker-ready marker;
- a tooltip;
- a semantic button label.

The YouTube, temporary photo, exit cup, and Feather controls also expose tooltips, semantic labels, and speaker placeholders.

Speaker behavior remains placeholder-only:

`قريبًا: نطق المسمى`

No TTS or audio file was added.

## Feather And Notebook

- Feather uses the approved existing asset.
- Feather is positioned below the wall frame beside the notebook zone.
- Feather opens the motivational sentence selector.
- Each sentence option includes a visual marker and speaker marker.
- The selected sentence appears on the notebook.
- State is local to the room and clears on exit.

## Assets

- `accessibility_checkin_card_icon.png`
- `accessibility_community_tools_card_icon.png`
- `accessibility_suggestions_card_icon.png`
- `accessibility_tools_card_icon.png`
- `accessibility_links_card_icon.png`
- `accessibility_note_feather_button.png`

All assets are reused from the approved Accessibility Room card asset set.

## Signals

Signal runtime was not changed.

Future documentation-only signals:

- Quick Access Card Clicked
- Check-In Opened
- Apps Tools Opened
- Suggestion Opened
- Personal Tools Opened
- Personal Links Opened
- Feather Opened
- Motivational Sentence Selected
- Notebook Updated

## Ownership

- Section owner: Residential
- Runtime surface: Quick Access Room
- Persistence: none
- Firebase dependency: none
- Storage dependency: none

Final Status: ACTIVE
