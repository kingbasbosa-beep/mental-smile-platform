# Library Audio Icon Card Registry V1

## Pattern

Source pattern: `AccessibilityGuideIcon` from the shared accessibility layer, already used by Client Room card surfaces.

Behavior: small audio-support icon on card surface; tap opens a larger visual preview; no playback.

## Registered Surfaces

| Surface | Runtime Count | Icon Behavior | Preview Type | Main Tap Preserved |
|---|---:|---|---|---|
| Library carousel category cards | 6 | Added | Category image asset | YES |
| Library provider entry cards | 2 | Added | Enlarged icon/title preview | YES |
| Specialist category cards | 10 | Added | Enlarged icon/title/intro preview | YES |
| Center category cards | 10 | Added | Enlarged icon/title/intro preview | YES |
| Standard Library category detail image slots | 6 | Added | Category image asset | YES |
| Provider branch content surfaces | 20 | Added | Enlarged icon/title/intro preview | YES |

## Guardrails

- No TTS runtime added.
- No audio playback added.
- No Firebase, Firestore, or Storage dependency added.
- No route definitions added.
- No card navigation target changed.
