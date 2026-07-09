# RUNTIME_INVENTORY_V1

Status: ACTIVE_INVENTORY
Purpose: Inventory of active runtime modules and tech stack components.
Runtime effect: none

## Tech Stack

- **Flutter SDK**: >=3.3.0
- **State Management**: flutter_riverpod ^2.6.1
- **Backend**: Firebase (Core, Firestore, Auth, Storage, Analytics)
- **Local Storage**: shared_preferences ^2.3.2
- **UI Components**: flutter_markdown, cupertino_icons
- **Geospatial**: geolocator, geocoding

## Active Feature Modules (`lib/features/`)

| Module | Purpose | Status |
| --- | --- | --- |
| `generation2_mobile_entry` | G2 Splash and Login Selection. | ACTIVE |
| `client` / `accessibility` | Residential static rooms. | ACTIVE |
| `library` | Knowledge base and content categories. | ACTIVE |
| `commercial` | Admin room and provider login/access. | ACTIVE |
| `commercial_v2_web` | Public showcase foundation. | ACTIVE |
| `presentation_gallery` | Reusable poster gallery, fullscreen viewer, zoom/pan/swipe poster presentation. | ACTIVE |
| `library/knowledge_cards` | Metadata-driven Know Your Right knowledge cards and markdown article viewer. | ACTIVE |
| `block_1_archive_operations` | Admin dashboards for archive/ops. | ACTIVE |
| `block_2_guides_constitutions` | Admin dashboards for governance. | ACTIVE |
| `block_3_card_kernel` | Admin dashboards for cards. | ACTIVE |
| `workshop_foundation` | Engineering workspace for AI/Owner. | ACTIVE |
| `intelligence_engine_foundation` | AI runtime foundation. | ACTIVE |
| `governance_operations_ecosystem` | Global moderation and playbooks. | ACTIVE |

## Core Infrastructure (`lib/core/` & `lib/app/`)

- `app/router/`: AppRouter and central Route Registry.
- `app/locale_provider.dart`: Language state management.
- `core/auth/`: AccountAccessService and role resolution.
- `core/visibility/`: VisibilityReadiness and signal validation.

## Pre-Freeze Runtime Surfaces

| Surface | Route / Placement | Owner | Runtime Status | Governance Status |
| --- | --- | --- | --- | --- |
| Landing Preview | `/landing-preview` | Commercial V2 Web / Owner | ACTIVE | PRE_FREEZE_REGISTERED |
| Landing Header Simplification | `/landing-preview` | Commercial V2 Web / Owner | ACTIVE | PRE_FREEZE_REGISTERED |
| Landing Hero Cleanup | `/landing-preview` | Commercial V2 Web / Owner | ACTIVE | PRE_FREEZE_REGISTERED |
| Platform Guides Carousel | Immediately below landing hero | Commercial V2 Web / Library | ACTIVE | PRE_FREEZE_REGISTERED |
| Presentation Carousel | Landing preview content stack | Presentation Gallery / Commercial V2 Web | ACTIVE | PRE_FREEZE_REGISTERED |
| Presentation Gallery | `/presentation-gallery` | Presentation Gallery | ACTIVE | PRE_FREEZE_REGISTERED |
| Presentation Viewer | Internal viewer route/page push | Presentation Gallery | ACTIVE | PRE_FREEZE_REGISTERED |
| Official Platform Links | `/web/library/official-links` | Library | ACTIVE | PRE_FREEZE_REGISTERED |
| Knowledge Cards | `/web/library/know-your-right/cards` | Library / Know Your Right | ACTIVE | PRE_FREEZE_REGISTERED |
| Knowledge Article Viewer | `/web/library/know-your-right/article` | Library / Know Your Right | ACTIVE | PRE_FREEZE_REGISTERED |

## Localization (`lib/l10n/`)

- `app_ar.arb`: Arabic (Source of Truth).
- `app_en.arb`: English.
- Coverage: 100% across all active UI sections.
