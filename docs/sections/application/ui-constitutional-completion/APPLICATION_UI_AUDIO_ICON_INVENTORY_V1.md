# APPLICATION UI AUDIO ICON INVENTORY V1

Status: ACTIVE INVENTORY

Operation ID: OP-G2-UI-WAVE-1-APPLICATION-UI-ACCESSIBILITY-LOCALIZATION-COMPLETION-AUDIT-V1

## Required Standard

Every visible Application UI item should have:

- Visual meaning icon
- Accessibility/listening icon
- Semantic label
- Future TTS-compatible wording
- No visual text tooltip that replaces the required icon behavior

Preferred listening icon:

- `assets/icons/accessibility/ms_accessibility_guide.webp`
- Reusable behavior: image preview tooltip, no visible text tooltip

## Current Inventory

| Surface | Current Status | Finding |
|---|---|---|
| Splash | PARTIAL | Primary actions include visual icons and some semantics, but direct headphone icons remain and text is mostly hardcoded. |
| Client Room main cards | PARTIAL | Cards include audio placeholders and icons, but direct `Icons.volume_up_rounded` usages remain. |
| Client Room dialogs | PARTIAL | Local dialogs contain visible labels and actions that are not fully localized or uniformly paired with accessibility guide icon. |
| Accessibility Room main cards | PARTIAL | Main room has accessibility icon work, but old tooltip/direct icon residue remains. |
| Accessibility Links | PARTIAL | Multiple direct `Icons.volume_up_rounded` usages remain. |
| Accessibility Tools | PARTIAL | Multiple direct `Icons.volume_up_rounded` usages remain. |
| Accessibility Suggestions | PARTIAL | Form labels, submission states, and dialog text need complete accessibility icon and localization pass. |
| Accessibility Check-in | PARTIAL | Direct audio icon usage remains; routing cards need unified accessibility icon behavior. |
| Message of the Day | PARTIAL | Direct audio icon usage remains. |
| Community Tools | PARTIAL | Direct audio icon usage remains. |
| Residential Exit Portal | PARTIAL | Goodbye page is visually simplified, but central message and exit button do not yet have complete accessibility icon/semantic pairing. |
| Old polished/legacy exit pages | REVIEW | Files still contain old headphones/volume icons; active route status must be kept separate from file residue. |
| Language Page | REVIEW | Legacy registration/access page residue still has navigation entries and visible labels. |
| Login Page | REVIEW | Legacy retired login file remains as source residue and should not be treated as active UI constitution unless reactivated. |

## Direct Old Audio Icon Residue

Detected direct icon patterns:

- `Icons.volume_up_rounded`
- `Icons.headphones_rounded`
- text snackbars beginning with `🎧 قريبًا`
- Flutter `Tooltip` usage that may display text instead of image-only accessibility preview

## Missing Icon Classes

Missing or incomplete:

- Dialog action buttons
- SnackBar-triggered audio placeholders
- Exit portal central controls
- Inner accessibility page cards
- Form fields in Accessibility Suggestions
- Some legacy inactive pages still contain old icons

## Required Next UI Pass

Replace direct old audio icons with the official Accessibility Guide icon widget on active Application pages only.

Do not generalize to inactive legacy files until their route status is confirmed.

