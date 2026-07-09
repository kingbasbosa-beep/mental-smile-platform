# Landing Platform Guides And Presentation Carousels Governance V1

Status: ACTIVE_GOVERNANCE_CARD
Domain: Commercial V2 Web / Landing
Runtime effect: none
Date: 2026-07-07

## Scope

This card records the final pre-freeze state of the landing preview after header simplification, hero cleanup, platform guide carousel insertion, presentation carousel insertion, and device action wiring.

## Active Landing Decisions

| Decision | Status |
| --- | --- |
| Top navigation removed; standalone language switch retained top-left | ACTIVE |
| Desktop and mobile floating controls retained top-right | ACTIVE |
| Desktop action opens legacy desktop splash | ACTIVE |
| Mobile action opens mobile splash | ACTIVE |
| Five former floating hero cards removed | ACTIVE |
| Platform guide carousel placed below the hero | ACTIVE |
| Presentation carousel placed in the landing content stack | ACTIVE |
| `/landing-preview` remains the safe preview route | ACTIVE |

## Platform Guides Contract

| Card | Asset | Behavior |
| --- | --- | --- |
| Desktop Guide | `assets/library/platform_guides/platform_guide_desktop.webp` | Fullscreen image viewer |
| Mobile Guide | `assets/library/platform_guides/platform_guide_mobile.webp` | Fullscreen image viewer |
| Content Access Guide | `assets/library/platform_guides/platform_guide_content_access.webp` | Fullscreen image viewer |
| Official Links | `assets/library/platform_guides/platform_official_links.webp` | Navigate to `/web/library/official-links` |

## Presentation Carousel Contract

- Uses the Presentation Gallery repository/list.
- Cards are image-only posters.
- Tapping opens the Presentation Viewer.
- Controls are visible and governed by the current landing interaction language.

## Governance Boundaries

- No new landing design was introduced.
- No routing was removed.
- No booking, login, payment, pricing, appointments, or patient dashboard was added.
- Existing RTL and responsiveness remain owned by the landing runtime.
