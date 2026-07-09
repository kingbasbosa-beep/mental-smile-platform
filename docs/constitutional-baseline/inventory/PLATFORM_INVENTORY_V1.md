# PLATFORM_INVENTORY_V1

Status: ACTIVE_INVENTORY
Purpose: High-level inventory of Mental Smile Platform components before Generation 1 Freeze.
Runtime effect: none

## Core Domains

| Domain | Purpose | Status |
| --- | --- | --- |
| Residential | Client rooms, personal space, and support entry. | PURE_DNA_VERIFIED |
| Library | Knowledge base, provider content, and knowledge cards. | PURE_DNA_VERIFIED |
| Commercial | Provider/Center management, profile engine, and discovery. | PURE_DNA_VERIFIED |
| Administrative | Governance operations, registries, and system health. | PURE_DNA_VERIFIED |
| Owner | Strategic intelligence, final decisions, and os-kernel. | SOVEREIGN_CERTIFIED |
| Archive | Institutional memory, history, and recovery vault. | SOVEREIGN_CERTIFIED |

## Key Components

| Component | Status | Note |
| --- | --- | --- |
| Splash Gateway | ACTIVE | Device and display mode selection. |
| G2 Mobile Entry | ACTIVE | Unified mobile/tablet login selection flow. |
| Client Friend Room | ACTIVE | Account-free client session environment. |
| Presentation Gallery | ACTIVE | Platform presentation posters and rolling carousel. |
| Know Your Right | ACTIVE | Metadata-driven knowledge card system. |
| Official Links | ACTIVE | Verified platform social and contact links page. |
| Platform Guides Carousel | ACTIVE | Four image-only guide cards below landing hero; official links card routes to official links page. |
| Presentation Viewer | ACTIVE | Fullscreen black viewer with zoom, pan, double tap, swipe, previous/next, and page indicator. |
| Landing Evolution | ACTIVE | Header simplification, hero cleanup, floating device actions, landing preview route. |
| Admin Operations | ACTIVE | Central creative cockpit for platform management. |

## Ownership Map

| Runtime Area | Primary Owner | Asset Owner | Route Owner | Notes |
| --- | --- | --- | --- | --- |
| Presentation Gallery | Presentation Gallery | `assets/presentations/` | `/presentation-gallery` | Independent from Knowledge Library. |
| Platform Guides Carousel | Commercial V2 Web / Library | `assets/library/platform_guides/` | `/landing-preview` | First three cards open image viewer; fourth routes to Official Links. |
| Official Platform Links | Library | `assets/library/backgrounds/official_links_background.webp` | `/web/library/official-links` | Placeholder URL rows only until Owner provides real URLs. |
| Knowledge Cards | Library / Know Your Right | `assets/images/library/know_your_right/cards/`, `assets/content/library/know_your_right/` | `/web/library/know-your-right/cards` | Metadata-driven future expansion. |
| Knowledge Article Viewer | Library / Know Your Right | Markdown article folders | `/web/library/know-your-right/article` | Image/title duplication removed; starts with page navigation buttons. |
| Landing Preview | Commercial V2 Web | Landing and guide assets | `/landing-preview` | Safe preview route retained for manual review. |

## Documentation Sections

- `docs/constitutional-baseline/`: Core rules and baselines.
- `docs/sections/`: Domain-specific documentation.
- `docs/archive/`: Historical records and extraction evidence.
- `docs/capsules/`: Self-contained recovery packages.
- `docs/system-health/`: Analyzer reports and health scorecards.
- `docs/generation-2/`: G2 mobile and library evolution docs.
