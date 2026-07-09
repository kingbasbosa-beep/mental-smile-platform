# Presentation Gallery Architecture V1

Status: ACTIVE_ARCHITECTURE_GUIDE
Domain: Presentation / Commercial V2 Web
Runtime effect: none
Date: 2026-07-07

## Purpose

The Presentation Gallery is an independent image-poster module for explaining Mental Smile platform surfaces. It is not part of the Knowledge Library, does not use Markdown, and does not split posters into article pages.

## Runtime Ownership

| Layer | Owner | Responsibility |
| --- | --- | --- |
| Model | Presentation Gallery | Defines poster metadata and future expansion contract. |
| Repository | Presentation Gallery | Supplies the active poster list from one reusable source. |
| Gallery Page | Presentation Gallery | Displays rolling horizontal presentation cards. |
| Viewer Page | Presentation Gallery | Displays fullscreen poster images with zoom, pan, double tap, swipe, previous/next, back, and page indicator. |
| Landing Integration | Commercial V2 Web | Displays the presentation carousel under the landing hero/guide area. |

## Active Poster Contract

| Poster | Asset |
| --- | --- |
| About Mental Smile | `assets/presentations/presentation_about_mental_smile.webp` |
| Accessibility Services | `assets/presentations/presentation_accessibility_services.webp` |
| Client Services | `assets/presentations/presentation_client_services.webp` |
| Specialist Services | `assets/presentations/presentation_specialist_services.webp` |
| Center Services | `assets/presentations/presentation_center_services.webp` |

## UI Laws

- The poster image is the complete card.
- No captions, title overlays, badges, reading time, or markdown rendering.
- Viewer uses black background and preserves image aspect ratio.
- More posters are added through the presentation list/model and assets, not by duplicating widgets.

## Dependencies

- Route: `/presentation-gallery`
- Landing placement: `/landing-preview`
- Asset family: `assets/presentations/`
- Module: `lib/features/presentation_gallery/`

## Governance Status

Presentation Gallery is ACTIVE, pre-freeze registered, and capsule-synchronized through `GENERATION_1_PRE_FREEZE_CAPSULE_SYNCHRONIZATION_V1.md`.
